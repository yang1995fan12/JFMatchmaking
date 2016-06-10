//
//  PersonalCell.h
//  JFMatchmaking
//
//  Created by 杨凡 on 16/6/10.
//  Copyright © 2016年 yf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfo.h"

@interface PersonalCell : UITableViewCell

@property (nonatomic,weak)IBOutlet UIImageView *headImageView;
@property (nonatomic,weak)IBOutlet UIImageView *sexImageView;
@property (nonatomic,weak)IBOutlet UILabel *nameLabel;
@property (nonatomic,weak)IBOutlet UILabel *ageLabel;
@property (nonatomic,weak)IBOutlet UILabel *heightLabel;
@property (nonatomic,weak)IBOutlet UILabel *recordLabel;
@property (nonatomic,weak)IBOutlet UILabel *addressLabel;
@property (nonatomic,weak)IBOutlet UILabel *salaryLabel;
@property (nonatomic,weak)IBOutlet UILabel *introduceLabel;
@property (nonatomic,weak)IBOutlet UILabel *timeLabel;
@property (nonatomic,weak)IBOutlet UIButton *helloButton;

@property (nonatomic,strong)UserInfo *userInfo;

@end
