//
//  KMMainVC.m
//  WeatherApp_iPhone
//
//  Created by Kraig McKernan on 3/18/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "KMMainVC.h"
#import "KMCollectionCell.h"
#import "KMWeather.h"

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
    [midTempLabel setText:@"-1*F"];
    [lowTempLabel setText:@"-1"];
    [highTempLabel setText:@"-1"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(weatherRefreshed:) name:@"weatherRefreshed" object:nil];
    weather = [[KMWeather alloc] init];

    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [weather numData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    int multiplier = indexPath.row;
    NSDate *date = [NSDate dateWithTimeInterval:21600*multiplier sinceDate:startDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd 'at' HH"];
    
    KMCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setBounds:CGRectMake(0, 0, 100, 100)];
    [cell setBackgroundColor:[UIColor grayColor]];
    [cell setText:[dateFormatter stringFromDate:date]];
    [cell setWeather:[NSNumber numberWithInt:[weather weatherForDate:date]]];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSInteger multiplier = indexPath.row;
    [midTempLabel setText:[NSString stringWithFormat:@"%3.0f*F", [weather tempForDate:[NSDate dateWithTimeInterval:21600*multiplier sinceDate:startDate]]]];
    [lowTempLabel setText:[NSString stringWithFormat:@"%2.0f", [weather lowTemp]]];
    [highTempLabel setText:[NSString stringWithFormat:@"%2.0f", [weather highTemp]]];
    
    if ([weather snowForDate:[NSDate dateWithTimeInterval:21600*multiplier sinceDate:startDate]] > .5) { //clean this up
        [imageView setImage:[UIImage imageNamed:@"snowing"]];
    } else if ([weather rainForDate:[NSDate dateWithTimeInterval:21600*multiplier sinceDate:startDate]] > .5) {
        [imageView setImage:[UIImage imageNamed:@"raining"]];
    } else {
        [imageView setImage:[UIImage imageNamed:@"sunny"]];
    }

    precipLabel.text = [NSString stringWithFormat:@"%.2f",[weather precip]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd 'at' HH"];
    NSString *dispDate = [dateFormatter stringFromDate:[NSDate dateWithTimeInterval:21600*multiplier sinceDate:startDate]];
    dateLabel.text = dispDate;
}

-(void)weatherRefreshed:(NSNotification*)note {
    [midTempLabel setText:[NSString stringWithFormat:@"%3.0f*F", [weather tempForDate:[NSDate dateWithTimeIntervalSinceNow:0]]]];
    [lowTempLabel setText:[NSString stringWithFormat:@"%2.0f", [weather lowTemp]]];
    [highTempLabel setText:[NSString stringWithFormat:@"%2.0f", [weather highTemp]]];
    if (DEBUG) {
        NSLog(@"Rain: %f", [weather rain]);
        NSLog(@"snow: %f", [weather snow]);
        
        NSLog(@"clouds now: %f", [weather clouds]);
    }
    if ([weather snow] > .5) {
        [imageView setImage:[UIImage imageNamed:@"snowing"]];
    } else if ([weather rain] > .5) {
        [imageView setImage:[UIImage imageNamed:@"raining"]];
    } else {
        [imageView setImage:[UIImage imageNamed:@"sunny"]];
    }
    
    NSDate *temp = [weather currentDate];
    temp = [NSDate dateWithTimeInterval:21600.0 sinceDate:temp];
    NSLog(@"Mid: %f", [weather currentTemp]);
    NSLog(@"%f", [weather tempForDate:[NSDate dateWithTimeIntervalSinceNow:0]]);
    NSLog(@"%f", [weather tempForDate:temp]);
    NSLog(@"%@", [weather currentDate]);
    NSLog(@"%@", temp);
    NSLog(@"Precip: %f", [weather precip]);
    
    precipLabel.text = [NSString stringWithFormat:@"%.2f",[weather precip]];
    
    NSDate *currentDate = [weather currentDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd 'at' HH"];
    NSString *dispDate = [dateFormatter stringFromDate:currentDate];
    dateLabel.text = dispDate;
    
    [self setCollectionValues];
    
    startDate = [weather currentDate];
}

-(void)setCollectionValues {
    [collectionV reloadData];
}

@end
