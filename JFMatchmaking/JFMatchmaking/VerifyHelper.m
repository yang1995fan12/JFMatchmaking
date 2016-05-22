//
//  VerifyHelper.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/22.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "VerifyHelper.h"

@implementation VerifyHelper


//判断一个字符串是否为空
+ (BOOL)isEmptyString:(NSString *)string {
    //判断是否为空，是的话返回yes
    if (string == nil) {
        return YES;
    }
    
    //判断是否NSNull的类型,是的话返回Yes
    if ([string isKindOfClass:NSNull.class]) {
        return YES;
    }
    
    //将中间的空格去掉,判断长度是否为0，是的话返回YES
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    NSString *result = [string stringByTrimmingCharactersInSet:set];
    if (result.length == 0) {
        return YES;
    }
    
    return NO;
}

@end
