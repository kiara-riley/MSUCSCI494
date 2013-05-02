//
//  KMCollectionCell.h
//  WeatherApp_iPhone
//
//  Created by Kraig McKernan on 3/18/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMCollectionCell : UICollectionViewCell {
    __weak IBOutlet UILabel *textLabel;
    __weak IBOutlet UIImageView *imageView;
}

@property (weak, nonatomic) NSString *text;
@property (weak, nonatomic) NSNumber *weather; //0-sunny, 1-rainy, 2-snowy, 3-partlycloudy, 4-cloudy, 5-night



@end
