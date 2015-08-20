//
//  MBTAPredictionCell.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/23/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "MBTAPredictionCell.h"

// Data Model
#import "MBTAPrediction.h"

NSString* const kMBTAPredictionCellReuseId = @"kMBTAPredictionCellReuseId";

@interface MBTAPredictionCell ()

@end

@implementation MBTAPredictionCell

#pragma mark - Cell Reuse Id

+ (NSString *)reuseId
{
    return kMBTAPredictionCellReuseId;
}

#pragma mark - Cell Lifecycle

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

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
    [self.textLabel setText:nil];
    [self.detailTextLabel setText:nil];
}

#pragma mark - Setters

- (void)setFromPrediction:(MBTAPrediction *)prediction
{
    [self.textLabel setText:prediction.stopName];
    [self.detailTextLabel setText:[NSString stringWithFormat:@"%ld", (long)prediction.stopSeconds]];
}


@end
