//
//  VueltaViewController.m
//  vuelta
//
//  Created by Claus Guttesen on 04/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "VueltaViewController.h"
#import "LaptimesViewController.h"
#import "ShowLaptimesViewController.h"
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

-(void)laptimes {
    lap = [[Lap alloc] init];
    lap.getNumberOfLaps = [self.numberOfLapsField.text integerValue];
    lap.metersPerLap = [self.metersPerLapField.text integerValue];
    lap.minutesPerKm = [self.minutesPerKmField.text integerValue];
    lap.secondsPerKm = [self.secondsPerKmField.text integerValue];
    [self.view endEditing:YES];
}

-(IBAction)clear {
    self.numberOfLapsField.text = nil;
    self.minutesPerKmField.text = nil;
    self.secondsPerKmField.text = nil;
    self.metersPerLapField.text = nil;
}

// stackoverflow.com/questions/5210535/passing-data-between-view-controllers

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"Laptimes"]) {
        [self laptimes];
        UINavigationController *navigationController = segue.destinationViewController;
        ShowLaptimesViewController *controller = (ShowLaptimesViewController *)navigationController.topViewController;
        controller.lap = lap;
    }
}

@end
