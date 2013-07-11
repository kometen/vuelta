//
//  Lap.h
//  vuelta
//
//  Created by Claus Guttesen on 07/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lap : NSObject

@property (nonatomic) int numberOfLaps;
@property (nonatomic) int metersPerLap;
@property (nonatomic) int minutesPerKm;
@property (nonatomic) int secondsPerKm;

-(int)getSecondsPerLap;
-(int)getTotalDistance;
-(NSString *)getEstimatedHalfMarathonTime;
-(NSString *)getLapTime:(int)lap secondsPerLap:(int)secondsPerLap;
-(NSString *)getLapTime:(int)lap secondsPerLap:(int)secondsPerLap delta:(int)delta;
-(NSString *)getLapTimeShortForm:(int)lap secondsPerLap:(int)secondsPerLap;

@end
