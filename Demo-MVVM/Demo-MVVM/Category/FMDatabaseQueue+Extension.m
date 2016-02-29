//
//  FMDatabaseQueue+Extension.m
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "FMDatabaseQueue+Extension.h"
#import "Header.h"
#import "test.h"
#define DB_PATH [NSString stringWithFormat:@"%@/%@.db", ST_DOCUMENT_DIRECTORY, ST_APP_NAME]

@implementation FMDatabaseQueue (Extension)

+(instancetype)shareInstense {
    
 
    
    static FMDatabaseQueue *queue = nil;
    static dispatch_once_t onceToKen;
    dispatch_once(&onceToKen, ^{
        
        queue =  [FMDatabaseQueue databaseQueueWithPath:DB_PATH];
        [self createTable];
    });
    
    return queue;
}

+(void)createTable{
    
    
    
    
}

@end
