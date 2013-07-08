//
//  VueltaViewController.m
//  vuelta
//
//  Created by Claus Guttesen on 04/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "VueltaViewController.h"
#import "Lap.h"

@interface VueltaViewController ()

@end

@implementation VueltaViewController {
    Lap *lap;
}

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
    lap = [[Lap alloc] init];
    lap.numberOfLaps = [self.numberOfLapsField.text integerValue];
    lap.metersPerLap = [self.metersPerLapField.text integerValue];
    lap.minutesPerKm = [self.minutesPerKmField.text integerValue];
    lap.secondsPerKm = [self.secondsPerKmField.text integerValue];
    self.secondsPerLapField.text = [NSString stringWithFormat:@"%i", [lap getSecondsPerLap]];
    self.totalDistanceField.text = [NSString stringWithFormat:@"%i", [lap getTotalDistance]];
    self.estimatedHalfMarathonTimeField.text = [lap getEstimatedHalfMarathonTime];
    [self.view endEditing:YES];
}

-(void)clear {
    self.numberOfLapsField.text = nil;
    self.minutesPerKmField.text = nil;
    self.secondsPerKmField.text = nil;
    self.metersPerLapField.text = nil;
    self.secondsPerLapField.text = nil;
    self.totalDistanceField.text = nil;
    self.estimatedHalfMarathonTimeField.text = nil;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Laptimes"]) {
        UINavigationController *navigationController = segue.destinationViewController;
    }
}

@end
