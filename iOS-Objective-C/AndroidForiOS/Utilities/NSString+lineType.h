//
//  NSString+lineType.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBTATripList.h"

@interface NSString (lineType)

+ (NSString *)stringForLineType:(MBTALineType)lineType;
+ (NSString *)fileNameForLineType:(MBTALineType)lineType;
+ (MBTALineType)lineTypeForString:(NSString *)stringValue;

@end
