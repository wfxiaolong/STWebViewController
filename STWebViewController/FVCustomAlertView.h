//
//  FVCustomAlertView.h
//  FVCustomAlertView
//
//  Created by Francis Visoiu Mistrih on 13/07/2014.
// 

#import <UIKit/UIKit.h>

/**
 * Displays a custom alert view. It can contain either a title or a custom UIView
 * The view is customisable and has 4 default modes:
 * - FVAlertTypeLoading - displays a UIActivityIndicator
 * - FVAlertTypeDone/Error/Warning - displays a checkmark/cross/exclamation point
 * - FVAlertTypeCustom - lets the user to customise the view
 */

@interface FVCustomAlertView : UIView

/// really custom alertView
+ (UIView *)content:(UIView *)contentView
          backAlpha:(CGFloat)alphaNum
         touchClose:(BOOL)canClose;

+ (void)hideAlertViewWithAnimation:(BOOL)fading;

@end
