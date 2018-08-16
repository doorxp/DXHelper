//
//  UIAlertController+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^UIAlertControllerHandler)(UIAlertController *sender, NSInteger buttonIndex);

typedef void (^ UIAlertControllerConfigurationTextField)(UITextField *textField);
typedef UIAlertController *(^UIAlertControllerAddTextField)(UIAlertControllerConfigurationTextField handler);

typedef UIAlertController *(^UIAlertControllerAlertCall)(NSString *title, NSString *message);
typedef UIAlertController *(^UIAlertControllerAddAction)(NSString *title, UIAlertControllerHandler handler);

typedef UIAlertController *(^UIAlertControllerShow)(void);




@interface UIAlertController (DXHelper)
@property (class, nonatomic , readonly)UIAlertControllerAlertCall alert;
@property (class, nonatomic , readonly)UIAlertControllerAlertCall actionSheet;

@property (nonatomic ,readonly)UIAlertControllerAddAction action;
@property (nonatomic, readonly)UIAlertControllerAddTextField textField;

@property (nonatomic ,readonly)UIAlertControllerShow show;
@end

@compatibility_alias UIAlert UIAlertController;
