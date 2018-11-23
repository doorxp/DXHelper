//
//  UIApplication+DXHelper.m
//  BrowserDL
//
//  Created by doorxp on 2018/10/12.
//  Copyright © 2018 zhixun. All rights reserved.
//

#import "UIApplication+DXHelper.h"

@implementation UIApplication (DXHelper)
@dynamic statusBar;

- (void)setHiddenStatusBar:(BOOL)hiddenStatusBar {
    if ([self respondsToSelector:@selector(statusBar)]) {
        self.statusBar.hidden = hiddenStatusBar;
    }
    else {
        self.statusBarHidden = hiddenStatusBar;
    }
}

- (BOOL)hiddenStatusBar {
     if ([self respondsToSelector:@selector(statusBar)]) {
         return self.statusBar.hidden;
     }
     else {
         return self.statusBarHidden;
     }
}

@end
