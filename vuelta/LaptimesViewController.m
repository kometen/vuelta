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
    NSDate *now, *today;
    int delta, index, previousDelta, previousIndex, secondsPerLap;
    BOOL firstTimeInNewIndexpathRow;
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
    secondsPerLap = [self.lap getSecondsPerLap];
    previousDelta = 0;
    previousIndex = -1;
    firstTimeInNewIndexpathRow = NO;
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
    static NSString *CellIdentifier = @"Laptimes";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    UILabel *timeLabel = (UILabel *)[cell viewWithTag:1001];

    if ((delta % 10 == 0) && (delta > 0)) {       // Bold every n'th second
        timeLabel.textColor = [UIColor blueColor];
        timeLabel.font = [UIFont boldSystemFontOfSize:17];
    } else if (firstTimeInNewIndexpathRow == YES) {
        label.font = [UIFont boldSystemFontOfSize:17];
        timeLabel.font = [UIFont boldSystemFontOfSize:17];
        label.textColor = [UIColor blueColor];
        timeLabel.textColor = [UIColor blueColor];
        firstTimeInNewIndexpathRow = NO;
    } else {
        label.font = [UIFont systemFontOfSize:17];
        timeLabel.font = [UIFont systemFontOfSize:17];
        label.textColor = [UIColor blackColor];
        timeLabel.textColor = [UIColor blackColor];
    }
    
    label.text = [self.lap getLapTime:(indexPath.row + 1) secondsPerLap:secondsPerLap];
    timeLabel.text = [self.lap getElapsedTimeFromSeconds:delta];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// http://stackoverflow.com/questions/16220777/accessing-cell-attributes-outside-of-cellforrowatindexpath
-(void)pollTime:(NSTimer *)timer {
    now = [[NSDate alloc] init];
    delta = (int)[now timeIntervalSinceDate:today];
    index = delta / secondsPerLap;  // Index equals to indexPath.row
    if (delta != previousDelta && index < self.lap.numberOfLaps) {
        if (previousIndex != index) {
            firstTimeInNewIndexpathRow = YES;
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        previousIndex = index;
        previousDelta = delta;
    }
    if (delta != previousDelta && index >= self.lap.numberOfLaps) {
        self.title = [self.lap getElapsedTimeFromSeconds:delta];
    }
}

-(IBAction)startTimer {
    self.startBarButton.title = @"Reset";
    [pollingTimer invalidate];
    today = [[NSDate alloc] init];
    pollingTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(pollTime:) userInfo:nil repeats:YES];
    [pollingTimer fire];
    previousIndex = -1;
    [self.tableView reloadData];
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
