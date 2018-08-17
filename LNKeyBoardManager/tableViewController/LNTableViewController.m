//
//  LNTableViewController.m
//  LNKeyBoardManager
//
//  Created by 刘宁 on 2018/8/17.
//  Copyright © 2018年 刘宁. All rights reserved.
//

#import "LNTableViewController.h"
#import "LNTbleViewCell.h"
#import "LNKeyBoardManager.h"

@interface LNTableViewController ()

@end

@implementation LNTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LNTbleViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LNTbleViewCell"];
    cell.leftL.text = [NSString stringWithFormat:@"选项-%zd",indexPath.row];
    cell.textField.placeholder = @"tableViewController自动帮你移动";

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *cells = [self.tableView visibleCells];
    for ( LNTbleViewCell * cell in cells) {
        if ([cell.textField isFirstResponder]) {
            [cell.textField resignFirstResponder];
            break;
        }
    }
}


@end
