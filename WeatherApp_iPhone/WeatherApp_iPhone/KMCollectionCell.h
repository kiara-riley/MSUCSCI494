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
}

@property (weak, nonatomic) NSString *text;

@end
