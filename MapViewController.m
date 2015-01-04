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
#import "BiblicalPins.h"
#import "HistoricalPins.h"
#import "SocialPins.h"

@interface MapViewController ()

@end

@implementation MapViewController

/*
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // restore the nav bar to translucent
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self.mapView setDelegate:self];
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] init];
    temporaryBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem;

    
    //Create a region and zoom level for the intial view of the map. 
    MKCoordinateSpan span = MKCoordinateSpanMake(100.0000f,100.0000f);
    CLLocationCoordinate2D coordinate = {38.4667, -28.4000};
    MKCoordinateRegion region = {coordinate, span};
    
    MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
    
    [self.mapView setRegion:regionThatFits animated:YES];
    
    BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
    jerusalem.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
    jerusalem.title = @"Jerusalem";
    jerusalem.subtitle = @"The City of David"; 
    jerusalem.information = @"The capital of the Davidic monarchy. According to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rCoordinates: 31.7883, 35.2167";
    
    BiblicalPins *rome = [[BiblicalPins alloc] init];
    rome.coordinate = CLLocationCoordinate2DMake(41.9000, 12.5000);
    rome.title = @"Rome";
    rome.subtitle = @"The Church that “presides in love”";
    rome.information = @"The Church of Rome was established in the first century and quickly acquired a reputation for generosity. According to tradition, both Peter and Paul were martyred there during the persecution under Nero.\r\rCoordinates: 41.9000, 12.5000\r\r";
    
    BiblicalPins *nazareth = [[BiblicalPins alloc] init];
    nazareth.coordinate = CLLocationCoordinate2DMake(32.7019, 35.3033);
    nazareth.title = @"Nazareth";
    nazareth.subtitle = @"Hometown of Jesus";
    nazareth.information = @"The town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas.\r\rCoordinates: 32.7019, 35.3033";
    
    BiblicalPins *bethEl = [[BiblicalPins alloc] init];
    bethEl.coordinate = CLLocationCoordinate2DMake(31.9300, 35.2200);
    bethEl.title = @"Beth-El";
    bethEl.subtitle = @"House of El";
    bethEl.information = @"Beth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon. In Genesis 32 and 35 it is associated with the Hebrew patriarch Jacob.\r\rCoordinates: 31.9300, 35.2200";
    
    BiblicalPins *ephesus = [[BiblicalPins alloc] init];
    ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
    ephesus.title = @"Ephesus";
    ephesus.subtitle = @"Paul's Asiatic Missionary Base";
    ephesus.information = @"Coordinates: 37.9411, 27.3419 ";
    
    BiblicalPins *corinth = [[BiblicalPins alloc] init];
    corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
    corinth.title = @"Corinth";
    corinth.information = @"Coordinates: 37.9333, 22.9333";
    
    BiblicalPins *dan = [[BiblicalPins alloc] init];
    dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
    dan.title = @"Dan";
    dan.subtitle = @"Northern cultic site";
    dan.information = @"Coordinates: 33.2490, 35.6520";
    
    BiblicalPins *temple = [[BiblicalPins alloc] init];
    temple.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
    temple.title = @"The Temple Mount";
    temple.subtitle = @"The House of YHWH";
    temple.information = @"Coordinates: 33.2490, 35.6520";
    
    BiblicalPins *hazor = [[BiblicalPins alloc] init];
    hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
    hazor.title = @"Hazor";
    hazor.information = @"Coordinates: 33.0167, 35.5669";
    
    HistoricalPins *nicea = [[HistoricalPins alloc] init];
    nicea.coordinate = CLLocationCoordinate2DMake(40.2574, 29.4317);
    nicea.title = @"Nicea";
    nicea.subtitle = @"Ecumenical Councils II, V";
    nicea.information = @"The first Council of Nicea was called by the Emperor Constantine in A.D. 325. It condemned the teaching of Arius and declared that Christ is ομοουσιους (homoousious) - 'of the same substance' as God. \r\rThe second Council of Nicea in A.D. 787 brought an end to the iconoclasm controversy by approving the veneration of icons.\r\rCoordinates: 40.2574, 29.4317";
    
    SocialPins *greenland = [[SocialPins alloc] init];
    greenland.coordinate = CLLocationCoordinate2DMake(72.0000, -40.0000);
    greenland.title = @"Greenland";
    greenland.subtitle = @"Accelerated Glacial Melt";
    greenland.information = @"Greenland is an examplar of the effects of climate change.\r\rCoordinates: 72.0000, -40.0000";
    
    HistoricalPins *alexandria = [[HistoricalPins alloc] init];
    alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
    alexandria.title = @"Alexandria, Egypt";
    alexandria.information = @"Eastern Patriarchate \r\rMajor catechumenical center in early Christianity. \r\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen.\r\rCoordinates: 31.1980, 29.9192";
    
    HistoricalPins *rome2 = [[HistoricalPins alloc] init];
    rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
    rome2.title = @"Rome";
    rome2.information = @"The Church that 'Presides in Love'. \r\rThe Church of Rome was established in the first century and quickly acquired a reputation for generosity. According to tradition, both Peter and Paul were martyred there during the persecution under Nero.\r\rCoordinates: 41.9022, 12.4533";
    
    HistoricalPins *constantinople = [[HistoricalPins alloc] init];
    constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
    constantinople.title = @"Constantinople, Councils II, V";
    constantinople.information = @"A.D. 381, 553 \r\rThe 2nd and 5th ecumenical councils confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively.\r\rCoordinates: 41.0122, 28.9760";
    
    SocialPins *sierraLeone = [[SocialPins alloc] init];
    sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
    sierraLeone.title = @"Sierra Leone";
    sierraLeone.subtitle = @"Insufficient Health Care";
    sierraLeone.information = @"Sierra Leone was the locus of an Ebola epidemic in 2014.\r\rCoordinates: 8.4844, -13.2344";
    
    SocialPins *camden = [[SocialPins alloc] init];
    camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
    camden.title = @"Camden, NJ";
    camden.information = @"Coordinates: 39.9400, -75.1050";
    
    SocialPins *atlantic = [[SocialPins alloc] init];
    atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
    atlantic.title = @"The Atlantic Ocean";
    atlantic.information = @"Coordinates: 38.4667, -28.4000";
    
    SocialPins *palestine = [[SocialPins alloc] init];
    palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
    palestine.title = @"Palestine";
    palestine.information = @"Coordinates: 31.6253, 35.1453";
    
    SocialPins *israel = [[SocialPins alloc] init];
    israel.coordinate = CLLocationCoordinate2DMake(31.0000, 35.0000);
    israel.title = @"Israel";
    israel.information = @"Coordinates: 31.6253, 35.1453";
    
    BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
    thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
    thessalonica.title = @"Thessalonica";
    thessalonica.information = @"Coordinates: 40.6500, 22.9000";
    
    BiblicalPins *philippi = [[BiblicalPins alloc] init];
    philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
    philippi.title = @"Philippians";
    philippi.information = @"Coordinates: 41.0131, 24.2864";
    
    BiblicalPins *antioch = [[BiblicalPins alloc] init];
    antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
    antioch.title = @"Antioch";
    antioch.information = @"Coordinates: 36.2000, 36.1500";
    
    BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
    bethlehem.coordinate = CLLocationCoordinate2DMake(31.7031, 35.1956);
    bethlehem.title = @"Bethlehem";
    bethlehem.information = @"Coordinates: 31.7031, 35.1956";


    
    NSArray *annotations = [NSArray arrayWithObjects:jerusalem, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, rome, nazareth, sierraLeone, camden, atlantic, rome2, constantinople, palestine, israel, alexandria, thessalonica, philippi, antioch, bethlehem, nil];
    
    [self.mapView addAnnotations:annotations];

    
    /*
    //Array to store multiple annotations
    //Create one instance of Bible Pins to use for other annotations - from Lynda.com
    
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    BiblicalPins *biblicalPin;
    
    //Annotations
    location.latitude = 41.9000;
    location.longitude = 12.5000;
    biblicalPin = [[BiblicalPins alloc] init];
    [biblicalPin setCoordinate: location];
    biblicalPin.title = @"Jerusalem";
    biblicalPin.subtitle = @"The City of David. According to 2 Samuel 24:24, David purchased this city from the Jebusites and then moved his captial from Hebron to here.";
    [annotations addObject:biblicalPin];
    
    
    [self.mapView addAnnotations:annotations];

    */

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
    //MKAnnotationView  *returnedAnnotationView = nil; //from MapCallouts
    
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        {
        return nil;
        }
    
    
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[BiblicalPins class]])
        {
        // Try to dequeue an existing pin view first.
        
        //from MapCallouts sample - returnedAnnotationView = [BiblicalPins createViewAnnotationForMapView: self.mapView annotation:annotation];
        
        MKPinAnnotationView *pinView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView)
            {
            // If an existing pin view was not available, create one.
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.animatesDrop = YES;
            pinView.canShowCallout = YES;
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"biblelines2"]];
            pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.leftCalloutAccessoryView = imageView;
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
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"churchlines"]];
            pinView.leftCalloutAccessoryView = imageView;
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
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earthlines"]];
            pinView.leftCalloutAccessoryView = imageView;
             pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.pinColor = MKPinAnnotationColorRed;
            pinView.calloutOffset = CGPointMake(0, 32);
            }
            
            pinView.annotation = annotation;
            return pinView;
            
        }
   

    
    return nil;
    
}




//This method creates a custom alert callout with the pin's detailed information - need to work on this.
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    //id <MKAnnotation> annotation = [view annotation];

    
    //annotation - works
    //BiblicalPins *biblicalPin = (BiblicalPins *) view.annotation;
    
    //deselect button selected - works
    //[self.mapView deselectAnnotation:biblicalPin animated:YES];
        
  
    
    //UIAlertController *alert = [UIAlertController alertControllerWithTitle: biblicalPin.title message:biblicalPin.subtitle preferredStyle:(UIAlertControllerStyleAlert)];
    
    //UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          //handler:^(UIAlertAction * action) {}];
    
    //[alert addAction:defaultAction];
    //[self presentViewController:alert animated:YES completion:nil];
    
    
    //-----------------------------------------------------------------------------
/*
    BiblicalPins *biblicalPin = (BiblicalPins *) view.annotation;
    
    [self.mapView deselectAnnotation:biblicalPin animated:YES];

    
    
        WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Map"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = biblicalPin.title;
    
    //detailViewController.imageView.image = [UIImage imageNamed:@"earthlines"];
    //[self.view addSubview:detailViewController.view];
    
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    options.size = CGSizeMake(960, 640);
    options.scale = [[UIScreen mainScreen] scale]; // iOS only
    options.region = self.mapView.region;
    options.mapType = MKMapTypeStandard;
    
    MKMapSnapshotter *snapshotter =
    [[MKMapSnapshotter alloc] initWithOptions:options];
    [snapshotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *e)
    {
    //if (e) ...;// Handle errors
    
    UIImage *image = snapshot.image;
    
    detailViewController.imageView.image = image;
// Done!
    }];
    

    word.definition = biblicalPin.information;
    
    detailViewController.currentWordDetail = word;

    
    [self.navigationController pushViewController:detailViewController animated:YES];
*/

   
    //----------------------
 
    BiblicalPins *biblicalPin = (BiblicalPins *) view.annotation;
    
    [self.mapView deselectAnnotation:biblicalPin animated:YES];
    
    
    MapDetailViewController *mapDetail = [[self storyboard]
    instantiateViewControllerWithIdentifier:@"MapDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Map"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = biblicalPin.title;

    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    options.size = CGSizeMake(280, 120);
    options.scale = [[UIScreen mainScreen] scale]; // iOS only
    options.region = self.mapView.region;
    options.mapType = MKMapTypeStandard;
    
    MKMapSnapshotter *snapshotter =
    [[MKMapSnapshotter alloc] initWithOptions:options];
    [snapshotter startWithCompletionHandler:^(MKMapSnapshot *snapshot, NSError *e)
     {
     //if (e) ...;// Handle errors
     
     UIImage *image = snapshot.image;
     
     mapDetail.imageView.image = image;
     mapDetail.currentWordDetail = word;
     mapDetail.locationLabel.text = biblicalPin.title;
     mapDetail.locationDescription.text = biblicalPin.information;
     }];
    
   // MKAnnotationView *pin = [[MKPinAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:@""];
    //UIImage *pinImage = pin.image; - - so if you want to capture pins in your snapshot, they must all be drawn manually. OMG - Apple please fix this. 

    
    word.definition = biblicalPin.information;    
    
    //mapDetail.currentWordDetail = word;
    //mapDetail.locationLabel.text = biblicalPin.title;
    //mapDetail.locationDescription.text = biblicalPin.information;
    
    
    //[self.view addSubview:mapDetail.view];
    
    
    
    [self.navigationController pushViewController:mapDetail animated:YES];
  //
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
    
    UIAlertAction* israelAction = [UIAlertAction actionWithTitle:@"Old Testament" style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action)
                                      {
                                      [self.mapView removeAnnotations:self.mapView.annotations];
                                      
                                      BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
                                      jerusalem.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
                                      jerusalem.title = @"Jerusalem";
                                      jerusalem.subtitle = @"The City of David";
                                      jerusalem.information = @"The capital of the Davidic monarchy. According to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rCoordinates: 31.7883, 35.2167";
                                      
                                      BiblicalPins *bethEl = [[BiblicalPins alloc] init];
                                      bethEl.coordinate = CLLocationCoordinate2DMake(31.9300, 35.2200);
                                      bethEl.title = @"Beth-El";
                                      bethEl.subtitle = @"1 Kings 12:28";
                                      
                                      BiblicalPins *dan = [[BiblicalPins alloc] init];
                                      dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
                                      dan.title = @"Dan";
                                      dan.subtitle = @"1 Kings 12: 28";
                                      
                                      BiblicalPins *temple = [[BiblicalPins alloc] init];
                                      temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                      temple.title = @"The Temple Mount";
                                      temple.subtitle = @"1 Kings 6:1";
                                      
                                      BiblicalPins *hazor = [[BiblicalPins alloc] init];
                                      hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
                                      hazor.title = @"Hazor";
                                      hazor.subtitle = @"Joshua 11:10";
                                      
                                      BiblicalPins *jericho = [[BiblicalPins alloc] init];
                                      jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
                                      jericho.title = @"Jericho";
                                      jericho.subtitle = @"Joshua 6";
                                      
                                      BiblicalPins *shiloh = [[BiblicalPins alloc] init];
                                      shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
                                      shiloh.title = @"Shiloh";
                                      shiloh.subtitle = @"Shrine with the Ark of the Covenant";
                                      
                                      BiblicalPins *hebron = [[BiblicalPins alloc] init];
                                      hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
                                      hebron.title = @"Hebron";
                                      hebron.subtitle = @"Ancient Canaanite Site";
                                      
                                      
                                      
                                      
                                      NSArray *annotations = [NSArray arrayWithObjects:jerusalem, dan, bethEl, temple, hazor,jericho, shiloh, hebron, nil];
                                      [self.mapView addAnnotations:annotations];
                                      
                                      MKCoordinateSpan span = MKCoordinateSpanMake(100.0000f,100.0000f);
                                      CLLocationCoordinate2D coordinate = {37.9333, 22.9333};
                                      MKCoordinateRegion region = {coordinate, span};
                                      
                                      MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                      
                                      [self.mapView setRegion:regionThatFits animated:YES];
                                      
                                      }];
    

    UIAlertAction* newTestamentAction = [UIAlertAction actionWithTitle:@"New Testament" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                        [self.mapView removeAnnotations:self.mapView.annotations];
                                   
                                   BiblicalPins *nazareth = [[BiblicalPins alloc] init];
                                   nazareth.coordinate = CLLocationCoordinate2DMake(32.7019, 35.3033);
                                   nazareth.title = @"Nazareth";
                                   nazareth.subtitle = @"Luke 4:16";
                                   
                                   BiblicalPins *capernaum = [[BiblicalPins alloc] init];
                                   capernaum.coordinate = CLLocationCoordinate2DMake(32.8811, 35.5750);
                                   capernaum.title = @"Capernaum";
                                   capernaum.subtitle = @"Fishing village on the Sea of Galilee";
                                   
                                   BiblicalPins *ephesus = [[BiblicalPins alloc] init];
                                   ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
                                   ephesus.title = @"Ephesus";
                                   ephesus.subtitle = @"Ephesians 1:4";
                                   
                                   BiblicalPins *corinth = [[BiblicalPins alloc] init];
                                   corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
                                   corinth.title = @"Corinth";
                                   corinth.subtitle = @"1 Corinthians 1:3";
                                   
                                   BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
                                   thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
                                   thessalonica.title = @"Thessalonica";
                                   thessalonica.subtitle = @"1 & 2 Thessalonians";
                                   
                                   BiblicalPins *philippi = [[BiblicalPins alloc] init];
                                   philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
                                   philippi.title = @"Philippians";
                                   philippi.subtitle = @"Philippians 1:2";
                                   
                                   BiblicalPins *rome = [[BiblicalPins alloc] init];
                                   rome.coordinate = CLLocationCoordinate2DMake(41.9000, 12.5000);
                                   rome.title = @"Rome";
                                   rome.subtitle = @"Romans 1:2 \r\rThe Church of Rome was established in the first century and quickly acquired a reputation for generosity. According to tradition, both Peter and Paul were martyred there during the persecution under Nero.";
                                   
                                   BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
                                   jerusalem.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
                                   jerusalem.title = @"Jerusalem";
                                   jerusalem.subtitle = @"The City of David";
                                   jerusalem.information = @"The capital of the Davidic monarchy. According to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rCoordinates: 31.7883, 35.2167";
                                   
                                   BiblicalPins *colossae = [[BiblicalPins alloc] init];
                                   colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
                                   colossae.title = @"Colossae";
                                   colossae.subtitle = @"Colossians 1:4";
                                   
                                   BiblicalPins *temple = [[BiblicalPins alloc] init];
                                   temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                   temple.title = @"The Temple Mount";
                                   temple.subtitle = @"1 Kings 6:1";
                                   
                                   BiblicalPins *antioch = [[BiblicalPins alloc] init];
                                   antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
                                   antioch.title = @"Antioch";
                                   antioch.subtitle = @"Center of Paul's Missions";
                                   
                                   BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
                                   bethlehem.coordinate = CLLocationCoordinate2DMake(31.7031, 35.1956);
                                   bethlehem.title = @"Bethlehem";
                                   bethlehem.subtitle = @"Traditional birthplace of Jesus";
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects: nazareth, ephesus, corinth, rome, thessalonica, philippi, capernaum, colossae, temple, jerusalem, antioch, bethlehem, nil];
                                   [self.mapView addAnnotations:annotations];
                                   
                                   MKCoordinateSpan span = MKCoordinateSpanMake(100.0000f,100.0000f);
                                   CLLocationCoordinate2D coordinate = {37.9333, 22.9333};
                                   MKCoordinateRegion region = {coordinate, span};
                                   
                                   MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                   
                                   [self.mapView setRegion:regionThatFits animated:YES];
                                   
                                   }];
                                   
                                   
    
    
    
    UIAlertAction* historicalAction = [UIAlertAction actionWithTitle:@"Historical" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                   [self.mapView removeAnnotations:self.mapView.annotations];
                                   
                                   HistoricalPins *nicea = [[HistoricalPins alloc] init];
                                   nicea.coordinate = CLLocationCoordinate2DMake(40.2574, 29.4317);
                                   nicea.title = @"Nicea: Councils I, VII";
                                   nicea.subtitle = @"A.D. 325, 787 \r\rThe first Council of Nicea was called by Constantine. It condemned the teaching of Arius and declared that Christ is ομοουσιους (homoousious) - 'of the same substance' as God. \r\rThe second Council of Nicea approved the veneration of icons.";
                                   
                                   HistoricalPins *alexandria = [[HistoricalPins alloc] init];
                                   alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
                                   alexandria.title = @"Alexandria, Egypt";
                                   alexandria.subtitle = @"Eastern Patriarchate \r\rMajor catechemenical center in early Christianity. \r\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen.";
                                   
                                   HistoricalPins *rome2 = [[HistoricalPins alloc] init];
                                   rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
                                   rome2.title = @"Rome";
                                   rome2.subtitle = @"The Church that 'Presides in Love'.\r\rThe Church of Rome was established in the first century and quickly acquired a reputation for generosity. According to tradition, both Peter and Paul were martyred there during the persecution under Nero.";
                                   
                                   HistoricalPins *constantinople = [[HistoricalPins alloc] init];
                                   constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
                                   constantinople.title = @"Constantinople, Councils II, V";
                                   constantinople.subtitle = @"A.D. 381, 553 \r\rThe 2nd and 5th ecumenical councils confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively.";    
                                   
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects:nicea, alexandria, rome2, constantinople,  nil];
                                   [self.mapView addAnnotations:annotations];
                                   
                                   }];
    
    UIAlertAction* socialAction = [UIAlertAction actionWithTitle:@"Social" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action)
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

                                     
                                     }];
    
    UIAlertAction* allAction = [UIAlertAction actionWithTitle:@"All" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                   [self.mapView removeAnnotations:self.mapView.annotations];
                                   
                                   BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
                                   jerusalem.coordinate = CLLocationCoordinate2DMake(31.7883, 35.2167);
                                   jerusalem.title = @"Jerusalem";
                                   jerusalem.subtitle = @"The City of David";
                                   jerusalem.information = @"The capital of the Davidic monarchy. According to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rCoordinates: 31.7883, 35.2167";
                                   
                                   BiblicalPins *rome = [[BiblicalPins alloc] init];
                                   rome.coordinate = CLLocationCoordinate2DMake(41.9000, 12.5000);
                                   rome.title = @"Rome";
                                   rome.subtitle = @"Romans 1:2.\r\rThe Church of Rome was established in the first century and quickly acquired a reputation for generosity. According to tradition, both Peter and Paul were martyred there during the persecution under Nero.";
                                   
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
                                   temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                   temple.title = @"The Temple Mount";
                                   temple.subtitle = @"1 Kings 6:1";
                                   
                                   BiblicalPins *hazor = [[BiblicalPins alloc] init];
                                   hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
                                   hazor.title = @"Hazor";
                                   hazor.subtitle = @"Joshua 11:10";
                                   
                                   HistoricalPins *nicea = [[HistoricalPins alloc] init];
                                   nicea.coordinate = CLLocationCoordinate2DMake(40.2574, 29.4317);
                                   nicea.title = @"Nicea, Councils I, VII";
                                   nicea.subtitle = @"A.D. 325, 787 \r\rThe first Council of Nicea was called by the Emperor Constantine. It condemned the teaching of Arius and declared that Christ is ομοουσιους (homoousious) - 'of the same substance' as God. \r\rThe second Council of Nicea approved the veneration of icons.";
                                   
                                   SocialPins *greenland = [[SocialPins alloc] init];
                                   greenland.coordinate = CLLocationCoordinate2DMake(72.0000, -40.0000);
                                   greenland.title = @"Greenland";
                                   greenland.subtitle = @"Issue: Accelerated Glacial Melt";
                                   
                                   HistoricalPins *alexandria = [[HistoricalPins alloc] init];
                                   alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
                                   alexandria.title = @"Alexandria, Egypt";
                                   alexandria.subtitle = @"Eastern Patriarchate \r\rMajor catechumenical center in early Christianity. \r\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen.";
                                   
                                   HistoricalPins *rome2 = [[HistoricalPins alloc] init];
                                   rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
                                   rome2.title = @"Rome";
                                   rome2.subtitle = @"The Church that 'Presides in Love'. \r\rThe Church of Rome was established in the first century and quickly acquired a reputation for generosity. According to tradition, both Peter and Paul were martyred there during the persecution under Nero.";
                                   
                                   HistoricalPins *constantinople = [[HistoricalPins alloc] init];
                                   constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
                                   constantinople.title = @"Constantinople, Councils II, V";
                                   constantinople.subtitle = @"A.D. 381, 553 \r\rThe 2nd and 5th ecumenical councils confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively.";
                                   
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
                                   
                                   BiblicalPins *antioch = [[BiblicalPins alloc] init];
                                   antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
                                   antioch.title = @"Antioch";
                                   antioch.subtitle = @"Center of Paul's Missions";
                                   
                                   BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
                                   bethlehem.coordinate = CLLocationCoordinate2DMake(31.7031, 35.1956);
                                   bethlehem.title = @"Bethlehem";
                                   bethlehem.subtitle = @"Traditional birthplace of Jesus";
                                   
                                   BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
                                   thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
                                   thessalonica.title = @"Thessalonica";
                                   thessalonica.subtitle = @"1 & 2 Thessalonians";
                                   
                                   BiblicalPins *philippi = [[BiblicalPins alloc] init];
                                   philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
                                   philippi.title = @"Philippians";
                                   philippi.subtitle = @"Philippians 1:2";


                                   
                                   NSArray *annotations = [NSArray arrayWithObjects:jerusalem, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, rome, nazareth, sierraLeone, camden, atlantic, rome2, constantinople, palestine, israel, alexandria, antioch, bethlehem, thessalonica, philippi, nil];
                                   [self.mapView addAnnotations:annotations];
                                   
                                   MKCoordinateSpan span = MKCoordinateSpanMake(100.0000f,100.0000f);
                                   CLLocationCoordinate2D coordinate = {38.4667, -28.4000};
                                   MKCoordinateRegion region = {coordinate, span};
                                   
                                   MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                   
                                   [self.mapView setRegion:regionThatFits animated:YES];

                                   
                                   }];
                                   
    
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * action)
                                   {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                                   }];
    
    [alert addAction:israelAction];
    [alert addAction:newTestamentAction];
    [alert addAction:historicalAction];
    [alert addAction:socialAction];
    [alert addAction:allAction];
    [alert addAction:cancelAction];
    
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
}
@end
