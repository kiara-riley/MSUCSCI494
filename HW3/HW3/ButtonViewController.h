//
//  ButtonViewController.h
//  HW3
//
//  Created by Kraig McKernan on 2/6/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailViewController;

@interface ButtonViewController : UIViewController {
}

@property DetailViewController *detailViewController;

- (IBAction)button1WasPressed:(id)sender;
- (IBAction)buttonNavWasPressed:(id)sender;

- (IBAction)buttonTabWasPressed:(id)sender;

@end
