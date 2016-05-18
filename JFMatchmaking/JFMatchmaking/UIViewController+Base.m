//
//  UIViewController+Base.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/18.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "UIViewController+Base.h"

@implementation UIViewController (Base)

- (SlideMenuController *)slideMenuController {
    //
    UIViewController *controller = self.parentViewController;
    
    while (controller != nil) {
        if (controller.class == SlideMenuController.class) {
            return (SlideMenuController *)controller;
        } else {
            controller = controller.presentedViewController;
        }
    }
    
    return nil;
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
