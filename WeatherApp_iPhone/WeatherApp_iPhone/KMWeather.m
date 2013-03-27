//
//  KMWeather.m
//  WeatherApp_iPhone
//
//  Created by Kraig McKernan on 3/25/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "KMWeather.h"


@implementation KMWeather

-(float)kelvToFahr:(float)in {
    in -= 273.15;
    in *= 1.8;
    in += 32;
    return in;
}

-(id)init
{
    self = [super init];
    if(self) {
        [self performSelectorInBackground:@selector(refreshWeather) withObject:nil];
    }
    return self;
}

-(void)refreshWeather {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    NSData *json = [NSData dataWithContentsOfURL:[NSURL URLWithString:kServerAddress]];
    if( [json length] == 0 ) {
#if DEBUG
        NSLog( @"using fake data..." );
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"fake-data" ofType:@"json"];
        json = [NSData dataWithContentsOfFile:filePath];
#else
        NSLog( @"server returned nothing" );
        return;
#endif
    }
    
    NSError* error = nil;
    id collections = [NSJSONSerialization JSONObjectWithData:json options:kNilOptions error:&error];
    
    if (error)
    {
        NSLog(@"Error parsing JSON %@: %@", [[NSString alloc] initWithData:json encoding:NSASCIIStringEncoding], [error localizedDescription]);
        return;
    }
    
    //NSLog(@"%@", collections);
    
    
    NSMutableDictionary *weather = [NSMutableDictionary new];
    for( NSDictionary *variable in collections ) {
        [weather setObject:variable forKey:[variable objectForKey:@"variable"]];
        
    }
    weatherData = weather;
    //NSLog(@"%@", [weatherData objectForKey:@"tmax2m"]);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"weatherRefreshed" object:self];

    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

}
-(float)currentTemp {
    //NSInteger val = [weatherData objectAtIndex:0]
    NSArray *min = [[[[weatherData objectForKey:@"tmin2m"] objectForKey:@"values"] objectAtIndex:0] objectForKey:@"predictions"];
    NSArray *max = [[[[weatherData objectForKey:@"tmax2m"] objectForKey:@"values"] objectAtIndex:0] objectForKey:@"predictions"];
    /*NSLog(@"%@", min);//min
    NSLog(@"%@", max);//max*/
    float minval = 0.0, maxval = 0.0;
    NSInteger i = 0;
    for (NSString *value in min) {
        float floatVal = [value floatValue];
        minval += floatVal;
        i++;
    }
    minval /= i;
    i = 0;
    for (NSString *value in max) {
        float floatVal = [value floatValue];
        maxval += floatVal;
        i++;
    }
    maxval /= i;
    float avg = (maxval + minval)/2;
    avg = [self kelvToFahr:avg];
    NSLog(@"%f", avg);
    return avg;
}

-(float)tempForDate:(NSDate*)date {
    NSDate *tempDate;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"];//format the date is in
    
    int i = 0;
    for (NSDictionary *value in [[weatherData objectForKey:@"tmax2m"] objectForKey:@"values"]){
        tempDate = [dateFormatter dateFromString:[value objectForKey:@"date"]];
        if ([date compare:tempDate] == NSOrderedDescending) {
            break;
        }
        i++;
    }
    if (i == [[[weatherData objectForKey:@"tmax2m"] objectForKey:@"values"] count]) {
        i = 0;
    }
    NSArray *max = [[[[weatherData objectForKey:@"tmax2m"] objectForKey:@"values"] objectAtIndex:i] objectForKey:@"predictions"];
    
    //----------
    i = 0;
    for (NSDictionary *value in [[weatherData objectForKey:@"tmin2m"] objectForKey:@"values"]){
        tempDate = [dateFormatter dateFromString:[value objectForKey:@"date"]];
        if ([date compare:tempDate] == NSOrderedDescending) {
            date = tempDate;
            break;
        }
        i++;
    }
    if (i == [[[weatherData objectForKey:@"tmin2m"] objectForKey:@"values"] count]) {
        i = 0;
    }
    NSArray *min = [[[[weatherData objectForKey:@"tmin2m"] objectForKey:@"values"] objectAtIndex:i] objectForKey:@"predictions"];
    //------
    float minval = 0.0, maxval = 0.0;
    i = 0;
    for (NSString *value in min) {
        float floatVal = [value floatValue];
        minval += floatVal;
        i++;
    }
    minval /= i;
    i = 0;
    for (NSString *value in max) {
        float floatVal = [value floatValue];
        maxval += floatVal;
        i++;
    }
    maxval /= i;
    float avg = (maxval + minval)/2;
    avg = [self kelvToFahr:avg];
    NSLog(@"%f", avg);
    return avg;
    
}

-(float)snow {
    NSArray *snow = [[[[weatherData objectForKey:@"csnowsfc"] objectForKey:@"values"] objectAtIndex:0] objectForKey:@"predictions"];
    float val = 0.0;
    NSInteger i = 0;
    for (NSString *value in snow) {
        float floatVal = [value floatValue];
        val += floatVal;
        i++;
    }
    val /= i;
    return val;
}

-(float)rain {
    NSArray *rain = [[[[weatherData objectForKey:@"crainsfc"] objectForKey:@"values"] objectAtIndex:0] objectForKey:@"predictions"];
    float val = 0.0;
    NSInteger i = 0;
    for (NSString *value in rain) {
        float floatVal = [value floatValue];
        val += floatVal;
        i++;
    }
    val /= i;
    return val;
}


@end
