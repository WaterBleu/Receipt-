//
//  CreateReceiptViewController.m
//  Receipt++
//
//  Created by Jeff Huang on 2015-07-21.
//  Copyright (c) 2015 Jeff Huang. All rights reserved.
//


#import "CreateReceiptViewController.h"
#import "Receipt.h"
#import "Tag.h"

@interface CreateReceiptViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldAmount;
@property (weak, nonatomic) IBOutlet UITextView *textFieldDescsription;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTag;
@property (nonatomic) UIDatePicker *datePicker;
@property (nonatomic) NSLocale *dateLocale;

@property (nonatomic) NSArray* priorityArr;

@end

@implementation CreateReceiptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textFieldDate.delegate = self;
    self.datePicker = [[UIDatePicker alloc] init];
    self.dateLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_CA"];
    self.datePicker.locale = self.dateLocale;
    self.datePicker.timeZone = [NSTimeZone timeZoneWithName:@"PST"];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
    self.textFieldDate.inputView = self.datePicker;
    
    //setup datePicker view
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(submitDate)];
    toolBar.items = [NSArray arrayWithObject:right];
    self.textFieldDate.inputAccessoryView = toolBar;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitReceipt:(UIButton *)sender {
    NSEntityDescription *receiptEntity = [NSEntityDescription entityForName:@"Receipt" inManagedObjectContext:self.managedObjectContext];
    Receipt *newReceipt = [NSEntityDescription insertNewObjectForEntityForName:[receiptEntity name] inManagedObjectContext:self.managedObjectContext];
    
    newReceipt.amount = [NSDecimalNumber decimalNumberWithString:self.textFieldAmount.text];
    newReceipt.receiptDescription = self.textFieldDescsription.text;
    newReceipt.timeStamp = self.datePicker.date;
    
    
    
    NSArray *tags = [self.textFieldTag.text componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]];
    
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void)submitDate{
    if([self.view endEditing:NO]){
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:[NSDateFormatter dateFormatFromTemplate:@"yyyy-MM-dd" options:0 locale:self.dateLocale]];
        dateFormat.locale = self.dateLocale;
        self.textFieldDate.text = [NSString stringWithFormat:@"%@", [dateFormat stringFromDate:self.datePicker.date]];
    }
}





@end
