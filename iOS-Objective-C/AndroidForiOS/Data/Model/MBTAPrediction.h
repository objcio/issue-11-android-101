//
//  MBTAPrediction.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBTAPrediction : NSObject

@property (strong, nonatomic) NSString *stopId;
@property (strong, nonatomic) NSString *stopName;
@property (assign, nonatomic) NSInteger stopSeconds;

- (instancetype)initWithData:(NSDictionary *)data;
- (MBTAPrediction *)importWithData:(NSDictionary *)data;

@end
