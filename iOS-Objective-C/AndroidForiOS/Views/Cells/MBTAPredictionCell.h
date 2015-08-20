//
//  MBTAPredictionCell.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/23/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <UIKit/UIKit.h>

OBJC_EXTERN NSString* const kMBTAPredictionCellReuseId;

@class MBTAPrediction;

@interface MBTAPredictionCell : UITableViewCell

#pragma mark - Cell Reuse Id
+ (NSString *)reuseId;

#pragma mark - Setters
- (void)setFromPrediction:(MBTAPrediction *)prediction;

@end
