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
-(void) viewWillAppear:(BOOL)animated
{
    self.originalCamera.altitude = self.mapView.camera.altitude;
    //BiblicalPins *biblicalPin = (BiblicalPins *) self.mapView.annotations;
    [self.mapView setCamera:self.originalCamera animated:YES];
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
    jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
    jerusalem.title = @"Jerusalem";
    jerusalem.subtitle = @"Capital of the Davidic Dynasty";
    jerusalem.image = [UIImage imageNamed:@"jerusalem"];
    jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rFurther Reference:\rWikipedia, “Jerusalem”\rhttp://tinyurl.com/2f662p\r\rCoordinates:\r31.7883, 35.2167";
    
    BiblicalPins *rome = [[BiblicalPins alloc] init];
    rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
    rome.title = @"Rome";
    rome.subtitle = @"Capital of the Roman Empire";
    rome.image = [UIImage imageNamed:@"rome-1"];
    rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. Ignatius of Antioch refers to the Roman church as that which “presides in love”. According to tradition, both Peter and Paul were martyred there during the persecution under Nero in A.D. 64.\r\rFurther Reference:\rWikipedia, “Ancient Rome”\rhttp://tinyurl.com/8wskrCoordinates:\r41.8900, 12.4938";
    
    BiblicalPins *nazareth = [[BiblicalPins alloc] init];
    nazareth.coordinate = CLLocationCoordinate2DMake(32.7000, 35.3040);
    nazareth.title = @"Nazareth";
    nazareth.subtitle = @"Traditional Hometown of Jesus";
    nazareth.image = [UIImage imageNamed:@"nazareth"];
    nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus.\r\rFurther Reference:\rWikipedia, “Nazareth”\r\rCoordinates:\r32.7000, 35.3040";
    
    BiblicalPins *bethEl = [[BiblicalPins alloc] init];
    bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
    bethEl.title = @"Beth-El";
    bethEl.subtitle = @"Canaanite cultic site of El";
    bethEl.image = [UIImage imageNamed:@"bethel"];
    bethEl.information = @"\rBeth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon. In Genesis 32 and 35 it is associated with the Hebrew patriarch Jacob.\r\rFurther Reference:\rWikipeida, “Bethel”\rhttp://tinyurl.com/b5fpuc\r\rCoordinates:\r31.9390, 35.2260";
    
    BiblicalPins *capernaum = [[BiblicalPins alloc] init];
    capernaum.coordinate = CLLocationCoordinate2DMake(32.8811, 35.5750);
    capernaum.title = @"Capernaum";
    capernaum.subtitle = @"Galilean Fishing Village";
    capernaum.image = [UIImage imageNamed:@"synagogue"];
    capernaum.information = @"\rAccording to the Gospel of Matthew, at the beginning of his public ministry, Jesus made his home in and conducting most of his preaching in the neighboring villages around Capernaum. The Synoptic Gospels Peter, Andrew, James, and John as being fisherman from this northern coastal city on the Sea of Galilee.\r\rFurther Reference:\rWikipedia, “Capernaum”\rhttp://tinyurl.com/oldmhj2\r\rCoordinates:\r32.8811, 35.5750";
    
    BiblicalPins *ephesus = [[BiblicalPins alloc] init];
    ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
    ephesus.title = @"Ephesus";
    ephesus.subtitle = @"Roman Provincial Captial of Asia";
    ephesus.image = [UIImage imageNamed:@"ephesus"];
    ephesus.information = @"\rEphesus was the base for Paul's European missionary journeys.\r\rFurther Reference:\rWikipedia, “Ephesus”\rhttp://tinyurl.com/olvyv\r\rCoordinates:\r37.9411, 27.3419";
    
    BiblicalPins *corinth = [[BiblicalPins alloc] init];
    corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
    corinth.title = @"Corinth";
    corinth.subtitle = @"Major Greek Port City";
    corinth.image = [UIImage imageNamed:@"corinth"];
    corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. St. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition.\r\rFurther Reference:\rWikipedia, “Ancient Corinth”\rhttp://tinyurl.com/26hqoex\r\rCoordinates: 37.9333, 22.9333";
    
    BiblicalPins *colossae = [[BiblicalPins alloc] init];
    colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
    colossae.title = @"Colossae";
    colossae.subtitle = @"Greek City in the Lycus Valley";
    colossae.image = [UIImage imageNamed:@"colossae"];
    colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters.\r\rFurther Refernce:\rWikipedia, “Colossae”\rhttp://tinyurl.com/pyz559n\r\rCoordinates:\r37.7878, 29.2615";
    
    BiblicalPins *dan = [[BiblicalPins alloc] init];
    dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
    dan.title = @"Dan";
    dan.image = [UIImage imageNamed:@"dan"];
    dan.subtitle = @"Northern Israelite Cultic Site";
    dan.information = @"\rDan was one of the two sites at which Jeroboam established alternative worship sites for the newly established northern kingdom as described in 1 Kings 12.\r\rFurther Reference:\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520";
    
    BiblicalPins *jericho = [[BiblicalPins alloc] init];
    jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
    jericho.title = @"Jericho";
    jericho.subtitle = @"Walled Canaanite City";
    jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500";

    
    BiblicalPins *temple = [[BiblicalPins alloc] init];
    temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
    temple.title = @"The Temple";
    temple.subtitle = @"The House of YHWH";
    temple.image = [UIImage imageNamed:@"temple"];
    temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great.\r\rFurther Reference:\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354";
    
    BiblicalPins *hazor = [[BiblicalPins alloc] init];
    hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
    hazor.title = @"Hazor";
    hazor.image = [UIImage imageNamed:@"hazor"];
    hazor.subtitle = @"Major Ancient Canaanite City";
    hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai. However, recent archeological findings show that Hazor was destroyed by internal revolt rather than external attack. This is one datum that is explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the “Biblical” category of the Dictionary tab.\r\rFurther Reference:\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669";
    
    BiblicalPins *sepphoris = [[BiblicalPins alloc] init];
    sepphoris.coordinate = CLLocationCoordinate2DMake(32.7529, 35.2795);
    sepphoris.title = @"Sepphoris";
    sepphoris.subtitle = @"Capital of Herod Antipas";
    sepphoris.image = [UIImage imageNamed:@"sepphoris"];
    sepphoris.information = @"\rAlthough it is not mentioned in Scripture, Sepphoris was a major city in Galilee and the captial city of Herod Antipas. It is likely that Jesus of Nazareth worked in or around this city before beginning his prophetic ministry.\r\rFurther Reference:\rWikipedia, “Sepphoris”\rhttp://tinyurl.com/p38eyob\r\rCoordinates:\r32.7529, 35.2795";
    
    HistoricalPins *nicea = [[HistoricalPins alloc] init];
    nicea.coordinate = CLLocationCoordinate2DMake(40.4292, 29.7211);
    nicea.title = @"Nicea";
    nicea.image = [UIImage imageNamed:@"nicea"];
    nicea.subtitle = @"Ecumenical Councils I, VII";
    nicea.information = @"\rThe first Council of Nicea was called by the Emperor Constantine in A.D. 325. It condemned the teaching of Arius and declared that Christ is “of the same substance” (homoousious) as God.\r\rThe second Council of Nicea in A.D. 787 brought an end to the iconoclasm controversy by approving the veneration of icons. See “Homoousios” in the Historical category of the Dictionary tab.\r\rFurther Reference:\rWikipedia\r“First Council of Nicea” http://tinyurl.com/hd8cm\r“Second Council of Nicea” http://tinyurl.com/yf66az\r\rCoordinates:\r40.2574, 29.4317";
    
    SocialPins *greenland = [[SocialPins alloc] init];
    greenland.coordinate = CLLocationCoordinate2DMake(61.2950, -45.0000);
    greenland.title = @"Greenland";
    greenland.subtitle = @"Accelerated Glacial Melting";
    greenland.image = [UIImage imageNamed:@"greenland"];
    greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. \r\rFurther Reference:\rNational Snow & Ice Data Center, “Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000";
    
    
    HistoricalPins *alexandria = [[HistoricalPins alloc] init];
    alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
    alexandria.title = @"Alexandria";
    alexandria.subtitle = @"Eastern Patriarchate";
    alexandria.image = [UIImage imageNamed:@"alexandria"]; 
    alexandria.information = @"\rEastern Patriarchate \r\rMajor catechumenical center in early Christianity. \r\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192";
    
    HistoricalPins *rome2 = [[HistoricalPins alloc] init];
    rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
    rome2.title = @"Church of Rome";
    rome2.subtitle = @"The Apostolic See";
    rome2.image = [UIImage imageNamed:@"vatican"];
    rome2.information = @"\rThe Church of Rome acquired a prominence in the earliest years of the Church, thanks in part, to the martyrdoms of both Peter and Paul in A.D. 64.  The earliest Christian writers testify to its importance. Ignatius of Antioch, Clement of Rome, Irenaeus of Lyon, and others all bear witness to the fact that the Roman church was regarded as a source of unity among all churches. Over time, this view developed into the idea that Peter was the first Bishop of Rome, (the Pope), and subsequent bishops of Rome inherited his Apostolic authority. Later Church teaching would declare that the Bishop of Rome held authority over the whole Church, and his approval was necessary to confirm the proceedings of an Ecumenical Council. The Apostolic See is also the head of Vatican City, the smallest nation on Earth, which was created in 1929 as part of the Lateran Treaty between the Italian government and the Holy See. The Pope is thus also formally recognized as a head of state.\r\rFurther Reference:\rWikipedia, “Holy See”\rhttp://tinyurl.com/fdy54\r\rCoordinates:\r41.9022, 12.4533";
    
    HistoricalPins *constantinople = [[HistoricalPins alloc] init];
    constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
    constantinople.title = @"Constantinople";
    constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
    constantinople.image = [UIImage imageNamed:@"constantinople"];
    constantinople.information = @"\rThe 2nd and 5th Ecumenical Councils of Constantinople, in A.D. 381 and 553, respectively, confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. See “Councils” section in the Home tab.\r\rFurther Reference:\rWikipedia, “First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\rCoordinates:\r41.0122, 28.9760";
    
    SocialPins *sierraLeone = [[SocialPins alloc] init];
    sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
    sierraLeone.title = @"Freetown";
    sierraLeone.subtitle = @"Insufficient Health Care";
    sierraLeone.image = [UIImage imageNamed:@"sierra"];
    sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014. The city's and larger country's health care infrastructure was devastated by the civil war from 1991-2002.\r\rWikipedia, “Sierra Leone”\rhttp://tinyurl.com/m7ql8\r\rCoordinates: 8.4844, -13.2344";
    
    SocialPins *camden = [[SocialPins alloc] init];
    camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
    camden.title = @"Camden, NJ";
    camden.subtitle = @"Issue: Systemic Poverty";
    camden.information = @"\rCoordinates: 39.9400, -75.1050";
    
    SocialPins *atlantic = [[SocialPins alloc] init];
    atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
    atlantic.title = @"The Atlantic Ocean";
    atlantic.subtitle = @"Rising Water Levels";
    atlantic.image = [UIImage imageNamed:@"ocean"]; 
    atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization.\r\rFurther Reference:\rWikipedia, “Atlantic Ocean”\rhttp://tinyurl.com/sea3p\r\rCoordinates: 38.4667, -28.4000";
    
    SocialPins *palestine = [[SocialPins alloc] init];
    palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
    palestine.title = @"Palestine";
    palestine.image = [UIImage imageNamed:@"palestine"];
    palestine.subtitle = @"Occupied Territory";
    palestine.information = @"\rCoordinates: 31.6253, 35.1453";
    
    SocialPins *israel = [[SocialPins alloc] init];
    israel.coordinate = CLLocationCoordinate2DMake(31.0000, 35.0000);
    israel.title = @"Israel";
    israel.subtitle = @"A Contested Homeland";
    israel.image = [UIImage imageNamed:@"israel"];
    israel.information = @"Coordinates: 31.6253, 35.1453";
    
    BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
    thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
    thessalonica.title = @"Thessalonica";
    thessalonica.subtitle = @"Greek Coastal City";
    thessalonica.image = [UIImage imageNamed:@"thessalonica"]; 
    thessalonica.information = @"\rThessalonica was home to one of the earlier Christian communities founded by the Apostle Paul.\r\rCoordinates:\r40.6500, 22.9000";
    
    BiblicalPins *philippi = [[BiblicalPins alloc] init];
    philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
    philippi.title = @"Philippi";
    philippi.subtitle = @"Major Greek City";
    philippi.image = [UIImage imageNamed:@"philippi"];
    philippi.information = @"\rPhilippi was...\r\rCoordinates:\r41.0131, 24.2864";
    
    BiblicalPins *antioch = [[BiblicalPins alloc] init];
    antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
    antioch.title = @"Antioch";
    antioch.subtitle = @"Capital of Ancient Syria";
    antioch.image = [UIImage imageNamed:@"antioch"];
    antioch.information = @"\rCoordinates:\r 36.2000, 36.1500";
    
    BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
    bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
    bethlehem.title = @"Bethlehem";
    bethlehem.image = [UIImage imageNamed:@"bethlehem"]; 
    bethlehem.subtitle = @"Traditional Birthplace of Jesus";
    bethlehem.information = @"\rCoordinates:\r31.7031, 35.1956";
    
    BiblicalPins *ramah = [[BiblicalPins alloc] init];
    ramah.coordinate = CLLocationCoordinate2DMake(32.936389, 35.367222);
    ramah.title = @"Ramah";
    
    BiblicalPins *hebron = [[BiblicalPins alloc] init];
    hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
    hebron.title = @"Hebron";
    hebron.subtitle = @"David's Judahite Capital";
    hebron.image = [UIImage imageNamed:@"hebron"];
    
    BiblicalPins *shiloh = [[BiblicalPins alloc] init];
    shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
    shiloh.title = @"Shiloh";
    shiloh.subtitle = @"Shrine of the Ark of the Covenant";
    shiloh.image = [UIImage imageNamed:@"shiloh"];
    
    HistoricalPins *lyon = [[HistoricalPins alloc] init];
    lyon.coordinate = CLLocationCoordinate2DMake(45.7600, 4.8400);
    lyon.title = @"Lyon";
    lyon.subtitle = @"Ecumenical Council XIII";
    lyon.image = [UIImage imageNamed:@"lyon"]; 
    lyon.information = @"\rCoordinates:\r45.7600, 4.8400";
    
    HistoricalPins *vienne = [[HistoricalPins alloc] init];
    vienne.coordinate = CLLocationCoordinate2DMake(46.5000, 0.5000);
    vienne.title = @"Vienne";
    vienne.subtitle = @"Ecumenical Council XV";
    vienne.image = [UIImage imageNamed:@"vienne"]; 
    vienne.information = @"\rCoordinates:\r46.5000, 0.5000";
    
    HistoricalPins *chalcedon = [[HistoricalPins alloc] init];
    chalcedon.coordinate = CLLocationCoordinate2DMake(40.9833, 29.0333);
    chalcedon.title = @"Chalcedon";
    chalcedon.subtitle = @"Ecumencial Council IV";
    chalcedon.image = [UIImage imageNamed:@"chalcedon"];
    chalcedon.information = @"Coordinates:\r40.9833, 29.0333";
    
    HistoricalPins *constance = [[HistoricalPins alloc] init];
    constance.coordinate = CLLocationCoordinate2DMake(47.6633, 9.1769);
    constance.title = @"Constance";
    constance.subtitle = @"Ecumenical Council XVI";
    constance.image = [UIImage imageNamed:@"constance"];
    constance.information = @"Coordinates:\r47.6633° N, 9.1769° E";
    
    HistoricalPins *trent = [[HistoricalPins alloc] init];
    trent.coordinate = CLLocationCoordinate2DMake(46.0667, 11.1167);
    trent.title = @"Trent";
    trent.subtitle = @"Ecumenical Council XIX";
    trent.image = [UIImage imageNamed:@"trent"];
    trent.information = @"Coordinates:\r46.0667° N, 11.1167° E";
    
    HistoricalPins *florence = [[HistoricalPins alloc] init];
    florence.coordinate = CLLocationCoordinate2DMake(43.7833, 11.2500);
    florence.title = @"Florence";
    florence.subtitle = @"Ecumenical Council XVII";
    florence.image = [UIImage imageNamed:@"florence"]; 
    florence.information = @"Coordinates:\r43.7833° N, 11.2500° E";
    
    HistoricalPins *lateran = [[HistoricalPins alloc] init];
    lateran.coordinate = CLLocationCoordinate2DMake(41.885906, 12.506156);
    lateran.title = @"St. John Lateran";
    lateran.subtitle = @"Ecumenical Councils IX, X, XI, XII";
    lateran.image = [UIImage imageNamed:@"lateran"]; 
    lateran.information = @"Coordinates:\r43.7833° N, 11.2500° E";
    
    SocialPins *uganda = [[SocialPins alloc] init];
    uganda.coordinate = CLLocationCoordinate2DMake(1.0667, 31.8833);
    uganda.title = @"Uganda";
    uganda.subtitle = @"Tribal Warfare & Water Scarcity";
    uganda.image = [UIImage imageNamed:@"uganda"];
    uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev";


    
    NSArray *annotations = [NSArray arrayWithObjects:jerusalem, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, rome, nazareth, capernaum, sierraLeone, camden, atlantic, rome2, constantinople, palestine, israel, alexandria, thessalonica, philippi, antioch, bethlehem, ramah, hebron, shiloh, lyon, vienne, chalcedon, constance, trent, florence, lateran, uganda, colossae, sepphoris, nil];
    
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
    
    
    //--------------------This was Jim's original solution for a Map detail view----------------------------
/*
    BiblicalPins *biblicalPin = (BiblicalPins *) view.annotation;
    
    [self.mapView deselectAnnotation:biblicalPin animated:YES];

    
    
        WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Map"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = biblicalPin.title;
    word.definition = biblicalPin.information;
    word.twitterDef = biblicalPin.subtitle; 
    
    detailViewController.currentWordDetail = word;

    
    [self.navigationController pushViewController:detailViewController animated:YES];
*/

 

    //----------------------  This implementation uses MKMapSnapshotter--------------------------------------------------
 
    BiblicalPins *biblicalPin = (BiblicalPins *) view.annotation;
    
    [self.mapView deselectAnnotation:biblicalPin animated:YES];
    
    
    MapDetailViewController *mapDetail = [[self storyboard]
    instantiateViewControllerWithIdentifier:@"MapDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Maps"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = biblicalPin.title;
    word.definition = biblicalPin.information;
    word.twitterDef = biblicalPin.subtitle;
    word.image = biblicalPin.image;
    
    mapDetail.currentWordDetail = word; 
    /*
    MKMapCamera  *myCamera = [MKMapCamera
                              cameraLookingAtCenterCoordinate:biblicalPin.coordinate
                                            fromEyeCoordinate:biblicalPin.coordinate
                                            eyeAltitude:2000];
    
    mapView.camera = myCamera;
    
    MKMapSnapshotOptions *options = [[MKMapSnapshotOptions alloc] init];
    options.size = CGSizeMake(320, 90);
    //options.camera = myCamera;
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
     */
    //mapDetail.imageView.image = biblicalPin.image;
    //mapDetail.currentWordDetail = word;
    //mapDetail.locationLabel.text = biblicalPin.title;
    //mapDetail.locationDescription.text = biblicalPin.information;
    
    [self.navigationController pushViewController:mapDetail animated:YES];
}

    //------------------A solution without a MKMapSnapShotter that just sets the label and textView properties on the MapDetailVC goes here-------------------------------------

/*
BiblicalPins *biblicalPin = (BiblicalPins *) view.annotation;

[self.mapView deselectAnnotation:biblicalPin animated:YES];



WordDetailViewController *MapDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"MapDetailViewController"];

UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Map"
                                                               style:UIBarButtonItemStylePlain target:nil action:nil];
self.navigationItem.backBarButtonItem = backButton;

Word *word = [[Word alloc] init];
word.name = biblicalPin.title;
word.definition = biblicalPin.information;
word.twitterDef = biblicalPin.subtitle;

MapDetailViewController.currentWordDetail = word;


[self.navigationController pushViewController:MapDetailViewController animated:YES];


*/



  //




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
                                      jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
                                      jerusalem.title = @"Jerusalem";
                                      jerusalem.subtitle = @"Capital of the Davidic Dynasty";
                                      jerusalem.image = [UIImage imageNamed:@"jerusalem"];
                                      jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rCoordinates:\r31.7883, 35.2167";
                                      
                                      BiblicalPins *bethEl = [[BiblicalPins alloc] init];
                                      bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
                                      bethEl.title = @"Beth-El";
                                      bethEl.subtitle = @"Canaanite cultic site of El";
                                      bethEl.image = [UIImage imageNamed:@"bethel"];
                                      bethEl.information = @"\rBeth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon. In Genesis 32 and 35 it is associated with the Hebrew patriarch Jacob.\r\rFurther Reference:\rWikipeida, “Bethel”\rhttp://tinyurl.com/b5fpuc\r\rCoordinates:\r31.9390, 35.2260";
                                      
                                          BiblicalPins *dan = [[BiblicalPins alloc] init];
                                          dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
                                          dan.title = @"Dan";
                                          dan.image = [UIImage imageNamed:@"dan"];
                                          dan.subtitle = @"Northern Israelite Cultic Site";
                                          dan.information = @"\rDan was one of the two sites at which Jeroboam established alternative worship sites for the newly established northern kingdom as described in 1 Kings 12.\r\rFurther Reference:\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520";
                                      
                                      BiblicalPins *temple = [[BiblicalPins alloc] init];
                                      temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                      temple.title = @"The Temple";
                                      temple.subtitle = @"The House of YHWH";
                                      temple.image = [UIImage imageNamed:@"temple"];
                                      temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great.\r\rFurther Reference:\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354";
                                      
                                      BiblicalPins *hazor = [[BiblicalPins alloc] init];
                                      hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
                                      hazor.title = @"Hazor";
                                      hazor.image = [UIImage imageNamed:@"hazor"];
                                      hazor.subtitle = @"Major Ancient Canaanite City";
                                      hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai. However, recent archeological findings show that Hazor was destroyed by internal revolt rather than external attack. This is one datum that is explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the “Biblical” category of the Dictionary tab.\r\rFurther Reference:\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669";
                                      
                                      BiblicalPins *jericho = [[BiblicalPins alloc] init];
                                      jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
                                      jericho.title = @"Jericho";
                                      jericho.subtitle = @"Walled Canaanite City";
                                      jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500";
                                      
                                      BiblicalPins *shiloh = [[BiblicalPins alloc] init];
                                      shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
                                      shiloh.title = @"Shiloh";
                                      shiloh.subtitle = @"Shrine of the Ark of the Covenant";
                                      shiloh.image = [UIImage imageNamed:@"shiloh"];

                                      
                                      BiblicalPins *hebron = [[BiblicalPins alloc] init];
                                      hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
                                      hebron.title = @"Hebron";
                                      hebron.subtitle = @"David's Judahite Capital";
                                      hebron.image = [UIImage imageNamed:@"hebron"];

                                      
                                      
                                      
                                      
                                      NSArray *annotations = [NSArray arrayWithObjects:jerusalem, dan, bethEl, temple, hazor,jericho, shiloh, hebron, nil];
                                      [self.mapView addAnnotations:annotations];
                                      
                                      MKCoordinateSpan span = MKCoordinateSpanMake(03.0000f,03.0000f);
                                      CLLocationCoordinate2D coordinate = {32.0556, 35.2895};
                                      MKCoordinateRegion region = {coordinate, span};
                                      
                                      MKCoordinateRegion regionThatFits = [self.mapView regionThatFits:region];
                                      
                                      [self.mapView setRegion:regionThatFits animated:YES];
                                      
                                      }];
    

    UIAlertAction* newTestamentAction = [UIAlertAction actionWithTitle:@"New Testament" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                        [self.mapView removeAnnotations:self.mapView.annotations];
                                   
                                   BiblicalPins *nazareth = [[BiblicalPins alloc] init];
                                   nazareth.coordinate = CLLocationCoordinate2DMake(32.7000, 35.3040);
                                   nazareth.title = @"Nazareth";
                                   nazareth.subtitle = @"Traditional Hometown of Jesus";
                                   nazareth.image = [UIImage imageNamed:@"nazareth"];
                                   nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus.\r\rFurther Reference:\rWikipedia, “Nazareth”\r\rCoordinates:\r32.7000, 35.3040";
                                   
                                   BiblicalPins *capernaum = [[BiblicalPins alloc] init];
                                   capernaum.coordinate = CLLocationCoordinate2DMake(32.8811, 35.5750);
                                   capernaum.title = @"Capernaum";
                                   capernaum.subtitle = @"Galilean Fishing Village";
                                   capernaum.image = [UIImage imageNamed:@"synagogue"];
                                   capernaum.information = @"\rAccording to the Gospel of Matthew, at the beginning of his public ministry, Jesus made his home in and conducting most of his preaching in the neighboring villages around Capernaum. The Synoptic Gospels Peter, Andrew, James, and John as being fisherman from this northern coastal city on the Sea of Galilee.\r\rFurther Reference:\rWikipedia, “Capernaum”\rhttp://tinyurl.com/oldmhj2\r\rCoordinates:\r32.8811, 35.5750";
                                   
                                   BiblicalPins *ephesus = [[BiblicalPins alloc] init];
                                   ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
                                   ephesus.title = @"Ephesus";
                                   ephesus.subtitle = @"Roman Provincial Captial of Asia";
                                   ephesus.image = [UIImage imageNamed:@"ephesus"];
                                   ephesus.information = @"\rEphesus was the base for Paul's European missionary journeys.\r\rFurther Reference:\rWikipedia, “Ephesus”\rhttp://tinyurl.com/olvyv\r\rCoordinates:\r37.9411, 27.3419";

                                   
                                   BiblicalPins *corinth = [[BiblicalPins alloc] init];
                                   corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
                                   corinth.title = @"Corinth";
                                   corinth.subtitle = @"Major Greek Port City";
                                   corinth.image = [UIImage imageNamed:@"corinth"];
                                   corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. St. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition.\r\rFurther Reference:\rWikipedia, “Ancient Corinth”\rhttp://tinyurl.com/26hqoex\r\rCoordinates: 37.9333, 22.9333";
                                   
                                   BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
                                   thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
                                   thessalonica.title = @"Thessalonica";
                                   thessalonica.subtitle = @"Greek Coastal City";
                                   thessalonica.image = [UIImage imageNamed:@"thessalonica"];
                                   thessalonica.information = @"\rThessalonica was home to one of the earlier Christian communities founded by the Apostle Paul.\r\rCoordinates:\r40.6500, 22.9000";
                                   
                                   BiblicalPins *philippi = [[BiblicalPins alloc] init];
                                   philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
                                   philippi.title = @"Philippi";
                                   philippi.subtitle = @"Major Greek City";
                                   philippi.image = [UIImage imageNamed:@"philippi"];

                                   
                                   BiblicalPins *rome = [[BiblicalPins alloc] init];
                                   rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
                                   rome.title = @"Rome";
                                   rome.subtitle = @"Capital of the Roman Empire";
                                   rome.image = [UIImage imageNamed:@"rome-1"];
                                   rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. Ignatius of Antioch refers to the Roman church as that which “presides in love”. According to tradition, both Peter and Paul were martyred there during the persecution under Nero in A.D. 64.\r\rFurther Reference:\rWikipedia, “Ancient Rome”\rhttp://tinyurl.com/8wskrCoordinates:\r41.8900, 12.4938";
                                   
                                   BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
                                   jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
                                   jerusalem.title = @"Jerusalem";
                                   jerusalem.subtitle = @"Capital of the Davidic Dynasty";
                                   jerusalem.image = [UIImage imageNamed:@"jerusalem"];
                                   jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rCoordinates:\r31.7883, 35.2167";

                                   
                                       BiblicalPins *colossae = [[BiblicalPins alloc] init];
                                       colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
                                       colossae.title = @"Colossae";
                                       colossae.subtitle = @"Greek City in the Lycus Valley";
                                       colossae.image = [UIImage imageNamed:@"colossae"];
                                       colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters.\r\rFurther Refernce:\rWikipedia, “Colossae”\rhttp://tinyurl.com/pyz559n\r\rCoordinates:\r37.7878, 29.2615";

                                   
                                   BiblicalPins *temple = [[BiblicalPins alloc] init];
                                   temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                   temple.title = @"The Temple Mount";
                                   temple.subtitle = @"The House of YHWH";
                                   temple.image = [UIImage imageNamed:@"temple"];
                                   temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great.\r\rCoordinates:\r31.7780, 35.2354";
                                   
                                   BiblicalPins *antioch = [[BiblicalPins alloc] init];
                                   antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
                                   antioch.title = @"Antioch";
                                   antioch.subtitle = @"Center of Paul's Missions";
                                   antioch.image = [UIImage imageNamed:@"antioch"];

                                   
                                   BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
                                   bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
                                   bethlehem.title = @"Bethlehem";
                                   bethlehem.image = [UIImage imageNamed:@"bethlehem"];
                                   bethlehem.subtitle = @"Traditional Birthplace of Jesus";
                                   bethlehem.information = @"\rCoordinates:\r31.7031, 35.1956";
                                       
                                       BiblicalPins *sepphoris = [[BiblicalPins alloc] init];
                                       sepphoris.coordinate = CLLocationCoordinate2DMake(32.7529, 35.2795);
                                       sepphoris.title = @"Sepphoris";
                                       sepphoris.subtitle = @"Capital of Herod Antipas";
                                       sepphoris.image = [UIImage imageNamed:@"sepphoris"];
                                       sepphoris.information = @"\rAlthough it is not mentioned in Scripture, Sepphoris was a major city in Galilee and the captial city of Herod Antipas. It is likely that Jesus of Nazareth worked in or around this city before beginning his prophetic ministry.\r\rFurther Reference:\rWikipedia, “Sepphoris”\rhttp://tinyurl.com/p38eyob\r\rCoordinates:\r32.7529, 35.2795";
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects: nazareth, ephesus, corinth, rome, thessalonica, philippi, capernaum, colossae, temple, jerusalem, antioch, bethlehem, sepphoris, nil];
                                   [self.mapView addAnnotations:annotations];
                                   
                                   MKCoordinateSpan span = MKCoordinateSpanMake(40.0000f,40.0000f);
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
                                   nicea.coordinate = CLLocationCoordinate2DMake(40.4292, 29.7211);
                                   nicea.title = @"Nicea";
                                   nicea.image = [UIImage imageNamed:@"nicea"];
                                   nicea.subtitle = @"Ecumenical Councils I, VII";
                                   nicea.information = @"\rThe first Council of Nicea was called by the Emperor Constantine in A.D. 325. It condemned the teaching of Arius and declared that Christ is “of the same substance” (homoousious) as God.\r\rThe second Council of Nicea in A.D. 787 brought an end to the iconoclasm controversy by approving the veneration of icons. See “Homoousios” in the Historical category of the Dictionary tab.\r\rFurther Reference:\rWikipedia\r“First Council of Nicea” http://tinyurl.com/hd8cm\r“Second Council of Nicea” http://tinyurl.com/yf66az\r\rCoordinates:\r40.2574, 29.4317";
                                   
                                       HistoricalPins *alexandria = [[HistoricalPins alloc] init];
                                       alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
                                       alexandria.title = @"Alexandria";
                                       alexandria.subtitle = @"Eastern Patriarchate";
                                       alexandria.image = [UIImage imageNamed:@"alexandria"];
                                       alexandria.information = @"\rEastern Patriarchate \r\rMajor catechumenical center in early Christianity. \r\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192";
                                   
                                       HistoricalPins *rome2 = [[HistoricalPins alloc] init];
                                       rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
                                       rome2.title = @"Church of Rome";
                                       rome2.subtitle = @"The Apostolic See";
                                       rome2.image = [UIImage imageNamed:@"vatican"];
                                       rome2.information = @"\rThe Church of Rome acquired a prominence in the earliest years of the Church, thanks in part, to the martyrdoms of both Peter and Paul in A.D. 64.  The earliest Christian writers testify to its importance. Ignatius of Antioch, Clement of Rome, Irenaeus of Lyon, and others all bear witness to the fact that the Roman church was regarded as a source of unity among all churches. Over time, this view developed into the idea that Peter was the first Bishop of Rome, (the Pope), and subsequent bishops of Rome inherited his Apostolic authority. Later Church teaching would declare that the Bishop of Rome held authority over the whole Church, and his approval was necessary to confirm the proceedings of an Ecumenical Council. The Apostolic See is also the head of Vatican City, the smallest nation on Earth, which was created in 1929 as part of the Lateran Treaty between the Italian government and the Holy See. The Pope is thus also formally recognized as a head of state.\r\rFurther Reference:\rWikipedia, “Holy See”\rhttp://tinyurl.com/fdy54\r\rCoordinates:\r41.9022, 12.4533";
                                   
                                   HistoricalPins *constantinople = [[HistoricalPins alloc] init];
                                   constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
                                   constantinople.title = @"Constantinople";
                                   constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
                                   constantinople.image = [UIImage imageNamed:@"constantinople"];
                                   constantinople.information = @"\rA.D. 381, 553 \r\rThe 2nd and 5th Ecumenical Councils of Constantinople confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. See “Councils” section in the Home tab.\r\rFurther Reference:\rWikipedia, “First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\rCoordinates:\r41.0122, 28.9760";
                             
                                   
                                   HistoricalPins *lyon = [[HistoricalPins alloc] init];
                                   lyon.coordinate = CLLocationCoordinate2DMake(45.7600, 4.8400);
                                   lyon.title = @"Lyon";
                                   lyon.subtitle = @"Ecumenical Council XIII";
                                   lyon.image = [UIImage imageNamed:@"lyon"];
                                   lyon.information = @"\rCoordinates:\r45.7600, 4.8400";
                                   
                                   HistoricalPins *vienne = [[HistoricalPins alloc] init];
                                   vienne.coordinate = CLLocationCoordinate2DMake(46.5000, 0.5000);
                                   vienne.title = @"Vienne";
                                   vienne.subtitle = @"Ecumenical Council XV";
                                   vienne.image = [UIImage imageNamed:@"vienne"];
                                   vienne.information = @"\rCoordinates:\r46.5000, 0.5000";
                                   
                                   HistoricalPins *chalcedon = [[HistoricalPins alloc] init];
                                   chalcedon.coordinate = CLLocationCoordinate2DMake(40.9833, 29.0333);
                                   chalcedon.title = @"Chalcedon";
                                   chalcedon.subtitle = @"Ecumencial Council IV";
                                   chalcedon.image = [UIImage imageNamed:@"chalcedon"];

                                   chalcedon.information = @"Coordinates:\r40.9833, 29.0333";
                                   
                                   HistoricalPins *constance = [[HistoricalPins alloc] init];
                                   constance.coordinate = CLLocationCoordinate2DMake(47.6633, 9.1769);
                                   constance.title = @"Constance";
                                   constance.subtitle = @"Ecumenical Council XVI";
                                   constance.image = [UIImage imageNamed:@"constance"];

                                   constance.information = @"Coordinates:\r47.6633° N, 9.1769° E";
                                   
                                   HistoricalPins *trent = [[HistoricalPins alloc] init];
                                   trent.coordinate = CLLocationCoordinate2DMake(46.0667, 11.1167);
                                   trent.title = @"Trent";
                                   trent.subtitle = @"Ecumenical Council XIX";
                                   trent.image = [UIImage imageNamed:@"trent"];
                                   trent.information = @"Coordinates:\r46.0667° N, 11.1167° E";
                                   
                                   HistoricalPins *florence = [[HistoricalPins alloc] init];
                                   florence.coordinate = CLLocationCoordinate2DMake(43.7833, 11.2500);
                                   florence.title = @"Florence";
                                   florence.subtitle = @"Ecumenical Council XVII";
                                   florence.image = [UIImage imageNamed:@"florence"]; 
                                   florence.information = @"Coordinates:\r43.7833° N, 11.2500° E";
                                   
                                   HistoricalPins *lateran = [[HistoricalPins alloc] init];
                                   lateran.coordinate = CLLocationCoordinate2DMake(41.885906, 12.506156);
                                   lateran.title = @"St. John Lateran";
                                   lateran.subtitle = @"Ecumenical Councils IX, X, XI, XII";
                                   lateran.image = [UIImage imageNamed:@"lateran"];
                                   lateran.information = @"Coordinates:\r43.7833° N, 11.2500° E";


                                   
                                   
                                   
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects:nicea, alexandria, rome2, constantinople, lyon, vienne, chalcedon, constance, trent, florence,lateran, nil];
                                   [self.mapView addAnnotations:annotations];
                                   
                                   }];
    
    UIAlertAction* socialAction = [UIAlertAction actionWithTitle:@"Social" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action)
                                     {
                                     [self.mapView removeAnnotations:self.mapView.annotations];
                                     
                                     SocialPins *greenland = [[SocialPins alloc] init];
                                     greenland.coordinate = CLLocationCoordinate2DMake(61.2950, -45.0000);
                                     greenland.title = @"Greenland";
                                     greenland.subtitle = @"Accelerated Glacial Melting";
                                     greenland.image = [UIImage imageNamed:@"greenland"];
                                     greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. \r\rFurther Reference:\rNational Snow & Ice Data Center, “Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000";

                                     
                                         SocialPins *sierraLeone = [[SocialPins alloc] init];
                                         sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
                                         sierraLeone.title = @"Freetown";
                                         sierraLeone.subtitle = @"Insufficient Health Care";
                                         sierraLeone.image = [UIImage imageNamed:@"sierra"];
                                         sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014. The city's and larger country's health care infrastructure was devastated by the civil war from 1991-2002.\r\rWikipedia, “Sierra Leone”\rhttp://tinyurl.com/m7ql8\r\rCoordinates: 8.4844, -13.2344";

                                     
                                     SocialPins *camden = [[SocialPins alloc] init];
                                     camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
                                     camden.title = @"Camden, NJ";
                                     camden.subtitle = @"Issue: Systemic Poverty";
                                     
                                         SocialPins *atlantic = [[SocialPins alloc] init];
                                         atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
                                         atlantic.title = @"The Atlantic Ocean";
                                         atlantic.subtitle = @"Rising Water Levels";
                                         atlantic.image = [UIImage imageNamed:@"ocean"];
                                         atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization.\r\rFurther Reference:\rWikipedia, “Atlantic Ocean”\rhttp://tinyurl.com/sea3p\r\rCoordinates: 38.4667, -28.4000";
                                     
                                     SocialPins *palestine = [[SocialPins alloc] init];
                                     palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
                                     palestine.title = @"Palestine";
                                     palestine.image = [UIImage imageNamed:@"palestine"];
                                     palestine.subtitle = @"Occupied Territory";
                                     
                                     SocialPins *israel = [[SocialPins alloc] init];
                                     israel.coordinate = CLLocationCoordinate2DMake(31.0000, 35.0000);
                                     israel.title = @"Israel";
                                     israel.subtitle = @"A Contested Homeland";
                                     israel.image = [UIImage imageNamed:@"israel"];

                                     
                                     SocialPins *uganda = [[SocialPins alloc] init];
                                     uganda.coordinate = CLLocationCoordinate2DMake(1.0667, 31.8833);
                                     uganda.title = @"Uganda";
                                     uganda.subtitle = @"Tribal Warfare & Water Scarcity";
                                     uganda.image = [UIImage imageNamed:@"uganda"];
                                     uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev";
                                     
                                     
                                     NSArray *annotations = [NSArray arrayWithObjects:greenland, sierraLeone, camden, atlantic, palestine, israel, uganda, nil];
                                     [self.mapView addAnnotations:annotations];

                                     
                                     }];
    
    UIAlertAction* allAction = [UIAlertAction actionWithTitle:@"All" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                   [self.mapView removeAnnotations:self.mapView.annotations];
                                   
                                   BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
                                   jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
                                   jerusalem.title = @"Jerusalem";
                                   jerusalem.subtitle = @"Capital of the Davidic Dynasty";
                                   jerusalem.image = [UIImage imageNamed:@"jerusalem"];
                                   jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rCoordinates:\r31.7883, 35.2167";
                                   
                                   BiblicalPins *rome = [[BiblicalPins alloc] init];
                                   rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
                                   rome.title = @"Rome";
                                   rome.subtitle = @"Capital of the Roman Empire";
                                   rome.image = [UIImage imageNamed:@"rome-1"];
                                   rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. Ignatius of Antioch refers to the Roman church as that which “presides in love”. According to tradition, both Peter and Paul were martyred there during the persecution under Nero in A.D. 64.\r\rFurther Reference:\rWikipedia, “Ancient Rome”\rhttp://tinyurl.com/8wskrCoordinates:\r41.8900, 12.4938";
                                   
                                   BiblicalPins *nazareth = [[BiblicalPins alloc] init];
                                   nazareth.coordinate = CLLocationCoordinate2DMake(32.7000, 35.3040);
                                   nazareth.title = @"Nazareth";
                                   nazareth.subtitle = @"Traditional Hometown of Jesus";
                                   nazareth.image = [UIImage imageNamed:@"nazareth"];
                                   nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus.\r\rFurther Reference:\rWikipedia, “Nazareth”\r\rCoordinates:\r32.7000, 35.3040";
                                   
                                   BiblicalPins *bethEl = [[BiblicalPins alloc] init];
                                   bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
                                   bethEl.title = @"Beth-El";
                                   bethEl.subtitle = @"Canaanite cultic site of El";
                                   bethEl.image = [UIImage imageNamed:@"bethel"];
                                   bethEl.information = @"\rBeth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon. In Genesis 32 and 35 it is associated with the Hebrew patriarch Jacob.\r\rFurther Reference:\rWikipeida, “Bethel”\rhttp://tinyurl.com/b5fpuc\r\rCoordinates:\r31.9390, 35.2260";
                                   
                                   BiblicalPins *capernaum = [[BiblicalPins alloc] init];
                                   capernaum.coordinate = CLLocationCoordinate2DMake(32.8811, 35.5750);
                                   capernaum.title = @"Capernaum";
                                   capernaum.subtitle = @"Galilean Fishing Village";
                                   capernaum.image = [UIImage imageNamed:@"synagogue"];
                                   capernaum.information = @"\rAccording to the Gospel of Matthew, at the beginning of his public ministry, Jesus made his home in and conducting most of his preaching in the neighboring villages around Capernaum. The Synoptic Gospels Peter, Andrew, James, and John as being fisherman from this northern coastal city on the Sea of Galilee.\r\rFurther Reference:\rWikipedia, “Capernaum”\rhttp://tinyurl.com/oldmhj2\r\rCoordinates:\r32.8811, 35.5750";
                                   
                                   BiblicalPins *ephesus = [[BiblicalPins alloc] init];
                                   ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
                                   ephesus.title = @"Ephesus";
                                   ephesus.subtitle = @"Roman Provincial Captial of Asia";
                                   ephesus.image = [UIImage imageNamed:@"ephesus"];
                                   ephesus.information = @"\rEphesus was the base for Paul's European missionary journeys.\r\rFurther Reference:\rWikipedia, “Ephesus”\rhttp://tinyurl.com/olvyv\r\rCoordinates:\r37.9411, 27.3419";
                                   
                                   BiblicalPins *corinth = [[BiblicalPins alloc] init];
                                   corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
                                   corinth.title = @"Corinth";
                                   corinth.subtitle = @"Major Greek Port City";
                                   corinth.image = [UIImage imageNamed:@"corinth"];
                                   corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. St. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition.\r\rFurther Reference:\rWikipedia, “Ancient Corinth”\rhttp://tinyurl.com/26hqoex\r\rCoordinates: 37.9333, 22.9333";
                                   
                                       BiblicalPins *dan = [[BiblicalPins alloc] init];
                                       dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
                                       dan.title = @"Dan";
                                       dan.image = [UIImage imageNamed:@"dan"];
                                       dan.subtitle = @"Northern Israelite Cultic Site";
                                       dan.information = @"\rDan was one of the two sites at which Jeroboam established alternative worship sites for the newly established northern kingdom as described in 1 Kings 12.\r\rFurther Reference:\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520";
                                   
                                   BiblicalPins *jericho = [[BiblicalPins alloc] init];
                                   jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
                                   jericho.title = @"Jericho";
                                   jericho.subtitle = @"Walled Canaanite City";
                                   jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500";
                                   
                                   
                                   BiblicalPins *temple = [[BiblicalPins alloc] init];
                                   temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                   temple.title = @"The Temple";
                                   temple.subtitle = @"The House of YHWH";
                                   temple.image = [UIImage imageNamed:@"temple"];
                                   temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great.\r\rFurther Reference:\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354";
                                   
                                   BiblicalPins *hazor = [[BiblicalPins alloc] init];
                                   hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
                                   hazor.title = @"Hazor";
                                   hazor.image = [UIImage imageNamed:@"hazor"];
                                   hazor.subtitle = @"Major Ancient Canaanite City";
                                   hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai. However, recent archeological findings show that Hazor was destroyed by internal revolt rather than external attack. This is one datum that is explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the “Biblical” category of the Dictionary tab.\r\rFurther Reference:\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669";
                                   
                                   HistoricalPins *nicea = [[HistoricalPins alloc] init];
                                   nicea.coordinate = CLLocationCoordinate2DMake(40.4292, 29.7211);
                                   nicea.title = @"Nicea";
                                   nicea.image = [UIImage imageNamed:@"nicea"];
                                   nicea.subtitle = @"Ecumenical Councils I, VII";
                                   nicea.information = @"\rThe first Council of Nicea was called by the Emperor Constantine in A.D. 325. It condemned the teaching of Arius and declared that Christ is “of the same substance” (homoousious) as God.\r\rThe second Council of Nicea in A.D. 787 brought an end to the iconoclasm controversy by approving the veneration of icons. See “Homoousios” in the Historical category of the Dictionary tab.\r\rFurther Reference:\rWikipedia\r“First Council of Nicea” http://tinyurl.com/hd8cm\r“Second Council of Nicea” http://tinyurl.com/yf66az\r\rCoordinates:\r40.2574, 29.4317";
                                   
                                   SocialPins *greenland = [[SocialPins alloc] init];
                                   greenland.coordinate = CLLocationCoordinate2DMake(61.2950, -45.0000);
                                   greenland.title = @"Greenland";
                                   greenland.subtitle = @"Accelerated Glacial Melting";
                                   greenland.image = [UIImage imageNamed:@"greenland"];
                                   greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. \r\rFurther Reference:\rNational Snow & Ice Data Center, “Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000";
                                   
                                       HistoricalPins *alexandria = [[HistoricalPins alloc] init];
                                       alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
                                       alexandria.title = @"Alexandria";
                                       alexandria.subtitle = @"Eastern Patriarchate";
                                       alexandria.image = [UIImage imageNamed:@"alexandria"];
                                       alexandria.information = @"\rEastern Patriarchate \r\rMajor catechumenical center in early Christianity. \r\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192";
                                   
                                       HistoricalPins *rome2 = [[HistoricalPins alloc] init];
                                       rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
                                       rome2.title = @"Church of Rome";
                                       rome2.subtitle = @"The Apostolic See";
                                       rome2.image = [UIImage imageNamed:@"vatican"];
                                       rome2.information = @"\rThe Church of Rome acquired a prominence in the earliest years of the Church, thanks in part, to the martyrdoms of both Peter and Paul in A.D. 64.  The earliest Christian writers testify to its importance. Ignatius of Antioch, Clement of Rome, Irenaeus of Lyon, and others all bear witness to the fact that the Roman church was regarded as a source of unity among all churches. Over time, this view developed into the idea that Peter was the first Bishop of Rome, (the Pope), and subsequent bishops of Rome inherited his Apostolic authority. Later Church teaching would declare that the Bishop of Rome held authority over the whole Church, and his approval was necessary to confirm the proceedings of an Ecumenical Council. The Apostolic See is also the head of Vatican City, the smallest nation on Earth, which was created in 1929 as part of the Lateran Treaty between the Italian government and the Holy See. The Pope is thus also formally recognized as a head of state.\r\rFurther Reference:\rWikipedia, “Holy See”\rhttp://tinyurl.com/fdy54\r\rCoordinates:\r41.9022, 12.4533";
                                   
                                   HistoricalPins *constantinople = [[HistoricalPins alloc] init];
                                   constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
                                   constantinople.title = @"Constantinople";
                                   constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
                                   constantinople.image = [UIImage imageNamed:@"constantinople"];
                                   constantinople.information = @"\rA.D. 381, 553 \r\rThe 2nd and 5th Ecumenical Councils of Constantinople confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. See “Councils” section in the Home tab.\r\rFurther Reference:\rWikipedia\r“First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\rCoordinates:\r41.0122, 28.9760";

                                   
                                   SocialPins *sierraLeone = [[SocialPins alloc] init];
                                   sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
                                   sierraLeone.title = @"Freetown";
                                   sierraLeone.subtitle = @"Insufficient Health Care";
                                   sierraLeone.image = [UIImage imageNamed:@"sierra"];

                                   sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014.\r\rCoordinates: 8.4844, -13.2344";
                                   
                                   SocialPins *camden = [[SocialPins alloc] init];
                                   camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
                                   camden.title = @"Camden, NJ";
                                   camden.subtitle = @"Issue: Systemic Poverty";
                                   camden.information = @"\rCoordinates: 39.9400, -75.1050";
                                   
                                       SocialPins *atlantic = [[SocialPins alloc] init];
                                       atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
                                       atlantic.title = @"The Atlantic Ocean";
                                       atlantic.subtitle = @"Rising Water Levels";
                                       atlantic.image = [UIImage imageNamed:@"ocean"];
                                       atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization.\r\rFurther Reference:\rWikipedia, “Atlantic Ocean”\rhttp://tinyurl.com/sea3p\r\rCoordinates: 38.4667, -28.4000";
                                   
                                   SocialPins *palestine = [[SocialPins alloc] init];
                                   palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
                                   palestine.title = @"Palestine";
                                   palestine.subtitle = @"Occupied Territory";
                                   palestine.image = [UIImage imageNamed:@"palestine"];
                                   palestine.information = @"\rCoordinates: 31.6253, 35.1453";
                                   
                                   SocialPins *israel = [[SocialPins alloc] init];
                                   israel.coordinate = CLLocationCoordinate2DMake(31.0000, 35.0000);
                                   israel.title = @"Israel";
                                   israel.subtitle = @"A Contested Homeland";
                                   israel.image = [UIImage imageNamed:@"israel"];
                                   israel.information = @"\rCoordinates: 31.6253, 35.1453";
                                   
                                   BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
                                   thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
                                   thessalonica.title = @"Thessalonica";
                                   thessalonica.subtitle = @"Greek Coastal City";
                                   thessalonica.image = [UIImage imageNamed:@"thessalonica"]; 
                                   thessalonica.information = @"\rThessalonica was home to one of the earlier Christian communities founded by the Apostle Paul.\r\rCoordinates:\r40.6500, 22.9000";
                                       
                                       BiblicalPins *sepphoris = [[BiblicalPins alloc] init];
                                       sepphoris.coordinate = CLLocationCoordinate2DMake(32.7529, 35.2795);
                                       sepphoris.title = @"Sepphoris";
                                       sepphoris.subtitle = @"Capital of Herod Antipas";
                                       sepphoris.image = [UIImage imageNamed:@"sepphoris"];
                                       sepphoris.information = @"\rAlthough it is not mentioned in Scripture, Sepphoris was a major city in Galilee and the captial city of Herod Antipas. It is likely that Jesus of Nazareth worked in or around this city before beginning his prophetic ministry.\r\rFurther Reference:\rWikipedia, “Sepphoris”\rhttp://tinyurl.com/p38eyob\r\rCoordinates:\r32.7529, 35.2795";
                                   
                                   BiblicalPins *philippi = [[BiblicalPins alloc] init];
                                   philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
                                   philippi.title = @"Philippi";
                                   philippi.subtitle = @"Major Greek City";
                                   philippi.image = [UIImage imageNamed:@"philippi"];

                                   philippi.information = @"\rPhilippi was...\r\rCoordinates:\r41.0131, 24.2864";
                                   
                                   BiblicalPins *antioch = [[BiblicalPins alloc] init];
                                   antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
                                   antioch.title = @"Antioch";
                                   antioch.subtitle = @"Capital of Ancient Syria";
                                   antioch.image = [UIImage imageNamed:@"antioch"];

                                   antioch.information = @"\rCoordinates:\r 36.2000, 36.1500";
                                   
                                       BiblicalPins *colossae = [[BiblicalPins alloc] init];
                                       colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
                                       colossae.title = @"Colossae";
                                       colossae.subtitle = @"Greek City in the Lycus Valley";
                                       colossae.image = [UIImage imageNamed:@"colossae"];
                                       colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters.\r\rFurther Refernce:\rWikipedia, “Colossae”\rhttp://tinyurl.com/pyz559n\r\rCoordinates:\r37.7878, 29.2615";
                                   
                                   BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
                                   bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
                                   bethlehem.title = @"Bethlehem";
                                   bethlehem.image = [UIImage imageNamed:@"bethlehem"]; 
                                   bethlehem.subtitle = @"Traditional Birthplace of Jesus";
                                   bethlehem.information = @"\rCoordinates:\r31.7031, 35.1956";
                                   
                                   BiblicalPins *ramah = [[BiblicalPins alloc] init];
                                   ramah.coordinate = CLLocationCoordinate2DMake(32.936389, 35.367222);
                                   ramah.title = @"Ramah";
                                   
                                   BiblicalPins *hebron = [[BiblicalPins alloc] init];
                                   hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
                                   hebron.title = @"Hebron";
                                   hebron.subtitle = @"David's Judahite Capital";
                                   hebron.image = [UIImage imageNamed:@"hebron"];

                                   
                                   BiblicalPins *shiloh = [[BiblicalPins alloc] init];
                                   shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
                                   shiloh.title = @"Shiloh";
                                   shiloh.subtitle = @"Shrine of the Ark of the Covenant";
                                   shiloh.image = [UIImage imageNamed:@"shiloh"];

                                   
                                   HistoricalPins *lyon = [[HistoricalPins alloc] init];
                                   lyon.coordinate = CLLocationCoordinate2DMake(45.7600, 4.8400);
                                   lyon.title = @"Lyon";
                                   lyon.subtitle = @"Ecumenical Council XIII";
                                   lyon.image = [UIImage imageNamed:@"lyon"];
                                   lyon.information = @"\rCoordinates:\r45.7600, 4.8400";
                                   
                                   HistoricalPins *vienne = [[HistoricalPins alloc] init];
                                   vienne.coordinate = CLLocationCoordinate2DMake(46.5000, 0.5000);
                                   vienne.title = @"Vienne";
                                   vienne.subtitle = @"Ecumenical Council XV";
                                   vienne.image = [UIImage imageNamed:@"vienne"];
                                   vienne.information = @"\rCoordinates:\r46.5000, 0.5000";
                                   
                                   HistoricalPins *chalcedon = [[HistoricalPins alloc] init];
                                   chalcedon.coordinate = CLLocationCoordinate2DMake(40.9833, 29.0333);
                                   chalcedon.title = @"Chalcedon";
                                   chalcedon.subtitle = @"Ecumencial Council IV";
                                   chalcedon.image = [UIImage imageNamed:@"chalcedon"];
                                   chalcedon.information = @"Coordinates:\r40.9833, 29.0333";
                                   
                                   HistoricalPins *constance = [[HistoricalPins alloc] init];
                                   constance.coordinate = CLLocationCoordinate2DMake(47.6633, 9.1769);
                                   constance.title = @"Constance";
                                   constance.subtitle = @"Ecumenical Council XVI";
                                   constance.image = [UIImage imageNamed:@"constance"];
                                   constance.information = @"Coordinates:\r47.6633° N, 9.1769° E";
                                   
                                   HistoricalPins *trent = [[HistoricalPins alloc] init];
                                   trent.coordinate = CLLocationCoordinate2DMake(46.0667, 11.1167);
                                   trent.title = @"Trent";
                                   trent.subtitle = @"Ecumenical Council XIX";
                                   trent.image = [UIImage imageNamed:@"trent"];
                                   trent.information = @"Coordinates:\r46.0667° N, 11.1167° E";
                                   
                                   HistoricalPins *florence = [[HistoricalPins alloc] init];
                                   florence.coordinate = CLLocationCoordinate2DMake(43.7833, 11.2500);
                                   florence.title = @"Florence";
                                   florence.subtitle = @"Ecumenical Council XVII";
                                   florence.image = [UIImage imageNamed:@"florence"];
                                   florence.information = @"Coordinates:\r43.7833° N, 11.2500° E";
                                   
                                   HistoricalPins *lateran = [[HistoricalPins alloc] init];
                                   lateran.coordinate = CLLocationCoordinate2DMake(41.885906, 12.506156);
                                   lateran.title = @"St. John Lateran";
                                   lateran.subtitle = @"Ecumenical Councils IX, X, XI, XII";
                                   lateran.image = [UIImage imageNamed:@"lateran"];
                                   lateran.information = @"Coordinates:\r43.7833° N, 11.2500° E";
                                   
                                   SocialPins *uganda = [[SocialPins alloc] init];
                                   uganda.coordinate = CLLocationCoordinate2DMake(1.0667, 31.8833);
                                   uganda.title = @"Uganda";
                                   uganda.subtitle = @"Tribal Warfare & Water Scarcity";
                                   uganda.image = [UIImage imageNamed:@"uganda"];
                                   uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev";
                                   


                                   
                                   NSArray *annotations = [NSArray arrayWithObjects:jerusalem, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, rome, nazareth, sierraLeone, camden, atlantic, rome2, constantinople, palestine, israel, alexandria, antioch, bethlehem, thessalonica, philippi, vienne, lyon, chalcedon, constance, trent, florence, uganda, lateran, colossae, sepphoris, nil];
                                   
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
