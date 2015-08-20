//
//  MBTATripListTableViewController.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/23/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "MBTATripListTableViewController.h"

// View Controllers
#import "MBTASubwayTripTableTableViewController.h"

// Managers
#import "MBTADataManager.h"

// Views and Cells
#import "MBTASubwayTripCell.h"

// Categories and Utilties
#import "NSString+lineType.h"
#import "UIViewController+MBTAColors.h"

@interface MBTATripListTableViewController ()

@property (assign, nonatomic) MBTALineType lineType;
@property (strong, nonatomic) NSArray *data;

@end

@implementation MBTATripListTableViewController

- (instancetype)initWithLineType:(MBTALineType)lineType
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        _lineType = lineType;
        self.title = [NSString stringForLineType:lineType];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
	[self configureNavbarForLineType:self.lineType];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MBTASubwayTripCell class]) bundle:nil] forCellReuseIdentifier:[MBTASubwayTripCell reuseId]];
    self.data = [[NSArray alloc] init];
    
    __weak MBTATripListTableViewController *weakSelf = self;
    [[MBTADataManager shared] importDataForKey:self.lineType withCompletion:^(MBTATripList *tripList, BOOL succeeded, NSError *error) {
        if (succeeded) {
            weakSelf.data = tripList.trips;
            [weakSelf.tableView reloadData];
        }
        else {
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Uh Oh", @"Error Message Title - Uh Oh")
										message:NSLocalizedString(@"Error loading data, sorry!", @"Error Message Description, can't load data")
									   delegate:nil
							  cancelButtonTitle:NSLocalizedString(@"OK", @"OK Button Title")
							  otherButtonTitles:nil] show];
        }
    }];

	self.tableView.estimatedRowHeight = [MBTASubwayTripCell estimatedHeight];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[MBTASubwayTripCell reuseId] forIndexPath:indexPath];
    
    MBTATrip *trip = [self.data objectAtIndex:indexPath.row];
    [(MBTASubwayTripCell *)cell setFromTrip:trip];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    MBTATrip *trip = [self.data objectAtIndex:indexPath.row];
    MBTASubwayTripTableTableViewController *tripDetailVC = [[MBTASubwayTripTableTableViewController alloc] initWithTrip:trip];
    [self.navigationController pushViewController:tripDetailVC animated:YES];
}

@end
