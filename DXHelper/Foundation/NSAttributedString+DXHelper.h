//
//  NSAttributedString+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NSAttributedString (DXHelper)
+ (instancetype)string:(NSString *)str attributes:(NSDictionary *)attributes;

- (id)data;

- (CGSize)sizeForWidth:(CGFloat)width font:(UIFont *)font;

- (void)appending:(NSString *)str attributes:(NSDictionary *)attributes;
@end
