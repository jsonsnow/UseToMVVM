//
//  HomePageCell.h
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageCellViewModel.h"

@interface HomePageCell : UITableViewCell

@property (strong,nonatomic) HomePageCellViewModel *viewModel;

@end
