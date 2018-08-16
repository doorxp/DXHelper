//
//  NSObject+DXHelper.h
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreGraphics;

@interface NSObject (DXHelper)
- (id)call:(SEL)sel,... NS_REQUIRES_NIL_TERMINATION;

/**
 *  交换对象的两个方法
 *
 *  @param  originSelector 原始方法
 *  @param  selector 用于交换的方法
 */
- (void)swizzleSelector:(SEL)originSelector withSelector:(SEL)selector;

/**
 *  交换类的两个方法
 *
 *  @param  originSelector 原始方法
 *  @param  selector 用于交换的方法
 */
+ (void)swizzleSelector:(SEL)originSelector withSelector:(SEL)selector;

+ (void)swizzleSelector:(SEL)originSelector withSelector:(SEL)selector class:(Class)aclass;

+ (void)swizzleSelector:(SEL)originSelector withSelector:(SEL)selector swizzleClass:(Class)swizzleClass withClass:(Class)withClass;

- (void)onlyCallLast:(SEL)selector object:(id)sender;
- (void)onlyCallLast:(SEL)selector object:(id)sender wait:(CGFloat)wait;

- (BOOL)instancesRespondToSelector:(SEL)aSelector;

#ifdef DEBUG
- (void)dump;
#endif //DEBUG
@end
