//
//  ChildViewController.m
//  HW2
//
//  Created by Kraig McKernan on 1/26/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "ChildViewController.h"
#import "SubView.h"

@interface ChildViewController () {
    SubView *view1;
    SubView *view2;
    SubView *view3;
}

@end

@implementation ChildViewController

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
    
    view1 = [[SubView alloc] initWithFrame:CGRectMake(0, 20, 100, 100)];
    [view1 setPattern:0];
    view2 = [[SubView alloc] initWithFrame:CGRectMake(110, 20, 100, 100)];
    [view2 setPattern:1];
    view3 = [[SubView alloc] initWithFrame:CGRectMake(220, 20, 100, 100)];
    [view3 setPattern:2];
    
    [[self view] addSubview:view1];
    
    
    [[self view] addSubview:view2];
    

    [[self view] addSubview:view3];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonWasPressed:(id)sender {
    [self changePatterns];
    
}

-(void)changePatterns {
    [view1 setPattern:([view1 pattern]+1)%3];
    [view2 setPattern:([view2 pattern]+1)%3];
    [view3 setPattern:([view3 pattern]+1)%3];

}
@end
