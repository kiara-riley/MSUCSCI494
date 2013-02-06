//
//  ButtonViewController.m
//  HW3
//
//  Created by Kraig McKernan on 2/6/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "ButtonViewController.h"
#import "DetailViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController

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
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button1WasPressed:(id)sender {
    [self performSegueWithIdentifier:@"button1Segue" sender:self];
}

- (IBAction)buttonNavWasPressed:(id)sender {
    [self performSegueWithIdentifier:@"buttonNavSegue" sender:self];
}

- (IBAction)buttonTabWasPressed:(id)sender {
    [self performSegueWithIdentifier:@"buttonTabSegue" sender:self];
}
@end
