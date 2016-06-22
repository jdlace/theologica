//
//  Old Testament.h
//  theologica
//
//  Created by Jonathan Lace on 6/21/16.
//  Copyright © 2016 techrament. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface OTPins : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *subtitle;
@property (copy, nonatomic) NSString *information;
@property (copy, nonatomic) UIImage *image;

-(NSArray*)createOTPins;



@end

