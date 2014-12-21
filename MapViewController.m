//
//  MapViewController.m
//  theologica
//
//  Created by Jonathan Lace on 12/14/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "MapViewController.h"
#import "MapDetailViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "BiblicalPins.h"
#import "HistoricalPins.h"
#import "SocialPins.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // restore the nav bar to translucent
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.mapView setDelegate:self];
    
    // create a custom navigation bar button and set it to always says "Back"
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    
    //Create a region and zoom level for the intial view of the map. 
    MKCoordinateSpan span = MKCoordinateSpanMake(40.0f,40.0001f);
    CLLocationCoordinate2D coordinate = {37.9667, 23.7167};
    MKCoordinateRegion region = {coordinate, span};
    
    MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
    
    [self.mapView setRegion:regionThatFits animated:YES];
 
/*
    BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
    jerusalem.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
    jerusalem.title = @"Jerusalem";
    jerusalem.subtitle = @"2 Sam. 24:24";
    
    BiblicalPins *rome = [[BiblicalPins alloc] init];
    rome.coordinate = CLLocationCoordinate2DMake(41.9000, 12.5000);
    rome.title = @"Rome";
    rome.subtitle = @"Romans 1:2";
    
    BiblicalPins *nazareth = [[BiblicalPins alloc] init];
    nazareth.coordinate = CLLocationCoordinate2DMake(32.7019, 35.3033);
    nazareth.title = @"Nazareth";
    nazareth.subtitle = @"Luke 4:16";
    
    BiblicalPins *bethEl = [[BiblicalPins alloc] init];
    bethEl.coordinate = CLLocationCoordinate2DMake(31.9300, 35.2200);
    bethEl.title = @"Beth-El";
    bethEl.subtitle = @"1 Kings 12:28";
    
    BiblicalPins *ephesus = [[BiblicalPins alloc] init];
    ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
    ephesus.title = @"Ephesus";
    ephesus.subtitle = @"Ephesians 1:4";
    
    BiblicalPins *corinth = [[BiblicalPins alloc] init];
    corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
    corinth.title = @"Corinth";
    corinth.subtitle = @"1 Corinthians 1:3";
    
    BiblicalPins *dan = [[BiblicalPins alloc] init];
    dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
    dan.title = @"Dan";
    dan.subtitle = @"1 Kings 12: 28";
    
    BiblicalPins *temple = [[BiblicalPins alloc] init];
    temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2358);
    temple.title = @"The Temple Mount";
    temple.subtitle = @"1 Kings 6:1";
    
    BiblicalPins *hazor = [[BiblicalPins alloc] init];
    hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
    hazor.title = @"Hazor";
    hazor.subtitle = @"Joshua 11:10";
    
    HistoricalPins *nicea = [[HistoricalPins alloc] init];
    nicea.coordinate = CLLocationCoordinate2DMake(40.2574, 29.4317);
    nicea.title = @"Nicea";
    nicea.subtitle = @"A.D. 325, First Ecumenical Council";
    
    SocialPins *greenland = [[SocialPins alloc] init];
    greenland.coordinate = CLLocationCoordinate2DMake(72.0000, -40.0000);
    greenland.title = @"Greenland";
    greenland.subtitle = @"Glacial Melt";
    
    
    [self.mapView addAnnotation:jerusalem];
    [self.mapView addAnnotation:nazareth];
    [self.mapView addAnnotation:rome];
    [self.mapView addAnnotation:bethEl];
    [self.mapView addAnnotation:ephesus];
    [self.mapView addAnnotation:corinth];
    [self.mapView addAnnotation:dan];
    [self.mapView addAnnotation:temple];
    [self.mapView addAnnotation:hazor];
    [self.mapView addAnnotation:nicea];
    [self.mapView addAnnotation:greenland]; 
    */
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        {
        return nil;
        }
    
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[BiblicalPins class]])
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            //pinView.image = [UIImage imageNamed: @"small-pin-map-7"];
            pinView.pinColor = MKPinAnnotationColorGreen;
            pinView.calloutOffset = CGPointMake(0, 32);
        
        return pinView;
        
        }
    }
    else if ([annotation isKindOfClass:[HistoricalPins class]])
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            //pinView.image = [UIImage imageNamed: @"small-pin-map-7"];
            pinView.pinColor = MKPinAnnotationColorPurple;
            pinView.calloutOffset = CGPointMake(0, 32);
        
        return pinView;
        
        }
            
    }
    else if ([annotation isKindOfClass:[SocialPins class]])
    {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            //pinView.image = [UIImage imageNamed: @"small-pin-map-7"];
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);
        
        }
    
    else
        {
            pinView.annotation = annotation;
        }
    
    return pinView;
    

    }
    
        // Add a detail disclosure button to the callout.
        //UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //pinView.rightCalloutAccessoryView = rightButton;
        
        //Add an image to the left callout.
        //UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0429"]];
        //pinView.leftCalloutAccessoryView = iconView;
    
    return nil;
    
}



-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
   /*
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Info"
                                                        message:@"Site description here."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
    */
    
}


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

- (IBAction)biblicalButton:(id)sender
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
    jerusalem.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
    jerusalem.title = @"Jerusalem";
    jerusalem.subtitle = @"2 Sam. 24:24";
    
    BiblicalPins *rome = [[BiblicalPins alloc] init];
    rome.coordinate = CLLocationCoordinate2DMake(41.9000, 12.5000);
    rome.title = @"Rome";
    rome.subtitle = @"Romans 1:2";
    
    BiblicalPins *nazareth = [[BiblicalPins alloc] init];
    nazareth.coordinate = CLLocationCoordinate2DMake(32.7019, 35.3033);
    nazareth.title = @"Nazareth";
    nazareth.subtitle = @"Luke 4:16";
    
    BiblicalPins *bethEl = [[BiblicalPins alloc] init];
    bethEl.coordinate = CLLocationCoordinate2DMake(31.9300, 35.2200);
    bethEl.title = @"Beth-El";
    bethEl.subtitle = @"1 Kings 12:28";
    
    BiblicalPins *ephesus = [[BiblicalPins alloc] init];
    ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
    ephesus.title = @"Ephesus";
    ephesus.subtitle = @"Ephesians 1:4";
    
    BiblicalPins *corinth = [[BiblicalPins alloc] init];
    corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
    corinth.title = @"Corinth";
    corinth.subtitle = @"1 Corinthians 1:3";
    
    BiblicalPins *dan = [[BiblicalPins alloc] init];
    dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
    dan.title = @"Dan";
    dan.subtitle = @"1 Kings 12: 28";
    
    BiblicalPins *temple = [[BiblicalPins alloc] init];
    temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2358);
    temple.title = @"The Temple Mount";
    temple.subtitle = @"1 Kings 6:1";
    
    BiblicalPins *hazor = [[BiblicalPins alloc] init];
    hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
    hazor.title = @"Hazor";
    hazor.subtitle = @"Joshua 11:10";
    
    NSArray *annotations = [NSArray arrayWithObjects:jerusalem,rome, nazareth, dan, bethEl, temple, corinth, ephesus, hazor, nil];
    [self.mapView addAnnotations:annotations];

}

- (IBAction)historicalButton:(id)sender
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    HistoricalPins *nicea = [[HistoricalPins alloc] init];
    nicea.coordinate = CLLocationCoordinate2DMake(40.2574, 29.4317);
    nicea.title = @"Nicea: Ecumencial Councils I, VII";
    nicea.subtitle = @"A.D. 325, 787";
    
    HistoricalPins *alexandria = [[HistoricalPins alloc] init];
    alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
    alexandria.title = @"Alexandria, Egypt: Patriarchate";
    alexandria.subtitle = @"Major catechemenical center in early Christianity";
    
    NSArray *annotations = [NSArray arrayWithObjects:nicea, alexandria, nil];
    [self.mapView addAnnotations:annotations];
}

- (IBAction)socialButton:(id)sender
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    
}

- (IBAction)allButton:(id)sender
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
    jerusalem.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
    jerusalem.title = @"Jerusalem";
    jerusalem.subtitle = @"2 Sam. 24:24";
    
    BiblicalPins *rome = [[BiblicalPins alloc] init];
    rome.coordinate = CLLocationCoordinate2DMake(41.9000, 12.5000);
    rome.title = @"Rome";
    rome.subtitle = @"Romans 1:2";
    
    BiblicalPins *nazareth = [[BiblicalPins alloc] init];
    nazareth.coordinate = CLLocationCoordinate2DMake(32.7019, 35.3033);
    nazareth.title = @"Nazareth";
    nazareth.subtitle = @"Luke 4:16";
    
    BiblicalPins *bethEl = [[BiblicalPins alloc] init];
    bethEl.coordinate = CLLocationCoordinate2DMake(31.9300, 35.2200);
    bethEl.title = @"Beth-El";
    bethEl.subtitle = @"1 Kings 12:28";
    
    BiblicalPins *ephesus = [[BiblicalPins alloc] init];
    ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
    ephesus.title = @"Ephesus";
    ephesus.subtitle = @"Ephesians 1:4";
    
    BiblicalPins *corinth = [[BiblicalPins alloc] init];
    corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
    corinth.title = @"Corinth";
    corinth.subtitle = @"1 Corinthians 1:3";
    
    BiblicalPins *dan = [[BiblicalPins alloc] init];
    dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
    dan.title = @"Dan";
    dan.subtitle = @"1 Kings 12: 28";
    
    BiblicalPins *temple = [[BiblicalPins alloc] init];
    temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2358);
    temple.title = @"The Temple Mount";
    temple.subtitle = @"1 Kings 6:1";
    
    BiblicalPins *hazor = [[BiblicalPins alloc] init];
    hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
    hazor.title = @"Hazor";
    hazor.subtitle = @"Joshua 11:10";
    
    HistoricalPins *nicea = [[HistoricalPins alloc] init];
    nicea.coordinate = CLLocationCoordinate2DMake(40.2574, 29.4317);
    nicea.title = @"Nicea";
    nicea.subtitle = @"A.D. 325, First Ecumenical Council";
    
    SocialPins *greenland = [[SocialPins alloc] init];
    greenland.coordinate = CLLocationCoordinate2DMake(72.0000, -40.0000);
    greenland.title = @"Greenland";
    greenland.subtitle = @"Glacial Melt";

    NSArray *annotations = [NSArray arrayWithObjects:jerusalem, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, rome, nazareth, nil];
    [self.mapView addAnnotations:annotations];
    
    
}
@end
