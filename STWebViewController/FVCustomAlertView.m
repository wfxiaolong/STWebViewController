//
//  FVCustomAlertView.m
//  FVCustomAlertView
//
//  Created by Francis Visoiu Mistrih on 13/07/2014.
//  Copyright (c) 2014 Francis Visoiu Mistrih. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "FVCustomAlertView.h"

static const NSUInteger kFinalViewTag = 1337;
static const NSUInteger kAlertViewTag = 1338;
static const CGFloat kFadeOutDuration = 0.5f;

@interface FVCustomAlertView ()

+ (void)fadeOutView:(UIView *)view completion:(void (^)(BOOL finished))completion;
+ (void)hideAlertByTap:(UITapGestureRecognizer *)sender;

@end

@implementation FVCustomAlertView

+ (void)fadeOutView:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:kFadeOutDuration
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [view setAlpha:0.0];
                     }
                     completion:completion];
}

+ (void)hideAlertByTap:(UITapGestureRecognizer *)sender {
    //fade out and then remove from superview
    [self fadeOutView:sender.view
           completion:^(BOOL finished) {
               [[sender.view viewWithTag:kFinalViewTag] removeFromSuperview];
           }];
}

#pragma -mark UNAlertView

+ (UIView *)content:(UIView*)contentView
          backAlpha:(CGFloat)alphaNum
         touchClose:(BOOL)canClose
{
    UIViewController *topVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    UIView *view = topVC.view;
    if ([view viewWithTag:kFinalViewTag]) {
        //don't allow 2 alerts on the same view
        NSLog(@"Can't add two FVCustomAlertViews on the same view. Hide the current view first.");
        return nil;
    }
    
    //get window size and position
    CGRect windowRect = [[UIScreen mainScreen] bounds];
    
    //create the final view with a special tag
    UIView *resultView = [[UIView alloc] initWithFrame:windowRect];
    resultView.tag = kFinalViewTag; //set tag to retrieve later
    
    //create shadow view by adding a black background with custom opacity
    UIView *shadowView = [[UIView alloc] initWithFrame:windowRect];
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.alpha = alphaNum;
    [resultView addSubview:shadowView];
    
    contentView.tag = kAlertViewTag; //set tag to retrieve later
    
    //set the number of lines to 0 (unlimited)
    [resultView addSubview:contentView];
    
    //tap the alert view to hide and remove it from the superview
    if (canClose) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:[FVCustomAlertView class] action:@selector(hideAlertByTap:)];
        tapGesture.numberOfTapsRequired = 1;
        tapGesture.numberOfTouchesRequired = 1;
        [resultView addGestureRecognizer:tapGesture];
    }
    
    [view addSubview:resultView];
    
    return resultView;
}

+ (void)hideAlertViewWithAnimation:(BOOL)fading {
    UIViewController *topVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    UIView *view = topVC.view;
    if (fading) {
        [self fadeOutView:[view viewWithTag:kFinalViewTag] completion:^(BOOL finished) {
            [[view viewWithTag:kFinalViewTag] removeFromSuperview];
        }];
    } else {
        [[view viewWithTag:kFinalViewTag] removeFromSuperview];
    }
}

@end
