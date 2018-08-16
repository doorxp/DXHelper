//
//  NSString+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface NSString (DXHelper)
#pragma mark - URLEncode/Decode
//URL encode
- (NSString *)urlEncode;
//URL decode
- (NSString *)urlDecode;

- (NSString *)md5;
- (NSString *)sha1;

- (id)jsonObject;

- (CGSize)sizeTo:(UIFont*)font constrainedToSize:(CGSize)cSize;
- (CGSize)sizeTo:(UIFont *)font;

- (NSData *)data;

- (NSUInteger)unsignedIntegerValue;

- (NSData *)deccodeBase64;

- (NSAttributedString*)html:(NSDictionary *)defAttributs;

- (NSAttributedString*)outlineString;

- (UIImage *)qrImage:(CGFloat)size;

//- (NSString *)format:(NSString *)first, ...;
@end
