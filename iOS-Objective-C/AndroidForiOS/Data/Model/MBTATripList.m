//
//  MBTATripList.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "MBTATripList.h"

// Data Model
#import "MBTATrip.h"

// Categories and Utilities
#import "NSString+lineType.h"

@implementation MBTATripList

- (id)init
{
    self = [super init];
    if (self) {
        self.trips = [[NSArray alloc] init];
    }
    return self;
}

- (instancetype)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        [self importWithData:data];
    }
    return self;
}

- (MBTATripList *)importWithData:(NSDictionary *)data
{
    if (data == nil) {
        return nil;
    }
    
    // Import Current Time
    id dataObject = [data objectForKey:@"CurrentTime"];
    if ([dataObject isKindOfClass:[NSNumber class]]) {
        NSTimeInterval unixEpochTimeInterval =  [(NSNumber *)dataObject doubleValue];
        self.currentTime = [NSDate dateWithTimeIntervalSince1970:unixEpochTimeInterval];
    }
    
    // Import Subway Line Type
    dataObject = [data objectForKey:@"Line"];
    if ([dataObject isKindOfClass:[NSString class]]) {
        self.subwayLine = [NSString lineTypeForString:dataObject];
    }

    // Import Trips List
    dataObject = [data objectForKey:@"Trips"];
    if ([dataObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *tripsData = [[NSMutableArray alloc] initWithCapacity:[(NSArray *)dataObject count]];
        for (id tripData in dataObject) {
            if ([tripData isKindOfClass:[NSDictionary class]]) {
                MBTATrip *trip = [[MBTATrip alloc] initWithData:tripData];
                [tripsData addObject:trip];
            }
        }
        self.trips = tripsData;
    }

    return self;
}

@end
