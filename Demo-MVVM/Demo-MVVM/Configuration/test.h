//
//  test.h
//  Demo-MVVM
//
//  Created by Aspmcll on 16/2/29.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString * const createArticleSQL = @"CREATE TABLE IF NOT EXISTS article (id INT, title VARCHAR, authorname VARCHAR, categoryname VARCHAR)";

static NSString * const saveArticleSQL = @"INSERT INTO article VALUES (?, ?, ?, ?)";
static NSString * const deleteArticleSQL = @"DELETE FROM article";
static NSString * const selectArticleSQL = @"SELECT * FROM article";


