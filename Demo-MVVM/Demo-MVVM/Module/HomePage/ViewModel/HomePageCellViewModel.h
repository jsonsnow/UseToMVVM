//
//  HomePageCellViewModel.h
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "BaseViewModel.h"
#import "ArticleModel.h"

@interface HomePageCellViewModel :BaseViewModel

@property (nonatomic,strong) ArticleModel *articleModel;

@property (nonatomic,copy,readonly) NSString *titleText;
@property (nonatomic,copy,readonly) NSString *authortext;
@property (nonatomic,copy,readonly) NSString *categoyrtext;

-(instancetype)initWithArticleModel:(ArticleModel *)articleModel;

@end
