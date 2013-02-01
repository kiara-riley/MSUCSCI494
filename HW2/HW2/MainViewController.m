//
//  MainViewController.m
//  HW2
//
//  Created by Kraig McKernan on 1/26/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

// 100%

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIViewController *child = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"ChildViewController"]; //creates the childviewcontroller programatically
    
    [self presentViewController:child animated:YES completion:nil]; //presents the child viewcontroller immediately with an animation (can see this vc for a tiny bit before the child fills the screen)
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
