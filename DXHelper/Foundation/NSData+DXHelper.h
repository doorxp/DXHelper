//
//  NSData+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (DXHelper)
- (NSData *)gzippedData;
- (NSData *)gunzippedData;

- (NSData *)encryptWithKey:(NSString *)key;
- (NSData *)decryptWithKey:(NSString *)key;

- (id)jsonObject;

- (NSString *)string;

- (NSString *)encodeBase64;

- (NSAttributedString*)html:(NSDictionary *)defAttributs;
- (NSAttributedString *)rtf;
@end
