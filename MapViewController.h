//
//  MapViewController.h
//  theologica
//
//  Created by Jonathan Lace on 12/14/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)biblicalButton:(id)sender;
- (IBAction)historicalButton:(id)sender;
- (IBAction)socialButton:(id)sender;
- (IBAction)allButton:(id)sender;
- (IBAction)viewButton:(id)sender;
- (IBAction)infoButton:(id)sender;

@end
