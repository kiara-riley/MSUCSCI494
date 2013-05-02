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
#import <QuartzCore/QuartzCore.h>

@interface KMMainVC ()

@end

@implementation KMMainVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self applyShinyBackground];
    UIImage *sun = [UIImage imageNamed:@"sunny"];
    [imageView setImage:sun];
    [dateLabel setText:@"Loading Weather Data"];
    [midTempLabel setText:@""]; //startup, we dont want these labels displayed
    [lowTempLabel setText:@""];
    [highTempLabel setText:@""];
    [precipLabel setText:@""];
    [precipitationLabel setText:@""];
    [temperatureLabel setText:@""];
    [hLabel setText:@""];
    [lLabel setText:@""];
    
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
    int multiplierTemp = indexPath.row*2; //skipping half of the data points to grab just day and night
    NSDate *date = [NSDate dateWithTimeInterval:21600*multiplierTemp sinceDate:startDate];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *string;
    if ((multiplierTemp%4)==0) {
        string = [NSString stringWithFormat:@"ccc 'Day'"];
    } else {
        string = [NSString stringWithFormat:@"ccc 'Night'"];
    }
    [dateFormatter setDateFormat:string];
    
    KMCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setBounds:CGRectMake(0, 0, 100, 100)];
    [cell setBackgroundColor:[UIColor lightGrayColor]];
    [cell setWeather:[NSNumber numberWithInt:[weather weatherForDate:date]]];
    
    [cell setText:[dateFormatter stringFromDate:[NSDate dateWithTimeInterval:(60*60*-7) sinceDate:date]]]; //-7 hours give correct bozeman time
    
    cell.layer.borderColor = [[UIColor darkGrayColor] CGColor];
    cell.layer.borderWidth = 1.0f;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    multiplier = indexPath.row*2;
    
    [self setWeatherValues]; 
}

-(void)weatherRefreshed:(NSNotification*)note {
    
    if (DEBUG) {
        
        /*NSLog(@"now: %f", [weather lowTemp]);
        NSLog(@"nowish: %f", [weather lowForDate:[weather currentDate]]);
        NSLog(@"in 6: %f", [weather lowForDate:[NSDate dateWithTimeInterval:21600 sinceDate:[weather currentDate]]]);*/
    }
        
    [precipitationLabel setText:@"Precipitation:"];
    [temperatureLabel setText:@"Temperature:"];
    [hLabel setText:@"H:"];
    [lLabel setText:@"L:"];
    
    [self setCollectionValues];
    
    startDate = [weather currentDate];
    
    multiplier = 0;
    [self setWeatherValues];
}

-(void)setCollectionValues {
    [collectionV reloadData];
}

-(void)setWeatherValues { //set the labels and imageview to the currently selected element
    
    NSDate *tempDate = [NSDate dateWithTimeInterval:21600*multiplier sinceDate:startDate];
    
    [midTempLabel setText:[NSString stringWithFormat:@"%3.0f°F", [weather tempForDate:tempDate]]];
    [lowTempLabel setText:[NSString stringWithFormat:@"%2.0f", [weather lowForDate:tempDate]]];
    [highTempLabel setText:[NSString stringWithFormat:@"%2.0f", [weather highForDate:tempDate]]];
    
    
    if ([weather snowForDate:tempDate] > .5) {
        [imageView setImage:[UIImage imageNamed:@"snow"]];
    } else if ([weather rainForDate:tempDate] > .5) {
        [imageView setImage:[UIImage imageNamed:@"raining"]];
    } else if ([weather cloudsForDate:tempDate] > .66) {
        [imageView setImage:[UIImage imageNamed:@"cloudy"]];
    } else if ([weather cloudsForDate:tempDate] > .33) {
        [imageView setImage:[UIImage imageNamed:@"partlycloudy"]];
    } else if (multiplier%4==2) {
        [imageView setImage:[UIImage imageNamed:@"night"]];
    } else {
        [imageView setImage:[UIImage imageNamed:@"sunny"]];
    }
    
    precipLabel.text = [NSString stringWithFormat:@"%.2f mm",[weather precipForDate:tempDate]];
    
    tempDate = [NSDate dateWithTimeInterval:(60*60*-7) sinceDate:tempDate];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *string;
    if ((multiplier%4)==0) {
        string = [NSString stringWithFormat:@"ccc MMM dd 'Daytime'"];
    } else {
        string = [NSString stringWithFormat:@"ccc MMM dd 'Nighttime'"];
    }
    [dateFormatter setDateFormat:string];
    NSString *dispDate = [dateFormatter stringFromDate:tempDate];
    dateLabel.text = dispDate;
}

- (void)applyShinyBackground {
    //method modified from:
    //http://coffeeshopped.com/2010/10/uiview-how-to-make-shiny-backgrounds-and-other-reusable-styles
    // create a CAGradientLayer to draw the gradient on
    CAGradientLayer *layer = [CAGradientLayer layer];
    
    // get the RGB components of the color
    
    
    // create the colors for our gradient based on the color passed in
    layer.colors = [NSArray arrayWithObjects:
                    (id)[[UIColor whiteColor] CGColor],
                    (id)[[UIColor colorWithRed:.95
                                         green:.95
                                          blue:.95
                                         alpha:1] CGColor],
                    (id)[[UIColor colorWithRed:.85
                                         green:.85
                                          blue:.85
                                         alpha:1] CGColor],
                    (id)[[UIColor colorWithRed:.8
                                         green:.8
                                          blue:.8
                                         alpha:1] CGColor],
                    nil];
    
    // create the color stops for our gradient
    layer.locations = [NSArray arrayWithObjects:
                       [NSNumber numberWithFloat:0.0f],
                       [NSNumber numberWithFloat:0.25f],
                       [NSNumber numberWithFloat:0.51f],
                       [NSNumber numberWithFloat:1.0f],
                       nil];
    
    layer.frame = self.view.bounds;
    [self.view.layer insertSublayer:layer atIndex:0];
}




@end
