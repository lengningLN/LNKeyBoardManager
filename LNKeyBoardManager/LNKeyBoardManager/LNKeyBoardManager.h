//
//  LNKeyBoardManager.h
//  LNKeyBoardManager
//
//  Created by 刘宁 on 2017/3/6.
//  Copyright © 2017年 刘宁. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "LNKeyBoardSender.h"

@interface LNKeyBoardManager : NSObject

/**
 是否可用
 */
@property (nonatomic, assign) BOOL enable;

/**
 单例manager
 */
+ (instancetype)sharedManager;

@end
