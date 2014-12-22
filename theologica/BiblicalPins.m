//
//  Pins.m
//  theologica
//
//  Created by Jonathan Lace on 12/16/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "BiblicalPins.h"

@implementation BiblicalPins
@synthesize coordinate;


-(id)initWithLocation:(CLLocationCoordinate2D)coords
{
    self = [super init];
    
    if (self)
    {
        self.coordinate = coords;
    }
    
    return self; 
}

@end
