//
//  WeatherView.m
//  Weather Reader
//
//  Created by John Scuteri on 1/27/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "WeatherView.h"
#import "SettingsView.h"
#import "WeatherData.h"

@interface WeatherView ()

@end

@implementation WeatherView {
    CLLocationManager *locationManager;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    locationManager = [[CLLocationManager alloc] init];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BackButton:(id)sender {
    SettingsView *SV = [[SettingsView alloc] initWithNibName:@"SettingsView" bundle:nil];
    [self presentViewController:SV animated:YES completion:NULL];
}

//LOCATION STUFF
-(IBAction)updateWeather:(id)sender{
    if(_locationTypeI.intValue < 1){
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        [locationManager startUpdatingLocation];
    }
    else{
        WeatherData *wd = [[WeatherData alloc] initWithZipCode:_passed];
        //NSLog(wd.goodParse);
        if(![wd.goodParse isEqualToString:@"good"]){
            _goodTest.text = wd.goodParse;
        }
        [self presentWeatherData:wd];
    }
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    if (currentLocation != nil) {
        WeatherData *wd = [[WeatherData alloc] initWithLocation:newLocation];
        [self presentWeatherData:wd];
        [locationManager stopUpdatingLocation];
    }
}
-(void)presentWeatherData:(WeatherData *)weather{
    //Temperature Type
    if(_temperatureTypeI.intValue < 1){
        _temperatureLabel.text = [NSString stringWithFormat:@"%.2f°F", ((([weather.temp doubleValue] - 273.15) *1.8) + 32)];
    }
    else{
        _temperatureLabel.text = [NSString stringWithFormat:@"%.2f°C", ([weather.temp doubleValue] - 273.15)];
    }
    _latitudeLabel.text = [NSString stringWithFormat:@"%.4f°", [weather.lat doubleValue]];
    _longitudeLabel.text = [NSString stringWithFormat:@"%.4f°", [weather.lng doubleValue]];
    _localityName.text = weather.name;
    _localityCountry.text = weather.country;
    _humidityLabel.text = [NSString stringWithFormat:@"%.2f%", [weather.humidity doubleValue]];
    _pressure.text = [NSString stringWithFormat:@"%.1fhPa", [weather.pressure doubleValue]];
    _windSpeed.text = [NSString stringWithFormat:@"%.2fmph", [weather.speed doubleValue]];
    _windDirection.text = [NSString stringWithFormat:@"%.2f°", [weather.deg doubleValue]];
    _weatherDescription.text = weather.description;
}
@end
