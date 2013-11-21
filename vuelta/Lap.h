//
//  Lap.h
//  vuelta
//
//  Created by Claus Guttesen on 07/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lap : NSObject

@property (nonatomic) int getNumberOfLaps;
@property (nonatomic) int metersPerLap;
@property (nonatomic) int minutesPerKm;
@property (nonatomic) int secondsPerKm;

-(int)getSecondsPerLap;
-(int)getTotalDistance;
-(NSString *)getEstimatedHalfMarathonTime;
-(NSString *)getLapTime:(int)lap secondsPerLap:(int)secondsPerLap;
-(NSString *)getLapTimeShortForm:(int)lap secondsPerLap:(int)secondsPerLap;
-(NSString *)getElapsedTimeFromSeconds:(int)totalSeconds;

@end
