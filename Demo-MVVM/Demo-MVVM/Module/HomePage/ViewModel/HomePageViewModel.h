//
//  HomePageViewModel.h
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "RequestViewModel.h"
#import "ArticleModel.h"
#import "SQLInterfaceV.h"
#import <RACSignal.h>

@interface HomePageViewModel : RequestViewModel<SQLInterfaceV>

@property (nonatomic ,strong) RACSignal *requestSignal;
@property (nonatomic, assign) NSInteger curentPage;
@property (nonatomic,strong) NSArray *dataSoure;


@end
