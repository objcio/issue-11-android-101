//
//  UIColor+MBTAColors.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "UIColor+MBTAColors.h"

@implementation UIColor (MBTAColors)

+ (UIColor *)colorForLineType:(MBTALineType)lineType
{
    UIColor *colorForLineType = nil;
    switch (lineType) {
        case MBTALineTypeBlue:
            colorForLineType = [UIColor blueColor];
            break;
            
        case MBTALineTypeOrange:
            colorForLineType = [UIColor orangeColor];
            break;
            
        case MBTALineTypeRed:
        default:
            colorForLineType = [UIColor redColor];
            break;
    }
    
    return colorForLineType;
}

@end
