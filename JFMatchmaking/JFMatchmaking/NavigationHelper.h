//
//  NavigationHelper.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/18.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bucket.h"

@interface NavigationHelper : NSObject <UINavigationControllerDelegate>

@property (nonatomic,strong) Bucket *bucket;


+ (instancetype)defaultHelper;

@end
