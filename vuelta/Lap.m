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

@end
