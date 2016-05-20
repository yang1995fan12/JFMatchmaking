//
//  UIView+Corner.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/20.
//  Copyright © 2016年 yf. All rights reserved.
//设置圆角

#import <UIKit/UIKit.h>
//告诉系统我们这个类可以在界面上设计的
IB_DESIGNABLE
@interface UIView (Corner)

//IBInspectable  表示可以直接在界面上编辑
@property (nonatomic,assign) IBInspectable CGFloat cornerRadius;//圆角半径
@property (nonatomic,assign) IBInspectable UIColor *borderColor;//边框颜色
@property (nonatomic,assign) IBInspectable CGFloat borderWidth;//边框宽度

@end
