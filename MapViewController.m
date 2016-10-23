//
//  MapViewController.m
//  theologica
//
//  Created by Jonathan Lace on 12/14/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "MapViewController.h"
#import "MapDetailViewController.h"
#import "WordDetailViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "OTPins.h"
#import "NTPins.h"
#import "HistoricalPins.h"
#import "SocialPins.h"

@interface MapViewController () 

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self.mapView setDelegate:self];
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    self.mapView.showsScale = TRUE;

    
    //Create a region and zoom level for the intial view of the map. 
  //  MKCoordinateSpan span = MKCoordinateSpanMake(180.0000f, 180.0000f);
    CLLocationCoordinate2D coordinate = {38.4667, -28.4000};
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 19900000, 19900000);
    //MKCoordinateRegion region = {coordinate, span};
    
    MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
    
    [self.mapView setRegion:regionThatFits animated:YES];
    
    OTPins *otPins = [[OTPins alloc] init];
    NTPins *ntPins = [[NTPins alloc] init];
    HistoricalPins *chPins = [[HistoricalPins alloc] init];
    SocialPins *socialPins = [[SocialPins alloc] init];
    
    NSArray *otPinsArray = [otPins createOTPins];
    NSArray *ntPinsArray = [ntPins createNTPins];
    NSArray *chPinsArray = [chPins createHistoricalPins];
    NSArray *socialPinsArray = [socialPins createSocialPins];
    
    NSMutableArray *annotationsArray = [[NSMutableArray alloc] init];
    [annotationsArray addObjectsFromArray: otPinsArray];
    [annotationsArray addObjectsFromArray: ntPinsArray];
    [annotationsArray addObjectsFromArray: chPinsArray];
    [annotationsArray addObjectsFromArray: socialPinsArray];
    
    [self.mapView addAnnotations:annotationsArray];
    
}


- (void)didReceiveMemoryWarning
{
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


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        {
        return nil;
        }
    
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[OTPins class]])
        {
        // Try to dequeue an existing pin view first.
        
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
            {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"biblelines2"]];
            pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            //pinView.leftCalloutAccessoryView = imageView;
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);

            }
        
            pinView.annotation = annotation;
            return pinView;
        
        }
    
    else if ([annotation isKindOfClass:[NTPins class]])
    {
        // Try to dequeue an existing pin view first.
        
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
        {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"biblelines2"]];
            pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            //pinView.leftCalloutAccessoryView = imageView;
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);
            
        }
        
        pinView.annotation = annotation;
        return pinView;
        
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
            //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"churchlines"]];
            //pinView.leftCalloutAccessoryView = imageView;
             pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);
            }
        
            pinView.annotation = annotation;
            return pinView;
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
            //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"justice"]];
            //pinView.leftCalloutAccessoryView = imageView;
             pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);
            }
            
            pinView.annotation = annotation;
            return pinView;
            }
    return nil;
    
}


//Creates a custom callout with the pin's detailed information

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    OTPins *otPin = (OTPins *) view.annotation;
    
    [self.mapView deselectAnnotation:otPin animated:YES];
    
    
    MapDetailViewController *mapDetail = [[self storyboard]
    instantiateViewControllerWithIdentifier:@"MapDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Maps"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = otPin.title;
    word.definition = otPin.information;
    word.twitterDef = otPin.subtitle;
    word.image = otPin.image;
    
    mapDetail.currentWordDetail = word; 
   
    
    [self.navigationController pushViewController:mapDetail animated:YES];
}




- (IBAction)viewButton:(id)sender
{
 
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Choose a View Style for the Map."
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* satelliteAction = [UIAlertAction actionWithTitle:@"Satellite" style:UIAlertActionStyleDefault
                                                                                handler:^(UIAlertAction * action)
                                                            {
                                                            [self.mapView setMapType: MKMapTypeSatellite];
                                                            }];
    
    UIAlertAction* hybridAction = [UIAlertAction actionWithTitle:@"Hybrid" style:UIAlertActionStyleDefault
                                                                         handler:^(UIAlertAction * action)
                                                            {
                                                            [self.mapView setMapType: MKMapTypeHybrid];
                                                            }];
    
    UIAlertAction* standardAction = [UIAlertAction actionWithTitle:@"Standard" style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action)
                                                            {
                                                            [self.mapView setMapType: MKMapTypeStandard];
                                                            }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive
                                                            handler:^(UIAlertAction * action)
                                                            {
                                                            [self dismissViewControllerAnimated:YES completion:nil];
                                                            }];
    
    [alert addAction:satelliteAction];
    [alert addAction:hybridAction];
    [alert addAction:standardAction];
    [alert addAction:cancelAction];
    
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
   
}



- (IBAction)mapsButton:(id)sender
{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Choose the category of Pins \rto display on the Map."
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* oldTestamentAction = [UIAlertAction actionWithTitle:@"Old Testament" style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action)
                                      {
                                      [self.mapView removeAnnotations:self.mapView.annotations];
                                          
                                          OTPins *otPins = [[OTPins alloc] init];
                                          NSArray *annotations = [otPins createOTPins];
                                      
                                      [self.mapView addAnnotations:annotations];
                                      
                                      MKCoordinateSpan span = MKCoordinateSpanMake(18.0000f,06.0000f);
                                      CLLocationCoordinate2D coordinate = {34.0556, 40.2895};
                                      MKCoordinateRegion region = {coordinate, span};
                                      
                                      MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                      
                                      [self.mapView setRegion:regionThatFits animated:YES];
                                      
                                      }];
    

    UIAlertAction* newTestamentAction = [UIAlertAction actionWithTitle:@"New Testament" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                        [self.mapView removeAnnotations:self.mapView.annotations];
                                   
                                       NTPins *ntPins = [[NTPins alloc] init];
                                       NSArray *annotations = [ntPins createNTPins];
                                       
                                   [self.mapView addAnnotations:annotations];
                                   
                                   MKCoordinateSpan span = MKCoordinateSpanMake(40.0000f,40.0000f);
                                   CLLocationCoordinate2D coordinate = {37.9333, 22.9333};
                                   MKCoordinateRegion region = {coordinate, span};
                                   
                                   MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                   
                                   [self.mapView setRegion:regionThatFits animated:YES];
                                   
                                   }];
                                   
                                   
    
    
    
    UIAlertAction* historicalAction = [UIAlertAction actionWithTitle:@"Church History" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                   
                                   CLLocationCoordinate2D coordinate = {41.9022, 12.4533};
                                   MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 5000000, 5000000);
                                   //MKCoordinateRegion region = {coordinate, span};
                                   
                                   MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                   
                                   [self.mapView setRegion:regionThatFits animated:YES];
                                   
                                   [self.mapView removeAnnotations:self.mapView.annotations];
                                   
                                       HistoricalPins *chPins = [[HistoricalPins alloc] init];
                                       NSArray *annotations = [chPins createHistoricalPins];
                                       
                                   [self.mapView addAnnotations:annotations];
                                   
                                   }];
    
    UIAlertAction* socialAction = [UIAlertAction actionWithTitle:@"Social Justice" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action)
                                     {
                                     
                                     CLLocationCoordinate2D coordinate = {38.4667, -28.4000};
                                     MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 19900000, 19900000);
                                     //MKCoordinateRegion region = {coordinate, span};
                                     
                                     MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                     
                                     [self.mapView setRegion:regionThatFits animated:YES];

                                     [self.mapView removeAnnotations:self.mapView.annotations];
                                     
                                         SocialPins *socialPins = [[SocialPins alloc] init];
                                         NSArray *annotations = [socialPins createSocialPins];
                                         
                                     [self.mapView addAnnotations:annotations];

                                     
                                     }];
    
    UIAlertAction* allAction = [UIAlertAction actionWithTitle:@"All" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                   [self.mapView removeAnnotations:self.mapView.annotations];
                                       
                                       //Create a region and zoom level for the intial view of the map.
                                       //  MKCoordinateSpan span = MKCoordinateSpanMake(180.0000f, 180.0000f);
                                       CLLocationCoordinate2D coordinate = {38.4667, -28.4000};
                                       MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 19900000, 19900000);
                                       //MKCoordinateRegion region = {coordinate, span};
                                       
                                       MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                       
                                       [self.mapView setRegion:regionThatFits animated:YES];
                                       
                                       OTPins *otPins = [[OTPins alloc] init];
                                       NTPins *ntPins = [[NTPins alloc] init];
                                       HistoricalPins *chPins = [[HistoricalPins alloc] init];
                                       SocialPins *socialPins = [[SocialPins alloc] init];
                                       
                                       NSArray *otPinsArray = [otPins createOTPins];
                                       NSArray *ntPinsArray = [ntPins createNTPins];
                                       NSArray *chPinsArray = [chPins createHistoricalPins];
                                       NSArray *socialPinsArray = [socialPins createSocialPins];
                                       
                                       NSMutableArray *annotationsArray = [[NSMutableArray alloc] init];
                                       [annotationsArray addObjectsFromArray: otPinsArray];
                                       [annotationsArray addObjectsFromArray: ntPinsArray];
                                       [annotationsArray addObjectsFromArray: chPinsArray];
                                       [annotationsArray addObjectsFromArray: socialPinsArray];
                                    
                                      [self.mapView addAnnotations:annotationsArray];
                                       
                                       
                                   }];

    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * action)
                                   {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                                   }];
    
    [alert addAction:oldTestamentAction];
    [alert addAction:newTestamentAction];
    [alert addAction:historicalAction];
    [alert addAction:socialAction];
    [alert addAction:allAction];
    [alert addAction:cancelAction];
    
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
}


/////orientation///////

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
