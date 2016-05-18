//
//  Bucket.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/18.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kBucketKeyTypeTag @"kBucketDataKeyTypeTag"
#define kBucketKeyTypeData @"kBucketDataKeyTypeData"

@interface Bucket : NSObject

- (instancetype)init;//初始化方法   id：表示任何类型   instancetype：表示当前所在类的类型
- (void)bucketInWithKey:(NSString *)key Value:(NSObject *)value;
- (NSObject *)bucketOutWithKey:(NSString *)key;
- (NSObject *)valueForKey:(NSString *)key;

@end
