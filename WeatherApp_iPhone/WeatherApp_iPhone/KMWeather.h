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
-(int)numData;//returns the number of data points or 1 if no weather yet

/*These all give the first(and will be default) date*/
-(NSDate*)currentDate;//not the "current" date but the first one
-(float)currentTemp;
-(float)lowTemp;
-(float)highTemp;
-(float)snow;
-(float)rain;
-(float)precip;
-(float)clouds;


-(float)tempForDate:(NSDate *)date;
-(float)snowForDate:(NSDate *)date;
-(float)rainForDate:(NSDate *)date;
-(float)cloudsForDate:(NSDate*)date;
-(float)precipForDate:(NSDate*)date;
-(float)highForDate:(NSDate*)date;
-(float)lowForDate:(NSDate*)date;


-(int)weatherNow;//calls weatherForDate:[self currentDate]
-(int)weatherForDate:(NSDate*)date;//returns, 0-sunny,1-rainy,2-snowy,3-cloudy


@end
