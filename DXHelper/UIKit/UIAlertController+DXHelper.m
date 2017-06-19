//
//  UIAlertController+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "UIAlertController+DXHelper.h"

@implementation UIAlertController (DXHelper)

+ (UIAlertControllerAlertCall)alert {
    return ^(NSString *title, NSString *message) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        return alert;
    };
}

+ (UIAlertControllerAlertCall)actionSheet {
    return ^(NSString *title, NSString *message) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
        
        return alert;
    };
}

- (UIAlertControllerAddTextField)textField {
    return ^(UIAlertControllerConfigurationTextField handler) {
        [self addTextFieldWithConfigurationHandler:handler];
        return self;
    };
}

static UIWindow *window = nil;

- (UIAlertControllerAddAction)action {
    return ^(NSString *title, UIAlertControllerHandler handler) {
        UIAlertAction *aa =
        [UIAlertAction actionWithTitle:title
                                 style:self.actions.count>0?UIAlertActionStyleDefault:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * _Nonnull action) {
                                  NSUInteger btnIndex = [self.actions indexOfObject:action];
                                   handler(self, btnIndex);
                                   window.rootViewController = nil;
                                   window = nil;
                               }];
        
        [self addAction:aa];
        return self;
    };
}

- (UIAlertControllerShow) show {
    
    return ^{
        CGRect r = [UIScreen mainScreen].bounds;
        
        window = [[UIWindow alloc] initWithFrame:r];
        window.windowLevel = UIWindowLevelAlert;
        window.rootViewController = [UIViewController new];
        
        [window makeKeyAndVisible];
        
        [window.rootViewController presentViewController:self animated:true completion:nil];
        
        return self;
    };
}

@end
