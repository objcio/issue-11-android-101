//
//  UIViewController+MBTAColors.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 11/7/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBTATripList.h"

@interface UIViewController (MBTAColors)

/**
 *  Set the color on the navbar, the title, and bar button 
 *  items for a subway line's color.
 *
 *  @param lineType the subway line type to configure the color for.  Ex: Red, Orange, Blue.
 */
- (void)configureNavbarForLineType:(MBTALineType)lineType;

/**
 *  Remove any color styles added to the navbar, title, and
 *  bar button items.
 */
- (void)clearNavbarColorStyles;

@end
