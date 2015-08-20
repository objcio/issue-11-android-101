//
//  MBTAPrediction.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "MBTAPrediction.h"

@implementation MBTAPrediction

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

- (MBTAPrediction *)importWithData:(NSDictionary *)data
{
    if (data == nil) {
        return nil;
    }
    
    // Import StopID
    id dataObject = [data objectForKey:@"StopID"];
    if ([dataObject isKindOfClass:[NSString class]]) {
        self.stopId = dataObject;
    }
    
    // Import Stop Name
    dataObject = [data objectForKey:@"Stop"];
    if ([dataObject isKindOfClass:[NSString class]]) {
        self.stopName = dataObject;
    }
    
    // Import Seconds
    dataObject = [data objectForKey:@"Seconds"];
    if ([dataObject isKindOfClass:[NSNumber class]]) {
        self.stopSeconds = [(NSNumber *)dataObject integerValue];
    }
    
    return self;
}

@end
