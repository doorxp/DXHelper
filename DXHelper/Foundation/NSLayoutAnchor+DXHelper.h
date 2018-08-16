//
//  NSLayoutAnchor+DXHelper.h
//  JustReviewFunctionNonDownloading
//
//  Created by doorxp on 2018/8/16.
//  Copyright © 2018年 zhixun. All rights reserved.
//

#import <UIKit/UIKit.h>

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
