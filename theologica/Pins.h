//
//  Pins.h
//  theologica
//
//  Created by Jonathan Lace on 12/16/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Pins : MKPointAnnotation

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *information; 

@end
