//
//  ConversionHelper.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/28.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConversionHelper : NSObject

+ (NSString *)toStringWithNumber:(NSNumber *)number defaultValue:(NSString *)value;
+ (NSString *)stringWithString:(NSString *)string defaultValue:(NSString *)value;
+ (NSDictionary *)timeIntervalFromDateString:(NSString *)string;
+ (NSString *)intervalSinceNowFromDateString:(NSString *)string;

@end
