//
//  HW5ViewController.m
//  HW5 Weather
//
//  Created by Kraig McKernan on 2/26/13.
//  Copyright (c) 2013 Kraig McKernan. All rights reserved.
//

#import "HW5ViewController.h"
#import "HW5ShowDataViewController.h"

static NSString* const kServerAddress = @"https://weatherparser.herokuapp.com";

@interface HW5ViewController ()

@end

@implementation HW5ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(weatherRefreshed:) name:@"weatherRefreshed" object:nil];
    
    [self performSelectorInBackground:@selector(refreshWeather) withObject:nil];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (weatherData != nil)
        return [weatherData count];
    else
        return 1;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (weatherData != nil) {
        
        return [NSString stringWithFormat:@"%@",[[weatherData objectAtIndex:row] objectForKey:@"variable"]]; //variable name
        
    } else
        return @"loading data..."; //no data yet
}

-(void) refreshWeather
{
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
    
    NSMutableDictionary *currentForecast = [NSMutableDictionary new];
    NSMutableArray *array = [NSMutableArray new];
    for( NSDictionary *variable in collections ) {
        [array addObject:variable]; //creating an array, more useful in a picker view
        
       
    }
    weatherData = array;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"weatherRefreshed" object:currentForecast];
}


-(void) weatherRefreshed:(NSNotification*)note
{
    [spinner stopAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [variablePicker reloadAllComponents]; //reload the pickerview to include the new data
}

-(IBAction)lookAtDataButtonWasPressed
{
    if (weatherData != nil) {
        [self performSegueWithIdentifier:@"showDataSegue" sender:nil]; //user wants to go to the next screen
    }
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDataSegue"]) {
        HW5ShowDataViewController *dvc = [segue destinationViewController];
        [dvc setData:[weatherData objectAtIndex:[variablePicker selectedRowInComponent:0]]]; //give the next viewcontroller our data
    }
}

@end
