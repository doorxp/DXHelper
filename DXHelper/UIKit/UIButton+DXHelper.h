//
//  UIButton+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DXHelper)
@property (nonatomic, strong)NSString *normalText;
@property (nonatomic, strong)UIImage *normalImage;

@property (nonatomic, strong)NSString *selectText;
@property (nonatomic, strong)UIImage *selectImage;

@property (nonatomic, strong)NSString *disableText;
@property (nonatomic, strong)UIImage *disableImage;

@property (nonatomic, strong)UIColor *normalTextColor;
@property (nonatomic, strong)UIColor *selectTextColor;
@property (nonatomic, strong)UIColor *disableColor;

@property (nonatomic, strong)UIImage *normalBackgroundImage;
@property (nonatomic, strong)UIImage *selectBackgroundImage;
@property (nonatomic, strong)UIImage *disableBackgroundImage;
@end
