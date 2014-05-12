//
//  WeatherData.m
//  Weather Reader
//
//  Created by John Scuteri on 1/28/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "WeatherData.h"

#define API_KEY @"Insert Your Key here"

@implementation WeatherData
- (id)initWithLocation:(CLLocation *)location{
    self = [super init];
    if (self) {
        //double lat = 40.73, lon = -73.44;
        [self getWeatherData:location];
        _goodParse = @"good";
    }
    return self;
}
- (id)initWithZipCode:(NSString *)zip{
    self = [super init];
    if (self) {
        double lat, lon;
        NSNumber *temporary;
        NSString *status;
        NSError *error;
        NSString *urlAsString = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/geocode/json?components=postal_code:%@&sensor=false",zip];
        NSURL *url = [[NSURL alloc] initWithString:urlAsString];
        //NSLog(@"%@", urlAsString);
        NSURLResponse *response;
        NSData *data = [NSURLConnection sendSynchronousRequest:[[NSURLRequest alloc] initWithURL:url] returningResponse:&response error:&error];
        //NSLog(@"%@", error);
        NSDictionary *parsedDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        //NSLog(@"%@", error);
        //main dictionary
        status = [parsedDict valueForKey:@"status"];
        if([status isEqualToString: @"OK"]){
            NSArray *firstLevelAry = [parsedDict valueForKey:@"results"];
            NSDictionary *secondLevelDict = firstLevelAry[0];
            NSDictionary *thirdLevelDict = [secondLevelDict valueForKey:@"geometry"];
            NSDictionary *fourthLevelDict = [thirdLevelDict valueForKey:@"location"];
            temporary = [fourthLevelDict valueForKey:@"lat"];
            lat = [temporary doubleValue];
            temporary = [fourthLevelDict valueForKey:@"lng"];
            lon = [temporary doubleValue];
            _goodParse = @"good";
        }
        else{
            lat = 0;
            lon = 0;
            _goodParse = @"The Zip Code entered could not be found.\nThe following weather is at Coordinates 0°N and 0°W";
        }
        CLLocation *location = [[CLLocation alloc]initWithLatitude:lat longitude:lon];
        [self getWeatherData:location];
    }
    return self;
}
-(void)getWeatherData:(CLLocation *)place
{
    double lat, lon;
    lat = place.coordinate.latitude;
    lon = place.coordinate.longitude;
    NSError *error;
    NSString *urlAsString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&APPID=%@",lat, lon, API_KEY];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    //NSLog(@"%@", urlAsString);
    NSURLResponse *response;
    NSData *data = [NSURLConnection sendSynchronousRequest:[[NSURLRequest alloc] initWithURL:url] returningResponse:&response error:&error];
    //NSLog(@"%@", error);
    NSDictionary *parsedDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    //NSLog(@"%@", error);
    //Gathering Values
    NSDictionary *location = [parsedDict valueForKey:@"coord"];
    _lat = [location valueForKey:@"lat"];
    _lng = [location valueForKey:@"lon"];
    NSDictionary *mainDict = [parsedDict valueForKey:@"main"];
    _temp = [mainDict valueForKey:@"temp"];
    _humidity  = [mainDict valueForKey:@"humidity"];
    _pressure = [mainDict valueForKey:@"pressure"];
    NSDictionary *windStuff = [parsedDict valueForKey:@"wind"];
    _deg = [windStuff valueForKey:@"deg"];
    _speed = [windStuff valueForKey:@"speed"];
    NSArray *conditions = [parsedDict valueForKey:@"weather"];
    NSDictionary *conditions1 = conditions[0];
    _description = [conditions1 valueForKey:@"description"];
    NSDictionary *locality = [parsedDict valueForKey:@"sys"];
    _country = [locality valueForKey:@"country"];
    //From the origonal dictionary
    _name = [parsedDict valueForKey:@"name"];
    
    
}
@end
