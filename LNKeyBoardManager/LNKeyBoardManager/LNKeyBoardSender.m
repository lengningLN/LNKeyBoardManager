//
//  LNKeyBoardSender.m
//  LNKeyBoardManager
//
//  Created by 刘宁 on 2017/3/6.
//  Copyright © 2017年 刘宁. All rights reserved.
//

#import "LNKeyBoardSender.h"
#import "LNKeyBoardManager.h"
#import <objc/runtime.h>

@implementation UITextField (LNKeyBoardSender)

- (void)setLN_MoveView:(UIView *)LN_MoveView
{
    if (self.LN_MoveView == LN_MoveView) {
        return;
    }
    
    // 添加关联对象
    objc_setAssociatedObject(self, @selector(LN_MoveView), LN_MoveView, OBJC_ASSOCIATION_ASSIGN);
    
    [self addTarget:[LNKeyBoardManager sharedManager] action:NSSelectorFromString(@"controlBeginEditing:") forControlEvents:UIControlEventEditingDidBegin];
}

- (UIView *)LN_MoveView
{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLN_KeyBoardDistance:(CGFloat)LN_KeyBoardDistance
{
    objc_setAssociatedObject(self, @selector(LN_KeyBoardDistance), @(LN_KeyBoardDistance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)LN_KeyBoardDistance
{
    id n = objc_getAssociatedObject(self, _cmd);
    return n?[n floatValue]:10.0;
}

@end

@implementation UITextView (LNKeyBoardSender)


+ (void)initialize
{
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        Method sm = class_getInstanceMethod(self, @selector(canBecomeFirstResponder));
        Method mm = class_getInstanceMethod(self, @selector(LN_canBecomeFirstResponder));
        method_exchangeImplementations(sm, mm);
    });
}

- (BOOL)LN_canBecomeFirstResponder
{
    BOOL result = [self LN_canBecomeFirstResponder];
    if (result && self.LN_MoveView) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [[LNKeyBoardManager sharedManager] performSelector:NSSelectorFromString(@"controlBeginEditing:") withObject:self];
#pragma clang diagnostic pop
    }
    return result;
}

#pragma mark - property

- (void)setLN_KeyBoardDistance:(CGFloat)LN_KeyBoardDistance
{
    objc_setAssociatedObject(self, @selector(LN_KeyBoardDistance), @(LN_KeyBoardDistance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)LN_KeyBoardDistance
{
    id n = objc_getAssociatedObject(self, _cmd);
    return n?[n floatValue]:10.0;
}

- (void)setLN_MoveView:(UIView *)LN_MoveView
{
    if (self.LN_MoveView == LN_MoveView){
        return;
    }
    objc_setAssociatedObject(self, @selector(LN_MoveView), LN_MoveView, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)LN_MoveView
{
    return objc_getAssociatedObject(self, _cmd);
}
@end
