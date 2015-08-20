//
//  MBTATripList.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBTATrip;

typedef NS_ENUM(NSInteger, MBTALineType)
{
    MBTALineTypeRed = 0,
    MBTALineTypeOrange,
    MBTALineTypeBlue,
    MBTALineTypeCount
};

@interface MBTATripList : NSObject

@property (strong, nonatomic) NSDate *currentTime;
@property (assign, nonatomic) MBTALineType subwayLine;
@property (strong, nonatomic) NSArray *trips;

- (instancetype)initWithData:(NSDictionary *)data;
- (MBTATripList *)importWithData:(NSDictionary *)data;

@end
