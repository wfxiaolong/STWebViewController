//
//  STAlertView.m
//  STWebViewController
//
//  Created by linxiaolong on 15/5/15.
//  Copyright (c) 2015年 linxiaolong. All rights reserved.
//

#import "STAlertView.h"

@interface STAlertView () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *hostField;
@property (nonatomic, strong) UITextField *ipAddressField;
@property (nonatomic, strong) UIButton    *comfirmBtn;

@property (nonatomic, copy  ) TouchBlock  tMBlock;

@end

@implementation STAlertView

- (void)mainTitle:(NSString *)mtitle block:(TouchBlock)block {
    CGRect mainRect = [UIScreen mainScreen].bounds;
    CGFloat wlength = 960/16*5-30;
    CGFloat hlength = 696/16*5-25;
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(mainRect.size.width/2-wlength/2, mainRect.size.height/2-hlength/2 - 100, wlength, hlength)];
    contentView.backgroundColor = [UIColor whiteColor];
    
    // set subView
    UILabel *mainLable  = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, wlength-25, 20)];
    mainLable.textColor = [UIColor orangeColor];
    mainLable.text      = mtitle;
    [contentView addSubview:mainLable];

    UILabel *lineLable  = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, wlength-25, 0.5)];
    lineLable.backgroundColor = [UIColor colorWithRed:249.0/255 green:157.0/255 blue:59.0/255 alpha:1];
    [contentView addSubview:lineLable];
    
    // add textField
    self.hostField = [[UITextField alloc] initWithFrame:CGRectMake(-1, 50, wlength+2, 30)];
    self.hostField.layer.borderWidth = 1;
    self.hostField.layer.borderColor = [UIColor grayColor].CGColor;
    self.hostField.textAlignment     = NSTextAlignmentCenter;
    self.hostField.placeholder       = @"例如：www.github.com ";
    
    self.ipAddressField = [[UITextField alloc] initWithFrame:CGRectMake(-1, 79, wlength+2, 30)];
    self.ipAddressField.layer.borderWidth = 1;
    self.ipAddressField.layer.borderColor = [UIColor grayColor].CGColor;
    self.ipAddressField.textAlignment     = NSTextAlignmentCenter;
    self.ipAddressField.placeholder       = @"例如：181.12.1.111 ";
    
    [contentView addSubview:self.ipAddressField];
    [contentView addSubview:self.hostField];
    
    // add comfirm btn
    self.comfirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, wlength, 30)];
    self.comfirmBtn.backgroundColor = [UIColor blackColor];
    [self.comfirmBtn setTitle:@"添加" forState:UIControlStateNormal];
    self.tMBlock = block;
    [contentView addSubview:self.comfirmBtn];
    [self.comfirmBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    contentView.layer.cornerRadius = 4;
    contentView.alpha = 0.9;
    
    [FVCustomAlertView content:contentView backAlpha:0.5 touchClose:YES];
    
}

- (void)btnClick:(id)sender {
    NSLog(@"我要去冲浪。。。🏄🏄🏄...");
    self.tMBlock(self.hostField.text, self.ipAddressField.text);
}

@end
