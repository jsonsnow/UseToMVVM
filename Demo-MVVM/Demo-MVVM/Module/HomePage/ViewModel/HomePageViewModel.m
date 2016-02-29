//
//  HomePageViewModel.m
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "HomePageViewModel.h"
#import "HomePageCellViewModel.h"
#import "test.h"
#import "FMDatabaseQueue+Extension.h"
#import <MJExtension.h>
#import <RACSubject.h>
#import "RACDisposable.h"

@interface HomePageViewModel ()
@property (strong,nonatomic) NSMutableArray *articeViewModels;
@property (nonatomic,assign) BOOL isRefresh;

@end

@implementation HomePageViewModel

-(BOOL)saveData {
    
    __block BOOL isSuccess = NO;
    
    [[FMDatabaseQueue shareInstense] inTransaction:^(FMDatabase *db, BOOL *rollback) {
      
        for (HomePageCellViewModel *cellViewModel in self.dataSoure) {
            
            [db executeUpdate:createArticleSQL];
            ArticleModel *articleModel = cellViewModel.articleModel;
            isSuccess = [db executeUpdate:saveArticleSQL,articleModel.articleId,articleModel.title,articleModel.authorname,articleModel.categoryname];
            if (!isSuccess) {
                
                break ;
            }
                         
        }
        
        if (!isSuccess) {
            
            *rollback = YES;
            return ;
        }
        
    }];
    
    
    
    return isSuccess;
}

-(BOOL)deleteData {
    
    __block BOOL isSuccess = NO;
    [[FMDatabaseQueue shareInstense] inDatabase:^(FMDatabase *db) {
       
        isSuccess = [db executeUpdate:deleteArticleSQL];
        
    }];
    
    return isSuccess;
    
}
-(void)loadData {
    
    
    [[FMDatabaseQueue shareInstense] inDatabase:^(FMDatabase *db) {
        
        
        FMResultSet *set = [db executeQuery:selectArticleSQL];
        
        while ([set next]) {
            
            ArticleModel *article = [ArticleModel new];
            article.title = [set objectForColumnName:@"title"];
            article.articleId = [set objectForColumnName:@"id"];
            article.authorname = [set objectForColumnName:@"authorname"];
            article.categoryname = [set objectForColumnName:@"categoryname"];
            HomePageCellViewModel *cellViewModel = [[HomePageCellViewModel alloc] initWithArticleModel:article];
            [self.articeViewModels addObject:cellViewModel];
            
            
        }
        [set close];
        
    }];
    
    self.dataSoure = [self.articeViewModels copy];
    
}

-(RACSignal *)requestSignal {
    
    if (!_requestSignal) {
        
        
        _requestSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSDictionary *paramters = @{@"page":@(self.curentPage)};
            NSURLSessionDataTask *task = [self.sessionManger POST:@"http://www.brighttj.com/api/index.php/api/article/articleList" parameters:paramters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                
                NSArray *articleArray = responseObject[@"data"][@"articleList"];
                for (NSDictionary *articleModelDic in articleArray) {
                    
                    ArticleModel *articleModel = [ArticleModel pareTheArticleModel:articleModelDic];
                    HomePageCellViewModel *cellViewModel = [[HomePageCellViewModel alloc] initWithArticleModel:articleModel];
                    [self.articeViewModels addObject:cellViewModel];
                    
                }
                self.dataSoure = [self.articeViewModels copy];
                if (self.isRefresh) {
                    
                    [self deleteData];
                    
                }
                [self saveData];
                [subscriber sendNext:self.dataSoure];
                [subscriber sendCompleted];
                
            
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                
                [subscriber sendError:error];
                [self loadData];
                
            }];
            
            return [RACDisposable disposableWithBlock:^{
               
                [task cancel];
                
            }];
        }];
        
    }
    
    
    return _requestSignal;
}
-(BOOL)isRefresh {
    
    
    _isRefresh = self.curentPage == 0;
    return _isRefresh;
}

-(NSMutableArray *)articeViewModels{
    
    if (!_articeViewModels) {
        
        _articeViewModels = [NSMutableArray new];
    }
    
    return _articeViewModels;
}

@end
