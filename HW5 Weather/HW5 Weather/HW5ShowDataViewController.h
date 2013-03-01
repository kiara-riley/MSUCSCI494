//
//  HW5ShowDataViewController.h
//  HW5 Weather
//
//  Created by Kraig McKernan on 2/28/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HW5ShowDataViewController : UIViewController {
    __weak IBOutlet UILabel *varLabel;
    __weak IBOutlet UITextView *valuesLabel;
    
    __weak IBOutlet UIDatePicker *datePicker;

}

-(IBAction)dateWasSelected:(id)sender;
-(IBAction)backButtonWasPressed:(id)sender;

@property NSDictionary *data;

@end
