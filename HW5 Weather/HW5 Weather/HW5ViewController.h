//
//  HW5ViewController.h
//  HW5 Weather
//
//  Created by Kraig McKernan on 2/26/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HW5ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    __weak IBOutlet UIPickerView *variablePicker;
    __weak IBOutlet UIActivityIndicatorView *spinner;
    NSArray *weatherData;
}

-(IBAction)lookAtDataButtonWasPressed;

@end
