//
//  Bucket.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/18.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "Bucket.h"

@interface Bucket ()

@property (nonatomic,strong) NSMutableDictionary *data;

@end

@implementation Bucket

- (instancetype)init {
    
    if (self = [super init]) {
        self.data = [[NSMutableDictionary alloc] init];
        
    }
    return self;
}

- (void)bucketInWithKey:(NSString *)key Value:(NSObject *)value {
    _data[key] = value;
}

- (NSObject *)bucketOutWithKey:(NSString *)key {
    NSObject *value = _data[key];
    [_data removeObjectForKey:key];
    return value;
}

- (NSObject *)valueForKey:(NSString *)key {
    return _data[key];
}

@end
