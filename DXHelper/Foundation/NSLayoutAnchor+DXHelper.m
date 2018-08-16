//
//  NSLayoutAnchor+DXHelper.m
//  JustReviewFunctionNonDownloading
//
//  Created by doorxp on 2018/8/16.
//  Copyright © 2018年 zhixun. All rights reserved.
//

#import "NSLayoutAnchor+DXHelper.h"

@implementation NSLayoutAnchor (DXHelper)
- (NSLayoutConstraint *)equalTo:(NSLayoutAnchor *)anchor {
    NSLayoutConstraint *r = [self constraintEqualToAnchor:anchor];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)greaterThanOrEqualTo:(NSLayoutAnchor *)anchor {
    NSLayoutConstraint *r = [self constraintGreaterThanOrEqualToAnchor:anchor];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)lessThanOrEqualTo:(NSLayoutAnchor *)anchor {
    NSLayoutConstraint *r = [self constraintLessThanOrEqualToAnchor:anchor];
    r.active = true;
    return r;
}

/* These methods return an inactive constraint of the form thisAnchor = otherAnchor + constant.
 */
- (NSLayoutConstraint *)equalTo:(NSLayoutAnchor *)anchor constant:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintEqualToAnchor:anchor constant:c];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)greaterThanOrEqualTo:(NSLayoutAnchor *)anchor constant:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintGreaterThanOrEqualToAnchor:anchor constant:c];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)lessThanOrEqualTo:(NSLayoutAnchor *)anchor constant:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintLessThanOrEqualToAnchor:anchor constant:c];
    r.active = true;
    return r;
}
@end
