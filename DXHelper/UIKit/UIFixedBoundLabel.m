//
//  UIFixedBoundLabel.m
//  BrowserDL
//
//  Created by doorxp on 2018/11/21.
//  Copyright © 2018 zhixun. All rights reserved.
//

#import "UIFixedBoundLabel.h"

@implementation UIFixedBoundLabel

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect r = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    UIFont *font = self.font;

    CGSize sz = r.size;
    sz.height -= floor(font.descender);
    r.size = sz;
    return r;
}

@end
