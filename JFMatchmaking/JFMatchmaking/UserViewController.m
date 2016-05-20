//
//  UserViewController.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/17.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "UserViewController.h"
#import "UtilsMacro.h"
#import "User.h"
#import "AFNetworkingHelper.h"
#import "UIImageView+webCache.h"
#import "UIViewController+Base.h"

@interface UserViewController ()

@property (nonatomic,assign) BOOL logged;

@property (nonatomic, weak) IBOutlet UIImageView *headImageView;
@property (nonatomic, weak) IBOutlet UILabel *nicknameLabel;

@end

@implementation UserViewController
//将要显示时
- (void)viewWillAppear:(BOOL)animated {
    //super 访问父类的方法
    [super viewWillAppear:animated];
    [self registerNotifications];
}

//将要消失时
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self unregisterNotifications];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景图片
    UIImage *image = [UIImage imageNamed:@"bg"];
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:image];
    
    //刷新数据
    User *user = [User currentUser];
    _logged = (user != nil ? YES : NO);
    [self refresh];
    
}

- (IBAction)headTapped {
    if (_logged == NO) {
        [self pushWithStoryboardID:@"Login" data:nil];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (_logged ? 3 : 0);
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row;
    if (index == 0) { //个人资料
        NSString *objectId = [[User currentUser] objectId];
        NSDictionary *data = @{@"isMe" : @YES, @"objectId" : objectId};
        [self pushWithStoryboardID:@"Personal" data:data];
    } else if (index == 1) { //消息中心
        
    } else { //注销
        //
        [User logout];
        
        //
        _logged =NO;
        [self refresh];
        
        //
        [self.tableView reloadData];
    }
}


#pragma mark - Private

- (void)registerNotifications {
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(didLogin) name:kNotificationTypeLogin object:nil];
    [center addObserver:self selector:@selector(didReset) name:kNofiticationTypeReset object:nil];
}

- (void)unregisterNotifications {

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

- (void)didLogin {
    _logged = YES;
    [self refresh];
}

- (void)didReset {
    [self refresh];
}

- (void)refresh {
    if (_logged == YES) {//登录
        NSString *objectId = [[User currentUser] objectId];
        NSDictionary *data = @{@"objectId" : objectId};
        
        AFNetworkingHelper *helper = [AFNetworkingHelper defaultHelper];
        [helper sendRequestWithURLString:kURLTypeInfos
                              parameters:data
                                 success:^(NSURLSessionDataTask *task, NSDictionary *response) {
                                     [self successWithTask:task response:response];
                                 }
                                 failure:^(NSURLSessionDataTask *task,NSError *error) {
                                     NSLog(@"%@",error);
                                     [self failureWithTask:task error:error];
                                 }];
        
    } else { //未登录
        _headImageView.image = [UIImage imageNamed:@"bg"];
        _nicknameLabel.text = @"点击头像登录";
        [self.tableView reloadData];
    }
}

- (void)successWithTask:(NSURLSessionDataTask *)task response:(NSDictionary *)response {
    NSInteger code = [response[@"code"] integerValue];
    if (code == 200) {
        //设置昵称
        NSDictionary *data = response[@"data"];
        _nicknameLabel.text = data[@"nickname"];
        
        //设置头像
        NSString *photo = data[@"photo"];
        NSURL *url = [NSURL URLWithString:photo];
        if (url != nil) {
            UIImage *image = [UIImage imageNamed:@"bg"];
            [_headImageView sd_setImageWithURL:url placeholderImage:image];
        } else {
            [self defaultSetting];
        }
        
    } else {
        [self defaultSetting];
    }
    
    [self.tableView reloadData];
}

- (void)failureWithTask:(NSURLSessionDataTask *)task error:(NSError *)error {
    [self defaultSetting];
    [self.tableView reloadData];
}

- (void)defaultSetting {
    _headImageView.image = [UIImage imageNamed:@"bg"];
    _nicknameLabel.text = @"昵称未知";
}

- (void)pushWithStoryboardID:(NSString *)identifier data:(NSObject *)data {
    //导航效果
    UINavigationController *nav = self.parentViewController.childViewControllers[1];
    [nav pushViewControllerWithStoryboardID:identifier animated:NO data:data];
    
    //抽屉效果
    [self.slideMenuController switchController];
}

@end
