//
//  ShowLaptimesViewController.h
//  vuelta
//
//  Created by Claus Guttesen on 18/11/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lap.h"

@interface ShowLaptimesViewController : UIViewController

@property (nonatomic, strong) Lap *lap;

@property (nonatomic, strong) IBOutlet UIBarButtonItem *startBarButton;
@property (nonatomic, strong) IBOutlet UILabel *numberofLapsField;
@property (nonatomic, strong) IBOutlet UILabel *totalDistanceField;
@property (nonatomic, strong) IBOutlet UILabel *secondsPerLapField;
@property (nonatomic, strong) IBOutlet UILabel *estimatedHalfMarathonTimeField;
@property (nonatomic, strong) IBOutlet UILabel *secondsPassedField;
@property (nonatomic, strong) IBOutlet UILabel *roundsCompletedField;

-(IBAction)startTimer;

@end
