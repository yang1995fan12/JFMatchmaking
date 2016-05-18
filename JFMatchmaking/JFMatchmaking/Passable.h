//
//  Passable.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/18.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Passable <NSObject>

@optional
//创建一个ViewController将要显示的时候
- (void)viewControllerDidShowWithTag:(NSString *)tag data:(NSObject *)data;

@end
