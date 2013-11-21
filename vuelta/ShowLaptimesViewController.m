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

@property (nonatomic, weak) IBOutlet UIProgressView *lapsCompletedProgress;

@end

@implementation ShowLaptimesViewController {
    NSTimer *pollingTimer;
    NSDate *now, *today;
    int secondsElapsed, lapsCompleted, secondsPerLap, currentSecond, previousSecond;
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
    secondsElapsed = 0;
    lapsCompleted = 0;
    currentSecond = 0;
    previousSecond = 0;
    lapsCompleted = 0;
    self.secondsPerLapField.text = [NSString stringWithFormat:@"%i", [self.lap getSecondsPerLap]];
    self.totalDistanceField.text = [NSString stringWithFormat:@"%i", [self.lap getTotalDistance]];
    self.estimatedHalfMarathonTimeField.text = [self.lap getEstimatedHalfMarathonTime];
    self.timeElapsedField.text = [self.lap getElapsedTimeFromSeconds:secondsElapsed];
    self.lapsCompletedField.text = [NSString stringWithFormat:@"Lap %i / %i", lapsCompleted, [self.lap getNumberOfLaps]];
    [_lapsCompletedProgress setProgress:0.0f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pollTime:(NSTimer *)timer
{
    now = [[NSDate alloc] init];
    secondsElapsed = (int)[now timeIntervalSinceDate:today];
    
    // Update rounds completed
    currentSecond = secondsElapsed;
    if (secondsElapsed % self.lap.getSecondsPerLap == 0 && secondsElapsed > 0) {
        if (previousSecond != currentSecond) {
            previousSecond = currentSecond;
            lapsCompleted++;
            [_lapsCompletedProgress setProgress:(double)lapsCompleted / (double)self.lap.getNumberOfLaps];
        }
    }

    self.timeElapsedField.text = [self.lap getElapsedTimeFromSeconds:secondsElapsed];
    self.lapsCompletedField.text = [NSString stringWithFormat:@"Lap %i / %i", lapsCompleted, [self.lap getNumberOfLaps]];
}

// startTimer calls pollTime at certain intervals to update progress
-(void)startTimer
{
    self.startBarButton.title = @"Reset";
    [pollingTimer invalidate];
    lapsCompleted = 0;
    today = [[NSDate alloc] init];
    pollingTimer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(pollTime:) userInfo:nil repeats:YES];
    [pollingTimer fire];
}

@end
