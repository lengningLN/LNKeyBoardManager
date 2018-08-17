//
//  LNKeyBoardResponder.h
//  LNKeyBoardManager
//
//  Created by 刘宁 on 2017/3/6.
//  Copyright © 2017年 刘宁. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNKeyBoardSender.h"

@interface LNKeyBoardResponder : NSObject

/**
 记录文本框
 */
@property (nonatomic, weak) UIView<LNKeyBoardSenderProtocol> *view;

/**
 记录文本框原有的位置
 */
@property (nonatomic, assign, readonly) CGRect frame;

/**
 记录scrollView原有的contentInset
 */
@property (nonatomic, assign, readonly) UIEdgeInsets contentInset;

/**
 记录scrollView原有的contentOffset
 */
@property (nonatomic, assign, readonly) CGPoint contentOffset;

/**
 保存view原有的tranform
 */
@property (nonatomic, assign, readonly) CGAffineTransform transform;

/**
 获取当前的移动视图是不是scrollView
 */
@property (nonatomic, assign, readonly) BOOL isScrollMoveView;

/**
 判断当前文本框是不是textView
 */
@property (nonatomic, assign, readonly) BOOL isTextView;

/**
 是不是在tableViewController中
 */
@property (nonatomic, assign, readonly) BOOL inTableViewController;

#pragma mark - method
/**
 处理键盘弹出
 */
- (void)keyboardShow:(NSTimeInterval)duration offset:(CGFloat)offset;

/**
 处理键盘关闭
 */
- (void)keyboardHidden:(NSTimeInterval)duration;

@end
