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
    NSLog(@"getSecondsPerLap: %d", [self.lap getSecondsPerLap]);
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
