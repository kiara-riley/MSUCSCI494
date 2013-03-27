//
//  KMWeather.h
//  WeatherApp_iPhone
//
//  Created by Kraig McKernan on 3/25/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* const kServerAddress = @"https://weatherparser.herokuapp.com";

@interface KMWeather : NSObject {
        NSDictionary *weatherData;
}

-(void)refreshWeather;
-(float)currentTemp;
-(float)tempForDate:(NSDate *)date;
-(float)snow;
-(float)rain;
@end
