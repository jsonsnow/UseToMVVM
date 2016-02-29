//
//  RequestViewModel.m
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "RequestViewModel.h"


@implementation RequestViewModel

-(AFHTTPSessionManager *)sessionManger {
    
    if (!_sessionManger) {
        
        _sessionManger = [AFHTTPSessionManager manager];
    }
    
    return _sessionManger;
}

-(void)dealloc {
    
    [self.sessionManger invalidateSessionCancelingTasks:YES];
}



@end
