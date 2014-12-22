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

+ (MKAnnotationView *)createViewAnnotationForMapView:(MKMapView *)mapView annotation:(id <MKAnnotation>)annotation
{
    // try to dequeue an existing pin view first
    MKAnnotationView *returnedAnnotationView =
    [mapView dequeueReusableAnnotationViewWithIdentifier:NSStringFromClass([BiblicalPins class])];
    if (returnedAnnotationView == nil)
        {
        returnedAnnotationView =
        [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                        reuseIdentifier:NSStringFromClass([BiblicalPins class])];
        
        ((MKPinAnnotationView *)returnedAnnotationView).pinColor = MKPinAnnotationColorRed;
        ((MKPinAnnotationView *)returnedAnnotationView).animatesDrop = YES;
        ((MKPinAnnotationView *)returnedAnnotationView).canShowCallout = YES;
        }
    
    return returnedAnnotationView;
}

@end
