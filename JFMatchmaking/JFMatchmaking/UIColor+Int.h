//
//  UIColor+Int.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/22.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Int)

+ (UIColor *)colorWithComponent:(NSInteger)component alpha:(NSInteger)alpha;
+ (UIColor *)colorWithComponent:(NSInteger)component;

+ (UIColor *)colorWithR:(NSInteger)red G:(NSInteger)green B:(NSInteger)blue A:(NSInteger)alpha;
+ (UIColor *)colorWithR:(NSInteger)r G:(NSInteger)g B:(NSInteger)b;

+ (UIColor *)colorWithHex:(NSInteger)hex;

@end
