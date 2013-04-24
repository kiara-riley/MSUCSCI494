//
//  KMCollectionCell.m
//  WeatherApp_iPhone
//
//  Created by Kraig McKernan on 3/18/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "KMCollectionCell.h"

@implementation KMCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setText:(NSString *)text {
    _text = text;
    [textLabel setText:_text];
}

-(void)setWeather:(NSNumber *)weather {
    _weather = weather;
    if ([weather integerValue] == 2) {
        [imageView setImage:[UIImage imageNamed:@"snowing"]];
    } else if ([weather integerValue] == 1) {
        [imageView setImage:[UIImage imageNamed:@"raining"]];
    } else {
        [imageView setImage:[UIImage imageNamed:@"sunny"]];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
