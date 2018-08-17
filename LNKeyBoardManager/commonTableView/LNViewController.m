//
//  LNViewController.m
//  LNKeyBoardManager
//
//  Created by 刘宁 on 2018/8/17.
//  Copyright © 2018年 刘宁. All rights reserved.
//

#import "LNViewController.h"
#import "LNCell.h"
#import "LNKeyBoardManager.h"
@interface LNViewController ()<UITabBarDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.tableView registerNib:[UINib nibWithNibName:@"LNCell" bundle:nil] forCellReuseIdentifier:@"LNCell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LNCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LNCell"];
    cell.leftL.text = [NSString stringWithFormat:@"选项-%zd",indexPath.row];
    cell.textField.placeholder = @"请输入选项的内容";
    cell.textField.LN_MoveView = tableView;
    cell.textField.LN_KeyBoardDistance = 30;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *cells = [self.tableView visibleCells];
    for ( LNCell * cell in cells) {
        if ([cell.textField isFirstResponder]) {
            [cell.textField resignFirstResponder];
            break;
        }
    }
}

@end
