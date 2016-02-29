//
//  HomePageCellViewModel.m
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "HomePageCellViewModel.h"

@implementation HomePageCellViewModel
-(instancetype)initWithArticleModel:(ArticleModel *)articleModel {
    
    if ( self = [super init]) {
        
        self.articleModel = articleModel;
        [self setupData];
    }
    
    return self;
}

-(void)setupData {
    
    _titleText = self.articleModel.title;
    _authortext = self.articleModel.authorname;
    _categoyrtext = [@"分类:" stringByAppendingString:self.articleModel.categoryname];
    
}

@end
