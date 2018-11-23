//
//  UIBarButtonItem+DXHelper.h
//  BrowserDL
//
//  Created by doorxp on 2018/8/31.
//  Copyright © 2018年 zhixun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (DXHelper)

+ (instancetype)title:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)imageNamed:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)sytem:(UIBarButtonSystemItem)type target:(id)target action:(SEL)action;

+ (instancetype)flexible;
+ (instancetype)fixed;

@end
