//
//  LaptimesViewController.h
//  vuelta
//
//  Created by Claus Guttesen on 08/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Lap.h"

@interface LaptimesViewController : UITableViewController

@property (nonatomic, strong) Lap *lap;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *startBarButton;

-(IBAction)startTimer;

@end
