//
//  ViewController.m
//  HW1
//
//  Created by Kraig McKernan on 1/25/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

// 100%

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonWasPressed:(id)sender {
    if ([textLabel.text isEqualToString:@"iOS assignment 1"]) {
        textLabel.text = @"Text Changed!";
    } else {
        textLabel.text = @"iOS assignment 1";
    }

}
@end
