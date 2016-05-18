//
//  UINavigationController+Passable.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/18.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Passable)

- (void)pushViewControllerWithStoryboardID:(NSString *)identifier
                                  animated:(BOOL)animated
                                       tag:(NSString *)tag
                                      data:(NSObject *)data;

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
                                            tag:(NSString *)tag
                                           data:(NSObject *)data;

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
                                         tag:(NSString *)tag
                                        data:(NSObject *)data;

- (void)pushViewControllerWithStoryboardID:(NSString *)identifier
                                  animated:(BOOL)animated
                                      data:(NSObject *)data;

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
                                           data:(NSObject *)data;

- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated
                                        data:(NSObject *)data;

@end
