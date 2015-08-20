//
//  MBTATrip.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "MBTATrip.h"
#import "MBTAPrediction.h"

@implementation MBTATrip

- (instancetype)initWithData:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]]) {
            [self importWithData:data];
        }
    }
    return self;
}

- (MBTATrip *)importWithData:(NSDictionary *)data
{
    if (data == nil) {
        return nil;
    }
    
    // Import TripId
    id dataObject = [data objectForKey:@"TripID"];
    if ([dataObject isKindOfClass:[NSString class]]) {
        self.tripId = dataObject;
    }
    
    // Import Destination
    dataObject = [data objectForKey:@"Destination"];
    if ([dataObject isKindOfClass:[NSString class]]) {
        self.destination = dataObject;
    }
    
    // Import Prediction List
    dataObject = [data objectForKey:@"Predictions"];
    if ([dataObject isKindOfClass:[NSArray class]]) {
        NSMutableArray *predictionsData = [[NSMutableArray alloc] initWithCapacity:[(NSArray *)dataObject count]];
        for (id predictionData in dataObject) {
            if ([predictionData isKindOfClass:[NSDictionary class]]) {
                MBTAPrediction *prediction = [[MBTAPrediction alloc] initWithData:predictionData];
                [predictionsData addObject:prediction];
            }
        }
        self.predictions = predictionsData;
    }
    
    // Import position information if it exits
    dataObject = [data objectForKey:@"Position"];
    if ([dataObject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *positionInformation = (NSDictionary *)dataObject;

        id positionData = [positionInformation objectForKey:@"Timestamp"];
        if ([positionData isKindOfClass:[NSNumber class]]) {
            NSTimeInterval unixEpochTimeInterval =  [(NSNumber *)positionData doubleValue];
            self.positionTimeStamp = [NSDate dateWithTimeIntervalSince1970:unixEpochTimeInterval];
        }
        
        positionData = [positionInformation objectForKey:@"Train"];
        if ([positionData isKindOfClass:[NSString class]]) {
            self.trainName = positionData;
        }
        
        positionData = [positionInformation objectForKey:@"Lat"];
        if ([positionData isKindOfClass:[NSNumber class]]) {
            self.positionLat = [(NSNumber *)positionData floatValue];
        }
        
        positionData = [positionInformation objectForKey:@"Long"];
        if ([positionData isKindOfClass:[NSNumber class]]) {
            self.positionLong = [(NSNumber *)positionData floatValue];
        }
        
        positionData = [positionInformation objectForKey:@"Heading"];
        if ([positionData isKindOfClass:[NSNumber class]]) {
            self.positionHeading = [(NSNumber *)positionData floatValue];
        }
    }
    
    return self;
}

@end
