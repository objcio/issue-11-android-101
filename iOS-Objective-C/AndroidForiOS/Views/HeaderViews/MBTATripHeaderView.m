//
//  MBTATripHeaderView.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/23/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "MBTATripHeaderView.h"

// Data Model
#import "MBTATrip.h"

NSString* const kMBTATripHeaderViewReuseId = @"kMBTATripHeaderViewReuseId";

@interface MBTATripHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *destinationLabel;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;

@end

@implementation MBTATripHeaderView

#pragma mark - Reuse Id
+ (NSString *)reuseId
{
    return kMBTATripHeaderViewReuseId;
}

#pragma mark - Height for Header View
+ (CGFloat)heightWithTrip:(MBTATrip *)trip
{
    return 150.f;
}

#pragma mark - Header View Lifecycle

- (void)awakeFromNib
{
    [self commonInit];
}

- (void)prepareForReuse
{
    [self commonInit];
}

- (void)commonInit
{
    [self.destinationLabel setText:nil];
    [self.latitudeLabel setText:nil];
    [self.longitudeLabel setText:nil];
    [self.headingLabel setText:nil];
    self.contentView.backgroundColor = [UIColor darkGrayColor];
}

#pragma mark - Setters

- (void)setFromTrip:(MBTATrip *)trip
{
    [self.destinationLabel setText:trip.destination];
    [self.latitudeLabel setText:[NSString stringWithFormat:@"%.2lf", trip.positionLat]];
    [self.longitudeLabel setText:[NSString stringWithFormat:@"%.2lf", trip.positionLong]];
    [self.headingLabel setText:[NSString stringWithFormat:@"%ld", trip.positionHeading]];
}

@end
