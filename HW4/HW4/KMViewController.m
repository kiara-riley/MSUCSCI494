//
//  KMViewController.m
//  HW4
//
//  Created by Kraig McKernan on 2/11/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

// Good job, 100%.

#import "KMViewController.h"

@interface KMViewController () {
    NSInteger selected[10]; // the selected items in the controller
}

@end

@implementation KMViewController

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
    for (int i = 0; i < sizeof(selected); i++) {
        selected[i] = -1; //load up the array with -1's. Not sure if this is needed. pretty sure its not
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return sizeof(selected);
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    int sec = indexPath.section;
    if (selected[sec] == indexPath.row) {
        cell.backgroundColor = [UIColor blueColor];
    } else {
        cell.backgroundColor = [UIColor redColor];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    int sec = indexPath.section;
    NSIndexPath *prevpath = [NSIndexPath indexPathForRow:selected[sec] inSection:indexPath.section];
    UICollectionViewCell *prev = [collectionView cellForItemAtIndexPath:prevpath]; //get previously selected cell
    
    prev.backgroundColor = [UIColor redColor]; //set bg colors
    cell.backgroundColor = [UIColor blueColor];
    
    selected[sec] = indexPath.row; //change this new cell to the selected one
    


}

@end
