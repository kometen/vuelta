//
//  VueltaViewController.m
//  vuelta
//
//  Created by Claus Guttesen on 04/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "VueltaViewController.h"

@interface VueltaViewController ()

@end

@implementation VueltaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.numberOfLapsField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)calculate {
    int laps = [self.numberOfLapsField.text integerValue];
    int minutes = [self.minutesPerKmField.text integerValue];
    int seconds = [self.secondsPerKmField.text integerValue];
    int distance = [self.metersPerLapField.text integerValue];
    int secondsPerLap = (minutes * 60 + seconds) / (1000.0/distance);
    int totalDistance = laps * distance;
    int hmsec = (minutes * 60 + seconds) * 21.1;    //hm = half marathon
    int hmhour = hmsec / 3600;
    int hmmin = (hmsec - hmhour * 3600) / 60;
    hmsec = hmsec - hmhour * 3600 - hmmin * 60;
    self.secondsPerLapField.text = [NSString stringWithFormat:@"%i", secondsPerLap];
    self.totalDistanceField.text = [NSString stringWithFormat:@"%i", totalDistance];
    self.estimatedTimeHalfMarathonField.text = [NSString stringWithFormat:@"%i:%02i:%02i", hmhour, hmmin, hmsec];
    [self.view endEditing:YES];
}

@end
