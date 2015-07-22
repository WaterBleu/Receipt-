//
//  CreateReceiptViewController.h
//  Receipt++
//
//  Created by Jeff Huang on 2015-07-21.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ReceiptProtocol <NSObject>

- (void)setReceiptItemWithAmount:(float*)amount andDescription:(NSString*)description andDate:(NSDate*)date;

@end

@interface CreateReceiptViewController : UIViewController

@property (nonatomic,strong) id<ReceiptProtocol> delegate;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
