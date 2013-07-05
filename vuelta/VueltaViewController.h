//
//  VueltaViewController.h
//  vuelta
//
//  Created by Claus Guttesen on 04/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VueltaViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *numberOfLapsField;
@property (nonatomic, strong) IBOutlet UITextField *metersPerLapField;
@property (nonatomic, strong) IBOutlet UITextField *minutesPerKmField;
@property (nonatomic, strong) IBOutlet UITextField *secondsPerKmField;
@property (nonatomic, strong) IBOutlet UILabel *totalDistanceField;
@property (nonatomic, strong) IBOutlet UILabel *secondsPerLapField;
@property (nonatomic, strong) IBOutlet UILabel *estimatedTimeHalfMarathonField;

-(IBAction)calculate;
-(IBAction)clear;

@end
