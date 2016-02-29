//
//  SQLInterfaceV.h
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SQLInterfaceV <NSObject>
@optional
-(BOOL)saveData;
-(void)loadData;
-(BOOL)deleteData;
-(BOOL)updateData;

@end
