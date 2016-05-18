//
//  HomeViewController.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "HomeViewController.h"
#import "UIViewController+Base.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

//视图将要出现
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.slideMenuController.pan.enabled = YES;
}
//视图将要消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.slideMenuController.pan.enabled = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置委托
    NavigationHelper *helper = [NavigationHelper defaultHelper];
    self.navigationController.delegate = helper;
    
}

- (IBAction)testButtonPressed:(id)sender {
    [self.slideMenuController switchController];
}

@end
