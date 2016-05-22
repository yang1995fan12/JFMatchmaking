//
//  UIHelper.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/22.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "UIHelper.h"
#import "UIColor+Int.h"

@implementation UIHelper
//动画开始的效果，有文字的话显示加载中。。。
+ (void)showLoadingInView:(UIView *)view hasText:(BOOL)hasText {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    UIView *container = (view != nil ? view : window);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
    hud.color = [UIColor colorWithHex:0xd78b93];
    if (hasText) {
        hud.labelText = @"加载中...";
    }
}
//默认不要文字
+ (void)showLoadingInView:(UIView *)view {
    [self showLoadingInView:view hasText:NO];
}
//动画消失的效果
+ (void)dismissLoadingInView:(UIView *)view {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    UIView *container = (view != nil ? view : window);
    [MBProgressHUD hideHUDForView:container animated:YES];
}
//显示提示文字的方法
+ (void)showTipsWithText:(NSString *)text inView:(UIView *)view {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    UIView *container = (view != nil ? view :window);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
    
    hud.color = [UIColor colorWithHex:0xd78b93];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info"]];
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:16];
    hud.detailsLabelText = text;
    
    [hud hide:YES afterDelay:1.5];
    
}
//显示错误的方法
+ (void)showErrorWithText:(NSString *)text inView:(UIView *)view {
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];
    UIView *container = (view != nil ? view :window);
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:container animated:YES];
    
    hud.color = [UIColor colorWithHex:0xd78b93];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error"]];
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:16];
    hud.detailsLabelText = text;
    
    [hud hide:YES afterDelay:1.5];
}

@end
