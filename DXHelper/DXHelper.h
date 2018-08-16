//
//  DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/16.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface DXHelper : NSObject

@end

UIKIT_EXTERN __kindof UIViewController *rooter(void);
UIKIT_EXTERN UIApplication *NSAPP(void);
UIKIT_EXTERN UIWindow *NSWindow(void);

#ifdef DEBUG

CF_EXTERN_C_BEGIN
extern void DEBUGLog(NSString *format, ...);
CF_EXTERN_C_END

#ifndef NSLog
#define  NSLog(format,...) DEBUGLog(@"%s[%d] " format ,strrchr(__BASE_FILE__,'/')+1, __LINE__, ##__VA_ARGS__)
#endif

#else
#define  NSLog(format,...)
#endif //DEBUG


#import "NSString+DXHelper.h"
#import "NSMutableString+DXHelper.h"
#import "NSAttributedString+DXHelper.h"
#import "NSMutableAttributedString+DXHelper.h"
#import "NSDictionary+DXHelper.h"
#import "NSDate+DXHelper.h"
#import "NSData+DXHelper.h"
#import "NSNotificationCenter+DXHelper.h"
#import "NSObject+DXHelper.h"
#import "NSDate+DXHelper.h"
#import "NSData+DXHelper.h"
#import "NSUserDefaults+DXHelper.h"
#import "NSFetchRequest+DXHelper.h"
#import "NSFetchedResultsController+DXHelper.h"
#import "NSFileManager+DXHelper.h"
#import "NSLayoutAnchor+DXHelper.h"

#import "DXCell.h"
#import "UIColor+DXHelper.h"
#import "UIView+DXHelper.h"
#import "UIViewController+DXHelper.h"
#import "UIButton+DXHelper.h"
#import "UIAlertController+DXHelper.h"
