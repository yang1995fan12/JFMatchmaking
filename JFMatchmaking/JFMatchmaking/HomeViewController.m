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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)testButtonPressed:(id)sender {
    [self.slideMenuController switchController];
}

@end
