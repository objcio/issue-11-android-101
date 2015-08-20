//
//  MBTATrip.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBTATrip : NSObject

@property (strong, nonatomic) NSString *tripId;
@property (strong, nonatomic) NSString *destination;
@property (strong, nonatomic) NSDate *positionTimeStamp;
@property (strong, nonatomic) NSString *trainName;
@property (assign, nonatomic) CGFloat positionLat;
@property (assign, nonatomic) CGFloat positionLong;
@property (assign, nonatomic) NSInteger positionHeading;
@property (strong, nonatomic) NSArray *predictions;

- (instancetype)initWithData:(NSDictionary *)data;
- (MBTATrip *)importWithData:(NSDictionary *)data;

@end
