//
//  MBTADataManager.m
//  AndroidForiOS
//
//  Created by Stephen Barnes on 3/21/14.
//  Copyright (c) 2014 Stephen Barnes. All rights reserved.
//

#import "MBTADataManager.h"

// Categories and Utilities
#import "NSString+lineType.h"

static const char* kMBTADataManagerBackgroundQueue = "kMBTADataManagerBackgroundQueue";

@interface MBTADataManager ()

@end

@implementation MBTADataManager

#pragma mark - Shared Instance

+ (MBTADataManager *)shared
{
    static dispatch_once_t onceToken;
    static MBTADataManager *s_sharedManager;
    dispatch_once(&onceToken, ^{
        s_sharedManager = [[MBTADataManager alloc] init];
    });
    
    return s_sharedManager;
}

#pragma mark - Date Formatters

+ (NSDateFormatter *)dataDateFormatter
{
    static NSDateFormatter* s_dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s_dateFormatter =[[NSDateFormatter alloc] init];
        s_dateFormatter.timeStyle = NSDateFormatterShortStyle;
        s_dateFormatter.dateStyle = NSDateFormatterShortStyle;
        s_dateFormatter.doesRelativeDateFormatting = YES;
    });
    return s_dateFormatter;
}

#pragma mark - File I/O

// From http://stackoverflow.com/questions/10866403/passing-data-from-local-file-using-json
+(NSDictionary*)dictionaryWithContentsOfJSONString:(NSString*)fileLocation
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[fileLocation stringByDeletingPathExtension] ofType:[fileLocation pathExtension]];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) {
        return nil;
    }
    else {
        return result;
    }
}

#pragma mark - Background Queue
- (dispatch_queue_t)backgroundQueue
{
    static dispatch_queue_t _backgroundQueue = nil;
    if (_backgroundQueue == nil) {
        _backgroundQueue = dispatch_queue_create(kMBTADataManagerBackgroundQueue, DISPATCH_QUEUE_SERIAL);
    }
    return _backgroundQueue;
}

#pragma mark - Data Import

- (void)importDataForKey:(MBTALineType)key withCompletion:(MBTAImportCompletionBlock)completion;
{
    dispatch_async([self backgroundQueue], ^{
        BOOL succeeded = NO;
        MBTATripList *tripList = nil;
        
        NSDictionary *data = [MBTADataManager dictionaryWithContentsOfJSONString:[NSString fileNameForLineType:key]];
        if ([data isKindOfClass:[NSDictionary class]]) {
            tripList = [[MBTATripList alloc] initWithData:[data objectForKey:@"TripList"]];
            succeeded = YES;
        }
        
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(tripList, succeeded, nil);
            });
        }
    });
}

@end
