//
//  KMMainVC.h
//  WeatherApp_iPhone
//
//  Created by Kraig McKernan on 3/18/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KMWeather;

@interface KMMainVC : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate> {
    
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *midTempLabel;
    __weak IBOutlet UILabel *highTempLabel;
    __weak IBOutlet UILabel *lowTempLabel;
    __weak IBOutlet UILabel *precipLabel;
    
    //these are the static text labels so I can make them "disappear" on startup
    __weak IBOutlet UILabel *temperatureLabel;
    __weak IBOutlet UILabel *precipitationLabel;
    __weak IBOutlet UILabel *hLabel;
    __weak IBOutlet UILabel *lLabel;
    __weak IBOutlet UICollectionView *collectionV;
    KMWeather *weather; //weather object
    NSDate *startDate; //the date returned by [weather currentDate]
    NSInteger multiplier; //current 6 hour multiplier to use
}

-(void)weatherRefreshed:(NSNotification*)note;
-(void)setCollectionValues;
-(void)setWeatherValues;

- (void)applyShinyBackground; //gives a gradient to the background

@end
