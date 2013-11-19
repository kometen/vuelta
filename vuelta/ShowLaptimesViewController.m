//
//  ShowLaptimesViewController.m
//  vuelta
//
//  Created by Claus Guttesen on 18/11/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "ShowLaptimesViewController.h"
#import "Lap.h"

@interface ShowLaptimesViewController ()

@end

@implementation ShowLaptimesViewController {
    NSTimer *pollingTimer;
    NSDate *now, *today;
    int delta, index, previousDelta, previousIndex, secondsPerLap;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberofLapsField.text = [NSString stringWithFormat:@"%i", [self.lap numberOfLaps]];
    self.secondsPerLapField.text = [NSString stringWithFormat:@"%i", [self.lap getSecondsPerLap]];
    self.totalDistanceField.text = [NSString stringWithFormat:@"%i", [self.lap getTotalDistance]];
    self.estimatedHalfMarathonTimeField.text = [self.lap getEstimatedHalfMarathonTime];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pollTime:(NSTimer *)timer
{
    now = [[NSDate alloc] init];
    delta = (int)[now timeIntervalSinceDate:today];
    self.secondsPassedField.text = [NSString stringWithFormat:@"%i", delta];
}

-(void)startTimer
{
    self.startBarButton.title = @"Reset";
    [pollingTimer invalidate];
    today = [[NSDate alloc] init];
    pollingTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(pollTime:) userInfo:nil repeats:YES];
    [pollingTimer fire];
}

@end
