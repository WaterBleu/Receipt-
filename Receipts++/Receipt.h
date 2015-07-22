//
//  Receipt.h
//  Receipts++
//
//  Created by Jeff Huang on 2015-07-21.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Tag;

@interface Receipt : NSManagedObject

@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * receiptDescription;
@property (nonatomic, retain) NSDate * timeStamp;
@property (nonatomic, retain) Tag *receiptRelationship;

@end
