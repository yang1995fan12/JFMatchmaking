//
//  UserViewController.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景图片
    UIImage *image = [UIImage imageNamed:@"bg"];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:image];
}



@end
