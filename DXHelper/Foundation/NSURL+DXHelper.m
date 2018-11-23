//
//  NSURL+DXHelper.m
//  BrowserDL
//
//  Created by doorxp on 2018/8/22.
//  Copyright © 2018年 zhixun. All rights reserved.
//

#import "NSURL+DXHelper.h"
@import MobileCoreServices;

@implementation NSURL (DXHelper)
- (NSString *)mimeType {
    NSString *uti = nil;
    [self getResourceValue:&uti
                        forKey:NSURLTypeIdentifierKey
                         error:nil];
    
    if(!uti) {
        NSString *ext = self.pathExtension;
        uti = (__bridge NSString *)(UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef _Nonnull)(ext), NULL));
        CFAutorelease((__bridge CFTypeRef)(uti));
    }
    
    
    NSString * mimeType = nil;
    
    if(!!uti) {
        mimeType =
        (__bridge NSString *)(UTTypeCopyPreferredTagWithClass((__bridge CFStringRef _Nonnull)(uti), kUTTagClassMIMEType));
    }
    
    
    if (!mimeType) {
        mimeType = @"application/octet-stream";
    }
    return mimeType;
}
@end
