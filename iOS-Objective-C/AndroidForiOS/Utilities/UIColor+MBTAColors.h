//
//  UIColor+MBTAColors.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBTATripList.h"

@interface UIColor (MBTAColors)

/**
 *  Return a color for a subway line type.
 *
 *  @param lineType the subway line type to configure the color for.  Ex: Red, Orange, Blue.
 *
 *  @return the correct subway line color.
 */
+ (UIColor *)colorForLineType:(MBTALineType)lineType;

@end
