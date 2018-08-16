//
//  UIButton+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "UIButton+DXHelper.h"

@implementation UIButton (DXHelper)
- (void)setNormalImage:(UIImage *)normalImage
{
    [self setImage:normalImage forState:UIControlStateNormal];
}

- (void)setSelectImage:(UIImage *)selectImage
{
    [self setImage:selectImage forState:UIControlStateSelected];
}

- (void)setDisableImage:(UIImage *)disableImage
{
    [self setImage:disableImage forState:UIControlStateDisabled];
}

- (void)setNormalText:(NSString *)normalText
{
    [self setTitle:normalText forState:UIControlStateNormal];
}

- (void)setSelectText:(NSString *)selectText
{
    [self setTitle:selectText forState:UIControlStateSelected];
}


- (void)setDisableText:(NSString *)disableText
{
    [self setTitle:disableText forState:UIControlStateDisabled];
}

- (UIImage *)normalImage
{
    return [self imageForState:UIControlStateNormal];
}

- (UIImage *)selectImage
{
    return [self imageForState:UIControlStateSelected];
}

- (UIImage *)disableImage
{
    return [self imageForState:UIControlStateDisabled];
}



- (NSString *)normalText
{
    return [self titleForState:UIControlStateNormal];
}

- (NSString *)selectText
{
    return [self titleForState:UIControlStateSelected];
}

- (NSString *)disableText
{
    return [self titleForState:UIControlStateDisabled];
}

- (UIColor *)normalTextColor
{
    return [self titleColorForState:UIControlStateNormal];
}

- (UIColor *)selectTextColor
{
    return [self titleColorForState:UIControlStateSelected];
}

- (UIColor *)disableColor
{
    return [self titleColorForState:UIControlStateDisabled];
}

- (void)setNormalTextColor:(UIColor *)normalTextColor
{
    [self setTitleColor:normalTextColor forState:UIControlStateNormal];
}

- (void)setDisableColor:(UIColor *)disableColor
{
    [self setTitleColor:disableColor forState:UIControlStateDisabled];
}

- (void)setSelectTextColor:(UIColor *)selectTextColor
{
    [self setTitleColor:selectTextColor forState:UIControlStateSelected];
}


- (void)setNormalBackgroundImage:(UIImage *)normalBackgroundImage
{
    [self setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
}

- (void)setSelectBackgroundImage:(UIImage *)selectBackgroundImage
{
    [self setBackgroundImage:selectBackgroundImage forState:UIControlStateSelected];
}

- (void)setDisableBackgroundImage:(UIImage *)disableBackgroundImage
{
    [self setBackgroundImage:disableBackgroundImage forState:UIControlStateDisabled];
}

- (UIImage *)normalBackgroundImage
{
    return [self backgroundImageForState:UIControlStateNormal];
}

- (UIImage *)selectBackgroundImage
{
    return [self backgroundImageForState:UIControlStateSelected];
}

- (UIImage *)disableBackgroundImage
{
    return [self backgroundImageForState:UIControlStateDisabled];
}
@end
