//
//  HW5ShowDataViewController.m
//  HW5 Weather
//
//  Created by Kraig McKernan on 2/28/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "HW5ShowDataViewController.h"

@interface HW5ShowDataViewController ()

@end

@implementation HW5ShowDataViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [varLabel setText:[_data objectForKey:@"variable"]]; //variable name
    /*for (NSDictionary *variable in _data) {
        NSLog(@"%@", variable);
        
        for ( var in variable) {
            //NSLog(@"--%@", var);
        }
        
    }*/
    //NSLog(@"%@", [_data objectForKey:@"values"]);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];//format the date is in
    
    NSArray *dateData = [_data objectForKey:@"values"]; //these structures get very confusing
    
    NSString *startString = [[dateData objectAtIndex:0] objectForKey:@"date"];
    NSString *endString = [[dateData objectAtIndex:[dateData count]-1] objectForKey:@"date"];//-1 or it would overflow
    
    
    NSDate *start = [dateFormatter dateFromString:startString];
    
    NSDate *end = [dateFormatter dateFromString:endString];
    
    [datePicker setMinimumDate:start];//grey out other dates
    [datePicker setMaximumDate:end];
    NSString *values = [[[dateData objectAtIndex:0] objectForKey:@"predictions" ] componentsJoinedByString:@","];//format the values
    [valuesLabel setText:[NSString stringWithFormat:@"%@", values]];
    //NSLog(@"%@", [[dateData objectAtIndex:0] objectForKey:@"predictions"]);
	
}

-(IBAction)dateWasSelected:(id)sender {
    //find a close date
    NSInteger i;
    NSArray *dateData = [_data objectForKey:@"values"];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];

    for (i = 0; i < [dateData count]; i++) {
        NSString *dateStr = [[dateData objectAtIndex:i] objectForKey:@"date"];
        NSDate *comp = [dateFormatter dateFromString:dateStr];
        if ([[datePicker date] compare:comp] == NSOrderedSame) { //unfortuneately, the dates must match perfectly, would be easier if i made my own pickerview since I dont think datepickers can go by six hour intervals only
            
            NSString *values = [[[dateData objectAtIndex:i] objectForKey:@"predictions" ] componentsJoinedByString:@","];
            [valuesLabel setText:[NSString stringWithFormat:@"%@", values]];
        }
    }
}

-(IBAction)backButtonWasPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil]; //go back to other screen
}

@end
