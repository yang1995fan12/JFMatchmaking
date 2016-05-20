//
//  User.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/19.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>

@property (nonatomic,strong) NSString *objectId;
@property (nonatomic,strong) NSString *username;

+ (instancetype)currentUser;
+ (void)loginWithID:(NSString *)objectId username:(NSString *)username;
+ (void)logout;

@end
