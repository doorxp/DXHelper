//
//  NSLayoutAnchor+DXHelper.h
//  JustReviewFunctionNonDownloading
//
//  Created by doorxp on 2018/8/16.
//  Copyright © 2018年 zhixun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_CLASS_AVAILABLE_IOS(9_0)
@interface NSLayoutAnchor (DXHelper)
/* These methods return an inactive constraint of the form thisAnchor = otherAnchor.
 */
- (NSLayoutConstraint *)equalTo:(NSLayoutAnchor *)anchor;
- (NSLayoutConstraint *)greaterThanOrEqualTo:(NSLayoutAnchor *)anchor;
- (NSLayoutConstraint *)lessThanOrEqualTo:(NSLayoutAnchor *)anchor;

/* These methods return an inactive constraint of the form thisAnchor = otherAnchor + constant.
 */
- (NSLayoutConstraint *)equalTo:(NSLayoutAnchor *)anchor constant:(CGFloat)c;
- (NSLayoutConstraint *)greaterThanOrEqualTo:(NSLayoutAnchor *)anchor constant:(CGFloat)c;
- (NSLayoutConstraint *)lessThanOrEqualTo:(NSLayoutAnchor *)anchor constant:(CGFloat)c;
@end

@interface NSLayoutDimension (DXHelper)

/* These methods return an inactive constraint of the form
 thisVariable = constant.
 */
- (NSLayoutConstraint *)equalTo:(CGFloat)c;
- (NSLayoutConstraint *)greaterThanOrEqualTo:(CGFloat)c;
- (NSLayoutConstraint *)lessThanOrEqualTo:(CGFloat)c;

/* These methods return an inactive constraint of the form
 thisAnchor = otherAnchor * multiplier.
 */
- (NSLayoutConstraint *)equalTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint *)greaterThanOrEqualTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m;
- (NSLayoutConstraint *)lessThanOrEqualToAnchor:(NSLayoutDimension *)anchor multiplier:(CGFloat)m;

/* These methods return an inactive constraint of the form
 thisAnchor = otherAnchor * multiplier + constant.
 */
- (NSLayoutConstraint *)equalTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint *)greaterThanOrEqualTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
- (NSLayoutConstraint *)lessThanOrEqualTo:(NSLayoutDimension *)anchor multiplier:(CGFloat)m constant:(CGFloat)c;
@end


typedef NSArray *(^LayoutEdges)(UIView *inView, UIEdgeInsets inset);

@interface UIView (layoutconstraint)
@property (nonatomic, readonly)LayoutEdges edges;
@end
