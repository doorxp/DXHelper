//
//  UIViewController+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DXHelper)
- (__kindof UIViewController *_Nullable)xib:(NSString *_Nullable)nameInStoryboard;

- (void)pushViewController:(UIViewController *_Nullable)viewController animated:(BOOL)animated;

- (nullable UIViewController *)popViewControllerAnimated:(BOOL)animated;

- (void)reloadData;
- (void)updateData;
@end
