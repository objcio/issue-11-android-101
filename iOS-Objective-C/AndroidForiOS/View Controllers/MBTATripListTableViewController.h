//
//  MBTATripListTableViewController.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/23/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBTATripList.h"

@interface MBTATripListTableViewController : UITableViewController

- (instancetype)initWithLineType:(MBTALineType)lineType;

@end
