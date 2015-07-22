//
//  ViewController.h
//  Receipts++
//
//  Created by Jeff Huang on 2015-07-21.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

