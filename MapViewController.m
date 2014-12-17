//
//  MapViewController.m
//  theologica
//
//  Created by Jonathan Lace on 12/14/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Create a region and zoom level for the intial view of the map. 
    MKCoordinateSpan span = MKCoordinateSpanMake(40.0f,40.0001f);
    CLLocationCoordinate2D coordinate = {37.9667, 23.7167};
    MKCoordinateRegion region = {coordinate, span};
    
    MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
    NSLog(@"Fit Region %f %f", regionThatFits.center.latitude, regionThatFits.center.longitude);
    
    [self.mapView setRegion:regionThatFits animated:YES];
 

    MKPointAnnotation *jerusalemAnnotation = [[MKPointAnnotation alloc] init];
    jerusalemAnnotation.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
    jerusalemAnnotation.title = @"Jerusalem";
    jerusalemAnnotation.subtitle = @"The City of David (2 Sam. 24:24)";
    
    MKPointAnnotation *romeAnnotation = [[MKPointAnnotation alloc] init];
    romeAnnotation.coordinate = CLLocationCoordinate2DMake(41.9000, 12.5000);
    romeAnnotation.title = @"Rome";
    romeAnnotation.subtitle = @"The capital of the Roman Empire";
    
    MKPointAnnotation *nazarethAnnotation = [[MKPointAnnotation alloc] init];
    nazarethAnnotation.coordinate = CLLocationCoordinate2DMake(32.7019, 35.3033);
    nazarethAnnotation.title = @"Nazareth";
    nazarethAnnotation.subtitle = @"The hometown of Jesus of Nazareth.";
    
    MKPointAnnotation *bethEl = [[MKPointAnnotation alloc] init];
    bethEl.coordinate = CLLocationCoordinate2DMake(31.9300, 35.2200);
    bethEl.title = @"Beth-El";
    bethEl.subtitle = @"One of two worship sites built by Jeroboam I.";
    
    [self.mapView addAnnotation:jerusalemAnnotation];
    [self.mapView addAnnotation:nazarethAnnotation];
    [self.mapView addAnnotation:romeAnnotation];
    [self.mapView addAnnotation:bethEl];
    
}
/*
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id<MKAnnotation>)annotation
{
   
    
}
 
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
