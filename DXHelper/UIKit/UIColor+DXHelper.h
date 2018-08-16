//
//  UIColor+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

@import UIKit;

typedef uint8_t C_C;

typedef UIColor* (^COLORFUNCHANNEL)(C_C r, C_C g, C_C b, CGFloat a);
typedef UIColor* (^COLORFUNSTRING)(NSString *hexValue);
typedef UIColor * (^COLORFUN24)(uint32_t value);

@interface UIColor (DXHelper)

@property (class, nonatomic, strong, readonly)COLORFUNCHANNEL color;
@property (class, nonatomic, strong, readonly)COLORFUNSTRING hex;
@property (class, nonatomic, strong, readonly)COLORFUN24 value;

@end

#ifndef RGBA
#define RGBA(_r, _g, _b, _a) UIColor.color(_r, _g, _b, _a)
#endif //RGBA

#ifndef RGB
#define RGB(_r, _g, _b) RGBA(_r, _g, _b, 1.0)
#endif //RGB

#ifndef GRAY
#define GRAY(_c_) RGB(_c_, _c_, _c_)
#endif //GRAY

__attribute__((overloadable)) UIColor *HEX(NSString *value);
__attribute__((overloadable)) UIColor *HEX(uint32_t value);
