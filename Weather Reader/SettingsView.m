//
//  SettingsView.m
//  Weather Reader
//
//  Created by John Scuteri on 1/27/14.
//  Copyright (c) 2014 John Scuteri. All rights reserved.
//

#import "SettingsView.h"
#import "WeatherView.h"

@interface SettingsView ()

@end

@implementation SettingsView

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
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(check) userInfo:Nil repeats:YES];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ToWeather:(id)sender {
    WeatherView *WV = [[WeatherView alloc] initWithNibName:@"WeatherView" bundle:nil];
    _zipCode = _zipInput.text;
    WV.passed = self.zipCode;
    
        ///////Test////////
    _temperatureType = [NSNumber numberWithInteger: _temperatureSegmentedControl.selectedSegmentIndex];
    _locationType = [NSNumber numberWithInteger: _locationSegmentedControl.selectedSegmentIndex];
    
    WV.locationTypeI = _locationType;
    WV.temperatureTypeI = _temperatureType;
    
    [self presentViewController:WV animated:YES completion:NULL];
}
-(void)check{
    if([_zipInput.text length] > 5){
        _zipInput.text = [_zipInput.text substringWithRange:NSMakeRange(0, 5)];
    }
}

@end
