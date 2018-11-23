//
//  UIApplication+DXHelper.h
//  BrowserDL
//
//  Created by doorxp on 2018/10/12.
//  Copyright © 2018 zhixun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (DXHelper)
@property (nonatomic, strong)UIView *statusBar;
@property (nonatomic, readwrite)BOOL hiddenStatusBar;
@end

NS_ASSUME_NONNULL_END
