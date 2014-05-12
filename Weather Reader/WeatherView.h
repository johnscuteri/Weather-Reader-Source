//
//  WeatherView.h
//  Weather Reader
//
//  Created by John Scuteri on 1/27/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

@import UIKit;
@import CoreLocation;

@interface WeatherView : UIViewController <CLLocationManagerDelegate>

- (IBAction)updateWeather:(id)sender;
- (IBAction)BackButton:(id)sender;

@property (strong,nonatomic) NSString *passed;
@property (weak, nonatomic) NSNumber *locationTypeI;
@property (weak, nonatomic) NSNumber *temperatureTypeI;

@property (weak, nonatomic) IBOutlet UILabel *goodTest;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *localityName;
@property (weak, nonatomic) IBOutlet UILabel *localityCountry;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *pressure;
@property (weak, nonatomic) IBOutlet UILabel *windSpeed;
@property (weak, nonatomic) IBOutlet UILabel *windDirection;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescription;

@end
