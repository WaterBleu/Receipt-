//
//  ReceiptCell.h
//  Receipts++
//
//  Created by Jeff Huang on 2015-07-21.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiptCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeStamp;
@property (weak, nonatomic) IBOutlet UILabel *amount;
@property (weak, nonatomic) IBOutlet UILabel *receiptDescription;

@end
