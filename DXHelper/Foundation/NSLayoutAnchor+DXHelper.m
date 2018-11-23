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

@implementation NSLayoutDimension (DXHelper)

/* These methods return an inactive constraint of the form
 thisVariable = constant.
 */
- (NSLayoutConstraint *)equalTo:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintEqualToConstant:c];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)greaterThanOrEqualTo:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintGreaterThanOrEqualToConstant:c];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)lessThanOrEqualTo:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintLessThanOrEqualToConstant:c];
    r.active = true;
    return r;
}

/* These methods return an inactive constraint of the form
 thisAnchor = otherAnchor * multiplier.
 */
- (NSLayoutConstraint *)equalTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m {
    NSLayoutConstraint *r = [self constraintEqualToAnchor:anchor multiplier:m];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)greaterThanOrEqualTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m {
    NSLayoutConstraint *r = [self constraintGreaterThanOrEqualToAnchor:anchor multiplier:m];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)lessThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m {
    NSLayoutConstraint *r = [self constraintLessThanOrEqualToAnchor:anchor multiplier:m];
    r.active = true;
    return r;
}

/* These methods return an inactive constraint of the form
 thisAnchor = otherAnchor * multiplier + constant.
 */
- (NSLayoutConstraint *)equalTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintEqualToAnchor:anchor multiplier:m];
    r.active = true;
    return r;
}

- (NSLayoutConstraint *)greaterThanOrEqualTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintGreaterThanOrEqualToAnchor:anchor multiplier:m];
    r.active = true;
    return r;
}
- (NSLayoutConstraint *)lessThanOrEqualTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c {
    NSLayoutConstraint *r = [self constraintLessThanOrEqualToAnchor:anchor multiplier:m];
    r.active = true;
    return r;
}
@end

@implementation UIView (layoutconstraint)
- (LayoutEdges)edges {
    return ^(UIView *inView, UIEdgeInsets inset) {
       return @[
                [self.topAnchor equalTo:inView.topAnchor constant:inset.top],
                [self.bottomAnchor equalTo:inView.bottomAnchor constant:inset.bottom],
                [self.leadingAnchor equalTo:inView.leadingAnchor constant:inset.left],
                [self.trailingAnchor equalTo:inView.trailingAnchor constant:inset.right]
                ];
    };
}
@end
