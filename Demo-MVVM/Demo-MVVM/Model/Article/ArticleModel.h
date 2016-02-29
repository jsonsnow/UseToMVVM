//
//  ArticleModel.h
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "BaseModel.h"

@interface ArticleModel : BaseModel
@property (nonatomic,copy) NSString *articleId;
@property (nonatomic,copy) NSString *title;
@property (copy, nonatomic) NSString *authorname;
@property (copy, nonatomic) NSString *categoryname;
+(instancetype)pareTheArticleModel:(NSDictionary *)dic;


@end
