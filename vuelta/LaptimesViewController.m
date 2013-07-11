//
//  LaptimesViewController.m
//  vuelta
//
//  Created by Claus Guttesen on 08/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "LaptimesViewController.h"
#import "Lap.h"

@interface LaptimesViewController ()

@end

@implementation LaptimesViewController {
    NSTimer *pollingTimer;
    //NSTimeInterval delta;
    NSDateFormatter *dateFormatter;
    NSDate *now, *today;
    int delta, index, previous, secondsPerLap;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dateFormatter = [[NSDateFormatter alloc] init];
    secondsPerLap = [self.lap getSecondsPerLap];
    previous = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lap.numberOfLaps;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    static NSString *CellIdentifier = @"Laptimes";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    UILabel *timeLabel = (UILabel *)[cell viewWithTag:1001];
    
    label.text = [self.lap getLapTime:(indexPath.row + 1) secondsPerLap:secondsPerLap];
    timeLabel.text = [NSString stringWithFormat:@"%i", (int)delta];
    
    return cell;
}

-(void)pollTime:(NSTimer *)timer {
    now = [[NSDate alloc] init];
    delta = (int)[now timeIntervalSinceDate:today];
    index = delta / secondsPerLap;
//    NSLog(@"delta: %i", delta);
    if (delta != previous) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        previous = delta;
    }
}

-(IBAction)startTimer {
    [pollingTimer invalidate];
    today = [[NSDate alloc] init];
    pollingTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(pollTime:) userInfo:nil repeats:YES];
    [pollingTimer fire];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
