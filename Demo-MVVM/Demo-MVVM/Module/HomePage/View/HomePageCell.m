//
//  HomePageCell.m
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "HomePageCell.h"
#import <ReactiveCocoa.h>

@implementation HomePageCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    [self setupSignal];
    
}

-(void)setupSignal{
    
    __weak typeof(self) weakself = self;
    [RACObserve(self, viewModel) subscribeNext:^(id x) {
       
        weakself.textLabel.text = _viewModel.titleText;
        weakself.detailTextLabel.text = _viewModel.authortext;
        
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
