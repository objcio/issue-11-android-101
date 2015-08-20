//
//  MBTASubwayTripTableTableViewController.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/23/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "MBTASubwayTripTableTableViewController.h"

// Data Model
#import "MBTATrip.h"
#import "MBTAPrediction.h"

// Views and Cells
#import "MBTATripHeaderView.h"
#import "MBTAPredictionCell.h"

static NSString* const kMBTATripTableViewCellReuseId = @"kMBTATripTableViewCellReuseId";

@interface MBTASubwayTripTableTableViewController ()

@property (assign, nonatomic) MBTATrip *trip;

@end

@implementation MBTASubwayTripTableTableViewController

- (instancetype)initWithTrip:(MBTATrip *)trip
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _trip = trip;
        [self setTitle:trip.destination];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[MBTAPredictionCell class] forCellReuseIdentifier:[MBTAPredictionCell reuseId]];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MBTATripHeaderView class]) bundle:nil] forHeaderFooterViewReuseIdentifier:[MBTATripHeaderView reuseId]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.trip.predictions count];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [MBTATripHeaderView heightWithTrip:self.trip];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MBTATripHeaderView *headerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:[MBTATripHeaderView reuseId]];
    [headerView setFromTrip:self.trip];
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MBTAPredictionCell reuseId] forIndexPath:indexPath];
    
    MBTAPrediction *prediction = [self.trip.predictions objectAtIndex:indexPath.row];
    [(MBTAPredictionCell *)cell setFromPrediction:prediction];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
