//
//  MBTASubwayTripCellTableViewCell.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <UIKit/UIKit.h>

OBJC_EXTERN NSString* const kMBTASubwayTripCellReuseId;

@class MBTATrip;

@interface MBTASubwayTripCell : UITableViewCell

#pragma mark - Cell Reuse Id
+ (NSString *)reuseId;

#pragma mark - Estimated Height
+ (CGFloat)estimatedHeight;

#pragma mark - Setters
- (void)setFromTrip:(MBTATrip *)trip;

@end
