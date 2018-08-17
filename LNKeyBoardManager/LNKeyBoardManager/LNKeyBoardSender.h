//
//  LNKeyBoardSender.h
//  LNKeyBoardManager
//
//  Created by 刘宁 on 2017/3/6.
//  Copyright © 2017年 刘宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LNKeyBoardSenderProtocol <NSObject>

/// 与键盘之间的距离 默认为10
@property (nonatomic, assign) CGFloat LN_KeyBoardDistance;

/// 需要做移动的view 默认为当前显示器的view
@property (nonatomic, weak) UIView *LN_MoveView;

@end

@interface UITextField (LNKeyBoardSender)<LNKeyBoardSenderProtocol>

@end

@interface UITextView (LNKeyBoardSender)<LNKeyBoardSenderProtocol>

@end
