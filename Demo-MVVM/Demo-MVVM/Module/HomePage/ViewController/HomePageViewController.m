//
//  HomePageViewController.m
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageViewModel.h"
#import "HomePageCell.h"

@interface HomePageViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) HomePageViewModel *viewModel;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self sendRequest];
    self.tableView.dataSource = self;
    
}

-(void)sendRequest {
    
    __weak typeof(self) weakSelf = self;
    [self.viewModel.requestSignal subscribeNext:^(NSArray *articles) {
        
        [weakSelf.tableView reloadData];
        
    } error:^(NSError *error) {
       
        
    }];
}

#pragma mark --UItableview datasourece
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.viewModel.dataSoure.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [self configCell:cell indexPath:indexPath];
    return cell;
    
}

-(void)configCell:(HomePageCell *)cell indexPath:(NSIndexPath *)indexPath{
    
    cell.viewModel = self.viewModel.dataSoure[indexPath.row];

    
}
-(HomePageViewModel *)viewModel {
    
    if (!_viewModel) {
        
        _viewModel = [HomePageViewModel new];
    }
    
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
