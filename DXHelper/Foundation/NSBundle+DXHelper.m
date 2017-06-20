//
//  NSBundle+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/20.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSBundle+DXHelper.h"

@implementation NSBundle (DXHelper)

- (NSString *)displayName {
    static NSString *name = nil;
    
    if (!!name) {
        return name;
    }
    
    if (!name) {
        name = self.localizedInfoDictionary[@"CFBundleDisplayName"];
    }
    
    if (!name) {
        name = self.infoDictionary[@"CFBundleName"];
    }
    
    return name;
}

- (NSString *)appVersion {
    static NSString *name = nil;
    
    if (!!name) {
        return name;
    }
    
    if (!name) {
        name = self.localizedInfoDictionary[@"CFBundleShortVersionString"];
    }
    
    return name;
}

- (NSString *)devVersion {
    static NSString *name = nil;
    
    if (!!name) {
        return name;
    }
    
    if (!name) {
        name = self.localizedInfoDictionary[@"CFBundleVersion"];
    }
    
    return name;
}

@end
