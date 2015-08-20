//
//  MBTATripHeaderView.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/23/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <UIKit/UIKit.h>

OBJC_EXTERN NSString* const kMBTATripHeaderViewReuseId;

@class MBTATrip;

@interface MBTATripHeaderView : UITableViewHeaderFooterView

#pragma mark - Reuse Id
+ (NSString *)reuseId;

#pragma mark - Height for Header View
+ (CGFloat)heightWithTrip:(MBTATrip *)trip;

#pragma mark - Setters
- (void)setFromTrip:(MBTATrip *)trip;

@end
