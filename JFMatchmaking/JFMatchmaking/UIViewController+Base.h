//
//  UIViewController+Base.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/18.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideMenuController.h"

@interface UIViewController (Base)
//readonly（只读）
@property (nonatomic,readonly) SlideMenuController *slideMenuController;

@end
