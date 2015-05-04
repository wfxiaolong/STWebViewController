//
//  ViewController.m
//  STWebViewController
//
//  Created by linxiaolong on 15/4/27.
//  Copyright (c) 2015年 linxiaolong. All rights reserved.
//

#import "ViewController.h"
#import "STWebViewController.h"

#define URLSTRING @"http://m.red.jd.com/sg4jdapp/index.html?sid=4ad2a6ab713f074651dad250fef1a5af"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect rect = {
        {100, 100},
        {100, 100}
    };
    UIButton *btn = [[UIButton alloc] initWithFrame:rect];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClick:(id)sender {
    STWebViewController *webC = [[STWebViewController alloc] initWithAddress:URLSTRING];
    [self.navigationController pushViewController:webC animated:YES];
}

@end
