//
//  SlideMenuController.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "SlideMenuController.h"
#import "UtilsMacro.h"
#import <Masonry.h>//手写自动布局的第三方库或者称为框架

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
    //先将折叠效果设置相反
    _folded = !_folded;
    
    if (_folded) {
        [self showContentViewController];
    } else {
        [self showMenuViewController];
    }
}

//手势滑动
- (IBAction)panned:(UIPanGestureRecognizer *)sender {
    //拿到当前触摸屏幕上的点
    CGPoint point = [sender locationInView:self.view];
    //判断是哪种状态
    switch (sender.state) {
            //当点击屏幕时开始状态
        case UIGestureRecognizerStateBegan:
            //记录一下当前这个点
            _originalPoint = point;
            //并且将这个阴影效果设置为Yes 开启
            [self setShadowVisible:YES];
            break;
            //当移动的时候
        case UIGestureRecognizerStateChanged:{
            //point.x（当前点）- self.originalPoint.x（开始位置的点） + self.originalX（起始的X轴）
            CGFloat tx = point.x - self.originalPoint.x + self.originalX;
            //保证tx不能小于0 ；  tx < 0 ? 0 : tx（tx小于0吗 小于的话=0 不小于0的话=tx）
            tx = tx < 0 ? 0 : tx;
            
            CGFloat s = 1 - tx * self.deltaScaleFactor;
            s = s < 0 ? 0 : s;
            
            //设置平移的矩阵
            CGAffineTransform transform = CGAffineTransformMakeTranslation(tx, 0);
            //叠加一个缩放的变化
            transform = CGAffineTransformScale(transform, s, s);
            //将上述变化赋给contentContainer.transform容器的变化
            _contentContainer.transform = transform;
            
            
            //透明度跟着偏移量变化
            CGFloat alpha = tx * self.deltaAlphaFactor;
            alpha = alpha > 1 ? 1 :alpha;
            _menuContainer.alpha = alpha;
            
        } break;
            //当松开手指 或者 滑动到手机屏幕之外
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled: {
            
            //设置平移的矩阵
            CGAffineTransform transform = _contentContainer.transform;
            
            if (transform.tx >= self.miniumOffsetX) {
                //将折叠效果设为NO  表示展开
                self.folded = NO;
                //调用显示菜单视图控制器方法
                [self showMenuViewController];
            } else {
                ////将折叠效果设为Yes  表示合起
                self.folded = YES;
                //显示内容视图控制器
                [self showContentViewController];
            }
        } break;
        default:
            NSLog(@"其他状态...");
    }
}

- (CGFloat)originalX {
    return (_folded ? 0 : _offsetX);
}

#pragma mark - Private  私有的

//初始化侧滑抽屉效果
- (void)initParams {
    _folded = YES;//默认折叠效果
    _scaleFactor = 0.90;//缩放因子0.90
    _offsetX = self.view.frame.size.width / 2 + 30;//侧滑的间距
    _deltaAlphaFactor = 1 / _offsetX;//计算侧滑移动多少的透明度
    _miniumOffsetX = _offsetX / 2;//位移量的大小判断是否侧滑该展开还是合起
    _deltaScaleFactor = (1 - _scaleFactor) / _offsetX;//计算每偏移量的多少该缩放变化多少
}
//显示菜单视图控制器
- (void)showMenuViewController {
    //开启阴影效果
    [self setShadowVisible:YES];
    
    //设置平移_offsetX（X轴平移），Y轴不变（0）
    CGAffineTransform transform = CGAffineTransformMakeTranslation(_offsetX, 0);
    //叠加一个缩放的变化 缩放XY轴都为（_scaleFactor //缩放因子0.90）
    transform = CGAffineTransformScale(transform, _scaleFactor, _scaleFactor);
    //设置了一个动画效果（kAnimationDuration //动画时间 为0.35）
    [UIView animateWithDuration:kAnimationDuration animations:^{
        //透明度设为1
        self.menuContainer.alpha = 1;
        //将上述变化赋给contentContainer.transform容器的变化
        self.contentContainer.transform = transform;
    } completion:^(BOOL finished) {
        //开启蒙版按钮
        [self setMaskButtonVisible:YES];
    }];
}
//显示内容视图控制器
- (void)showContentViewController {
    //关闭阴影效果
    [self setShadowVisible:NO];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.menuContainer.alpha = 0;
        self.contentContainer.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self setMaskButtonVisible:NO];
    }];
}
//设置阴影
- (void)setShadowVisible:(BOOL)visible {
    if (visible) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:_contentContainer.layer.bounds];//根据contentContainer内容的容器来设置贝塞尔曲线路径
        _contentContainer.layer.shadowPath = path.CGPath;//设置阴影路径
        _contentContainer.layer.shadowColor = [UIColor blackColor].CGColor;//设置阴影颜色
        _contentContainer.layer.shadowOffset = CGSizeZero;//偏移量
        _contentContainer.layer.shadowOpacity = 0.4;//透明度
        _contentContainer.layer.shadowRadius = 4.5;//圆角
    } else {
        //让阴影消失
        _contentContainer.layer.shadowRadius = 0;//圆角
    }
}
//设置蒙版按钮
- (void)setMaskButtonVisible:(BOOL)visible {
    //nil OC:表示对象不存在
    //    Swift:表示对象不存在或值缺失
    
    if (_maskButton == nil) {
        //初始化按钮
        self.maskButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //绑定按钮事件
        [_maskButton addTarget:self action:@selector(maskButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
        //将按钮放置_contentContainer（内容容器）上
        [_contentContainer addSubview:_maskButton];
        //设置约束
        [_maskButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_contentContainer).insets(UIEdgeInsetsZero);
        }];
    }
    
    _maskButton.hidden = !visible;
}
//蒙版按钮按下事件
- (void)maskButtonPressed {
    //先将折叠效果设置相反状态
    _folded = !_folded;
    //执行showContentViewController方法
    [self showContentViewController];
}

@end
