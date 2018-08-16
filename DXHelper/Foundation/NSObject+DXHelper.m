//
//  NSObject+DXHelper.m
//  DXHelper
//
//  Created by doorxp on 2017/6/19.
//  Copyright © 2017年 doorxp. All rights reserved.
//

#import "NSObject+DXHelper.h"
#import <objc/runtime.h>

@implementation NSObject (DXHelper)
- (id)call:(SEL)sel,...
{
    NSMethodSignature *signature = [self methodSignatureForSelector:sel];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:self];
    
    va_list ap;
    va_start(ap, sel);
    id obj = va_arg(ap, id);
    
    NSInteger i = 2;
    while (obj)
    {
        [invocation setArgument:&obj atIndex:i];
        i ++;
        obj = va_arg(ap, id);
    }
    
    va_end(ap);
    
    
    [invocation setSelector:sel];
    [invocation invokeWithTarget:self];
    
    id retValue = nil;
    
    //    if (signature.methodReturnLength > 0)
    //    {
    //        [invocation getReturnValue:&retValue];
    //    }
    
    return retValue;
    
}

/**
 *  交换指定对象的两个方法
 *
 *  @param  originSelector 原始方法
 *  @param  selector 用于交换的方法
 *  @param  class 前两个方法所属的类
 */
+ (void)swizzleSelector:(SEL)originSelector withSelector:(SEL)selector class:(Class)class
{
    SEL originalSelector = originSelector;
    SEL swizzledSelector = selector;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    /*
     交换两个方法
     //*/
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)swizzleSelector:(SEL)originSelector withSelector:(SEL)selector swizzleClass:(Class)swizzleClass withClass:(Class)withClass {
    
    SEL originalSelector = originSelector;
    SEL swizzledSelector = selector;
    
    Method originalMethod = class_getInstanceMethod(swizzleClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(withClass, swizzledSelector);
    
    /*
     交换两个方法
     //*/
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

+ (void)swizzleSelector:(SEL)originSelector withSelector:(SEL)selector
{
    Class class = [self class];
    [self swizzleSelector:originSelector
             withSelector:selector
                    class:class];
}

- (void)swizzleSelector:(SEL)originSelector withSelector:(SEL)selector
{
    Class class = [self class];
    [[self class] swizzleSelector:originSelector
                     withSelector:selector
                            class:class];
    
}

- (void)onlyCallLast:(SEL)selector object:(id)sender wait:(CGFloat)wait
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self
                                             selector:selector
                                               object:sender];
    
    [self performSelector:selector
               withObject:sender
               afterDelay:wait];
}

- (void)onlyCallLast:(SEL)selector object:(id)sender
{
    [self onlyCallLast:selector object:sender wait:1];
}

- (BOOL)instancesRespondToSelector:(SEL)aSelector
{
    return [[self class] instancesRespondToSelector:aSelector];
}
#ifdef DEBUG
+ (void)dumpMethodsFor:(Class)cls {
    unsigned int methodCount = 0;
    Method * methods = class_copyMethodList(cls, &methodCount);
    
    for (unsigned int i = 0 ; i<methodCount; i++) {
        Method method = methods[i];
        printf("\n\n%s:\n",NSStringFromClass(cls).UTF8String);
        printf("   %s %s\n", sel_getName(method_getName(method)), method_getTypeEncoding(method));
    }
}

+ (void)dumpPropertysFor:(Class)cls {
    unsigned int methodCount = 0;
    
    objc_property_t * propertys = class_copyPropertyList(cls, &methodCount);
    
    for (unsigned int i = 0 ; i<methodCount; i++) {
        objc_property_t property = propertys[i];
        printf("   %s\n", property_getName(property));
    }
}
    
- (void)dump {
    [NSObject dumpMethodsFor:self.class];
    [NSObject dumpPropertysFor:self.class];
}
#endif
@end
