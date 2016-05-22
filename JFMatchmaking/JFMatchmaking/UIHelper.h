//
//  UIHelper.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/22.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>//这个框架的目的  网络请求加载动画的第三方

@interface UIHelper : NSObject

+ (void)showLoadingInView:(UIView *)view hasText:(BOOL)hasText;
+ (void)showLoadingInView:(UIView *)view;
+ (void)dismissLoadingInView:(UIView *)view;
+ (void)showTipsWithText:(NSString *)text inView:(UIView *)view;
+ (void)showErrorWithText:(NSString *)text inView:(UIView *)view;

@end
