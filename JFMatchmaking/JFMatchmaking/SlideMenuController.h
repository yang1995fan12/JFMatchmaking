//
//  SlideMenuController.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuController : UIViewController

@property (nonatomic,weak) IBOutlet UIPanGestureRecognizer *pan;

- (void)switchController;

@end
