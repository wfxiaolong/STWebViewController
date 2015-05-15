//
//  STAlertView.h
//  STWebViewController
//
//  Created by linxiaolong on 15/5/15.
//  Copyright (c) 2015年 linxiaolong. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FVCustomAlertView.h"

@interface STAlertView : FVCustomAlertView

typedef void (^TouchBlock)(NSString *host, NSString *ipAddress);

- (void)mainTitle:(NSString *)mtitle
            block:(TouchBlock)block;

@end
