//
//  TableViewController.m
//  STWebViewController
//
//  Created by linxiaolong on 15/5/15.
//  Copyright (c) 2015年 linxiaolong. All rights reserved.
//

#import "TableViewController.h"
#import "STAlertView.h"
#import "PPWebViewController.h"

#import "NSEtcHosts.h"

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *hostArray;
@property (nonatomic, strong) NSMutableArray *ipAddreddArray;
@property (nonatomic, strong) STAlertView    *stCusAlertView;

@end

static NSString *identify = @"tableViewCellIdentify";

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureData];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarClick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureData {
    self.hostArray      = @[].mutableCopy;
    self.hostArray      = [[NSUserDefaults standardUserDefaults] objectForKey:@"hostArray"];
    self.ipAddreddArray = @[].mutableCopy;
    self.ipAddreddArray =[[NSUserDefaults standardUserDefaults] objectForKey:@"ipAddressArray"];
    if (!self.hostArray || !self.ipAddreddArray) {
        self.hostArray      = @[@"www.duobao_admin.com"].mutableCopy;
        self.ipAddreddArray = @[@"120.132.59.160"].mutableCopy;
    }
}

- (void)rightBarClick:(id)sender {
    if (!self.stCusAlertView) {
        self.stCusAlertView = [[STAlertView alloc] init];
    }
    [self.stCusAlertView mainTitle:@"添加" block:^(NSString *host, NSString *ipAddress) {
        [STAlertView hideAlertViewWithAnimation:YES];
        if ([host isEqualToString:@""] || [ipAddress isEqualToString:@""]) {
            return ;
        }
        [self.hostArray addObject:host];
        [self.ipAddreddArray addObject:ipAddress];
        [self.tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.hostArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identify];
    cell.textLabel.text = self.hostArray[indexPath.row];
    cell.detailTextLabel.text = self.ipAddreddArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [NSEtcHosts addHost:self.hostArray[indexPath.row] ipAddress:self.ipAddreddArray[indexPath.row]];
    /// HTTPS的需要自己判断
    NSString *urlSting = [@"http://" stringByAppendingString:self.hostArray[indexPath.row]];
    PPWebViewController *webView = [[PPWebViewController alloc] initWithURL:[NSURL URLWithString:urlSting]];
    [self.navigationController pushViewController:webView animated:YES];
}

@end
