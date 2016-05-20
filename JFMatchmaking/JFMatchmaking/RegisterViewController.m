//
//  RegisterViewController.m
//  JFMatchmaking
//
//  Created by 杨凡 on 16/5/20.
//  Copyright © 2016年 yf. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

//IBOutletCollection 输出口的数组
@property (nonatomic,strong) IBOutletCollection(UITextField) NSArray *fields;

@end

@implementation RegisterViewController

- (IBAction)touched {
    [self.view endEditing:YES];
}

- (IBAction)registerButtonPressed:(id)sender {
    
}

//点击键盘右下角的事件
- (IBAction)textFieldDidEndOnExit:(UITextField *)field {
    //获得当前这个输入框是第几个
    NSInteger index = [_fields indexOfObject:field];
    //如果小于2呢
    if (index < 2) {
        //我们就让当前这个输入框失去焦点
        [field resignFirstResponder];
        //并且让下一个输入框获得焦点
        [_fields[++index] becomeFirstResponder];
    } else {
        //否者就让最后一个输入框失去焦点
        [field resignFirstResponder];
    }
}

@end
