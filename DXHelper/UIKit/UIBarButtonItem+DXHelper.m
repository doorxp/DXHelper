//
//  UIBarButtonItem+DXHelper.m
//  BrowserDL
//
//  Created by doorxp on 2018/8/31.
//  Copyright © 2018年 zhixun. All rights reserved.
//

#import "UIBarButtonItem+DXHelper.h"

@implementation UIBarButtonItem (DXHelper)
+ (instancetype)title:(NSString *)title target:(id)target action:(SEL)action {
    UIBarButtonItem *bbi =
    [[UIBarButtonItem alloc] initWithTitle:title
                                     style:UIBarButtonItemStylePlain
                                    target:target
                                    action:action];
    return bbi;
}

+ (instancetype)imageNamed:(NSString *)named target:(id)target action:(SEL)action {
    UIImage *image = [UIImage imageNamed:named];
    UIBarButtonItem *bbi =
    [[UIBarButtonItem alloc] initWithImage:image
                                     style:UIBarButtonItemStylePlain
                                    target:target
                                    action:action];
    return bbi;
}

+ (instancetype)sytem:(UIBarButtonSystemItem)type target:(id)target action:(SEL)action {
    return [[UIBarButtonItem alloc] initWithBarButtonSystemItem:type target:target action:action];
    
}

+ (instancetype)flexible {
    return [self sytem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
}

+ (instancetype)fixed {
    return [self sytem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
}
@end
