//
//  KMMainVC.m
//  WeatherApp_iPhone
//
//  Created by Kraig McKernan on 3/18/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "KMMainVC.h"
#import "KMCollectionCell.h"

@interface KMMainVC ()

@end

@implementation KMMainVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *sun = [UIImage imageNamed:@"sun.jpg"];
    [imageView setImage:sun];
    [dateLabel setText:@"Today"];
    [midTempLabel setText:@"32*F"];
    [lowTempLabel setText:@"28"];
    [highTempLabel setText:@"36"];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KMCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setBounds:CGRectMake(0, 0, 100, 100)];
    [cell setBackgroundColor:[UIColor grayColor]];
    [cell setText:@"Tomorrow"];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
}


@end
