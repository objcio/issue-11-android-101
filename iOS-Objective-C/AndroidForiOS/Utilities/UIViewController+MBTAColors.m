//
//  UIViewController+MBTAColors.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 11/7/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "UIViewController+MBTAColors.h"
#import "UIColor+MBTAColors.h"

@implementation UIViewController (MBTAColors)

- (void)configureNavbarForLineType:(MBTALineType)lineType
{
	[self.navigationController.navigationBar setBarTintColor:[UIColor colorForLineType:lineType]];
	[self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
	[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
	[self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
	[[self.navigationItem rightBarButtonItem] setTintColor:[UIColor whiteColor]];
	[[self.navigationItem backBarButtonItem] setTintColor:[UIColor whiteColor]];
}

- (void)clearNavbarColorStyles
{
	[self.navigationController.navigationBar setBarTintColor:nil];
	[self.navigationController.navigationBar setTintColor:nil];
	[self.navigationController.navigationBar setTitleTextAttributes:nil];
	[self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
	[[self.navigationItem rightBarButtonItem] setTintColor:nil];
	[[self.navigationItem backBarButtonItem] setTintColor:nil];
}

@end
