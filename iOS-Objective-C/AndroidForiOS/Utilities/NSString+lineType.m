//
//  NSString+lineType.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "NSString+lineType.h"

@implementation NSString (lineType)

+ (NSString *)stringForLineType:(MBTALineType)lineType
{
    NSString *stringForLineType = @"";
    switch (lineType) {
        case MBTALineTypeBlue:
            stringForLineType = @"Blue";
            break;
            
        case MBTALineTypeOrange:
            stringForLineType = @"Orange";
            break;
            
        case MBTALineTypeRed:
        default:
            stringForLineType = @"Red";
            break;
    }
    
    return stringForLineType;
}

+ (NSString *)fileNameForLineType:(MBTALineType)lineType
{
    NSString *lineTypeString = [self stringForLineType:lineType];
    return [lineTypeString stringByAppendingString:@".json"];
}

+ (MBTALineType)lineTypeForString:(NSString *)stringValue
{
    MBTALineType lineType = MBTALineTypeRed;
    if ([stringValue isEqualToString:@"Red"]) {
        lineType = MBTALineTypeRed;
    }
    else if ([stringValue isEqualToString:@"Blue"]) {
        lineType = MBTALineTypeBlue;
    }
    else if ([stringValue isEqualToString:@"Orange"]) {
        lineType = MBTALineTypeOrange;
    }
    
    return lineType;
}

@end
