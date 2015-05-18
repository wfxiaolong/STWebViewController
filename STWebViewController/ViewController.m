//
//  ViewController.m
//  STWebViewController
//
//  Created by linxiaolong on 15/4/27.
//  Copyright (c) 2015年 linxiaolong. All rights reserved.
//

#import "ViewController.h"
#import "SVWebViewController.h"
#import "TableViewController.h"

//#define URLSTRING @"http://m.red.jd.com/sg4jdapp/index.html?sid=4ad2a6ab713f074651dad250fef1a5af"
#define URLSTRING @"http://www.baidu.com"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect rect = {
        {50, 100},
        {200, 50}
    };
    UIButton *btn = [[UIButton alloc] initWithFrame:rect];
    [btn setTitle:@"侧滑京东页面" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    CGRect rect2 = {
        {50, 200},
        {200, 50}
    };
    UIButton *btn2 = [[UIButton alloc] initWithFrame:rect2];
    [btn2 setTitle:@"内网访问host" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor blackColor];
    [btn2 addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClick:(id)sender {
    SVWebViewController *webC = [[SVWebViewController alloc] initWithAddress:URLSTRING];
    [self.navigationController pushViewController:webC animated:YES];
}

- (void)btnClick2:(id)sender {
    TableViewController *tabW = [[TableViewController alloc] init];
    [self.navigationController pushViewController:tabW animated:YES];
}

@end
