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

-(NSString *)getLapTimeShortForm:(int)lap secondsPerLap:(int)secondsPerLap {
    int total = lap * secondsPerLap;
    int minute = total / 60;
    int seconds = total - (minute * 60);
    return [NSString stringWithFormat:@"%02i:%02i", minute, seconds];
}

// stackoverflow.com/questions/1025192/memory-leaks-formatting-a-string-to-display-time-each-second
-(NSString *)getElapsedTimeFromSeconds:(int)totalSeconds {
    int hours = totalSeconds / 3600;
    int minutes = totalSeconds / 60;
    int seconds = totalSeconds % 60;
    if (hours > 0) {
        return [NSString stringWithFormat:@"%i:%02i:%02i", hours, minutes, seconds];
    } else {
        return [NSString stringWithFormat:@"%02i:%02i", minutes, seconds];
    }
}

@end
