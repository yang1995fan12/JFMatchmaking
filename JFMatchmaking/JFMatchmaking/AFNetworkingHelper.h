//
//  AFNetworkingHelper.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/19.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLMacor.h"
#import <AFNetworking.h>

@interface AFNetworkingHelper : NSObject

+ (instancetype)defaultHelper;

- (void)sendRequestWithURLString:(NSString *)urlString
                      parameters:(NSDictionary *)parameters
                         success:(void (^)(NSURLSessionDataTask *, id))success
                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
                           cache:(BOOL)useCache;

- (void)sendRequestWithURLString:(NSString *)urlString
                      parameters:(NSDictionary *)parameters
                         success:(void (^)(NSURLSessionDataTask *, id))success
                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

- (void)sendRequestWithURLString:(NSString *)urlString
                         success:(void (^)(NSURLSessionDataTask *, id))success
                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
                           cache:(BOOL)useCache;

- (void)sendRequestWithURLString:(NSString *)urlString
                         success:(void (^)(NSURLSessionDataTask *, id))success
                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

- (void)uploadWithURLString:(NSString *)urlString
                       data:(NSData *)data
                    success:(void (^)(NSURLResponse *, id))success
                    failure:(void (^)(NSURLResponse *, NSError *))failure;

@end
