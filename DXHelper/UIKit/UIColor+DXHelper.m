//
//  UIColor+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "UIColor+DXHelper.h"

@implementation UIColor (DXHelper)
+ (COLORFUNCHANNEL)color {
    return ^(C_C r,
             C_C g,
             C_C b,
             CGFloat a) {
        return [UIColor colorWithRed:r/255.0
                               green:g/255.0
                                blue:b/255.0
                               alpha:a];
    };
}

+ (COLORFUNSTRING)hex {
    return ^(NSString *hexColor) {
        
        UIColor *color = nil;
        
        if ([hexColor hasPrefix:@"#"]) {
            unsigned value = 0;
            NSScanner *scanner = [NSScanner scannerWithString:hexColor];
            [scanner setScanLocation:1]; // bypass '#' character
            [scanner scanHexInt:&value];
            if (hexColor.length == 2) {
                value = value << 4 | value;
                color = GRAY(value);
            }
            else if (hexColor.length == 3) {
                color = GRAY(value);
            }
            else if (hexColor.length == 4) {
                uint8_t r = value & 0xF00;
                uint8_t g = value & 0x0F0;
                uint8_t b = value & 0x00F;
                r = r << 4 | r;
                g = g << 4 | g;
                b = b << 4 | b;
                
                color = RGB(r, g, b);
            }
            else if (hexColor.length == 5) {
                uint8_t r = value & 0xF000;
                uint8_t g = value & 0x0F00;
                uint8_t b = value & 0x00F0;
                uint8_t a = value & 0x000F;
                
                r = r << 4 | r;
                g = g << 4 | g;
                b = b << 4 | b;
                a = a << 4 | a;
                
                color = RGBA(r, g, b, a/255.0);
            }
            else if (hexColor.length == 7) {
                uint8_t r = value & 0xFF0000;
                uint8_t g = value & 0x00FF00;
                uint8_t b = value & 0x0000FF;
                color = RGB(r, g, b);
            }
            else if (hexColor.length == 9) {
                uint8_t r = value & 0xFF000000;
                uint8_t g = value & 0x00FF0000;
                uint8_t b = value & 0x0000FF00;
                uint8_t a = value & 0x000000FF;
                color = RGBA(r, g, b, a/255.0);
            }
            else {
                #ifdef DEBUG
                NSAssert(0, @"hex error format!!");
                #endif//DEBUG
            }
        }
        else {
            NSString *name = [hexColor stringByAppendingString:@"Color"];
            SEL sel = NSSelectorFromString(name);
            Class cls = [UIColor class];
            if ([cls instancesRespondToSelector:sel]) {
                UIColor *(*func)(id, SEL)
                = (void*)[cls methodForSelector:sel];
                
                color = func(cls, sel);
            }
            else {
#ifdef DEBUG
                NSAssert(0, @"no named Color");
#endif //DEBUG
            }
        }
        
        return color;
    };
}

+ (COLORFUN24)value {
    return ^(uint32_t v) {
        uint8_t r = v & 0xFF0000;
        uint8_t g = v & 0x00FF00;
        uint8_t b = v & 0x0000FF;
        return RGB(r, g, b);
    };
}

@end


__attribute__((overloadable)) UIColor *HEX(NSString *value) {
    return UIColor.hex(value);
}

__attribute__((overloadable)) UIColor *HEX(uint32_t value) {
    return UIColor.value(value);
}
