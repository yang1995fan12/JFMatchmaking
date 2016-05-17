//
//  SlideMenuController.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "SlideMenuController.h"
#import "UtilsMacro.h"

@interface SlideMenuController ()

@property (nonatomic,weak)IBOutlet UIView *menuContainer;//菜单的容器
@property (nonatomic,weak)IBOutlet UIView *contentContainer;//内容的容器

@property (nonatomic,strong)UIButton *maskButton;//蒙版按钮
@property (nonatomic,assign)BOOL folded;//折叠
@property (nonatomic,assign)CGPoint originalPoint;//原始点
@property (nonatomic,assign)CGFloat scaleFactor;//缩放因子
@property (nonatomic,assign)CGFloat offsetX;//抵消X
@property (nonatomic,assign)CGFloat originalX;//原始X
@property (nonatomic,assign)CGFloat deltaScaleFactor;//增量比例因子
@property (nonatomic,assign)CGFloat deltaAlphaFactor;//增量阿尔法因子
@property (nonatomic,assign)CGFloat miniumOffsetX;//最小偏移量X

@end

@implementation SlideMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initParams];
}

//开关控制器
- (void)switchController {
    
    _folded = !_folded;
    if (_folded) {
        [self showContentViewController];
    } else {
        [self showMenuViewController];
    }
}

#pragma mark - Private  私有的

//初始化侧滑抽屉效果
- (void)initParams {
    _folded = YES;//默认折叠效果
    _scaleFactor = 0.95;//缩放因子0.95
    _offsetX = self.view.frame.size.width /2 + 30;//侧滑的间距
    _deltaAlphaFactor = 1 / _offsetX;//计算侧滑移动多少的透明度
    _miniumOffsetX = _offsetX / 2;//位移量的大小判断是否侧滑该展开还是合起
    _deltaScaleFactor = (1 - _scaleFactor) / _offsetX;//计算每偏移量的多少该缩放变化多少
}

- (void)showMenuViewController {
    
    //[self setShadowVisile:YES];
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(_offsetX, 0);
    transform = CGAffineTransformScale(transform, _scaleFactor, _scaleFactor);
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.menuContainer.alpha = 1;
        self.contentContainer.transform = transform;
    } completion:^(BOOL finished) {
        //[self setMaskButtonVisibs:YES];
    }];
}

- (void)showContentViewController {
    //[self setShadowVisible:NO];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.menuContainer.alpha = 0;
        self.contentContainer.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //[self setMaskButtonVisible:NO];
    }];
}

@end
