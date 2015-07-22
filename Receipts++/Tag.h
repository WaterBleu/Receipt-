//
//  Tag.h
//  Receipts++
//
//  Created by Jeff Huang on 2015-07-21.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Tag : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject *tagRelationship;

@end
