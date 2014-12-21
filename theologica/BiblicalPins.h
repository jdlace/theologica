//
//  Pins.h
//  theologica
//
//  Created by Jonathan Lace on 12/16/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface BiblicalPins : NSObject <MKAnnotation>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate; 
@property (copy, nonatomic) NSString *information; 

@end
