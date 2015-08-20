//
//  MBTADataManager.h
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBTATripList.h"

typedef void (^MBTAImportCompletionBlock)(MBTATripList *tripList, BOOL succeeded, NSError* error);

@interface MBTADataManager : NSObject

#pragma mark - Shared Instance
+ (MBTADataManager *)shared;

#pragma mark - Date Formatters
+ (NSDateFormatter *)dataDateFormatter;

#pragma mark - Data Import
- (void)importDataForKey:(MBTALineType)key withCompletion:(MBTAImportCompletionBlock)completion;

@end
