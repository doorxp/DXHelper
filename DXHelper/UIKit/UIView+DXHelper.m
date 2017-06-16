//
//  UIView+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "UIView+DXHelper.h"

@implementation UIView (DXHelper)
- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect r = self.frame;
    r.origin = origin;
    self.frame = r;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect r = self.frame;
    r.size = size;
    self.frame = r;
}

- (CGFloat)x {
    return self.origin.x;
}

- (CGFloat)y {
    return self.origin.y;
}

- (CGFloat)width {
    return self.size.width;
}

- (CGFloat)height {
    return self.size.height;
}

- (void)setX:(CGFloat)x {
    CGRect r = self.frame;
    r.origin.x = x;
    self.frame = r;
}

- (void)setY:(CGFloat)y {
    CGRect r = self.frame;
    r.origin.y = y;
    self.frame = r;
}

- (void)setWidth:(CGFloat)width {
    CGRect r = self.frame;
    r.size.width = width;
    self.frame = r;
}

- (void)setHeight:(CGFloat)height {
    CGRect r = self.frame;
    r.size.height = height;
    self.frame = r;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint p = self.center;
    p.x = centerX;
    self.center = p;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint p = self.center;
    p.y = centerY;
    self.center = p;
}

- (UIViewController*)viewController {
    
    id controller = self.nextResponder;
    while (!!controller && ![controller isKindOfClass:[UIViewController class]]) {
        controller = [controller nextResponder];
    }
    
    return controller;
}

@end
