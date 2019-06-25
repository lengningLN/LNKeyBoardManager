//
//  LNKeyBoardResponder.m
//  LNKeyBoardManager
//
//  Created by 刘宁 on 2017/3/6.
//  Copyright © 2017年 刘宁. All rights reserved.
//

#import "LNKeyBoardResponder.h"

@implementation LNKeyBoardResponder

- (void)setView:(UIView<LNKeyBoardSenderProtocol> *)view
{
    // 清空
    if (view == nil) {
        _frame = CGRectZero;
        _isTextView = NO;
        _isScrollMoveView = NO;
        _contentInset = UIEdgeInsetsZero;
        _contentOffset = CGPointZero;
        _transform = CGAffineTransformIdentity;
        _inTableViewController = NO;
        _view = nil;
        return;
    }
    
    _inTableViewController = [self inTableViewController:view];
    _isScrollMoveView = [view.LN_MoveView isKindOfClass:[UIScrollView class]];
    _isTextView = [view isKindOfClass:[UITextView class]];
    _frame = [view convertRect:view.bounds toView:[UIApplication sharedApplication].keyWindow];
    
    // 如果是相同的移动视图 不需要更新transform和偏移量
    if (view.LN_MoveView == _view.LN_MoveView) {
        _view = view;
        return;
    }
    
    _view = view;
    if (_isScrollMoveView) {
        _contentInset = ((UIScrollView *)view.LN_MoveView).contentInset;
        _contentOffset = ((UIScrollView *)view.LN_MoveView).contentOffset;
        _transform = CGAffineTransformIdentity;
    }else{
        _contentInset = UIEdgeInsetsZero;
        _contentOffset = CGPointZero;
        _transform = view.transform;
    }
}

- (void)keyboardShow:(NSTimeInterval)duration offset:(CGFloat)offset
{
    // 如果是scrollView
    if (self.isScrollMoveView) {
        UIScrollView *moveV = (UIScrollView *)self.view.LN_MoveView;
        [UIView animateWithDuration:duration animations:^{
            moveV.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, self.contentInset.bottom + offset, self.contentInset.right);
            moveV.contentOffset = CGPointMake(self.contentOffset.x, self.contentOffset.y + offset);
        }];
    }else{
        [UIView animateWithDuration:duration animations:^{
              self.view.LN_MoveView.transform = CGAffineTransformTranslate(self.view.LN_MoveView.transform, 0, -(offset));
        }];
    }
}

- (void)keyboardHidden:(NSTimeInterval)duration
{
    if (self.isScrollMoveView) {
        UIScrollView *moveV = (UIScrollView *)self.view.LN_MoveView;
        [UIView animateWithDuration:duration animations:^{
            moveV.contentInset = self.contentInset;
            moveV.contentOffset = self.contentOffset;
        }completion:^(BOOL finished) {
            self.view = nil;
        }];
    }else{
        [UIView animateWithDuration:duration animations:^{
            self.view.LN_MoveView.transform = self.transform;
        }completion:^(BOOL finished) {
            self.view = nil;
        }];
    }
}

- (BOOL)inTableViewController:(UIView *)view;
{
    id vc = view;
    // 一定要判断vc是否有值, 不然传入不在控制器中的view会死循环
    while (vc && [vc isKindOfClass:[UIViewController class]] == NO) {
        vc = [vc nextResponder];
    }
    return [vc isKindOfClass:[UITableViewController class]];
}

@end
