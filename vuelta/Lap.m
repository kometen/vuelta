//
//  Lap.m
//  vuelta
//
//  Created by Claus Guttesen on 07/07/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "Lap.h"

@implementation Lap {
    int hmsec, hmmin, hmhour;
}

-(int)getSecondsPerLap {
    return (self.minutesPerKm * 60 + self.secondsPerKm) / (1000.0/self.metersPerLap);
}

-(int)getTotalDistance {
    return self.numberOfLaps * self.metersPerLap;
}

-(NSString *)getEstimatedHalfMarathonTime {
    hmsec = (self.minutesPerKm * 60 + self.secondsPerKm) * 21.1;
    hmhour = hmsec / 3600;
    hmmin = (hmsec - hmhour * 3600) / 60;
    hmsec = hmsec - hmhour * 3600 - hmmin * 60;
    return [NSString stringWithFormat:@"%i:%02i:%02i", hmhour, hmmin, hmsec];
}

-(NSString *)getLapTime:(int)lap secondsPerLap:(int)secondsPerLap {
    int total = lap * secondsPerLap;
    int minute = total / 60;
    int seconds = total - (minute * 60);
    return [NSString stringWithFormat:@"lap %i, %02i min %02i sec", lap, minute, seconds];
}

-(NSString *)getLapTime:(int)lap secondsPerLap:(int)secondsPerLap delta:(int)delta {
    int total = lap * secondsPerLap;
    int minute = total / 60;
    int seconds = total - (minute * 60);
    return [NSString stringWithFormat:@"lap %i, %02i min %02i sec, %i", lap, minute, seconds, delta];
}

-(NSString *)getLapTimeShortForm:(int)lap secondsPerLap:(int)secondsPerLap {
    int total = lap * secondsPerLap;
    int minute = total / 60;
    int seconds = total - (minute * 60);
    return [NSString stringWithFormat:@"%02i:%02i", minute, seconds];
}

@end
