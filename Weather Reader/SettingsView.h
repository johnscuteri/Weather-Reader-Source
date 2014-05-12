//
//  SettingsView.h
//  Weather Reader
//
//  Created by John Scuteri on 1/27/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

@import UIKit;

@interface SettingsView : UIViewController

- (IBAction)ToWeather:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *zipInput;
@property (weak, nonatomic) NSString *zipCode;

@property (weak, nonatomic) IBOutlet UISegmentedControl *locationSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *temperatureSegmentedControl;

@property (weak, nonatomic) NSNumber *locationType;
@property (weak, nonatomic) NSNumber *temperatureType;










@end
