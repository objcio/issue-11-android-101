//
//  MBTASubwayTripTableTableViewController.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/23/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBTATrip;

@interface MBTASubwayTripTableTableViewController : UITableViewController

- (instancetype)initWithTrip:(MBTATrip *)trip;

@end
