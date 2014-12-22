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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mapView setDelegate:self];
    
    
    /*
    [self.mapView setDelegate:self];
    
    // create a custom navigation bar button and set it to always says "Back"
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    */
    
    
    
    //Create a region and zoom level for the intial view of the map. 
    MKCoordinateSpan span = MKCoordinateSpanMake(100.0000f,100.0000f);
    CLLocationCoordinate2D coordinate = {41.9000, 12.5000};
    MKCoordinateRegion region = {coordinate, span};
    
    MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
    
    [self.mapView setRegion:regionThatFits animated:YES];
    
    
    //Array to store multiple annotations
    //Create one instance of Bible Pins to use for other annotations - from Lynda.com
    /*
    //Coordinate
    CLLocationCoordinate2D location;
    location.latitude = 41.9000;
    location.longitude = 12.5000;
    BiblicalPins *biblicalPin = [[BiblicalPins alloc] init];
    //Annotation
    [biblicalPin setCoordinate: location];
    biblicalPin.title = @"Jerusalem";
    biblicalPin.subtitle = @"The City of David. According to 2 Samuel 24:24, David purchased this city from the Jebusites and then moved his captial from Hebron to here.";
    [annotations addObject:biblicalPin];
    
    CLLocationCoordinate2D location;
    location.latitude = 41.9000;
    location.longitude = 12.5000;
    BiblicalPins *biblicalPin = [[BiblicalPins alloc] init];
    //Annotation
    [biblicalPin setCoordinate: location];
    biblicalPin.title = @"Jerusalem";
    biblicalPin.subtitle = @"The City of David. According to 2 Samuel 24:24, David purchased this city from the Jebusites and then moved his captial from Hebron to here.";
    [annotations addObject:biblicalPin];
    */
    

}


//This method creates a custom alert callout with the pin's detailed information - need to work on this.
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    //annotation
    BiblicalPins *jerusalem = (BiblicalPins *) view.annotation;

    //deselect button selected
    [self.mapView deselectAnnotation:jerusalem animated:YES];
    
    //alert
    //NSString *msg = [[NSString alloc]
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:jerusalem.title message:jerusalem.subtitle preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    

    
    
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
    jerusalem.information = @"The city that King David purchased from the Jebusites and designated the capital of Israel.";
    
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
    nicea.title = @"Nicea: Councils I, VII";
    nicea.subtitle = @"A.D. 325, 787";
    
    HistoricalPins *alexandria = [[HistoricalPins alloc] init];
    alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
    alexandria.title = @"Alexandria, Egypt";
    alexandria.subtitle = @"Major catechemenical center in early Christianity";
    
    HistoricalPins *rome2 = [[HistoricalPins alloc] init];
    rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
    rome2.title = @"Rome";
    rome2.subtitle = @"The Church that Presides in Love";
    
    HistoricalPins *constantinople = [[HistoricalPins alloc] init];
    constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
    constantinople.title = @"Constantinople, Councils II, V";
    constantinople.subtitle = @"A.D. 381, 553";
    
    
    
    NSArray *annotations = [NSArray arrayWithObjects:nicea, alexandria, rome2, constantinople,  nil];
    [self.mapView addAnnotations:annotations];
}

- (IBAction)socialButton:(id)sender
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    SocialPins *greenland = [[SocialPins alloc] init];
    greenland.coordinate = CLLocationCoordinate2DMake(72.0000, -40.0000);
    greenland.title = @"Greenland";
    greenland.subtitle = @"Issue: Accelerated Glacial Melting";
    
    SocialPins *sierraLeone = [[SocialPins alloc] init];
    sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
    sierraLeone.title = @"Sierra Leone";
    sierraLeone.subtitle = @"Issue: Health Care";
    
    SocialPins *camden = [[SocialPins alloc] init];
    camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
    camden.title = @"Camden, NJ";
    camden.subtitle = @"Issue: Systemic Poverty";
    
    SocialPins *atlantic = [[SocialPins alloc] init];
    atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
    atlantic.title = @"The Atlantic Ocean";
    atlantic.subtitle = @"Issue: Overfishing, Sea Level Rise";
    
    SocialPins *palestine = [[SocialPins alloc] init];
    palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
    palestine.title = @"Palestine";
    palestine.subtitle = @"Issue: Israeli Occupation";
    
    SocialPins *israel = [[SocialPins alloc] init];
    israel.coordinate = CLLocationCoordinate2DMake(31.0000, 35.0000);
    israel.title = @"Israel";
    israel.subtitle = @"Issue: Regional Terrorism";
    
    
    NSArray *annotations = [NSArray arrayWithObjects:greenland, sierraLeone, camden, atlantic, palestine, israel, nil];
    [self.mapView addAnnotations:annotations];
    
}

- (IBAction)allButton:(id)sender
{
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
    jerusalem.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
    jerusalem.title = @"Jerusalem";
    jerusalem.subtitle = @"2 Sam. 24:24";
    jerusalem.information = @"The city that King David purchased from the Jebusites and designated the capital of Israel.";
    
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
    greenland.subtitle = @"Issue: Accelerated Glacial Melt";
    
    HistoricalPins *alexandria = [[HistoricalPins alloc] init];
    alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
    alexandria.title = @"Alexandria, Egypt: Patriarchate";
    alexandria.subtitle = @"Major catechemenical center in early Christianity";
    
    HistoricalPins *rome2 = [[HistoricalPins alloc] init];
    rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
    rome2.title = @"Rome";
    rome2.subtitle = @"The Church that Presides in Love";
    
    HistoricalPins *constantinople = [[HistoricalPins alloc] init];
    constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
    constantinople.title = @"Constantinople, Councils II, V";
    constantinople.subtitle = @"A.D. 381, 553";
    
    SocialPins *sierraLeone = [[SocialPins alloc] init];
    sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
    sierraLeone.title = @"Sierra Leone";
    sierraLeone.subtitle = @"Issue: Health Care";
    
    SocialPins *camden = [[SocialPins alloc] init];
    camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
    camden.title = @"Camden, NJ";
    camden.subtitle = @"Issue: Systemic Poverty";
    
    SocialPins *atlantic = [[SocialPins alloc] init];
    atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
    atlantic.title = @"The Atlantic Ocean";
    atlantic.subtitle = @"Issue: Overfishing, Sea Level Rise";
    
    SocialPins *palestine = [[SocialPins alloc] init];
    palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
    palestine.title = @"Palestine";
    palestine.subtitle = @"Issue: Israeli Occupation";
    
    SocialPins *israel = [[SocialPins alloc] init];
    israel.coordinate = CLLocationCoordinate2DMake(31.0000, 35.0000);
    israel.title = @"Israel";
    israel.subtitle = @"Issue: Regional Terrorism";

    NSArray *annotations = [NSArray arrayWithObjects:jerusalem, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, rome, nazareth, sierraLeone, camden, atlantic, rome2, constantinople, palestine, israel, nil];
    [self.mapView addAnnotations:annotations];
    
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    /* from Lynda.com
     //view
     MKPinAnnotationView *view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin"];
     //pin color
     view.pinColor = MKPinAnnotationColorRed;
     //enabled animated
     view.enabled = YES;
     view.animatesDrop = YES;
     view.canShowCallout = YES;
     //image - button
     UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"old-scroll@3x copy-1"]];
     view.leftCalloutAccessoryView = imageView;
     view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
     return view;
     */
    
    
    
    
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
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"old-scroll@3x copy-1"]];
            pinView.leftCalloutAccessoryView = imageView;
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);
            
            return pinView;
            
            }
        }
    else if ([annotation isKindOfClass:[HistoricalPins class]])
        {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView2"];
        if (!pinView)
            {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView2"];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"church@3x copy"]];
            pinView.leftCalloutAccessoryView = imageView;
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);
            
            return pinView;
            
            }
        
        }
    else if ([annotation isKindOfClass:[SocialPins class]])
        {
        // Try to dequeue an existing pin view first.
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView3"];
        if (!pinView)
            {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView3"];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"man-woman-child-7@3x copy"]];
            pinView.leftCalloutAccessoryView = imageView;
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);
            
            return pinView;
            
            }
        
        else
            {
            pinView.annotation = annotation;
            }
        
        
        
        }
    
    // Add a detail disclosure button to the callout.
    //UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //pinView.rightCalloutAccessoryView = rightButton;
    
    //Add an image to the left callout.
    //UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IMG_0429"]];
    //pinView.leftCalloutAccessoryView = iconView;
    
    return nil;
    
}

@end
