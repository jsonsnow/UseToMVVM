//
//  ArticleModel.m
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "ArticleModel.h"
#import <MJExtension.h>

@implementation ArticleModel
+(NSDictionary *)replacedKeyFromPropertyName {
    
    
    return @{@"articleId":@"id"};
}
+(instancetype)pareTheArticleModel:(NSDictionary *)dic {
    
    
    return [[self alloc ] paretheArticleModelWithDic:dic];
    
}

-(instancetype)paretheArticleModelWithDic:(NSDictionary *)dic {
    
    self.articleId    = dic[@"id"];
    self.title        = dic[@"title"];
    self.authorname   = dic[@"author"][@"name"];
    self.categoryname = dic[@"categorys"][0][@"name"];
    
    return self;
    
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}


@end
