//
//  WeatherData.h
//  Weather Reader
//
//  Created by John Scuteri on 1/28/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

@import Foundation;
@import CoreLocation;

@interface WeatherData : NSObject

//http://bugs.openweathermap.org/projects/api/wiki/Weather_Data

-(id)initWithLocation:(CLLocation *)location;
-(id)initWithZipCode:(NSString *)zip;
-(void)getWeatherData:(CLLocation *)place;

@property (strong, nonatomic) NSNumber *lat;
@property (strong, nonatomic) NSNumber *lng;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSNumber *temp;
@property (strong, nonatomic) NSNumber *humidity;
@property (strong, nonatomic) NSNumber *pressure;
@property (strong, nonatomic) NSNumber *speed;
@property (strong, nonatomic) NSNumber *deg;//Direction
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *goodParse;
//@property (strong, nonatomic) NSNumber *temp_min;
//@property (strong, nonatomic) NSNumber *temp_max;
//@property (strong, nonatomic) NSNumber *all;//Cloud percentage
//@property (strong, nonatomic) NSString *name;
//@property (strong, nonatomic) NSNumber *dt;

@end
