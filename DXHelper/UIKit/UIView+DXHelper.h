//
//  UIView+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

@import UIKit;

@interface UIView (DXHelper)
@property (nonatomic, readwrite)CGPoint origin;
@property (nonatomic, readwrite)CGSize size;

@property (nonatomic, readwrite)CGFloat x;
@property (nonatomic, readwrite)CGFloat y;
@property (nonatomic, readwrite)CGFloat width;
@property (nonatomic, readwrite)CGFloat height;

@property (nonatomic, readwrite)CGFloat centerX;
@property (nonatomic, readwrite)CGFloat centerY;

@property (nonatomic, strong, readonly)UIViewController *viewController;

@end

#define XY(x,y) CGPointMake(x, y)
#define SZ(w,h) CGSizeMake(w, h)
