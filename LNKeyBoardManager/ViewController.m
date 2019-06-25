//
//  ViewController.m
//  LNKeyBoardManager
//
//  Created by 刘宁 on 2018/8/17.
//  Copyright © 2018年 刘宁. All rights reserved.
//

#import "ViewController.h"
#import "LNKeyBoardSender.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *upField;

@property (weak, nonatomic) IBOutlet UITextField *middleTextField;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *downField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.upField.LN_MoveView = self.view;
    self.upField.LN_KeyBoardDistance = 50;
    
    self.middleTextField.LN_MoveView = self.view;
    self.middleTextField.LN_KeyBoardDistance = 50;
    
    self.downField.LN_MoveView = self.view;
    self.downField.LN_KeyBoardDistance = 15;
    
    self.textView.LN_MoveView = self.view;
    self.textView.LN_KeyBoardDistance = 30;
}


@end
