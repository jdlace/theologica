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
    
    BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
    jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
    jerusalem.title = @"Jerusalem";
    jerusalem.subtitle = @"Capital of the Davidic Dynasty";
    jerusalem.image = [UIImage imageNamed:@"jerusalem"];
    jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Judges 1:8 gives portrays a violent capture of the city by the sons of Judah. David eventually brought the Ark to Jerusalem from Keraith Jearim. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rFurther Reference:\rBiblical Archology Society, “Jerusalem”\rhttp://tinyurl.com/okx3c8r\r\rCoordinates:\r31.7883, 35.2167\r\r\r";
    
    BiblicalPins *gehenna = [[BiblicalPins alloc] init];
    gehenna.coordinate = CLLocationCoordinate2DMake(31.768406, 35.230439);
    gehenna.title = @"Gehenna";
    gehenna.subtitle = @"the Valley of Ben-Hinnom";
    gehenna.image = [UIImage imageNamed:@"gehenna"];
    gehenna.information = @"\rGehenna was a valley, south of Jerusalem, where apostate Israelites would sacrifice their infants by burning them alive to worship the god Molech. 2 Kings 23 describes King Josiah destroying the shrine as part of his larger Deuteronomic Reform:\r\r10“The king also defiled Topheth in the Valley of Ben-hinnom, so that there would no longer be any immolation of sons or daughters by fire in honor of Molech.”\r\rLater, in Second Temple Judaism, it came to regarded as representative and a shorthand for everything evil and worthy of YHWH's punishment; a metonym for “hell”. This is the location and concept which Jesus mentions several times in the Synoptic Gospels. See “Second Temple Judaism”, “Synoptic Gospels” in the Dictionary tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 1034\rhttp://tinyurl.com/k3f2f8p\r\rNew American Bible Revised Edition\r2 Kings 23\rhttp://tinyurl.com/pkdkn5n\r\rCoordinates: 31.768406, 35.230439\r\r\r";
    
    BiblicalPins *rome = [[BiblicalPins alloc] init];
    rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
    rome.title = @"Rome";
    rome.subtitle = @"Capital of the Roman Empire";
    rome.image = [UIImage imageNamed:@"rome-1"];
    rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. St. Paul wrote a letter to the Roman church towards the end of his missionary career. It is famous for laying out his thesis of righteousness through faith in Jesus Christ apart from the Law:\r\r“But now the righteousness of God has been manifested apart from the law, though testified to by the law and the prophets, the righteousness of God through faith in Jesus Christ for all who believe. For there is no distinction; all have sinned and are deprived of the glory of God. They are justified freely by his grace through the redemption in Christ Jesus, whom God set forth as an expiation, through faith, by his blood, to prove his righteousness because of the forgiveness of sins previously committed, through the forbearance of God—to prove his righteousness in the present time, that he might be righteous and justify the one who has faith in Jesus.”\r-Romans 3:21-26\r\rAccording to tradition, Sts. Peter and Paul were martyred there during the persecution under the Emperor Nero in A.D. 64. The Roman historian Tacitus recounts the circumstances of the arrests:\r\r“Consequently, to get rid of the report, Nero fastened the guilt and inflicted the most exquisite tortures on a class hated for their abominations, called Christians by the populace. Christus, from whom the name had its origin, suffered the extreme penalty during the reign of Tiberius at the hands of one of our procurators, Pontius Pilatus, and a most mischievous superstition, thus checked for the moment, again broke out not only in Judæa, the first source of the evil, but even in Rome, where all things hideous and shameful from every part of the world find their centre and become popular. Accordingly, an arrest was first made of all who pleaded guilty; then, upon their information, an immense multitude was convicted, not so much of the crime of firing the city, as of hatred against mankind. Mockery of every sort was added to their deaths. Covered with the skins of beasts, they were torn by dogs and perished, or were nailed to crosses, or were doomed to the flames and burnt, to serve as a nightly illumination, when daylight had expired.”\r-Annals, 15.44\r\rFurther Reference:\rNew American Bible Revised Edition\rRomans 3, http://tinyurl.com/ponhbaj\r\rTacitus, Annals Book XV\rhttp://tinyurl.com/nbwlrkw\r\rCoordinates:\r41.8900, 12.4938\r\r\r";
    
    BiblicalPins *nazareth = [[BiblicalPins alloc] init];
    nazareth.coordinate = CLLocationCoordinate2DMake(32.7000, 35.3040);
    nazareth.title = @"Nazareth";
    nazareth.subtitle = @"Traditional Hometown of Jesus";
    nazareth.image = [UIImage imageNamed:@"nazareth"];
    nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus (Acts 24:5).\r\rFurther Reference:\rPope John Paul II, Jubliee Pilgramage Homily on the Annunciation\rhttp://tinyurl.com/p4sjg9p\r\rWikipedia, “Nazareth”\rhttp://tinyurl.com/jojq76x\r\rCoordinates:\r32.7000, 35.3040\r\r\r";
    
    BiblicalPins *bethEl = [[BiblicalPins alloc] init];
    bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
    bethEl.title = @"Beth-El";
    bethEl.subtitle = @"Southern Israelite Cultic Site";
    bethEl.image = [UIImage imageNamed:@"bethel"];
    bethEl.information = @"\rMeaning “House of God”, Beth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon prior to the emergence of Israel. In Genesis 28 it is associated with the Hebrew patriarch Jacob:\r\r“When Jacob awoke from his sleep, he said, 'Truly, the Lord is in this place and I did not know it!' He was afraid and said: 'How awesome this place is! This is nothing else but the house of God, the gateway to heaven!' Early the next morning Jacob took the stone that he had put under his head, set it up as a sacred pillar, and poured oil on top of it. He named that place Beth-El, whereas the former name of the town had been Luz.”\r-Genesis 28: 16-19\r\rLater in 1 Kings, Bethel becomes one of two alternative worship sites established by King Jeroboam of the Northern Kingdom:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Bethel, the other in Dan. This led to sin, because the people frequented these calves in Bethel and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r-1 Kings 12: 28-31\r\rArcheologist Israel Finkelstein claims that its pottery evidence suggests that Beth-El was actually deserted during the reign of Jeroboam I:\r\r“Bethel is the other site mentioned in 1 Kgs 12:29 as a cult place that was erected by Jeroboam I. The mound at the village of Beitin east of Ramallah, the location of biblical Bethel, was thoroughly excavated in the 1930s and 1950s. A comprehensive investigation of the finds from this dig, stored in Jerusalem and Pittsburgh, also cast doubt on the historicity of this verse. This investigation revealed that most of the Iron IIA pottery types known from sites in the vicinity, for example, Stratum 14 in the City of David in Jerusalem, are rare or absent at Bethel and that there are no diagnostic early Iron IIA items at the site (Finkelstein and Singer-Avitz 2009). In other words, Bethel, too, produced no clear indication of activity in the time of Jeroboam I.”\r-Finkelstein, 74\r\rSee “Dan”.\r\rFurther Reference:\rNew American Bible Revised Edition\rGenesis 28, http://tinyurl.com/joct23k\r\r1 Kings 12, http://tinyurl.com/qhd4nug\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rCoordinates:\r31.9390, 35.2260\r\r\r";
    
    BiblicalPins *capernaum = [[BiblicalPins alloc] init];
    capernaum.coordinate = CLLocationCoordinate2DMake(32.8811, 35.5750);
    capernaum.title = @"Capernaum";
    capernaum.subtitle = @"Galilean Fishing Village";
    capernaum.image = [UIImage imageNamed:@"synagogue"];
    capernaum.information = @"\rAccording to the Gospel of Matthew, at the beginning of his public ministry, Jesus made his home in and conducted most of his preaching in the neighboring villages around Capernaum in the northern region of Galilee. The Synoptic Gospels Peter, Andrew, James, and John as being fisherman from this northern coastal city on the Sea of Galilee.\r\rFurther Reference:\rFelix Just, S.J., “The Galilee”\rhttp://tinyurl.com/z8dgcz8\r\rWikipedia, “Capernaum”\rhttp://tinyurl.com/oldmhj2\r\rCoordinates:\r32.8811, 35.5750\r\r\r";
    
    BiblicalPins *ephesus = [[BiblicalPins alloc] init];
    ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
    ephesus.title = @"Ephesus";
    ephesus.subtitle = @"Roman Provincial Captial of Asia";
    ephesus.image = [UIImage imageNamed:@"ephesus"];
    ephesus.information = @"\rEphesus was the base for St. Paul's European missionary journeys. A letter in his name is addressed to the Ephesians, although many scholars believe it was originally intended as a general letter since some early manuscripts omit the phrase “who are in Ephesus”. It is counted among the so-called disputed letters of St. Paul. It is noted for its appeal to unity:\r\r“I, then, a prisoner for the Lord, urge you to live in a manner worthy of the call you have received, with all humility and gentleness, with patience, bearing with one another through love, striving to preserve the unity of the spirit through the bond of peace: one body and one Spirit, as you were also called to the one hope of your call; one Lord, one faith, one baptism; one God and Father of all, who is over all and through all and in all.”\r-Ephesians 4: 1-6\r\rFurther Reference:\rNew American Bible Revised Edition\rEphesians 4, http://tinyurl.com/pfgw3mg\r\rCoordinates:\r37.9411, 27.3419\r\r\r";
    
    BiblicalPins *corinth = [[BiblicalPins alloc] init];
    corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
    corinth.title = @"Corinth";
    corinth.subtitle = @"Major Greek Port City";
    corinth.image = [UIImage imageNamed:@"corinth"];
    corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. The 2nd century Greek writer Pausanius gives a detailed description of Corinth in Book II of his 'Description of Greece':\r\r“Worth seeing here are a theater and a white-marble race-course. Within the sanctuary of the god stand on the one side portrait statues of athletes who have won victories at the Isthmian games, on the other side pine trees growing in a row, the greater number of them rising up straight. On the temple, which is not very large, stand bronze Tritons. In the fore-temple are images, two of Poseidon, a third of Amphitrite, and a Sea, which also is of bronze. The offerings inside were dedicated in our time by Herodes the Athenian, four horses, gilded except for the hoofs, which are of ivory..There is also an ancient sanctuary called the altar of the Cyclopes, and they sacrifice to the Cyclopes upon it.”\r-Description, 2.1.7-2.2.1\r\rSt. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition. In 1 Corinthians, St. Paul addresses both reports he has heard about the Corinthian church as well as a list of written questions presented to him via couriers. 1 Corinthians is famous for displaying St. Paul's ability to respond to new situations with Gospel-inspired principles. His instruction regarding food sacrificed to idols is illuminated in the context of Pausanius's description of Corinthian temples:\r\r“Now in regard to meat sacrificed to idols: we realize that 'all of us have knowledge'; knowledge inflates with pride, but love builds up. If anyone supposes he knows something, he does not yet know as he ought to know. But if one loves God, one is known by him. So about the eating of meat sacrificed to idols: we know that 'there is no idol in the world,' and that 'there is no God but one.' Indeed, even though there are so-called gods in heaven and on earth (there are, to be sure, many 'gods' and many 'lords'), yet for us there is one God, the Father, from whom all things are and for whom we exist, and one Lord, Jesus Christ, through whom all things are and through whom we exist.\r\rBut not all have this knowledge. There are some who have been so used to idolatry up until now that, when they eat meat sacrificed to idols, their conscience, which is weak, is defiled. Now food will not bring us closer to God. We are no worse off if we do not eat, nor are we better off if we do. But make sure that this liberty of yours in no way becomes a stumbling block to the weak. If someone sees you, with your knowledge, reclining at table in the temple of an idol, may not his conscience too, weak as it is, be 'built up' to eat the meat sacrificed to idols? Thus through your knowledge, the weak person is brought to destruction, the brother for whom Christ died. When you sin in this way against your brothers and wound their consciences, weak as they are, you are sinning against Christ. Therefore, if food causes my brother to sin, I will never eat meat again, so that I may not cause my brother to sin.”\r-1 Corinthians 8\r\rFurther Reference:\rPausanius, “Description of Greece”\rhttp://tinyurl.com/q6lxdl7\r\rNew American Bible Revised Edition\r1 Corinthians 8, http://tinyurl.com/qa83h5s\r\rCoordinates: 37.9333, 22.9333\r\r\r";
    
    BiblicalPins *colossae = [[BiblicalPins alloc] init];
    colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
    colossae.title = @"Colossae";
    colossae.subtitle = @"Greek City in the Lycus Valley";
    colossae.image = [UIImage imageNamed:@"colossae"];
    colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters. Like Philippians, it contains an early Christian hymn:\r\r“He is the image of the invisible God, the firstborn of all creation. For in him were created all things in heaven and on earth, the visible and the invisible, whether thrones or dominions or principalities or powers; all things were created through him and for him. He is before all things, and in him all things hold together. He is the head of the body, the church. He is the beginning, the firstborn from the dead, that in all things he himself might be preeminent. For in him all the fullness was pleased to dwell, and through him to reconcile all things for him, making peace by the blood of his cross [through him], whether those on earth or those in heaven.”\r-Colossians 1: 15-20\r\rFurther Refernce:\rNew American Bible Revised Edition\rColossians, http://tinyurl.com/qe6h9ur\r\rCoordinates:\r37.7878, 29.2615\r\r\r";
    
    BiblicalPins *dan = [[BiblicalPins alloc] init];
    dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
    dan.title = @"Dan";
    dan.image = [UIImage imageNamed:@"dan"];
    dan.subtitle = @"Northern Israelite Cultic Site";
    dan.information = @"\rAccording to 1 Kings 12, Dan becomes one of two alternative worship sites established by King Jeroboam I of the Northern Kingdom of Israel:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Beth-El, the other in Dan. This led to sin, because the people frequented these calves in Beth-El and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r-1 Kings 12: 28-31\r\rHowever, according to some archeologists, its pottery evidence suggest that Dan:\r\r-was destroyed by the end of late Iron Age I\r-was deserted during the time of Jeroboam I\r-was rebuilt by Hazael in the late 9th century B.C.\r-became Israelite for the first time around 800 B.C.\r\rIsrael Finkelstein claims:\r\r“...the evidence from Dan does not support the tradition about Jeroboam I at Dan... it means that the tradition about the erection of the bamah [altar] at Dan is a retrojection into the past of a reality from the days of Jeroboam II, in the first half of the eighth century B.C.E.”\r-Finkelstein, 74\r\rDan is also the site (known as “Tel-Dan”) where one of the most significant archeological finds was discovered by Avraham Biran in 1993; an inscription that referred to the “House of David”. According to the Biblical Archeological Society (BAS):\r\r“Avraham Biran and his team of archaeologists found a remarkable inscription from the ninth century B.C.E. that refers both to the 'House of David' and to the 'King of Israel.' This is the first time that the name David has been found in any ancient inscription outside the Bible. That the inscription refers not simply to a 'David' but to the House of David, the dynasty of the great Israelite king, is even more remarkable. 'King of Israel' is a term frequently found in the Bible, especially in the Book of Kings. This, however, may be the oldest extrabiblical reference to Israel in Semitic script. If this inscription proves anything, it shows that both Israel and Judah, contrary to the claims of some scholarly Biblical minimizers, were important kingdoms at this time.”\r-BAS, 33\r\rSee “Beth-El”.\r\rFurther Reference:\rNew American Bible Revised Edition\r1 Kings 12, http://tinyurl.com/qhd4nug\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rBiblical Archeological Society, “Top Ten Biblical Archeological Discoveries”\rhttp://tinyurl.com/goqp9qf\r\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520\r\r\r";
    
    BiblicalPins *jericho = [[BiblicalPins alloc] init];
    jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
    jericho.title = @"Jericho";
    jericho.subtitle = @"Walled Canaanite City";
    jericho.image = [UIImage imageNamed:@"jericho"];
    jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500\r\r\r";

    
    BiblicalPins *temple = [[BiblicalPins alloc] init];
    temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
    temple.title = @"The Temple";
    temple.subtitle = @"The House of Yahweh";
    temple.image = [UIImage imageNamed:@"temple"];
    temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great before being destroyed again by the Roman army in A.D. 70.\r\rFurther Reference:\rNOVA, “Recreating the Temple” (video)\rhttp://tinyurl.com/jr83lcj\r\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
    
    BiblicalPins *hazor = [[BiblicalPins alloc] init];
    hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
    hazor.title = @"Hazor";
    hazor.image = [UIImage imageNamed:@"hazor"];
    hazor.subtitle = @"Major Ancient Canaanite City";
    hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai:\r\r“At that time Joshua, turning back, captured Hazor and struck down its king with the sword; for Hazor formerly was the chief of all those kingdoms. He also struck down with the sword every person there, carrying out the ban, till none was left alive. Hazor itself he burned.”\r-Joshua 11: 10-11\r\rHowever, according to the book of Judges, Hazor was still standing and a functional monarchy:\r\r“So the LORD sold them into the power of the Canaanite king, Jabin, who reigned in Hazor. The general of his army was Sisera, who lived in Harosheth-ha-goiim.”\r-Judges 4: 2\r\rIn addition to this discrepancy, recent archeological findings show that Hazor was destroyed in the late 13th century while Jericho and Ai were destroyed in 1500 B.C. and 2200 B.C., respectively. These findings further show Hazor was destoryed by internal revolt rather than external attack. These data are best explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the the Dictionary tab.\r\rFurther Reference:\rNew American Bible Revised Edition, Joshua 11\rhttp://tinyurl.com/z65778q\r\rJudges 4\rhttp://tinyurl.com/hf82n48\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”, pg. 21\rhttp://tinyurl.com/gnjmjwa\r\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669\r\r\r";
    
    BiblicalPins *sepphoris = [[BiblicalPins alloc] init];
    sepphoris.coordinate = CLLocationCoordinate2DMake(32.7529, 35.2795);
    sepphoris.title = @"Sepphoris";
    sepphoris.subtitle = @"Capital of Herod Antipas";
    sepphoris.image = [UIImage imageNamed:@"sepphoris"];
    sepphoris.information = @"\rAlthough it is not mentioned in Scripture, Sepphoris was a major city in Galilee and the captial city of Herod Antipas. It is likely that Jesus of Nazareth worked in or around this city before beginning his prophetic ministry.\r\rFurther Reference:\rWikipedia, “Sepphoris”\rhttp://tinyurl.com/p38eyob\r\rCoordinates:\r32.7529, 35.2795\r\r\r";
    
    HistoricalPins *nicea = [[HistoricalPins alloc] init];
    nicea.coordinate = CLLocationCoordinate2DMake(40.4292, 29.7211);
    nicea.title = @"Nicea";
    nicea.image = [UIImage imageNamed:@"nicea"];
    nicea.subtitle = @"Ecumenical Councils I, VII";
    nicea.information = @"\rThe first Council of Nicea was called by the Emperor Constantine in A.D. 325. It condemned the teaching of Arius and declared that Christ is “of the same substance” (homoousious) as God.\r\rThe second Council of Nicea in A.D. 787 brought an end to the iconoclasm controversy by approving the veneration of icons. See the Councils section of the Overview tab. See “Homoousios” in the Historical category of the Dictionary tab.\r\rFurther Reference:\rWikipedia\r“First Council of Nicea” http://tinyurl.com/hd8cm\r“Second Council of Nicea” http://tinyurl.com/yf66az\r\rCoordinates:\r40.2574, 29.4317\r\r\r";
    
    SocialPins *greenland = [[SocialPins alloc] init];
    greenland.coordinate = CLLocationCoordinate2DMake(61.2950, -45.0000);
    greenland.title = @"Greenland";
    greenland.subtitle = @"Accelerated Glacial Melting";
    greenland.image = [UIImage imageNamed:@"greenland"];
    greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. Glacial melt intensifies global warming by releasing increased amounts of previously trapped carbon into the atmosphere. Pope Francis has identified the risk to glaciers from climate change by stating:\r\r“Warming has effects on the carbon cycle. It creates a vicious circle which aggravates the situation even more, affecting the availability of essential resources like drinking water, energy and agricultural production in warmer regions, and leading to the extinction of part of the planet’s biodiversity. The melting in the polar ice caps and in high altitude plains can lead to the dangerous release of methane gas, while the decomposition of frozen organic material can further increase the emission of carbon dioxide. Things are made worse by the loss of tropical forests which would otherwise help to mitigate climate change. Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas.”\r-Laudato Si, 24\r\rFurther Reference:\rPope Francis, “Laudato Si'”\rhttp://tinyurl.com/o6sowft\r\rCatholic Climate Movement\rhttp://tinyurl.com/lxe52t7\r\rNational Snow & Ice Data Center\r“Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000\r\r\r";
    
    SocialPins *greatbr = [[SocialPins alloc] init];
    greatbr.coordinate = CLLocationCoordinate2DMake(-18.2861, 147.7000);
    greatbr.title = @"Great Barrier Reef";
    greatbr.subtitle = @"Threatened Coral Ecosystem";
    greatbr.image = [UIImage imageNamed:@"barrier"];
    greatbr.information = @"\rAustralia's Great Barrier Reef is the world's largest coral ecosystem. Climate change is putting many elements of the reef under threat. Pope Francis emphasized the importance of safeguarding coral reef systems when he stated:\r\r“In tropical and subtropical seas, we find coral reefs comparable to the great forests on dry land, for they shelter approximately a million species, including fish, crabs, molluscs, sponges and algae. Many of the world’s coral reefs are already barren or in a state of constant decline. ‘Who turned the wonderworld of the seas into underwater cemeteries bereft of colour and life?’ This phenomenon is due largely to pollution which reaches the sea as the result of deforestation, agricultural monocultures, industrial waste and destructive fishing methods, especially those using cyanide and dynamite. It is aggravated by the rise in temperature of the oceans. All of this helps us to see that every intervention in nature can have consequences which are not immediately evident, and that certain ways of exploiting resources prove costly in terms of degradation which ultimately reaches the ocean bed itself.”\r-Laudato Si, 41\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rCatholic Bishops of Queensland, “Pastoral Letter on the Great Barrier Reef”\rhttp://tinyurl.com/one2fma\r\rCatholic Care Australia\rhttp://catholicearthcare.org.au\r\rCoordinates:\r18.2861, 147.7000\r\r\r";
    
    
    HistoricalPins *alexandria = [[HistoricalPins alloc] init];
    alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
    alexandria.title = @"Alexandria";
    alexandria.subtitle = @"Eastern Patriarchate";
    alexandria.image = [UIImage imageNamed:@"alexandria"];
    alexandria.information = @"\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen and Clement of Alexandira. It was known for its highly allegorical hermeneutical method in contrast with that of Antioch. It later became one of 5 major centers of Christianity in the 4th century in the canons of the Nicene Council.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192\r\r\r";
    
    HistoricalPins *vatican = [[HistoricalPins alloc] init];
    vatican.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
    vatican.title = @"The Vatican";
    vatican.subtitle = @"Ecumenical Councils XX, XXI";
    vatican.image = [UIImage imageNamed:@"vatican"];
    vatican.information = @"\rThe First Vatican Council was convoked by Pope Pius IX and held session from 1868-1870. It's major themes were the condemnation of so-called “Modernism” and the definition of the nature of the Church, especially as it relates to the Papacy. In the context of this second point was the doctrine of Papal Infallibility. Vatican I only approved two dogmatic constitutions: the Dogmatic Constitution on the Catholic Faith and the Dogmatic Consititution on the Church of Christ. This latter constitution was the subject of some contention among the assembled bishops. The relevant text reads:\r\r“...we teach and define as a divinely revealed dogma that when the Roman pontiff speaks ex cathedra, that is, when, in the exercise of his office as shepherd and teacher of all Christians, in virtue of his supreme apostolic authority, he defines a doctrine concerning faith or morals to be held by the whole church, he possesses, by the divine assistance promised to him in blessed Peter, that infallibility which the divine Redeemer willed his church to enjoy in defining doctrine concerning faith or morals. Therefore, such definitions of the Roman pontiff are of themselves, and not by the consent of the church, irreformable.”\r-Vatican I, Pastor Aeternus, 9\r\rThe Second Vatican Council was convoked by Pope John XXIII and held session from 1962-1965. A major theme of the council was “aggiornomento”, or the updating of the Church in order to communicate the gospel more effectively to the 20th century. Among the changes introduced at Vatican II were the restoration of the liturgy in the vernacular and the the celebrant turned to face the congregation during the Eucharist. The council also acknowledged the profound scientific, technological, and other social changes that had occured:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis....The recent studies and findings of science, history and philosophy raise new questions which effect life and which demand new theological investigations. Furthermore, theologians, within the requirements and methods proper to theology, are invited to seek continually for more suitable ways of communicating doctrine to the men of their times; for the deposit of Faith or the truths are one thing and the manner in which they are enunciated, in the same meaning and understanding, is another.”\r-Vatican II, Gaudium et Spes, 5, 62.\r\rSee “Councils” in the Overview tab. See “Aggiornomento”, “Liturgy”, “Modernism” in the Dictionary tab.\r\rFurther Reference:\rDecrees and Canons of Vatican I\rhttp://tinyurl.com/zvdqu9u\r\rDocuments of Vatican II\rhttp://tinyurl.com/jmaxecg\r\rCoordinates:\r41.9022, 12.4533\r\r\r";
    
    HistoricalPins *constantinople = [[HistoricalPins alloc] init];
    constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
    constantinople.title = @"Constantinople";
    constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
    constantinople.image = [UIImage imageNamed:@"constantinople"];
    constantinople.information = @"\rThe 2nd and 5th Ecumenical Councils in A.D. 381 and 553, respectively, confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. The sixth in A.D. 680-681 condemned monothelitism, and the eighth in A.D. 869-870 deposed Photius and brought and end to the schism named after him. See the “Councils” section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\r“Third Council of Constantinople”\rhttp://tinyurl.com/oetzuo6\r\r“Fourth Council of Constantinople”\rhttp://tinyurl.com/pjc3kx2\r\rCoordinates:\r41.0122, 28.9760\r\r\r";
    
    SocialPins *sierraLeone = [[SocialPins alloc] init];
    sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
    sierraLeone.title = @"Freetown";
    sierraLeone.subtitle = @"Insufficient Health Care";
    sierraLeone.image = [UIImage imageNamed:@"sierra"];
    sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014. The city's and larger country's health care infrastructure was devastated by the civil war from 1991-2002.\r\rWikipedia, “Sierra Leone”\rhttp://tinyurl.com/m7ql8\r\rCoordinates: 8.4844, -13.2344\r\r\r";
    
    SocialPins *camden = [[SocialPins alloc] init];
    camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
    camden.title = @"Camden, NJ";
    camden.subtitle = @"Systemic Unemployment & Poverty";
    camden.image = [UIImage imageNamed:@"camden"];
    camden.information = @"\rIn 2012 Camden, NJ was ranked by the U.S. Census Bureau as the poorest city in the United States per capita as well as the most dangerous, being equally ranked as the crime capital of the United States. Fr. Jeff Putthoff is trying to help provide otherwise absent opportunities for many of the youth in Camden. He is the creator and director of HopeWorks, a non-profit, youth development program that trains young people in the use of and design of technologies such as Web design:\r\r“Hopeworks 'N Camden uses education, technology and entrepreneurship to partner with young men and women as they identify and earn a sustainable future. Together we seize the opportunity to heal and thrive in the midst of violence and poverty. Hopeworks 'N Camden is a nonprofit that has been working for over 15 years with Camden youth. Utilizing an advanced training curriculum in web site design/development, GIS and Salesforce, Hopeworks works with youth 14­-23 to get back in school and find a safe pathway to their future. Healing communities by creating safe pathways through which we own our histories and discover new choices. Hopeworks 'N Camden uses education, technology and entrepreneurship to partner with young men and women as they identify and earn a sustainable future. Together we seize the opportunity to heal and thrive in the midst of violence and poverty. Hopeworks 'N Camden is a nonprofit that has been working for over 15 years with Camden youth. Utilizing an advanced training curriculum in web site design/development, GIS and Salesforce, Hopeworks works with youth 14­-23 to get back in school and find a safe pathway to their future.”\r\rFurther Reference:\rHopeWorks, http://www.hopeworks.org\r\rWikipedia, “Camden, NJ”\rhttp://tinyurl.com/bmuvoem\r\rCoordinates: 39.9400, -75.1050\r\r\r";
    
    SocialPins *atlantic = [[SocialPins alloc] init];
    atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
    atlantic.title = @"The Atlantic Ocean";
    atlantic.subtitle = @"Rising Water Levels";
    atlantic.image = [UIImage imageNamed:@"ocean"]; 
    atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization. Pope Francis emphasized the importance of maintaining the health of the world's oceans when he stated:\r\r“Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas...Oceans not only contain the bulk of our planet’s water supply, but also most of the immense variety of living creatures, many of them still unknown to us and threatened for various reasons. What is more, marine life in rivers, lakes, seas and oceans, which feeds a great part of the world’s population, is affected by uncontrolled fishing, leading to a drastic depletion of certain species. Selective forms of fishing which discard much of what they collect continue unabated. Particularly threatened are marine organisms which we tend to overlook, like some forms of plankton; they represent a significant element in the ocean food chain, and species used for our food ultimately depend on them.”\r-Laudato Si, 24, 40\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rNOAA, National Ocean Service\rhttp://tinyurl.com/yc7jxud\r\r\r";
    
    SocialPins *philippines = [[SocialPins alloc] init];
    philippines.coordinate = CLLocationCoordinate2DMake(13.1333, 123.7333);
    philippines.title = @"Legazpi City";
    philippines.subtitle = @"Carbon Mining Coastal Destruction";
    philippines.image = [UIImage imageNamed:@"legazpi"];
    philippines.information = @"\rThe coast of Legazpi City, Philippines, is suffering from the effects of carbon mining. Pope Francis hightlighted the importance of addressing human intensification of the carbon cycle when he stated:\r\r“Climate change is a global problem with grave implications: environmental, social, economic, political and for the distribution of goods. It represents one of the principal challenges facing humanity in our day. Its worst impact will probably be felt by developing countries in coming decades. Many of the poor live in areas particularly affected by phenomena related to warming, and their means of subsistence are largely dependent on natural reserves and ecosystemic services such as agriculture, fishing and forestry. They have no other financial activities or resources which can enable them to adapt to climate change or to face natural disasters, and their access to social services and protection is very limited. For example, changes in climate, to which animals and plants cannot adapt, lead them to migrate; this in turn affects the livelihood of the poor, who are then forced to leave their homes, with great uncertainty for their future and that of their children. There has been a tragic rise in the number of migrants seeking to flee from the growing poverty caused by environmental degradation. They are not recognized by international conventions as refugees; they bear the loss of the lives they have left behind, without enjoying any legal protection whatsoever.”\r-Laudato Si, 25\r\rFurther Refernce\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rCoordinates:\r13.1333, 123.7333\r\r\r";
    
    SocialPins *palestine = [[SocialPins alloc] init];
    palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
    palestine.title = @"Palestine";
    palestine.image = [UIImage imageNamed:@"palestine"];
    palestine.subtitle = @"Occupied Territory";
    palestine.information = @"\rSince the creation of the state of Israel in 1948, Palestinians have been without statehood. The Vatican recently officially recognized the State of Palestine even though such recognition is absent in the United Nations and other governments.\r\rFurther Reference:\rVatican, Joint Statement of the Bilateral Commission of the Holy See and the State of Palestine\rhttp://tinyurl.com/okb4f9b\r\rCoordinates:\r31.6253, 35.1453\r\r\r";
    
    SocialPins *israel = [[SocialPins alloc] init];
    israel.coordinate = CLLocationCoordinate2DMake(31.0000, 35.0000);
    israel.title = @"Israel";
    israel.subtitle = @"A Contested Homeland";
    israel.image = [UIImage imageNamed:@"israel"];
    israel.information = @"\rThe modern state of Israel was created in 1948 when the British Mandate for Palestine expired at midnight. David Ben-Gurion announced the creation of Israel with these words:\r\r“Eretz Israel (the Land of Israel) was the birthplace of the Jewish people. Here their spiritual, religious, and political identity was shaped. Here they first attained statehood, created cultural values of national and universal significance and gave to the world the eternal Book of Books. Jews strove in every successive generation to reestablish themselves in their ancient homeland. ... they made deserts bloom, revived the Hebrew language, built villages and towns, and created a thriving community, controlling its own economy and culture, loving peace but knowing how to defend itself...The State of Israel will be open for Jewish immigration... will foster the development of the country for the benefit of all its inhabitants; it will be based on freedom, justice and peace as envisaged by the prophets of Israel; it will ensure complete equality of social and political rights to all its inhabitants irrespective of religion, race or sex; it will guarantee freedom of religion, conscience, language, education and culture; it will safeguard the Holy Places of all religions; and it will be faithful to the principles of the Charter of the United Nations. We extend our hand to all neighbouring states and their peoples in an offer of peace and good neighbourliness, and appeal to them to establish bonds of cooperation and mutual help with the sovereign Jewish people settled in its own land.”\r-Declaration\r\rSince then, Israel has fought numerous wars for its survival with its surrounding Arab neighborsMuch of the present crisis stems from Israel's control of the West Bank and Gaza strip, areas that are legally part of the Palestinan territories. Israel has controlled these areas since the Six-Day War of 1967, in violation of U.N. resolution 242, which is often cited as a factor in continuing threats from disaffected Palestinian groups:\r\r“The Security Council,\r\rExpressing its continuing concern with the grave situation in the Middle East,\r\rEmphasizing the inadmissibility of the acquisition of territory by war and the need to work for a just and lasting peace in which every State in the area can live in security,\r\rEmphasizing further that all Member States in their acceptance of the Charter of the United Nations have undertaken a commitment to act in accordance with Article 2 of the Charter,\r\r1. Affirms that the fulfilment of Charter principles requires the establishment of a just and lasting peace in the Middle East which should include the application of both the following principles:\r\r(i) Withdrawal of Israel armed forces from territories occupied in the recent conflict;\r\r(ii) Termination of all claims or states of belligerency and respect for and acknowledgment of the sovereignty, territorial integrity and political independence of every State in the area and their right to live in peace within secure and recognized boundaries free from threats or acts of force;\r\r2. Affirms further the necessity\r\r(a) For guaranteeing freedom of navigation through international waterways in the area;\r\r(b)	For achieving a just settlement of the refugee problem;\r\r(c)	For guaranteeing the territorial inviolability and political independence of every State in the area, through measures including the establishment of demilitarized zones;\r\r3. Requests the Secretary-General to designate a Special Representative to proceed to the Middle East to establish and maintain contacts with the States concerned in order to promote agreement and assist efforts to achieve a peaceful and accepted settlement in accordance with the provisions and principles in this resolution;\r\r4. Requests the Secretary-General to report to the Security Council on the progress of the efforts of the Special Representative as soon as possible.”\r\rFurther Reference:\rDeclaration of Establishment of the State of Israel\rhttp://tinyurl.com/p56bfn9\r\rUnited Nations Security Council\rResolution 242\rhttp://tinyurl.com/yeszj3t\r\rCoordinates:\r31.6253, 35.1453\r\r\r";
    
    BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
    thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
    thessalonica.title = @"Thessalonica";
    thessalonica.subtitle = @"Greek Coastal City";
    thessalonica.image = [UIImage imageNamed:@"thessalonica"]; 
    thessalonica.information = @"\rThessalonica (modern Thessaloniki) was home to one of the earlier Christian communities founded by the St. Paul. There are two New Testament letters addressed to this community, however only one of them (1 Thessalonians) is counted as authentically Pauline. The other (2 Thessalonians) is among the so-called disputed letters. 1 Thessalonians contains an reference to an earlier oral tradition of Jesus:\r\r“We do not want you to be unaware, brothers, about those who have fallen asleep, so that you may not grieve like the rest, who have no hope. For if we believe that Jesus died and rose, so too will God, through Jesus, bring with him those who have fallen asleep. Indeed, we tell you this, on the word of the Lord, that we who are alive, who are left until the coming of the Lord, will surely not precede those who have fallen asleep. For the Lord himself, with a word of command, with the voice of an archangel and with the trumpet of God, will come down from heaven, and the dead in Christ will rise first. Then we who are alive, who are left, will be caught up together with them in the clouds to meet the Lord in the air. Thus we shall always be with the Lord. Therefore, console one another with these words.”\r-1 Thessalonians 4: 13-18\r\rFurther Reference:\rNew American Standard Bible Revised Edition\r1 Thessalonians, http://tinyurl.com/obav3c6\r\rCoordinates:\r40.6500, 22.9000\r\r\r";
    
    BiblicalPins *philippi = [[BiblicalPins alloc] init];
    philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
    philippi.title = @"Philippi";
    philippi.subtitle = @"Major Greek City";
    philippi.image = [UIImage imageNamed:@"philippi"];
    philippi.information = @"\rAccording to Acts 16: 11-15, Philippi was a Roman colony in which both St. Paul and St. Barnabas conducted missionary work. Philippians contains what many scholars believe to be an early Christian hymn describing the Incarnation:\r\r“Have among yourselves the same attitude that is also yours in Christ Jesus, Who, though he was in the form of God did not regard equality with God something to be grasped. Rather, he emptied himself, taking the form of a slave, coming in human likeness; and found human in appearance, he humbled himself, becoming obedient to death, even death on a cross. Because of this, God greatly exalted him and bestowed on him the name that is above every name, that at the name of Jesus every knee should bend, of those in heaven and on earth and under the earth, and every tongue confess that Jesus Christ is Lord, to the glory of God the Father.”\r-Philippians 2: 5-11\r\rSee “Incarnation” in the Dictionary.\r\rFurther Reference:\rNew American Bible Revised Edition\rPhilippians 2, http://tinyurl.com/p4byh43\r\rCoordinates:\r41.0131, 24.2864\r\r\r";
    
    BiblicalPins *antioch = [[BiblicalPins alloc] init];
    antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
    antioch.title = @"Antioch";
    antioch.subtitle = @"Capital of Ancient Syria";
    antioch.image = [UIImage imageNamed:@"antioch"];
    antioch.information = @"\rAntioch was a major center for Gentile Christianity in the first century as recorded in the Acts of the Apostles. St. Paul and St. Barnabas launched their missionary journeys from this city. The disciples of Jesus were first called Christians in Antioch (Acts 11:26).\r\r“Now those who had been scattered by the persecution that arose because of Stephen went as far as Phoenicia, Cyprus, and Antioch, preaching the word to no one but Jews. There were some Cypriots and Cyrenians among them, however, who came to Antioch and began to speak to the Greeks as well, proclaiming the Lord Jesus. The hand of the Lord was with them and a great number who believed turned to the Lord. The news about them reached the ears of the church in Jerusalem, and they sent Barnabas to Antioch. When he arrived and saw the grace of God, he rejoiced and encouraged them all to remain faithful to the Lord in firmness of heart, for he was a good man, filled with the holy Spirit and faith. And a large number of people was added to the Lord. Then he went to Tarsus to look for Saul, and when he had found him he brought him to Antioch. For a whole year they met with the church and taught a large number of people, and it was in Antioch that the disciples were first called 'Christians'.”\r-Acts 11: 19-26\r\rFurther Reference:\rNew American Bible Revised Edition\rActs 11, http://tinyurl.com/o3cm45r\r\rCoordinates:\r36.2000, 36.1500\r\r\r";
    
    BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
    bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
    bethlehem.title = @"Bethlehem";
    bethlehem.image = [UIImage imageNamed:@"bethlehem"]; 
    bethlehem.subtitle = @"Traditional Birthplace of Jesus";
    bethlehem.information = @"\rBethlehem is located just south of Jerusalem. While Matthew portrays Bethlehem as Joseph and Mary's hometown, Luke states that Nazareth was their hometown, which they left in order to be in Bethlehem for a census.\r\rFurther Reference:\rWikipedia, “Bethlehem”\rhttp://tinyurl.com/natjqkv\r\rCoordinates:\r31.7031, 35.1956\r\r\r";
    
    //BiblicalPins *ramah = [[BiblicalPins alloc] init];
    //ramah.coordinate = CLLocationCoordinate2DMake(32.936389, 35.367222);
    //ramah.title = @"Ramah";
    
    
    BiblicalPins *hebron = [[BiblicalPins alloc] init];
    hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
    hebron.title = @"Hebron";
    hebron.subtitle = @"David's Judahite Capital";
    hebron.image = [UIImage imageNamed:@"hebron"];
    hebron.information = @"\rOne of the oldest continually occupied cities in the world, Hebron is first mentioned in the biblical story-cycles of Abraham. In Genesis 23, Abraham buys Hebron from Ephron the Hittite for 400 sheckels. Abraham, Isaac, and Jacob are portrayed as buried there. Numbers 13:22 indicates that Hebron was founded around 1720 B.C. In the book of Judges, Joshua assigns Hebron to Caleb as part of the territory of Judah. In the book of 2 Samuel, David is annointed King of Judah and all Israel at Hebron.\r\r“All the tribes of Israel came to David at Hebron and said, 'We are your own flesh and blood. In the past, while Saul was king over us, you were the one who led Israel on their military campaigns. And the LORD said to you, ‘You will shepherd my people Israel, and you will become their ruler.’ When all the elders of Israel had come to King David at Hebron, the king made a covenant with them at Hebron before the LORD, and they anointed David king over Israel.”\r-2 Samuel 5: 1-3\r\rFurther Reference:\rNew American Bible Revised Edition\r2 Samuel 5, http://tinyurl.com/npwcn4a\r\rCoordinates:\r31.5333, 35.0950\r\r\r";
    
    BiblicalPins *shiloh = [[BiblicalPins alloc] init];
    shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
    shiloh.title = @"Shiloh";
    shiloh.subtitle = @"Shrine of the Ark of the Covenant";
    shiloh.image = [UIImage imageNamed:@"shiloh"];
    shiloh.information = @"\rAccording to various Old Testament references, Shiloh was a major cultic site asociated with the Ark of the Covenant and the tribe of Levi. It is first mentioned in the context of the Ark of the Covenant in 1 Samuel 4: 3-4:\r\r“When the soldiers returned to camp, the elders of Israel asked, 'Why did the LORD bring defeat on us today before the Philistines? Let us bring the ark of the LORD’s covenant from Shiloh, so that he may go with us and save us from the hand of our enemies.' So the people sent men to Shiloh, and they brought back the ark of the covenant of the LORD Almighty, who is enthroned between the cherubim. And Eli’s two sons, Hophni and Phinehas, were there with the ark of the covenant of God.”\r\rArcheologist Israel Finkelstein claims that although the evidence for a major settlement at Shiloh is scant during the Iron Age I period, there is evidence for cultic activity:\r\r“There was no settlement at Shiloh in the Late Bronze Age, but the favissa found on the northeastern slope hints that cultic-activity did take place at the site at that time. When one attempts to evaluate the nature of Iron I Shiloh, it is impossible to ignore these facts. To summarize this point, although there is no direct evidence of an Iron I shrine at Shiloh, indirect considerations seem to hint that Iron I Shiloh was not a typical highlands settlement, and the long-term evidence, from the Middle and Late Bronze Ages, seems to hint at the existence of a cult place there.”\r-Finkelstein, 25\r\rFurther Reference:\rNew American Standard Bible Revised Edition\r1 Samuel 4, http://tinyurl.com/o7n83hf\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rCoordinates:\r32.0556, 35.2895\r\r\r";
    
    HistoricalPins *lyon = [[HistoricalPins alloc] init];
    lyon.coordinate = CLLocationCoordinate2DMake(45.7600, 4.8400);
    lyon.title = @"Lyon";
    lyon.subtitle = @"Ecumenical Councils XIII, XIV";
    lyon.image = [UIImage imageNamed:@"lyon"];
    lyon.information = @"\rThe first Council of Lyon was held in 1245 and was the thirteenth Ecumneical Council of the Church. It was called by Pope Innocent IV to excommunicate Frederick II and call for the 7th Crusade to reconquer the Holy Land. It also dealt with various disciplinary matters.\r\rThe second Council of Lyon was held from 1272-1274 and was the fourteenth Ecumenical Council of the Church. It was called by Pope Gregory X in order to fund the reconquest of the Holy Land and end the Great Schism with the Eastern Orthodox churches. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Lyon”\rhttp://tinyurl.com/msp95mv\r“Second Council of Lyon”\rhttp://tinyurl.com/my3aqa6\r\rCoordinates:\r45.7600, 4.8400\r\r\r";
    
    HistoricalPins *ephesus2 = [[HistoricalPins alloc] init];
    ephesus2.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3500);
    ephesus2.title = @"Ephesus";
    ephesus2.subtitle = @"Ecumencial Council III";
    ephesus2.image = [UIImage imageNamed:@"ephesus2"];
    ephesus2.information = @"\rThe Council of Ephesus was called in A.D. 431 by the Roman Emperor Theodosius II. It condemned the teaching of Nestorius, who denied the principle of Communicatio Idiomatum by claiming that the Virgin Mary was the mother of Christ but not of God. The Council taught that the Virgin Mary was “Theotokos”: God-bearer. \r\rFurther Reference:\rWikipedia, “Council of Ephesus”\rhttp://tinyurl.com/mrmvuaw\r\rCoordinates:\r37.9411, 27.3500\r\r\r";

    
    HistoricalPins *vienne = [[HistoricalPins alloc] init];
    vienne.coordinate = CLLocationCoordinate2DMake(46.5000, 0.5000);
    vienne.title = @"Vienne";
    vienne.subtitle = @"Ecumenical Council XV";
    vienne.image = [UIImage imageNamed:@"vienne"]; 
    vienne.information = @"\rThe Council of Vienne was held from 1311 to 1312 and is counted as the fifteenth ecumenical council by the Catholic Church. It was created by the papal bull of Clement V, “Faciens Misericordiam”, which called for an ecumenical council to create a new Crusade. The bull also established papal commissions to deal with charges against the Knights Templar. The Council also created Chairs of Hebrew, Aramaic, and Greek at the University of Paris. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Vienne”\rhttp://tinyurl.com/ldrffc7\r\rCoordinates:\r46.5000, 0.5000\r\r\r";
    
    HistoricalPins *chalcedon = [[HistoricalPins alloc] init];
    chalcedon.coordinate = CLLocationCoordinate2DMake(40.9833, 29.0333);
    chalcedon.title = @"Chalcedon";
    chalcedon.subtitle = @"Ecumencial Council IV";
    chalcedon.image = [UIImage imageNamed:@"chalcedon"];
    chalcedon.information = @"\rThe Council of Chalcedon was held in A.D. 451 and promulgated what would become the classical Christological definition of Jesus Christ as one person in two natures:\r\r“We, then, following the holy Fathers, all with one consent, teach people to confess one and the same Son, our Lord Jesus Christ, the same perfect in Godhead and also perfect in manhood; truly God and truly man, of a rational soul and body; consubstantial with the Father according to the Godhead, and consubstantial with us according to the Manhood; in all things like unto us, without sin; begotten before all ages of the Father according to the Godhead, and in these latter days, for us and for our salvation, born of the Virgin Mary, the Mother of God, according to the Manhood; one and the same Christ, Son, Lord, only begotten, to be acknowledged in two natures, inconfusedly, unchangeably, indivisibly, inseparably; (ἐν δύο φύσεσιν ἀσυγχύτως, ἀτρέπτως, ἀδιαιρέτως, ἀχωρίστως) the distinction of natures being by no means taken away by the union, but rather the property of each nature being preserved, and concurring in one Person (prosopon) and one Subsistence, not parted or divided into two persons, but one and the same Son, and only begotten God, the Word, the Lord Jesus Christ; as the prophets from the beginning [have declared] concerning Him, and the Lord Jesus Christ Himself has taught us, and the Creed of the holy Fathers has handed down to us.”\r\rSee the Councils section in the Overview tab.\r\rFurther Reference:\rCouncil of Chalcedon, Definition\rhttp://tinyurl.com/nhnxvro\r\rCoordinates:\r40.9833, 29.0333\r\r\r";
    
    HistoricalPins *constance = [[HistoricalPins alloc] init];
    constance.coordinate = CLLocationCoordinate2DMake(47.6633, 9.1769);
    constance.title = @"Constance";
    constance.subtitle = @"Ecumenical Council XVI";
    constance.image = [UIImage imageNamed:@"constance"];
    constance.information = @"\rThe Council of Constance was held from 1414 to 1418 and ended the so-called “Western Schism” and Avignon Papacy. It was the first Council to specifically advocate Conciliarism by claiming that even the Pope was subject to the decrees of an Ecumenical Council. However, the Pope elected by the Council, Martin V, did not confirm this statement. As such, it was not considered a binding teaching. The Council also condemned the teaching of John Wycliff and Jan Hus. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Constance”\rhttp://tinyurl.com/5upzc5\r\rCoordinates:\r47.6633, 9.1769\r\r\r";
    
    HistoricalPins *trent = [[HistoricalPins alloc] init];
    trent.coordinate = CLLocationCoordinate2DMake(46.0667, 11.1167);
    trent.title = @"Trent";
    trent.subtitle = @"Ecumenical Council XIX";
    trent.image = [UIImage imageNamed:@"trent"];
    trent.information = @"\rThe Council of Trent was in session from 1545 to 1563 in Trento, Italy. It was the most signficant Church Council since Nicea until Vatican II. It was called by Pope Paul III as a response to the Protestant Reformation, and consolidated many elements of Catholic teaching, including Sacraments, Latin as the official language of the Church, and the Breviary. The Tridentine Mass became the ordinary form of the Mass until the developments of Vatican II. See Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Trent”\rhttp://tinyurl.com/5t586h\r\rCoordinates:\r46.0667, 11.1167\r\r\r";
    
    HistoricalPins *florence = [[HistoricalPins alloc] init];
    florence.coordinate = CLLocationCoordinate2DMake(43.7833, 11.2500);
    florence.title = @"Florence";
    florence.subtitle = @"Ecumenical Council XVII";
    florence.image = [UIImage imageNamed:@"florence"]; 
    florence.information = @"\rInitially convoked by Pope Martin V as the Council of Basel in 1431, the council was moved to Ferrara, and then finally to Florence after a series of political events and the election of an anti-pope. The Council of Florence negotiated reunion with some Eastern churches and established the Filique clause in the Nicene Creed. It also established Papal primacy over an ecumenical council, which was a departure from the previous Council of Constance. See “Filioque”, “Nicene Creed”. See “Councils” section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Florence”\rhttp://tinyurl.com/o2t9hxd\r\rCoordinates:\r43.7833, 11.2500\r\r\r";
    
    HistoricalPins *lateran = [[HistoricalPins alloc] init];
    lateran.coordinate = CLLocationCoordinate2DMake(41.885906, 12.506156);
    lateran.title = @"St. John Lateran";
    lateran.subtitle = @"Ecumenical Councils IX, X, XI, XII";
    lateran.image = [UIImage imageNamed:@"lateran"]; 
    lateran.information = @"\rThe First Lateran Council in 1123 was convoked by Pope Callixtus II and did not deal with doctrinal questions. Instead, it promulgated a series of clerical reforms such as the prohibition of Simony and cohabitation with non-familial women.\r\rThe second Lateran Council was convoked by Pope Innocent II in 1139 dealt with the schism initated by the antipope Anicletus II.\r\rThe Third Lateran Council in 1179 was convoked by Pope Alexander III and put an end to the schism caused by the election of two antipopes. Notably, it also decreed that only Cardinals could elect a Pope by a two-thirds majority. It also excommunicated anyone who engaged in usury.\r\rThe Fourth Lateran Council was convoked by Innocent III and began in 1215. It was notable for its large number of attendees, its organization of the Fifth Crusade, as well as the decree that Jews and Muslims be required to wear special clothing. See “Councils” section in the Overview tab.\r\rFurther Refernce:\rWikipedia, “First Council of the Lateran”\rhttp://tinyurl.com/o7w4qna\r\r“Second Council of the Lateran”\rhttp://tinyurl.com/o7rnua5\r\r“Third Council of the Lateran”\rhttp://tinyurl.com/ogkpnwz\r\r“Fourth Council of the Lateran”\rhttp://tinyurl.com/nzjtd9f\r\rCoordinates:\r43.7833, 11.2500\r\r\r";
    
    SocialPins *uganda = [[SocialPins alloc] init];
    uganda.coordinate = CLLocationCoordinate2DMake(1.0667, 31.8833);
    uganda.title = @"Uganda";
    uganda.subtitle = @"Tribal Warfare & Water Scarcity";
    uganda.image = [UIImage imageNamed:@"uganda"];
    uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev\r\rCoordinates: 1.0667, 31.8833\r\r\r";
    
    SocialPins *asheville = [[SocialPins alloc] init];
    asheville.coordinate = CLLocationCoordinate2DMake(35.5800, -82.5558);
    asheville.title = @"St. Eugene Church";
    asheville.subtitle = @"Renewable Energy Exemplar";
    asheville.image = [UIImage imageNamed:@"StEugene"];
    asheville.information = @"\rSt. Eugene Church in Asheville, North Carolina, recently commited to using 100% renewable energy in the form of solar panels. These will sigificantly reduce its monthly energy bill.\r\rFurther Reference:\rSt. Eugene Church, www.steugene.org\rhttp://tinyurl.com/ofblbtf\r\r\r";
    
    SocialPins *burma = [[SocialPins alloc] init];
    burma.coordinate = CLLocationCoordinate2DMake(22.0000,  96.0000);
    burma.title = @"Burma";
    burma.subtitle = @"Religous Freedom Violations";
    burma.image = [UIImage imageNamed:@"Burma"];
    burma.information = @"\rBurma was categorized as a Tier 1 violator of religious freedom by the United States Commission on International Religious Freedom in 2015.\r\rFurther Reference:\rUSCIRF, Annual Report 2015\rhttp://tinyurl.com/m34ndev\r\r\r";
    
    SocialPins *cali = [[SocialPins alloc] init];
    cali.coordinate = CLLocationCoordinate2DMake(37.0000, -120.0000);
    cali.title = @"California";
    cali.subtitle = @"Catastrophic Drought";
    cali.image = [UIImage imageNamed:@"drought"];
    cali.information = @"\rIn 2015, California experienced an unprecedented drought which caused the state to implement mandatory water restrictions. Scientists attribute the severtity of the drought to the effects of climate change. Pope Francis highlighted the importance of water for human life and development, when he stated:\r\r“Fresh drinking water is an issue of primary importance, since it is indispensable for human life and for supporting terrestrial and aquatic ecosystems. Sources of fresh water are necessary for health care, agriculture and industry. Water supplies used to be relatively constant, but now in many places demand exceeds the sustainable supply, with dramatic consequences in the short and long term.”\r-Laudato Si, 28.\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rState of California, “Drought”\rhttp://tinyurl.com/prczpha\r\rCoordinates:\r37.0000, 120.0000\r\r\r";
    
    SocialPins *amazon = [[SocialPins alloc] init];
    amazon.coordinate = CLLocationCoordinate2DMake(-3.1600, -60.0300);
    amazon.title = @"Amazon Rain Forest";
    amazon.subtitle = @"Increasing Deforestation";
    amazon.image = [UIImage imageNamed:@"amazon"];
    amazon.information = @"\rThe Amazon Rain Forest is a vital eco-system of the South American continent. Pope Francis emphasized the importance of this and similar ecosystems for human development when he stated:\r\r“Let us mention, for example, those richly biodiverse lungs of our planet which are the Amazon and the Congo basins, or the great aquifers and glaciers. We know how important these are for the entire earth and for the future of humanity. The ecosystems of tropical forests possess an enormously complex biodiversity which is almost impossible to appreciate fully, yet when these forests are burned down or levelled for purposes of cultivation, within the space of a few years countless species are lost and the areas frequently become arid wastelands. A delicate balance has to be maintained when speaking about these places, for we cannot overlook the huge global economic interests which, under the guise of protecting them, can undermine the sovereignty of individual nations.”\r-Laudato Si, 38\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rNature, “Stopping Deforestation: Battle for the Amazon”. http://tinyurl.com/ngqjb5q\r\rCoordinates:\r-3.1600, 60.0300\r\r\r";
    
    SocialPins *texas = [[SocialPins alloc] init];
    texas.coordinate = CLLocationCoordinate2DMake(31.0000, -100.0000);
    texas.title = @"Texas";
    texas.subtitle = @"Leads U.S. in Capital Punishment";
    texas.image = [UIImage imageNamed:@"texas"];
    texas.information = @"\rWhile numerous states have abolished the death penalty, Texas' rate of execution remains the highest in the nation. Various social groups, such as the Innocence Project, are aimed at abolishing the death penalty in Texas and throughout the country.\r\rFurther Reference:\rThe Innocence Project\rhttp://innocenceproject.org\r\r\r";
    
    SocialPins *gitmo = [[SocialPins alloc] init];
    gitmo.coordinate = CLLocationCoordinate2DMake(19.9000, -75.1500);
    gitmo.title = @"Guantanamo Bay";
    gitmo.subtitle = @"Enemy Combatant Detention Camp";
    gitmo.image = [UIImage imageNamed:@"gitmo"];
    gitmo.information = @"\rAfter the 9/11 terrorist attacks on the United States, the U.S. government initiated a policy of detaining foreign nationals who were suspected of being terrorists or supplying material support to terrorist networks. This was controversial because detainees were not classified as prisoners of war and were deprived of the right to habius corpus, effectively allowing indefinite detention without trial. Subsequent news stories and a report by the United States Senate confirmed that torture had been practiced in the prison:\r\r“...CIA personnel, aided by two outside contractors, decided to initiate a program of indefinite secret detention and the use of brutal interrogation techniques in violation of U.S. law, treaty obligations, and our values.”\r-Senate Report, 2\r\rThe United States Conference of Catholic Bishops have written extensively the the U.S. Congress to share the concern of the Church in America on that reported events at Guantanamo:\r\r“Detainees have the right to a just and fair trial held in a timely manner. For at least 86 detainees 'a crime has not first been proven.' The indefinite detention of detainees is not only injurious to those individuals, it also wounds the moral reputation of our nation, compromises our commitment to the rule of law, and undermines our struggle against terrorism.”\r-USCCB, Letter\r\rFurther Reference:\r\rSenate Select Committee on Intelligence,\rStudy of CIA Detention and Interrogation Program\rhttp://tinyurl.com/zz6fn67\r\rUnited States Conference of Catholic Bishops,\rLetter Regarding Detainees at Guantanamo Bay\rhttp://tinyurl.com/hju2a87\r\rCoordinates: 19.9000, -75.1500\r\r\r";
    
    BiblicalPins *caesarea = [[BiblicalPins alloc] init];
    caesarea.coordinate = CLLocationCoordinate2DMake(32.5190, 34.9045);
    caesarea.title = @"Caesarea Maritima";
    caesarea.subtitle = @"Ancient Roman Sea Port";
    caesarea.image = [UIImage imageNamed:@"Caesarea"];
    caesarea.information = @"\rCaesarea Maritima was built by Herod the Great on the coast of Palestine and named in honor of Caesar Augustus. It later become the official residence of Roman procutators, such as Pontius Pilate. It boasted of an immense aqueduct that brought water from 7.5 kilometers away to the northeast, an amphitheater, a temple to Augustus, and, according to Josephus, the site of the Jewish act of civil disobedience in A.D. 26 in protest to Pilate's order to install Roman standards in the Temple. The New Testament book of Acts mentions Caesarea as one of the earliest missionary cities visited by the Apostles:\r\r“Now in Caesarea there was a man named Cornelius, a centurion of the Cohort called the Italica, devout and God-fearing along with his whole household, who used to give alms generously to the Jewish people and pray to God constantly. One afternoon about three o’clock, he saw plainly in a vision an angel of God come in to him and say to him, 'Cornelius.' He looked intently at him and, seized with fear, said, 'What is it, sir?' He said to him, 'Your prayers and almsgiving have ascended as a memorial offering before God. Now send some men to Joppa and summon one Simon who is called Peter. He is staying with another Simon, a tanner, who has a house by the sea.' When the angel who spoke to him had left, he called two of his servants and a devout soldier from his staff, explained everything to them, and sent them to Joppa.”\r-Acts 10:1-8\r\rJosephus gives a detailed account of the architecture of Caesarea in his book Antiquities of the Jews:\r\r “The city itself was called 'Caesarea', which was also itself built of fine materials, and was of a fine structure; nay, the very subterranean vaults and cellars had no less of architecture bestowed on them than had the buildings above ground. Some of these vaults carried things at even distances to the haven and to the sea; but one of them ran obliquely, and bound all the rest together, that both the rain and the filth of the citizens were together carried off with ease, and the sea itself, upon the flux of the tide from without, came into the city, and washed it all clean. Herod also built therein a theater of stone; and on the south quarter, behind the port, an amphitheater also, capable of holding a vast number of men, and conveniently situated for a prospect to the sea. So this city was thus finished in twelve years; during which time the king did not fail to go on both with the work, and to pay the charges that were necessary.”\r-Josephus, XV, 9\r\rJosephus later claimed that the desecration of a synogogue in Caesarea was the catalyst of a revolt that precipitated the First Jewish Revolt. Later, from A.D. 230-250, Caesarea became the intellectual home of the great church father, Origen. See ”Apostle”, ”Temple”.\r\rFurther Reference:\rNew American Bible Revised Edition, Acts 10\rhttp://tinyurl.com/zhlfhqb\r\rJosephus, “Antiquities of the Jews”\rhttp://tinyurl.com/j75tfyh\r\rThe Bible and Interpretation, “Caesarea Maritima”\rhttp://tinyurl.com/jcwyslc\r\rCoordinates: 32.5190, 34.9045\r\r\r";
    
    




    
    NSArray *annotations = [NSArray arrayWithObjects:jerusalem, gehenna, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, greatbr, philippines, rome, nazareth, capernaum, sierraLeone, camden, atlantic, vatican, constantinople, palestine, israel, alexandria, thessalonica, philippi, antioch, bethlehem, hebron, shiloh, lyon, vienne, chalcedon, constance, trent, florence, lateran, uganda, colossae, sepphoris, asheville, burma, ephesus2, cali, amazon, texas, gitmo, caesarea, nil];
    
    [self.mapView addAnnotations:annotations];

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
                                      
                                      BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
                                      jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
                                      jerusalem.title = @"Jerusalem";
                                      jerusalem.subtitle = @"Capital of the Davidic Dynasty";
                                      jerusalem.image = [UIImage imageNamed:@"jerusalem"];
                                      jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Judges 1:8 gives portrays a violent capture of the city by the sons of Judah. David eventually brought the Ark to Jerusalem from Keraith Jearim. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rFurther Reference:\rWikipedia, “Jerusalem”\rhttp://tinyurl.com/2f662p\r\rCoordinates:\r31.7883, 35.2167\r\r\r";
                                      
                                      BiblicalPins *gehenna = [[BiblicalPins alloc] init];
                                      gehenna.coordinate = CLLocationCoordinate2DMake(31.768406, 35.230439);
                                      gehenna.title = @"Gehenna";
                                      gehenna.subtitle = @"The Valley of Ben-Hinnom";
                                      gehenna.image = [UIImage imageNamed:@"gehenna"];
                                      gehenna.information = @"\rGehenna was a valley, south of Jerusalem, where apostate Israelites would sacrifice their infants by burning them alive to worship the god Molech. It is mentioned several times in the Hebrew Scriptures. In Second Temple Judaism, it came to regarded as representative and a shorthand for everything evil and worthy of YHWH's punishment. This is the location that Jesus is portrayed as alluding to when he mentions Gehenna, which was later translated as “hell”.\r\rFurther Reference:\rWikipedia, “Gehenna”\rhttp://tinyurl.com/ymbj2d\r\r\rCoordinates: 31.768406, 35.230439";
                                      
                                          BiblicalPins *bethEl = [[BiblicalPins alloc] init];
                                          bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
                                          bethEl.title = @"Beth-El";
                                          bethEl.subtitle = @"Southern Israelite Cultic Site";
                                          bethEl.image = [UIImage imageNamed:@"bethel"];
                                          bethEl.information = @"\rMeaning “House of God”, Beth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon prior to the emergence of Israel. In Genesis 28 it is associated with the Hebrew patriarch Jacob:\r\r“When Jacob awoke from his sleep, he said, 'Truly, the Lord is in this place and I did not know it!' He was afraid and said: 'How awesome this place is! This is nothing else but the house of God, the gateway to heaven!' Early the next morning Jacob took the stone that he had put under his head, set it up as a sacred pillar, and poured oil on top of it. He named that place Beth-El, whereas the former name of the town had been Luz.”\r-Genesis 28: 16-19\r\rLater in 1 Kings, Bethel becomes one of two alternative worship sites established by King Jeroboam of the Northern Kingdom:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Bethel, the other in Dan. This led to sin, because the people frequented these calves in Bethel and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r-1 Kings 12: 28-31\r\rArcheologist Israel Finkelstein claims that its pottery evidence suggests that Beth-El was actually deserted during the reign of Jeroboam I:\r\r“Bethel is the other site mentioned in 1 Kgs 12:29 as a cult place that was erected by Jeroboam I. The mound at the village of Beitin east of Ramallah, the location of biblical Bethel, was thoroughly excavated in the 1930s and 1950s. A comprehensive investigation of the finds from this dig, stored in Jerusalem and Pittsburgh, also cast doubt on the historicity of this verse. This investigation revealed that most of the Iron IIA pottery types known from sites in the vicinity, for example, Stratum 14 in the City of David in Jerusalem, are rare or absent at Bethel and that there are no diagnostic early Iron IIA items at the site (Finkelstein and Singer-Avitz 2009). In other words, Bethel, too, produced no clear indication of activity in the time of Jeroboam I.”\r-Finkelstein, 74\r\rSee “Dan”.\r\rFurther Reference:\rNew American Bible Revised Edition\rGenesis 28, http://tinyurl.com/joct23k\r\r1 Kings 12, http://tinyurl.com/qhd4nug\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rCoordinates:\r31.9390, 35.2260\r\r\r";

                                      
                                          BiblicalPins *dan = [[BiblicalPins alloc] init];
                                          dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
                                          dan.title = @"Dan";
                                          dan.image = [UIImage imageNamed:@"dan"];
                                          dan.subtitle = @"Northern Israelite Cultic Site";
                                          dan.information = @"\rAccording to 1 Kings 12, Dan becomes one of two alternative worship sites established by King Jeroboam I of the Northern Kingdom of Israel:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Beth-El, the other in Dan. This led to sin, because the people frequented these calves in Beth-El and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r-1 Kings 12: 28-31\r\rHowever, according to some archeologists, its pottery evidence suggest that Dan:\r\r-was destroyed by the end of late Iron Age I\r-was deserted during the time of Jeroboam I\r-was rebuilt by Hazael in the late 9th century B.C.\r-became Israelite for the first time around 800 B.C.\r\rIsrael Finkelstein claims:\r\r“...the evidence from Dan does not support the tradition about Jeroboam I at Dan... it means that the tradition about the erection of the bamah [altar] at Dan is a retrojection into the past of a reality from the days of Jeroboam II, in the first half of the eighth century B.C.E.”\r-Finkelstein, 74\r\rDan is also the site (known as “Tel-Dan”) where one of the most significant archeological finds was discovered by Avraham Biran in 1993; an inscription that referred to the “House of David”. According to the Biblical Archeological Society (BAS):\r\r“Avraham Biran and his team of archaeologists found a remarkable inscription from the ninth century B.C.E. that refers both to the 'House of David' and to the 'King of Israel.' This is the first time that the name David has been found in any ancient inscription outside the Bible. That the inscription refers not simply to a 'David' but to the House of David, the dynasty of the great Israelite king, is even more remarkable. 'King of Israel' is a term frequently found in the Bible, especially in the Book of Kings. This, however, may be the oldest extrabiblical reference to Israel in Semitic script. If this inscription proves anything, it shows that both Israel and Judah, contrary to the claims of some scholarly Biblical minimizers, were important kingdoms at this time.”\r-BAS, 33\r\rSee “Beth-El”.\r\rFurther Reference:\rNew American Bible Revised Edition\r1 Kings 12, http://tinyurl.com/qhd4nug\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rBiblical Archeological Society, “Top Ten Biblical Archeological Discoveries”\rhttp://tinyurl.com/goqp9qf\r\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520\r\r\r";
                                      
                                          BiblicalPins *temple = [[BiblicalPins alloc] init];
                                          temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                          temple.title = @"The Temple";
                                          temple.subtitle = @"The House of Yahweh";
                                          temple.image = [UIImage imageNamed:@"temple"];
                                          temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great before being destroyed again by the Roman army in A.D. 70.\r\rFurther Reference:\rNOVA, “Recreating the Temple” (video)\rhttp://tinyurl.com/jr83lcj\r\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
                                      
                                          BiblicalPins *hazor = [[BiblicalPins alloc] init];
                                          hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
                                          hazor.title = @"Hazor";
                                          hazor.image = [UIImage imageNamed:@"hazor"];
                                          hazor.subtitle = @"Major Ancient Canaanite City";
                                          hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai:\r\r“At that time Joshua, turning back, captured Hazor and struck down its king with the sword; for Hazor formerly was the chief of all those kingdoms. He also struck down with the sword every person there, carrying out the ban, till none was left alive. Hazor itself he burned.”\r-Joshua 11: 10-11\r\rHowever, according to the book of Judges, Hazor was still standing and a functional monarchy:\r\r“So the LORD sold them into the power of the Canaanite king, Jabin, who reigned in Hazor. The general of his army was Sisera, who lived in Harosheth-ha-goiim.”\r-Judges 4: 2\r\rIn addition to this discrepancy, recent archeological findings show that Hazor was destroyed in the late 13th century while Jericho and Ai were destroyed in 1500 B.C. and 2200 B.C., respectively. These findings further show Hazor was destoryed by internal revolt rather than external attack. These data are best explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the the Dictionary tab.\r\rFurther Reference:\rNew American Bible Revised Edition, Joshua 11\rhttp://tinyurl.com/z65778q\r\rJudges 4\rhttp://tinyurl.com/hf82n48\r\rIsrael Finkelstein, “The Forgotten Kingdom:  The Archeology And History Of Northern Israel”, pg. 21\rhttp://tinyurl.com/gnjmjwa\r\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669\r\r\r";
                                      
                                      BiblicalPins *jericho = [[BiblicalPins alloc] init];
                                      jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
                                      jericho.title = @"Jericho";
                                      jericho.subtitle = @"Walled Canaanite City";
                                      jericho.image = [UIImage imageNamed:@"jericho"];
                                      jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500\r\r\r";
                                      
                                          BiblicalPins *shiloh = [[BiblicalPins alloc] init];
                                          shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
                                          shiloh.title = @"Shiloh";
                                          shiloh.subtitle = @"Shrine of the Ark of the Covenant";
                                          shiloh.image = [UIImage imageNamed:@"shiloh"];
                                          shiloh.information = @"\rAccording to various Old Testament references, Shiloh was a major cultic site asociated with the Ark of the Covenant and the tribe of Levi. It is first mentioned in the context of the Ark of the Covenant in 1 Samuel 4: 3-4:\r\r“When the soldiers returned to camp, the elders of Israel asked, 'Why did the LORD bring defeat on us today before the Philistines? Let us bring the ark of the LORD’s covenant from Shiloh, so that he may go with us and save us from the hand of our enemies.' So the people sent men to Shiloh, and they brought back the ark of the covenant of the LORD Almighty, who is enthroned between the cherubim. And Eli’s two sons, Hophni and Phinehas, were there with the ark of the covenant of God.”\r\rArcheologist Israel Finkelstein claims that although the evidence for a major settlement at Shiloh is scant during the Iron Age I period, there is evidence for cultic activity:\r\r“There was no settlement at Shiloh in the Late Bronze Age, but the favissa found on the northeastern slope hints that cultic-activity did take place at the site at that time. When one attempts to evaluate the nature of Iron I Shiloh, it is impossible to ignore these facts. To summarize this point, although there is no direct evidence of an Iron I shrine at Shiloh, indirect considerations seem to hint that Iron I Shiloh was not a typical highlands settlement, and the long-term evidence, from the Middle and Late Bronze Ages, seems to hint at the existence of a cult place there.”\r-Finkelstein, 25\r\rFurther Reference:\rNew American Standard Bible Revised Edition\r1 Samuel 4, http://tinyurl.com/o7n83hf\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rCoordinates:\r32.0556, 35.2895\r\r\r";

                                      
                                          BiblicalPins *hebron = [[BiblicalPins alloc] init];
                                          hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
                                          hebron.title = @"Hebron";
                                          hebron.subtitle = @"David's Judahite Capital";
                                          hebron.image = [UIImage imageNamed:@"hebron"];
                                          hebron.information = @"\rOne of the oldest continually occupied cities in the world, Hebron is first mentioned in the biblical story-cycles of Abraham. In Genesis 23, Abraham buys Hebron from Ephron the Hittite for 400 sheckels. Abraham, Isaac, and Jacob are portrayed as buried there. Numbers 13:22 indicates that Hebron was founded around 1720 B.C. In the book of Judges, Joshua assigns Hebron to Caleb as part of the territory of Judah. In the book of 2 Samuel, David is annointed King of Judah and all Israel at Hebron.\r\r“All the tribes of Israel came to David at Hebron and said, 'We are your own flesh and blood. In the past, while Saul was king over us, you were the one who led Israel on their military campaigns. And the LORD said to you, ‘You will shepherd my people Israel, and you will become their ruler.’ When all the elders of Israel had come to King David at Hebron, the king made a covenant with them at Hebron before the LORD, and they anointed David king over Israel.”\r-2 Samuel 5: 1-3\r\rFurther Reference:\rNew American Bible Revised Edition\r2 Samuel 5, http://tinyurl.com/npwcn4a\r\rCoordinates:\r31.5333, 35.0950\r\r\r";

                                      
                                      
                                      
                                      
                                      NSArray *annotations = [NSArray arrayWithObjects:jerusalem, gehenna, dan, bethEl, temple, hazor,jericho, shiloh, hebron, nil];
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
                                       nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus (Acts 24:5).\r\rFurther Reference:\rPope John Paul II, Jubliee Pilgramage Homily on the Annunciation\rhttp://tinyurl.com/p4sjg9p\r\rWikipedia, “Nazareth”\rhttp://tinyurl.com/jojq76x\r\rCoordinates:\r32.7000, 35.3040\r\r\r";
                                   
                                   BiblicalPins *gehenna = [[BiblicalPins alloc] init];
                                   gehenna.coordinate = CLLocationCoordinate2DMake(31.768406, 35.230439);
                                   gehenna.title = @"Gehenna";
                                   gehenna.subtitle = @"The Valley of Ben-Hinnom";
                                   gehenna.image = [UIImage imageNamed:@"gehenna"];
                                   gehenna.information = @"\rGehenna was a valley, south of Jerusalem, where apostate Israelites would sacrifice their infants by burning them alive to worship the god Molech. It is mentioned several times in the Hebrew Scriptures. In Second Temple Judaism, it came to regarded as representative and a shorthand for everything evil and worthy of YHWH's punishment. This is the location that Jesus is portrayed as alluding to when he mentions Gehenna, which was later translated as “hell”.\r\rFurther Reference:\rWikipedia, “Gehenna”\rhttp://tinyurl.com/ymbj2d\r\r\rCoordinates: 31.768406, 35.230439";
                                   
                                   BiblicalPins *capernaum = [[BiblicalPins alloc] init];
                                   capernaum.coordinate = CLLocationCoordinate2DMake(32.8811, 35.5750);
                                   capernaum.title = @"Capernaum";
                                   capernaum.subtitle = @"Galilean Fishing Village";
                                   capernaum.image = [UIImage imageNamed:@"synagogue"];
                                   capernaum.information = @"\rAccording to the Gospel of Matthew, at the beginning of his public ministry, Jesus made his home in and conducting most of his preaching in the neighboring villages around Capernaum. The Synoptic Gospels Peter, Andrew, James, and John as being fisherman from this northern coastal city on the Sea of Galilee.\r\rFurther Reference:\rWikipedia, “Capernaum”\rhttp://tinyurl.com/oldmhj2\r\rCoordinates:\r32.8811, 35.5750\r\r\r";
                                   
                                       BiblicalPins *ephesus = [[BiblicalPins alloc] init];
                                       ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
                                       ephesus.title = @"Ephesus";
                                       ephesus.subtitle = @"Roman Provincial Captial of Asia";
                                       ephesus.image = [UIImage imageNamed:@"ephesus"];
                                       ephesus.information = @"\rEphesus was the base for St. Paul's European missionary journeys. A letter in his name is addressed to the Ephesians, although many scholars believe it was originally intended as a general letter since some early manuscripts omit the phrase “who are in Ephesus”. It is counted among the so-called disputed letters of St. Paul. It is noted for its appeal to unity:\r\r“I, then, a prisoner for the Lord, urge you to live in a manner worthy of the call you have received, with all humility and gentleness, with patience, bearing with one another through love, striving to preserve the unity of the spirit through the bond of peace: one body and one Spirit, as you were also called to the one hope of your call; one Lord, one faith, one baptism; one God and Father of all, who is over all and through all and in all.”\r-Ephesians 4: 1-6\r\rFurther Reference:\rNew American Bible Revised Edition\rEphesians 4, http://tinyurl.com/pfgw3mg\r\rCoordinates:\r37.9411, 27.3419\r\r\r";


                                   
                                       BiblicalPins *corinth = [[BiblicalPins alloc] init];
                                       corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
                                       corinth.title = @"Corinth";
                                       corinth.subtitle = @"Major Greek Port City";
                                       corinth.image = [UIImage imageNamed:@"corinth"];
                                       corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. The 2nd century Greek writer Pausanius gives a detailed description of Corinth in Book II of his 'Description of Greece':\r\r“Worth seeing here are a theater and a white-marble race-course. Within the sanctuary of the god stand on the one side portrait statues of athletes who have won victories at the Isthmian games, on the other side pine trees growing in a row, the greater number of them rising up straight. On the temple, which is not very large, stand bronze Tritons. In the fore-temple are images, two of Poseidon, a third of Amphitrite, and a Sea, which also is of bronze. The offerings inside were dedicated in our time by Herodes the Athenian, four horses, gilded except for the hoofs, which are of ivory..There is also an ancient sanctuary called the altar of the Cyclopes, and they sacrifice to the Cyclopes upon it.”\r-Description, 2.1.7-2.2.1\r\rSt. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition. In 1 Corinthians, St. Paul addresses both reports he has heard about the Corinthian church as well as a list of written questions presented to him via couriers. 1 Corinthians is famous for displaying St. Paul's ability to respond to new situations with Gospel-inspired principles. His instruction regarding food sacrificed to idols is illuminated in the context of Pausanius's description of Corinthian temples:\r\r“Now in regard to meat sacrificed to idols: we realize that 'all of us have knowledge'; knowledge inflates with pride, but love builds up. If anyone supposes he knows something, he does not yet know as he ought to know. But if one loves God, one is known by him. So about the eating of meat sacrificed to idols: we know that 'there is no idol in the world,' and that 'there is no God but one.' Indeed, even though there are so-called gods in heaven and on earth (there are, to be sure, many 'gods' and many 'lords'), yet for us there is one God, the Father, from whom all things are and for whom we exist, and one Lord, Jesus Christ, through whom all things are and through whom we exist.\r\rBut not all have this knowledge. There are some who have been so used to idolatry up until now that, when they eat meat sacrificed to idols, their conscience, which is weak, is defiled. Now food will not bring us closer to God. We are no worse off if we do not eat, nor are we better off if we do. But make sure that this liberty of yours in no way becomes a stumbling block to the weak. If someone sees you, with your knowledge, reclining at table in the temple of an idol, may not his conscience too, weak as it is, be 'built up' to eat the meat sacrificed to idols? Thus through your knowledge, the weak person is brought to destruction, the brother for whom Christ died. When you sin in this way against your brothers and wound their consciences, weak as they are, you are sinning against Christ. Therefore, if food causes my brother to sin, I will never eat meat again, so that I may not cause my brother to sin.”\r-1 Corinthians 8\r\rFurther Reference:\rPausanius, “Description of Greece”\rhttp://tinyurl.com/q6lxdl7\r\rNew American Bible Revised Edition\r1 Corinthians 8, http://tinyurl.com/qa83h5s\r\rCoordinates: 37.9333, 22.9333\r\r\r";

                                   
                                       BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
                                       thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
                                       thessalonica.title = @"Thessalonica";
                                       thessalonica.subtitle = @"Greek Coastal City";
                                       thessalonica.image = [UIImage imageNamed:@"thessalonica"];
                                       thessalonica.information = @"\rThessalonica (modern Thessaloniki) was home to one of the earlier Christian communities founded by the St. Paul. There are two New Testament letters addressed to this community, however only one of them (1 Thessalonians) is counted as authentically Pauline. The other (2 Thessalonians) is among the so-called disputed letters. 1 Thessalonians contains an reference to an earlier oral tradition of Jesus:\r\r“We do not want you to be unaware, brothers, about those who have fallen asleep, so that you may not grieve like the rest, who have no hope. For if we believe that Jesus died and rose, so too will God, through Jesus, bring with him those who have fallen asleep. Indeed, we tell you this, on the word of the Lord, that we who are alive, who are left until the coming of the Lord, will surely not precede those who have fallen asleep. For the Lord himself, with a word of command, with the voice of an archangel and with the trumpet of God, will come down from heaven, and the dead in Christ will rise first. Then we who are alive, who are left, will be caught up together with them in the clouds to meet the Lord in the air. Thus we shall always be with the Lord. Therefore, console one another with these words.” -1 Thessalonians 4: 13-18\r\rFurther Reference:\rNew American Standard Bible Revised Edition\r1 Thessalonians, http://tinyurl.com/obav3c6\r\rCoordinates:\r40.6500, 22.9000\r\r\r";
                                   
                                       BiblicalPins *philippi = [[BiblicalPins alloc] init];
                                       philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
                                       philippi.title = @"Philippi";
                                       philippi.subtitle = @"Major Greek City";
                                       philippi.image = [UIImage imageNamed:@"philippi"];
                                       philippi.information = @"\rAccording to Acts 16: 11-15, Philippi was a Roman colony in which both St. Paul and St. Barnabas conducted missionary work. Philippians contains what many scholars believe to be an early Christian hymn describing the Incarnation:\r\r“Have among yourselves the same attitude that is also yours in Christ Jesus, Who, though he was in the form of God did not regard equality with God something to be grasped. Rather, he emptied himself, taking the form of a slave, coming in human likeness; and found human in appearance, he humbled himself, becoming obedient to death, even death on a cross. Because of this, God greatly exalted him and bestowed on him the name that is above every name, that at the name of Jesus every knee should bend, of those in heaven and on earth and under the earth, and every tongue confess that Jesus Christ is Lord, to the glory of God the Father.”\r-Philippians 2: 5-11\r\rSee “Incarnation” in the Dictionary.\r\rFurther Reference:\rNew American Bible Revised Edition\rPhilippians 2, http://tinyurl.com/p4byh43\r\rCoordinates:\r41.0131, 24.2864\r\r\r";

                                   
                                       BiblicalPins *rome = [[BiblicalPins alloc] init];
                                       rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
                                       rome.title = @"Rome";
                                       rome.subtitle = @"Capital of the Roman Empire";
                                       rome.image = [UIImage imageNamed:@"rome-1"];
                                       rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. St. Paul wrote a letter to the Roman church towards the end of his missionary career. It is famous for laying out his thesis of righteousness through faith in Jesus Christ apart from the Law:\r\r“But now the righteousness of God has been manifested apart from the law, though testified to by the law and the prophets, the righteousness of God through faith in Jesus Christ for all who believe. For there is no distinction; all have sinned and are deprived of the glory of God. They are justified freely by his grace through the redemption in Christ Jesus, whom God set forth as an expiation, through faith, by his blood, to prove his righteousness because of the forgiveness of sins previously committed, through the forbearance of God—to prove his righteousness in the present time, that he might be righteous and justify the one who has faith in Jesus.”\r-Romans 3:21-26\r\rAccording to tradition, Sts. Peter and Paul were martyred there during the persecution under the Emperor Nero in A.D. 64. The Roman historian Tacitus recounts the circumstances of the arrests:\r\r“Consequently, to get rid of the report, Nero fastened the guilt and inflicted the most exquisite tortures on a class hated for their abominations, called Christians by the populace. Christus, from whom the name had its origin, suffered the extreme penalty during the reign of Tiberius at the hands of one of our procurators, Pontius Pilatus, and a most mischievous superstition, thus checked for the moment, again broke out not only in Judæa, the first source of the evil, but even in Rome, where all things hideous and shameful from every part of the world find their centre and become popular. Accordingly, an arrest was first made of all who pleaded guilty; then, upon their information, an immense multitude was convicted, not so much of the crime of firing the city, as of hatred against mankind. Mockery of every sort was added to their deaths. Covered with the skins of beasts, they were torn by dogs and perished, or were nailed to crosses, or were doomed to the flames and burnt, to serve as a nightly illumination, when daylight had expired.”\r-Annals, 15.44\r\rFurther Reference:\rNew American Bible Revised Edition\rRomans 3, http://tinyurl.com/ponhbaj\r\rTacitus, Annals Book XV\rhttp://tinyurl.com/nbwlrkw\r\rCoordinates:\r41.8900, 12.4938\r\r\r";

                                   
                                   BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
                                   jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
                                   jerusalem.title = @"Jerusalem";
                                   jerusalem.subtitle = @"Capital of the Davidic Dynasty";
                                   jerusalem.image = [UIImage imageNamed:@"jerusalem"];
                                   jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Judges 1:8 gives portrays a violent capture of the city by the sons of Judah. David eventually brought the Ark to Jerusalem from Keraith Jearim. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rFurther Reference:\rWikipedia, “Jerusalem”\rhttp://tinyurl.com/2f662p\r\rCoordinates:\r31.7883, 35.2167\r\r\r";

                                   
                                       BiblicalPins *colossae = [[BiblicalPins alloc] init];
                                       colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
                                       colossae.title = @"Colossae";
                                       colossae.subtitle = @"Greek City in the Lycus Valley";
                                       colossae.image = [UIImage imageNamed:@"colossae"];
                                       colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters. Like Philippians, it contains an early Christian hymn:\r\r“He is the image of the invisible God, the firstborn of all creation. For in him were created all things in heaven and on earth, the visible and the invisible, whether thrones or dominions or principalities or powers; all things were created through him and for him. He is before all things, and in him all things hold together. He is the head of the body, the church. He is the beginning, the firstborn from the dead, that in all things he himself might be preeminent. For in him all the fullness was pleased to dwell, and through him to reconcile all things for him, making peace by the blood of his cross [through him], whether those on earth or those in heaven.”\r-Colossians 1: 15-20\r\rFurther Refernce:\rNew American Bible Revised Edition\rColossians, http://tinyurl.com/qe6h9ur\r\rCoordinates:\r37.7878, 29.2615\r\r\r";

                                   
                                       BiblicalPins *temple = [[BiblicalPins alloc] init];
                                       temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                       temple.title = @"The Temple";
                                       temple.subtitle = @"The House of Yahweh";
                                       temple.image = [UIImage imageNamed:@"temple"];
                                       temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great before being destroyed again by the Roman army in A.D. 70.\r\rFurther Reference:\rPBS, “Recreating the Temple”\rhttp://tinyurl.com/jr83lcj\r\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
                                   
                                       BiblicalPins *antioch = [[BiblicalPins alloc] init];
                                       antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
                                       antioch.title = @"Antioch";
                                       antioch.subtitle = @"Capital of Ancient Syria";
                                       antioch.image = [UIImage imageNamed:@"antioch"];
                                       antioch.information = @"\rAntioch was a major center for Gentile Christianity in the first century as recorded in the Acts of the Apostles. St. Paul and St. Barnabas launched their missionary journeys from this city. The disciples of Jesus were first called Christians in Antioch (Acts 11:26).\r\r“Now those who had been scattered by the persecution that arose because of Stephen went as far as Phoenicia, Cyprus, and Antioch, preaching the word to no one but Jews. There were some Cypriots and Cyrenians among them, however, who came to Antioch and began to speak to the Greeks as well, proclaiming the Lord Jesus. The hand of the Lord was with them and a great number who believed turned to the Lord. The news about them reached the ears of the church in Jerusalem, and they sent Barnabas to Antioch. When he arrived and saw the grace of God, he rejoiced and encouraged them all to remain faithful to the Lord in firmness of heart, for he was a good man, filled with the holy Spirit and faith. And a large number of people was added to the Lord. Then he went to Tarsus to look for Saul, and when he had found him he brought him to Antioch. For a whole year they met with the church and taught a large number of people, and it was in Antioch that the disciples were first called 'Christians'.” - Acts 11: 19-26\r\rFurther Reference:\rNew American Bible Revised Edition\rActs 11, http://tinyurl.com/o3cm45r\r\rCoordinates:\r36.2000, 36.1500\r\r\r";

                                   
                                   BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
                                   bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
                                   bethlehem.title = @"Bethlehem";
                                   bethlehem.image = [UIImage imageNamed:@"bethlehem"];
                                   bethlehem.subtitle = @"Traditional Birthplace of Jesus";
                                   bethlehem.information = @"\rBethlehem is located just south of Jerusalem. While Matthew portrays Bethlehem as Joseph and Mary's hometown, Luke states that Nazareth was their hometown, which they left in order to be in Bethlehem for a census.\r\rFurther Reference:\rWikipedia, “Bethlehem”\rhttp://tinyurl.com/natjqkv\r\rCoordinates:\r31.7031, 35.1956\r\r\r";
                                   
                                       
                                       BiblicalPins *sepphoris = [[BiblicalPins alloc] init];
                                       sepphoris.coordinate = CLLocationCoordinate2DMake(32.7529, 35.2795);
                                       sepphoris.title = @"Sepphoris";
                                       sepphoris.subtitle = @"Capital of Herod Antipas";
                                       sepphoris.image = [UIImage imageNamed:@"sepphoris"];
                                       sepphoris.information = @"\rAlthough it is not mentioned in Scripture, Sepphoris was a major city in Galilee and the captial city of Herod Antipas. It is likely that Jesus of Nazareth worked in or around this city before beginning his prophetic ministry.\r\rFurther Reference:\rWikipedia, “Sepphoris”\rhttp://tinyurl.com/p38eyob\r\rCoordinates:\r32.7529, 35.2795\r\r\r";
                                       
                                       BiblicalPins *caesarea = [[BiblicalPins alloc] init];
                                       caesarea.coordinate = CLLocationCoordinate2DMake(32.5190, 34.9045);
                                       caesarea.title = @"Caesarea Maritima";
                                       caesarea.subtitle = @"Ancient Roman Sea Port";
                                       caesarea.image = [UIImage imageNamed:@"Caesarea"];
                                       caesarea.information = @"\rCaesarea Maritima was built by Herod the Great on the coast of Palestine and named in honor of Caesar Augustus. It later become the official residence of Roman procutators, such as Pontius Pilate. It boasted of an immense aqueduct that brought water from 7.5 kilometers away to the northeast, an amphitheater, a temple to Augustus, and, according to Josephus, the site of the Jewish act of civil disobedience in A.D. 26 in protest to Pilate's order to install Roman standards in the Temple. The New Testament book of Acts mentions Caesarea as one of the earliest missionary cities visited by the Apostles:\r\r“Now in Caesarea there was a man named Cornelius, a centurion of the Cohort called the Italica, devout and God-fearing along with his whole household, who used to give alms generously to the Jewish people and pray to God constantly. One afternoon about three o’clock, he saw plainly in a vision an angel of God come in to him and say to him, 'Cornelius.' He looked intently at him and, seized with fear, said, 'What is it, sir?' He said to him, 'Your prayers and almsgiving have ascended as a memorial offering before God. Now send some men to Joppa and summon one Simon who is called Peter. He is staying with another Simon, a tanner, who has a house by the sea.' When the angel who spoke to him had left, he called two of his servants and a devout soldier from his staff, explained everything to them, and sent them to Joppa.”\r-Acts 10:1-8\r\rJosephus gives a detailed account of the architecture of Caesarea in his book Antiquities of the Jews:\r\r “The city itself was called 'Caesarea', which was also itself built of fine materials, and was of a fine structure; nay, the very subterranean vaults and cellars had no less of architecture bestowed on them than had the buildings above ground. Some of these vaults carried things at even distances to the haven and to the sea; but one of them ran obliquely, and bound all the rest together, that both the rain and the filth of the citizens were together carried off with ease, and the sea itself, upon the flux of the tide from without, came into the city, and washed it all clean. Herod also built therein a theater of stone; and on the south quarter, behind the port, an amphitheater also, capable of holding a vast number of men, and conveniently situated for a prospect to the sea. So this city was thus finished in twelve years; during which time the king did not fail to go on both with the work, and to pay the charges that were necessary.”\r-Josephus, XV, 9\r\rJosephus later claimed that the desecration of a synogogue in Caesarea was the catalyst of a revolt that precipitated the First Jewish Revolt. Later, from A.D. 230-250, Caesarea became the intellectual home of the great church father, Origen. See ”Apostle”, ”Temple”.\r\rFurther Reference:\rNew American Bible Revised Edition, Acts 10\rhttp://tinyurl.com/zhlfhqb\r\rJosephus, “Antiquities of the Jews”\rhttp://tinyurl.com/j75tfyh\r\rThe Bible and Interpretation, “Caesarea Maritima”\rhttp://tinyurl.com/jcwyslc\r\rCoordinates: 32.5190, 34.9045\r\r\r";
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects: nazareth, ephesus, corinth, rome, thessalonica, philippi, capernaum, colossae, temple, jerusalem, antioch, bethlehem, sepphoris, gehenna, caesarea, nil];
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
                                   
                                   HistoricalPins *nicea = [[HistoricalPins alloc] init];
                                   nicea.coordinate = CLLocationCoordinate2DMake(40.4292, 29.7211);
                                   nicea.title = @"Nicea";
                                   nicea.image = [UIImage imageNamed:@"nicea"];
                                   nicea.subtitle = @"Ecumenical Councils I, VII";
                                   nicea.information = @"\rThe first Council of Nicea was called by the Emperor Constantine in A.D. 325. It condemned the teaching of Arius and declared that Christ is “of the same substance” (homoousious) as God.\r\rThe second Council of Nicea in A.D. 787 brought an end to the iconoclasm controversy by approving the veneration of icons. See “Homoousios” in the Historical category of the Dictionary tab.\r\rFurther Reference:\rWikipedia\r“First Council of Nicea” http://tinyurl.com/hd8cm\r“Second Council of Nicea” http://tinyurl.com/yf66az\r\rCoordinates:\r40.2574, 29.4317\r\r\r";
                                   
                                       HistoricalPins *alexandria = [[HistoricalPins alloc] init];
                                       alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
                                       alexandria.title = @"Alexandria";
                                       alexandria.subtitle = @"Eastern Patriarchate";
                                       alexandria.image = [UIImage imageNamed:@"alexandria"];
                                       alexandria.information = @"\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen and Clement of Alexandira. It was known for its highly allegorical hermeneutical method in contrast with that of Antioch. It later became one of 5 major centers of Christianity in the 4th century in the canons of the Nicene Council.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192\r\r\r";
                                   
                                       HistoricalPins *vatican = [[HistoricalPins alloc] init];
                                       vatican.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
                                       vatican.title = @"The Vatican";
                                       vatican.subtitle = @"Ecumenical Councils XX, XXI";
                                       vatican.image = [UIImage imageNamed:@"vatican"];
                                       vatican.information = @"\rThe First Vatican Council was convoked by Pope Pius IX and held session from 1868-1870. It's major themes were the condemnation of so-called “Modernism” and the definition of the nature of the Church, especially as it relates to the Papacy. In the context of this second point was the doctrine of Papal Infallibility. Vatican I only approved two dogmatic constitutions: the Dogmatic Constitution on the Catholic Faith and the Dogmatic Consititution on the Church of Christ. This latter constitution was the subject of some contention among the assembled bishops. The relevant text reads:\r\r“...we teach and define as a divinely revealed dogma that when the Roman pontiff speaks ex cathedra, that is, when, in the exercise of his office as shepherd and teacher of all Christians, in virtue of his supreme apostolic authority, he defines a doctrine concerning faith or morals to be held by the whole church, he possesses, by the divine assistance promised to him in blessed Peter, that infallibility which the divine Redeemer willed his church to enjoy in defining doctrine concerning faith or morals. Therefore, such definitions of the Roman pontiff are of themselves, and not by the consent of the church, irreformable.”\r-Vatican I, Pastor Aeternus, 9\r\rThe Second Vatican Council was convoked by Pope John XXIII and held session from 1962-1965. A major theme of the council was “aggiornomento”, or the updating of the Church in order to communicate the gospel more effectively to the 20th century. Among the changes introduced at Vatican II were the restoration of the liturgy in the vernacular and the the celebrant turned to face the congregation during the Eucharist. The council also acknowledged the profound scientific, technological, and other social changes that had occured:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis....The recent studies and findings of science, history and philosophy raise new questions which effect life and which demand new theological investigations. Furthermore, theologians, within the requirements and methods proper to theology, are invited to seek continually for more suitable ways of communicating doctrine to the men of their times; for the deposit of Faith or the truths are one thing and the manner in which they are enunciated, in the same meaning and understanding, is another.”\r-Vatican II, Gaudium et Spes, 5, 62.\r\rSee “Councils” in the Overview tab. See “Aggiornomento”, “Liturgy”, “Modernism” in the Dictionary tab.\r\rFurther Reference:\rDecrees and Canons of Vatican I\rhttp://tinyurl.com/zvdqu9u\r\rDocuments of Vatican II\rhttp://tinyurl.com/jmaxecg\r\rCoordinates:\r41.9022, 12.4533\r\r\r";
                                   
                                       HistoricalPins *constantinople = [[HistoricalPins alloc] init];
                                       constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
                                       constantinople.title = @"Constantinople";
                                       constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
                                       constantinople.image = [UIImage imageNamed:@"constantinople"];
                                       constantinople.information = @"\rThe 2nd and 5th Ecumenical Councils in A.D. 381 and 553, respectively, confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. The sixth in A.D. 680-681 condemned monothelitism, and the eighth in A.D. 869-870 deposed Photius and brought and end to the schism named after him. See the “Councils” section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\r“Third Council of Constantinople”\rhttp://tinyurl.com/oetzuo6\r\r“Fourth Council of Constantinople”\rhttp://tinyurl.com/pjc3kx2\r\rCoordinates:\r41.0122, 28.9760\r\r\r";
                             
                                   
                                   HistoricalPins *lyon = [[HistoricalPins alloc] init];
                                   lyon.coordinate = CLLocationCoordinate2DMake(45.7600, 4.8400);
                                   lyon.title = @"Lyon";
                                   lyon.subtitle = @"Ecumenical Councils XIII, XIV";
                                   lyon.image = [UIImage imageNamed:@"lyon"];
                                   lyon.information = @"\rThe first Council of Lyon was held in 1245 and was the thirteenth Ecumneical Council of the Church. It was called by Pope Innocent IV to excommunicate Frederick II and call for the 7th Crusade to reconquer the Holy Land. It also dealt with various disciplinary matters.\r\rThe second Council of Lyon was held from 1272-1274 and was the fourteenth Ecumenical Council of the Church. It was called by Pope Gregory X in order to fund the reconquest of the Holy Land and end the Great Schism with the Eastern Orthodox churches. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Lyon”\rhttp://tinyurl.com/msp95mv\r“Second Council of Lyon”\rhttp://tinyurl.com/my3aqa6\r\rCoordinates:\r45.7600, 4.8400\r\r\r";
                                   
                                   HistoricalPins *vienne = [[HistoricalPins alloc] init];
                                   vienne.coordinate = CLLocationCoordinate2DMake(46.5000, 0.5000);
                                   vienne.title = @"Vienne";
                                   vienne.subtitle = @"Ecumenical Council XV";
                                   vienne.image = [UIImage imageNamed:@"vienne"];
                                   vienne.information = @"\rThe Council of Vienne was held from 1311 to 1312 and is counted as the fifteenth ecumenical council by the Catholic Church. It was created by the papal bull of Clement V, Faciens Misericordiam, which called for an ecumenical council to create a new Crusade. The bull also established papal commissions to deal with charges against the Knights Templar. The Council also created Chairs of Hebrew, Aramaic, and Greek at the University of Paris. See Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Vienne”\rhttp://tinyurl.com/ldrffc7\r\rCoordinates:\r46.5000, 0.5000\r\r\r";
                                   
                                       HistoricalPins *chalcedon = [[HistoricalPins alloc] init];
                                       chalcedon.coordinate = CLLocationCoordinate2DMake(40.9833, 29.0333);
                                       chalcedon.title = @"Chalcedon";
                                       chalcedon.subtitle = @"Ecumencial Council IV";
                                       chalcedon.image = [UIImage imageNamed:@"chalcedon"];
                                       chalcedon.information = @"\rThe Council of Chalcedon was held in A.D. 451 and promulgated what would become the classical Christological definition of Jesus Christ as one person in two natures:\r\r“We, then, following the holy Fathers, all with one consent, teach people to confess one and the same Son, our Lord Jesus Christ, the same perfect in Godhead and also perfect in manhood; truly God and truly man, of a rational soul and body; consubstantial with the Father according to the Godhead, and consubstantial with us according to the Manhood; in all things like unto us, without sin; begotten before all ages of the Father according to the Godhead, and in these latter days, for us and for our salvation, born of the Virgin Mary, the Mother of God, according to the Manhood; one and the same Christ, Son, Lord, only begotten, to be acknowledged in two natures, inconfusedly, unchangeably, indivisibly, inseparably; (ἐν δύο φύσεσιν ἀσυγχύτως, ἀτρέπτως, ἀδιαιρέτως, ἀχωρίστως) the distinction of natures being by no means taken away by the union, but rather the property of each nature being preserved, and concurring in one Person (prosopon) and one Subsistence, not parted or divided into two persons, but one and the same Son, and only begotten God, the Word, the Lord Jesus Christ; as the prophets from the beginning [have declared] concerning Him, and the Lord Jesus Christ Himself has taught us, and the Creed of the holy Fathers has handed down to us.”\r\rSee the Councils section in the Overview tab.\r\rFurther Reference:\rCouncil of Chalcedon, Definition\rhttp://tinyurl.com/nhnxvro\r\rCoordinates:\r40.9833, 29.0333\r\r\r";
                                   
                                   HistoricalPins *constance = [[HistoricalPins alloc] init];
                                   constance.coordinate = CLLocationCoordinate2DMake(47.6633, 9.1769);
                                   constance.title = @"Constance";
                                   constance.subtitle = @"Ecumenical Council XVI";
                                   constance.image = [UIImage imageNamed:@"constance"];
                                   constance.information = @"\rThe Council of Constance was held from 1414 to 1418 and ended the so-called “Western Schism” and Avignon Papacy. It was the first Council to specifically advocate Conciliarism by claiming that even the Pope was subject to the decrees of an Ecumenical Council. However, the Pope elected by the Council, Martin V, did not confirm this statement. As such, it was not considered a binding teaching. The Council also condemned the teaching of John Wycliff and Jan Hus. See Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Constance”\rhttp://tinyurl.com/5upzc5\r\rCoordinates:\r47.6633, 9.1769\r\r\r";
                                   
                                   HistoricalPins *trent = [[HistoricalPins alloc] init];
                                   trent.coordinate = CLLocationCoordinate2DMake(46.0667, 11.1167);
                                   trent.title = @"Trent";
                                   trent.subtitle = @"Ecumenical Council XIX";
                                   trent.image = [UIImage imageNamed:@"trent"];
                                   trent.information = @"\rThe Council of Trent was in session from 1545 to 1563 in Trento, Italy. It was the most signficant Church Council since Nicea until Vatican II. It was called by Pope Paul III as a response to the Protestant Reformation, and consolidated many elements of Catholic teaching, including Sacraments, Latin as the official language of the Church, and the Breviary. The Tridentine Mass became the ordinary form of the Mass until the developments of Vatican II. See Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Trent”\rhttp://tinyurl.com/5t586h\r\rCoordinates:\r46.0667, 11.1167\r\r\r";
                                   
                                   HistoricalPins *florence = [[HistoricalPins alloc] init];
                                   florence.coordinate = CLLocationCoordinate2DMake(43.7833, 11.2500);
                                   florence.title = @"Florence";
                                   florence.subtitle = @"Ecumenical Council XVII";
                                   florence.image = [UIImage imageNamed:@"florence"];
                                   florence.information = @"\rInitially convoked by Pope Martin V as the Council of Basel in 1431, the council was moved to Ferrara, and then finally to Florence after a series of political events and the election of an anti-pope. The Council of Florence negotiated reunion with some Eastern churches and established the Filique clause in the Nicene Creed. It also established Papal primacy over an ecumenical council, which was a departure from the previous Council of Constance. See “Filioque”, “Nicene Creed”. See “Councils” section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Florence”\rhttp://tinyurl.com/o2t9hxd\r\rCoordinates:\r43.7833, 11.2500\r\r\r";
                                   
                                   HistoricalPins *lateran = [[HistoricalPins alloc] init];
                                   lateran.coordinate = CLLocationCoordinate2DMake(41.885906, 12.506156);
                                   lateran.title = @"St. John Lateran";
                                   lateran.subtitle = @"Ecumenical Councils IX, X, XI, XII";
                                   lateran.image = [UIImage imageNamed:@"lateran"];
                                   lateran.information = @"\rThe First Lateran Council in 1123 was convoked by Pope Callixtus II and did not deal with doctrinal questions. Instead, it promulgated a series of clerical reforms such as the prohibition of Simony and cohabitation with non-familial women.\r\rThe second Lateran Council was convoked by Pope Innocent II in 1139 dealt with the schism initated by the antipope Anicletus II.\r\rThe Third Lateran Council in 1179 was convoked by Pope Alexander III and put an end to the schism caused by the election of two antipopes. Notably, it also decreed that only Cardinals could elect a Pope by a two-thirds majority. It also excommunicated anyone who engaged in usury.\r\rThe Fourth Lateran Council was convoked by Innocent III and began in 1215. It was notable for its large number of attendees, its organization of the Fifth Crusade, as well as the decree that Jews and Muslims be required to wear special clothing. See “Councils” section in the Overview tab.\r\rFurther Refernce:\rWikipedia, “First Council of the Lateran”\rhttp://tinyurl.com/o7w4qna\r\r“Second Council of the Lateran”\rhttp://tinyurl.com/o7rnua5\r\r“Third Council of the Lateran”\rhttp://tinyurl.com/ogkpnwz\r\r“Fourth Council of the Lateran”\rhttp://tinyurl.com/nzjtd9f\r\rCoordinates:\r43.7833, 11.2500\r\r\r";
                                   
                                   HistoricalPins *ephesus2 = [[HistoricalPins alloc] init];
                                   ephesus2.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3500);
                                   ephesus2.title = @"Ephesus";
                                   ephesus2.subtitle = @"Ecumencial Council III";
                                   ephesus2.image = [UIImage imageNamed:@"ephesus2"];
                                   ephesus2.information = @"\rThe Council of Ephesus was called in A.D. 431 by the Roman Emperor Theodosius II. It condemned the teaching of Nestorius, who denied the principle of Communicatio Idiomatum by claiming that the Virgin Mary was the mother of Christ but not of God. The Council taught that the Virgin Mary was “Theotokos”: God-bearer. \r\rFurther Reference:\rWikipedia, “Council of Ephesus”\rhttp://tinyurl.com/mrmvuaw\r\rCoordinates:\r37.9411, 27.3500\r\r\r";


                                   
                                   
                                   
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects:nicea, alexandria, vatican, constantinople, lyon, vienne, chalcedon, constance, trent, florence,lateran, ephesus2, nil];
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
                                     
                                     SocialPins *greenland = [[SocialPins alloc] init];
                                     greenland.coordinate = CLLocationCoordinate2DMake(61.2950, -45.0000);
                                     greenland.title = @"Greenland";
                                     greenland.subtitle = @"Accelerated Glacial Melting";
                                     greenland.image = [UIImage imageNamed:@"greenland"];
                                     greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. Glacial melt intensifies global warming by releasing increased amounts of previously trapped carbon into the atmosphere. Pope Francis has identified the risk to glaciers from climate change by stating:\r\r“Warming has effects on the carbon cycle. It creates a vicious circle which aggravates the situation even more, affecting the availability of essential resources like drinking water, energy and agricultural production in warmer regions, and leading to the extinction of part of the planet’s biodiversity. The melting in the polar ice caps and in high altitude plains can lead to the dangerous release of methane gas, while the decomposition of frozen organic material can further increase the emission of carbon dioxide. Things are made worse by the loss of tropical forests which would otherwise help to mitigate climate change. Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas.” -Laudato Si, 24\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rCatholic Climate Movement\rhttp://tinyurl.com/lxe52t7\r\rNational Snow & Ice Data Center\r“Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000\r\r\r";
                                     
                                     SocialPins *greatbr = [[SocialPins alloc] init];
                                     greatbr.coordinate = CLLocationCoordinate2DMake(-18.2861, 147.7000);
                                     greatbr.title = @"Great Barrier Reef";
                                     greatbr.subtitle = @"Threatened Coral Ecosystem";
                                     greatbr.image = [UIImage imageNamed:@"barrier"];
                                     greatbr.information = @"\rAustralia's Great Barrier Reef is the world's largest coral ecosystem. Climate change is putting many elements of the reef under threat. Pope Francis emphasized the importance of safeguarding coral reef systems when he stated:\r\r“In tropical and subtropical seas, we find coral reefs comparable to the great forests on dry land, for they shelter approximately a million species, including fish, crabs, molluscs, sponges and algae. Many of the world’s coral reefs are already barren or in a state of constant decline. ‘Who turned the wonderworld of the seas into underwater cemeteries bereft of colour and life?’ This phenomenon is due largely to pollution which reaches the sea as the result of deforestation, agricultural monocultures, industrial waste and destructive fishing methods, especially those using cyanide and dynamite. It is aggravated by the rise in temperature of the oceans. All of this helps us to see that every intervention in nature can have consequences which are not immediately evident, and that certain ways of exploiting resources prove costly in terms of degradation which ultimately reaches the ocean bed itself.” -Laudato Si, 41\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rCatholic Bishops of Queensland, “Pastoral Letter on the Great Barrier Reef”\rhttp://tinyurl.com/one2fma\r\rCatholic Care Australia\rhttp://catholicearthcare.org.au\r\rCoordinates:\r18.2861, 147.7000\r\r\r";
                                     
                                     SocialPins *philippines = [[SocialPins alloc] init];
                                     philippines.coordinate = CLLocationCoordinate2DMake(13.1333, 123.7333);
                                     philippines.title = @"Legazpi City";
                                     philippines.subtitle = @"Carbon Mining Coastal Destruction";
                                     philippines.image = [UIImage imageNamed:@"legazpi"];
                                     philippines.information = @"\rThe coast of Legazpi City, Philippines, is suffering from the effects of carbon mining. Pope Francis hightlighted the importance of addressing human intensification of the carbon cycle when he stated:\r\r“Climate change is a global problem with grave implications: environmental, social, economic, political and for the distribution of goods. It represents one of the principal challenges facing humanity in our day. Its worst impact will probably be felt by developing countries in coming decades. Many of the poor live in areas particularly affected by phenomena related to warming, and their means of subsistence are largely dependent on natural reserves and ecosystemic services such as agriculture, fishing and forestry. They have no other financial activities or resources which can enable them to adapt to climate change or to face natural disasters, and their access to social services and protection is very limited. For example, changes in climate, to which animals and plants cannot adapt, lead them to migrate; this in turn affects the livelihood of the poor, who are then forced to leave their homes, with great uncertainty for their future and that of their children. There has been a tragic rise in the number of migrants seeking to flee from the growing poverty caused by environmental degradation. They are not recognized by international conventions as refugees; they bear the loss of the lives they have left behind, without enjoying any legal protection whatsoever.” -Laudato Si, 25\r\rFurther Refernce\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rCoordinates:\r13.1333, 123.7333\r\r\r";

                                     
                                         SocialPins *sierraLeone = [[SocialPins alloc] init];
                                         sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
                                         sierraLeone.title = @"Freetown";
                                         sierraLeone.subtitle = @"Insufficient Health Care";
                                         sierraLeone.image = [UIImage imageNamed:@"sierra"];
                                         sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014. The city's and larger country's health care infrastructure was devastated by the civil war from 1991-2002.\r\rWikipedia, “Sierra Leone”\rhttp://tinyurl.com/m7ql8\r\rCoordinates: 8.4844, -13.2344\r\r\r";

                                     
                                     SocialPins *camden = [[SocialPins alloc] init];
                                     camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
                                     camden.title = @"Camden, NJ";
                                     camden.subtitle = @"Systemic Unemployment & Poverty";
                                     camden.image = [UIImage imageNamed:@"camden"];
                                     camden.information = @"\rIn 2012 Camden, NJ was ranked by the U.S. Census Bureau as the poorest city in the United States per capita as well as the most dangerous, being equally ranked as the crime capital of the United States. Fr. Jeff Putthoff is trying to help provide otherwise absent opportunities for many of the youth in Camden. He is the creator and director of HopeWorks, a non-profit, youth development program that trains young people in the use of and design of technologies such as Web design:\r\r“Hopeworks 'N Camden uses education, technology and entrepreneurship to partner with young men and women as they identify and earn a sustainable future. Together we seize the opportunity to heal and thrive in the midst of violence and poverty. Hopeworks 'N Camden is a nonprofit that has been working for over 15 years with Camden youth. Utilizing an advanced training curriculum in web site design/development, GIS and Salesforce, Hopeworks works with youth 14­-23 to get back in school and find a safe pathway to their future. Healing communities by creating safe pathways through which we own our histories and discover new choices. Hopeworks 'N Camden uses education, technology and entrepreneurship to partner with young men and women as they identify and earn a sustainable future. Together we seize the opportunity to heal and thrive in the midst of violence and poverty. Hopeworks 'N Camden is a nonprofit that has been working for over 15 years with Camden youth. Utilizing an advanced training curriculum in web site design/development, GIS and Salesforce, Hopeworks works with youth 14­-23 to get back in school and find a safe pathway to their future.”\r\rFurther Reference:\rHopeWorks, http://www.hopeworks.org\r\rWikipedia, “Camden, NJ”\rhttp://tinyurl.com/bmuvoem\r\rCoordinates: 39.9400, -75.1050\r\r\r";
                                     
                                     SocialPins *atlantic = [[SocialPins alloc] init];
                                     atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
                                     atlantic.title = @"The Atlantic Ocean";
                                     atlantic.subtitle = @"Rising Water Levels";
                                     atlantic.image = [UIImage imageNamed:@"ocean"];
                                     atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization. Pope Francis emphasized the importance of maintaining the health of the world's oceans when he stated:\r\r“Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas...Oceans not only contain the bulk of our planet’s water supply, but also most of the immense variety of living creatures, many of them still unknown to us and threatened for various reasons. What is more, marine life in rivers, lakes, seas and oceans, which feeds a great part of the world’s population, is affected by uncontrolled fishing, leading to a drastic depletion of certain species. Selective forms of fishing which discard much of what they collect continue unabated. Particularly threatened are marine organisms which we tend to overlook, like some forms of plankton; they represent a significant element in the ocean food chain, and species used for our food ultimately depend on them.” -Laudato Si, 24, 40\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rWikipedia, “Atlantic Ocean”\rhttp://tinyurl.com/sea3p\r\rCoordinates: 38.4667, -28.4000\r\r\r";
                                     
                                     SocialPins *palestine = [[SocialPins alloc] init];
                                     palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
                                     palestine.title = @"Palestine";
                                     palestine.image = [UIImage imageNamed:@"palestine"];
                                     palestine.subtitle = @"Occupied Territory";
                                     palestine.information = @"\rSince the creation of the state of Israel in 1948, Palestinians have been without statehood. The Vatican recently officially recognized the State of Palestine even though such recognition is absent in the United Nations and other governments.\r\rFurther Reference:\rVatican, Joint Statement of the Bilateral Commission of the Holy See and the State of Palestine\rhttp://tinyurl.com/okb4f9b\r\rCoordinates:\r31.6253, 35.1453\r\r\r";

                                     
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
                                     uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev\r\rCoordinates: 1.0667, 31.8833\r\r\r";
                                     
                                     SocialPins *asheville = [[SocialPins alloc] init];
                                     asheville.coordinate = CLLocationCoordinate2DMake(35.5800, -82.5558);
                                     asheville.title = @"St. Eugene Church";
                                     asheville.subtitle = @"Renewable Energy Exemplar";
                                     asheville.image = [UIImage imageNamed:@"StEugene"];
                                     asheville.image = [UIImage imageNamed:@"StEugene"];
                                     asheville.information = @"\rSt. Eugene Church in Asheville, North Carolina, recently commited to using 100% renewable energy in the form of solar panels. These will sigificantly reduce its monthly energy bill.\r\rFurther Reference:\rSt. Eugene Church, www.steugene.org\rhttp://tinyurl.com/ofblbtf\r\r\r";
                                         
                                         SocialPins *burma = [[SocialPins alloc] init];
                                         burma.coordinate = CLLocationCoordinate2DMake(22.0000,  96.0000);
                                         burma.title = @"Burma";
                                         burma.subtitle = @"Religous Freedom Violations";
                                         burma.image = [UIImage imageNamed:@"Burma"];
                                         burma.information = @"\rBurma was categorized as a Tier 1 violator of religious freedom by the United States Commission on International Religious Freedom in 2015.\r\rFurther Reference:\rUSCIRF, Annual Report 2015\rhttp://tinyurl.com/m34ndev\r\r\r";
                                     
                                     SocialPins *cali = [[SocialPins alloc] init];
                                     cali.coordinate = CLLocationCoordinate2DMake(37.0000, -120.0000);
                                     cali.title = @"California";
                                     cali.subtitle = @"Catastrophic Drought";
                                     cali.image = [UIImage imageNamed:@"drought"];
                                     cali.information = @"\rIn 2015, California experienced an unprecedented drought which caused the state to implement mandatory water restrictions. Scientists attribute the severtity of the drought to the effects of climate change. Pope Francis highlighted the importance of water for human life and development, when he stated:\r\r“Fresh drinking water is an issue of primary importance, since it is indispensable for human life and for supporting terrestrial and aquatic ecosystems. Sources of fresh water are necessary for health care, agriculture and industry. Water supplies used to be relatively constant, but now in many places demand exceeds the sustainable supply, with dramatic consequences in the short and long term.” -Laudato Si, 28.\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rState of California, “Drought”\rhttp://tinyurl.com/prczpha\r\rCoordinates:\r37.0000, 120.0000\r\r\r";
                                     
                                     SocialPins *amazon = [[SocialPins alloc] init];
                                     amazon.coordinate = CLLocationCoordinate2DMake(-3.1600, -60.0300);
                                     amazon.title = @"Amazon Rain Forest";
                                     amazon.subtitle = @"Increasing Deforestation";
                                     amazon.image = [UIImage imageNamed:@"amazon"];
                                     amazon.information = @"\rThe Amazon Rain Forest is a vital eco-system of the South American continent. Pope Francis emphasized the importance of this and similar ecosystems for human development when he stated:\r\r“Let us mention, for example, those richly biodiverse lungs of our planet which are the Amazon and the Congo basins, or the great aquifers and glaciers. We know how important these are for the entire earth and for the future of humanity. The ecosystems of tropical forests possess an enormously complex biodiversity which is almost impossible to appreciate fully, yet when these forests are burned down or levelled for purposes of cultivation, within the space of a few years countless species are lost and the areas frequently become arid wastelands. A delicate balance has to be maintained when speaking about these places, for we cannot overlook the huge global economic interests which, under the guise of protecting them, can undermine the sovereignty of individual nations.” -Laudato Si, 38\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rNature, “Stopping Deforestation: Battle for the Amazon”. http://tinyurl.com/ngqjb5q\r\rCoordinates:\r-3.1600, 60.0300\r\r\r";
                                     
                                     SocialPins *texas = [[SocialPins alloc] init];
                                     texas.coordinate = CLLocationCoordinate2DMake(31.0000, -100.0000);
                                     texas.title = @"Texas";
                                     texas.subtitle = @"Leads U.S. in Capital Punishment";
                                     texas.image = [UIImage imageNamed:@"texas"];
                                     texas.information = @"\rWhile numerous states have abolished the death penalty, Texas' rate of execution remains the highest in the nation. Various social groups, such as the Innocence Project, are aimed at abolishing the death penalty in Texas and throughout the country.\r\rFurther Reference:\rThe Innocence Project\rhttp://innocenceproject.org\r\r\r";
                                         
                                         SocialPins *gitmo = [[SocialPins alloc] init];
                                         gitmo.coordinate = CLLocationCoordinate2DMake(19.9000, -75.1500);
                                         gitmo.title = @"Guantanamo Bay";
                                         gitmo.subtitle = @"Enemy Combatant Detention Camp";
                                         gitmo.image = [UIImage imageNamed:@"gitmo"];
                                         gitmo.information = @"\rAfter the 9/11 terrorist attacks on the United States, the U.S. government initiated a policy of detaining foreign nationals who were suspected of being terrorists or supplying material support to terrorist networks. This was controversial because detainees were not classified as prisoners of war and were deprived of the right to habius corpus, effectively allowing indefinite detention without trial. Subsequent news stories and a report by the United States Senate confirmed that torture had been practiced in the prison:\r\r“...CIA personnel, aided by two outside contractors, decided to initiate a program of indefinite secret detention and the use of brutal interrogation techniques in violation of U.S. law, treaty obligations, and our values.”\r-Senate Report, 2\r\rThe United States Conference of Catholic Bishops have written extensively the the U.S. Congress to share the concern of the Church in America on that reported events at Guantanamo:\r\r“Detainees have the right to a just and fair trial held in a timely manner. For at least 86 detainees 'a crime has not first been proven.' The indefinite detention of detainees is not only injurious to those individuals, it also wounds the moral reputation of our nation, compromises our commitment to the rule of law, and undermines our struggle against terrorism.”\r-USCCB, Letter\r\rFurther Reference:\r\rSenate Select Committee on Intelligence,\rStudy of CIA Detention and Interrogation Program\rhttp://tinyurl.com/zz6fn67\r\rUnited States Conference of Catholic Bishops,\rLetter Regarding Detainees at Guantanamo Bay\rhttp://tinyurl.com/hju2a87\r\rCoordinates: 19.9000, -75.1500\r\r\r";
                                     
                                     
                                     NSArray *annotations = [NSArray arrayWithObjects:greenland, greatbr, philippines, sierraLeone, camden, atlantic, palestine, israel, uganda, asheville, burma, cali, amazon, texas, gitmo, nil];
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
                                   
                                       BiblicalPins *jerusalem = [[BiblicalPins alloc] init];
                                       jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
                                       jerusalem.title = @"Jerusalem";
                                       jerusalem.subtitle = @"Capital of the Davidic Dynasty";
                                       jerusalem.image = [UIImage imageNamed:@"jerusalem"];
                                       jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Judges 1:8 gives portrays a violent capture of the city by the sons of Judah. David eventually brought the Ark to Jerusalem from Keraith Jearim. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rFurther Reference:\rBiblical Archology Society, “Jerusalem”\rhttp://tinyurl.com/okx3c8r\r\rCoordinates:\r31.7883, 35.2167\r\r\r";
                                       
                                       BiblicalPins *gehenna = [[BiblicalPins alloc] init];
                                       gehenna.coordinate = CLLocationCoordinate2DMake(31.768406, 35.230439);
                                       gehenna.title = @"Gehenna";
                                       gehenna.subtitle = @"the Valley of Ben-Hinnom";
                                       gehenna.image = [UIImage imageNamed:@"gehenna"];
                                       gehenna.information = @"\rGehenna was a valley, south of Jerusalem, where apostate Israelites would sacrifice their infants by burning them alive to worship the god Molech. 2 Kings 23 describes King Josiah destroying the shrine as part of his larger Deuteronomic Reform:\r\r10“The king also defiled Topheth in the Valley of Ben-hinnom, so that there would no longer be any immolation of sons or daughters by fire in honor of Molech.”\r\rLater, in Second Temple Judaism, it came to regarded as representative and a shorthand for everything evil and worthy of YHWH's punishment; a metonym for “hell”. This is the location and concept which Jesus mentions several times in the Synoptic Gospels. See “Second Temple Judaism”, “Synoptic Gospels” in the Dictionary tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 1034\rhttp://tinyurl.com/k3f2f8p\r\rNew American Bible Revised Edition\r2 Kings 23\rhttp://tinyurl.com/pkdkn5n\r\rCoordinates: 31.768406, 35.230439\r\r\r";
                                       
                                       BiblicalPins *rome = [[BiblicalPins alloc] init];
                                       rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
                                       rome.title = @"Rome";
                                       rome.subtitle = @"Capital of the Roman Empire";
                                       rome.image = [UIImage imageNamed:@"rome-1"];
                                       rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. St. Paul wrote a letter to the Roman church towards the end of his missionary career. It is famous for laying out his thesis of righteousness through faith in Jesus Christ apart from the Law:\r\r“But now the righteousness of God has been manifested apart from the law, though testified to by the law and the prophets, the righteousness of God through faith in Jesus Christ for all who believe. For there is no distinction; all have sinned and are deprived of the glory of God. They are justified freely by his grace through the redemption in Christ Jesus, whom God set forth as an expiation, through faith, by his blood, to prove his righteousness because of the forgiveness of sins previously committed, through the forbearance of God—to prove his righteousness in the present time, that he might be righteous and justify the one who has faith in Jesus.”\r-Romans 3:21-26\r\rAccording to tradition, Sts. Peter and Paul were martyred there during the persecution under the Emperor Nero in A.D. 64. The Roman historian Tacitus recounts the circumstances of the arrests:\r\r“Consequently, to get rid of the report, Nero fastened the guilt and inflicted the most exquisite tortures on a class hated for their abominations, called Christians by the populace. Christus, from whom the name had its origin, suffered the extreme penalty during the reign of Tiberius at the hands of one of our procurators, Pontius Pilatus, and a most mischievous superstition, thus checked for the moment, again broke out not only in Judæa, the first source of the evil, but even in Rome, where all things hideous and shameful from every part of the world find their centre and become popular. Accordingly, an arrest was first made of all who pleaded guilty; then, upon their information, an immense multitude was convicted, not so much of the crime of firing the city, as of hatred against mankind. Mockery of every sort was added to their deaths. Covered with the skins of beasts, they were torn by dogs and perished, or were nailed to crosses, or were doomed to the flames and burnt, to serve as a nightly illumination, when daylight had expired.”\r-Annals, 15.44\r\rFurther Reference:\rNew American Bible Revised Edition\rRomans, http://tinyurl.com/ouynwe5\r\rTacitus, Annals Book XV\rhttp://tinyurl.com/nbwlrkw\r\rCoordinates:\r41.8900, 12.4938\r\r\r";
                                       
                                       BiblicalPins *nazareth = [[BiblicalPins alloc] init];
                                       nazareth.coordinate = CLLocationCoordinate2DMake(32.7000, 35.3040);
                                       nazareth.title = @"Nazareth";
                                       nazareth.subtitle = @"Traditional Hometown of Jesus";
                                       nazareth.image = [UIImage imageNamed:@"nazareth"];
                                       nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus (Acts 24:5).\r\rFurther Reference:\rPope John Paul II, Jubliee Pilgramage Homily on the Annunciation\rhttp://tinyurl.com/p4sjg9p\r\rWikipedia, “Nazareth”\rhttp://tinyurl.com/jojq76x\r\rCoordinates:\r32.7000, 35.3040\r\r\r";
                                       
                                       BiblicalPins *bethEl = [[BiblicalPins alloc] init];
                                       bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
                                       bethEl.title = @"Beth-El";
                                       bethEl.subtitle = @"Southern Israelite Cultic Site";
                                       bethEl.image = [UIImage imageNamed:@"bethel"];
                                       bethEl.information = @"\rMeaning “House of God”, Beth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon prior to the emergence of Israel. In Genesis 28 it is associated with the Hebrew patriarch Jacob:\r\r“When Jacob awoke from his sleep, he said, 'Truly, the Lord is in this place and I did not know it!' He was afraid and said: 'How awesome this place is! This is nothing else but the house of God, the gateway to heaven!' Early the next morning Jacob took the stone that he had put under his head, set it up as a sacred pillar, and poured oil on top of it. He named that place Beth-El, whereas the former name of the town had been Luz.”\r-Genesis 28: 16-19\r\rLater in 1 Kings, Bethel becomes one of two alternative worship sites established by King Jeroboam of the Northern Kingdom:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Bethel, the other in Dan. This led to sin, because the people frequented these calves in Bethel and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r-1 Kings 12: 28-31\r\rArcheologist Israel Finkelstein claims that its pottery evidence suggests that Beth-El was actually deserted during the reign of Jeroboam I:\r\r“Bethel is the other site mentioned in 1 Kgs 12:29 as a cult place that was erected by Jeroboam I. The mound at the village of Beitin east of Ramallah, the location of biblical Bethel, was thoroughly excavated in the 1930s and 1950s. A comprehensive investigation of the finds from this dig, stored in Jerusalem and Pittsburgh, also cast doubt on the historicity of this verse. This investigation revealed that most of the Iron IIA pottery types known from sites in the vicinity, for example, Stratum 14 in the City of David in Jerusalem, are rare or absent at Bethel and that there are no diagnostic early Iron IIA items at the site (Finkelstein and Singer-Avitz 2009). In other words, Bethel, too, produced no clear indication of activity in the time of Jeroboam I.”\r-Finkelstein, 74\r\rSee “Dan”.\r\rFurther Reference:\rNew American Bible Revised Edition\rGenesis 28, http://tinyurl.com/joct23k\r\r1 Kings 12, http://tinyurl.com/qhd4nug\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rCoordinates:\r31.9390, 35.2260\r\r\r";
                                       
                                       BiblicalPins *capernaum = [[BiblicalPins alloc] init];
                                       capernaum.coordinate = CLLocationCoordinate2DMake(32.8811, 35.5750);
                                       capernaum.title = @"Capernaum";
                                       capernaum.subtitle = @"Galilean Fishing Village";
                                       capernaum.image = [UIImage imageNamed:@"synagogue"];
                                       capernaum.information = @"\rAccording to the Gospel of Matthew, at the beginning of his public ministry, Jesus made his home in and conducting most of his preaching in the neighboring villages around Capernaum. The Synoptic Gospels Peter, Andrew, James, and John as being fisherman from this northern coastal city on the Sea of Galilee.\r\rFurther Reference:\rWikipedia, “Capernaum”\rhttp://tinyurl.com/oldmhj2\r\rCoordinates:\r32.8811, 35.5750\r\r\r";
                                       
                                       BiblicalPins *ephesus = [[BiblicalPins alloc] init];
                                       ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
                                       ephesus.title = @"Ephesus";
                                       ephesus.subtitle = @"Roman Provincial Captial of Asia";
                                       ephesus.image = [UIImage imageNamed:@"ephesus"];
                                       ephesus.information = @"\rEphesus was the base for St. Paul's European missionary journeys. A letter in his name is addressed to the Ephesians, although many scholars believe it was originally intended as a general letter since some early manuscripts omit the phrase “who are in Ephesus”. It is counted among the so-called disputed letters of St. Paul. It is noted for its appeal to unity:\r\r“I, then, a prisoner for the Lord, urge you to live in a manner worthy of the call you have received, with all humility and gentleness, with patience, bearing with one another through love, striving to preserve the unity of the spirit through the bond of peace: one body and one Spirit, as you were also called to the one hope of your call; one Lord, one faith, one baptism; one God and Father of all, who is over all and through all and in all.”\r-Ephesians 4: 1-6\r\rFurther Reference:\rNew American Bible Revised Edition\rEphesians, http://tinyurl.com/pfgw3mg\r\rCoordinates:\r37.9411, 27.3419\r\r\r";
                                       
                                       BiblicalPins *corinth = [[BiblicalPins alloc] init];
                                       corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
                                       corinth.title = @"Corinth";
                                       corinth.subtitle = @"Major Greek Port City";
                                       corinth.image = [UIImage imageNamed:@"corinth"];
                                       corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. The 2nd century Greek writer Pausanius gives a detailed description of Corinth in Book II of his 'Description of Greece':\r\r“Worth seeing here are a theater and a white-marble race-course. Within the sanctuary of the god stand on the one side portrait statues of athletes who have won victories at the Isthmian games, on the other side pine trees growing in a row, the greater number of them rising up straight. On the temple, which is not very large, stand bronze Tritons. In the fore-temple are images, two of Poseidon, a third of Amphitrite, and a Sea, which also is of bronze. The offerings inside were dedicated in our time by Herodes the Athenian, four horses, gilded except for the hoofs, which are of ivory..There is also an ancient sanctuary called the altar of the Cyclopes, and they sacrifice to the Cyclopes upon it.”\r-Description, 2.1.7-2.2.1\r\rSt. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition. In 1 Corinthians, St. Paul addresses both reports he has heard about the Corinthian church as well as a list of written questions presented to him via couriers. 1 Corinthians is famous for displaying St. Paul's ability to respond to new situations with Gospel-inspired principles. His instruction regarding food sacrificed to idols is illuminated in the context of Pausanius's description of Corinthian temples:\r\r“Now in regard to meat sacrificed to idols: we realize that 'all of us have knowledge'; knowledge inflates with pride, but love builds up. If anyone supposes he knows something, he does not yet know as he ought to know. But if one loves God, one is known by him. So about the eating of meat sacrificed to idols: we know that 'there is no idol in the world,' and that 'there is no God but one.' Indeed, even though there are so-called gods in heaven and on earth (there are, to be sure, many 'gods' and many 'lords'), yet for us there is one God, the Father, from whom all things are and for whom we exist, and one Lord, Jesus Christ, through whom all things are and through whom we exist.\r\rBut not all have this knowledge. There are some who have been so used to idolatry up until now that, when they eat meat sacrificed to idols, their conscience, which is weak, is defiled. Now food will not bring us closer to God. We are no worse off if we do not eat, nor are we better off if we do. But make sure that this liberty of yours in no way becomes a stumbling block to the weak. If someone sees you, with your knowledge, reclining at table in the temple of an idol, may not his conscience too, weak as it is, be 'built up' to eat the meat sacrificed to idols? Thus through your knowledge, the weak person is brought to destruction, the brother for whom Christ died. When you sin in this way against your brothers and wound their consciences, weak as they are, you are sinning against Christ. Therefore, if food causes my brother to sin, I will never eat meat again, so that I may not cause my brother to sin.”\r-1 Corinthians 8\r\rFurther Reference:\rPausanius, “Description of Greece”\rhttp://tinyurl.com/q6lxdl7\r\rNew American Bible Revised Edition\r1 Corinthians 8, http://tinyurl.com/qa83h5s\r\rCoordinates: 37.9333, 22.9333\r\r\r";
                                       
                                       BiblicalPins *colossae = [[BiblicalPins alloc] init];
                                       colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
                                       colossae.title = @"Colossae";
                                       colossae.subtitle = @"Greek City in the Lycus Valley";
                                       colossae.image = [UIImage imageNamed:@"colossae"];
                                       colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters. Like Philippians, it contains an early Christian hymn:\r\r“He is the image of the invisible God, the firstborn of all creation. For in him were created all things in heaven and on earth, the visible and the invisible, whether thrones or dominions or principalities or powers; all things were created through him and for him. He is before all things, and in him all things hold together. He is the head of the body, the church. He is the beginning, the firstborn from the dead, that in all things he himself might be preeminent. For in him all the fullness was pleased to dwell, and through him to reconcile all things for him, making peace by the blood of his cross [through him], whether those on earth or those in heaven.”\r-Colossians 1: 15-20\r\rFurther Refernce:\rNew American Bible Revised Edition\rColossians, http://tinyurl.com/qe6h9ur\r\rCoordinates:\r37.7878, 29.2615\r\r\r";
                                       
                                       BiblicalPins *dan = [[BiblicalPins alloc] init];
                                       dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
                                       dan.title = @"Dan";
                                       dan.image = [UIImage imageNamed:@"dan"];
                                       dan.subtitle = @"Northern Israelite Cultic Site";
                                       dan.information = @"\rAccording to 1 Kings 12, Dan becomes one of two alternative worship sites established by King Jeroboam I of the Northern Kingdom of Israel:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Beth-El, the other in Dan. This led to sin, because the people frequented these calves in Beth-El and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r-1 Kings 12: 28-31\r\rHowever, according to some archeologists, its pottery evidence suggest that Dan:\r\r-was destroyed by the end of late Iron Age I\r-was deserted during the time of Jeroboam I\r-was rebuilt by Hazael in the late 9th century B.C.\r-became Israelite for the first time around 800 B.C.\r\rIsrael Finkelstein claims:\r\r“...the evidence from Dan does not support the tradition about Jeroboam I at Dan... it means that the tradition about the erection of the bamah [altar] at Dan is a retrojection into the past of a reality from the days of Jeroboam II, in the first half of the eighth century B.C.E.”\r-Finkelstein, 74\r\rDan is also the site (known as “Tel-Dan”) where one of the most significant archeological finds was discovered by Avraham Biran in 1993; an inscription that referred to the “House of David”. According to the Biblical Archeological Society (BAS):\r\r“Avraham Biran and his team of archaeologists found a remarkable inscription from the ninth century B.C.E. that refers both to the 'House of David' and to the 'King of Israel.' This is the first time that the name David has been found in any ancient inscription outside the Bible. That the inscription refers not simply to a 'David' but to the House of David, the dynasty of the great Israelite king, is even more remarkable. 'King of Israel' is a term frequently found in the Bible, especially in the Book of Kings. This, however, may be the oldest extrabiblical reference to Israel in Semitic script. If this inscription proves anything, it shows that both Israel and Judah, contrary to the claims of some scholarly Biblical minimizers, were important kingdoms at this time.”\r-BAS, 33\r\rSee “Beth-El”.\r\rFurther Reference:\rNew American Bible Revised Edition\r1 Kings 12, http://tinyurl.com/qhd4nug\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rBiblical Archeological Society, “Top Ten Biblical Archeological Discoveries”\rhttp://tinyurl.com/goqp9qf\r\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520\r\r\r";
                                       
                                       BiblicalPins *jericho = [[BiblicalPins alloc] init];
                                       jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
                                       jericho.title = @"Jericho";
                                       jericho.subtitle = @"Walled Canaanite City";
                                       jericho.image = [UIImage imageNamed:@"jericho"];
                                       jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500\r\r\r";
                                       
                                       
                                       BiblicalPins *temple = [[BiblicalPins alloc] init];
                                       temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                       temple.title = @"The Temple";
                                       temple.subtitle = @"The House of Yahweh";
                                       temple.image = [UIImage imageNamed:@"temple"];
                                       temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great before being destroyed again by the Roman army in A.D. 70.\r\rFurther Reference:\rNOVA, “Recreating the Temple” (video)\rhttp://tinyurl.com/jr83lcj\r\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
                                       
                                       BiblicalPins *hazor = [[BiblicalPins alloc] init];
                                       hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
                                       hazor.title = @"Hazor";
                                       hazor.image = [UIImage imageNamed:@"hazor"];
                                       hazor.subtitle = @"Major Ancient Canaanite City";
                                       hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai:\r\r“At that time Joshua, turning back, captured Hazor and struck down its king with the sword; for Hazor formerly was the chief of all those kingdoms. He also struck down with the sword every person there, carrying out the ban, till none was left alive. Hazor itself he burned.”\r-Joshua 11: 10-11\r\rHowever, according to the book of Judges, Hazor was still standing and a functional monarchy:\r\r“So the LORD sold them into the power of the Canaanite king, Jabin, who reigned in Hazor. The general of his army was Sisera, who lived in Harosheth-ha-goiim.”\r-Judges 4: 2\r\rIn addition to this discrepancy, recent archeological findings show that Hazor was destroyed in the late 13th century while Jericho and Ai were destroyed in 1500 B.C. and 2200 B.C., respectively. These findings further show Hazor was destoryed by internal revolt rather than external attack. These data are best explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the the Dictionary tab.\r\rFurther Reference:\rNew American Bible Revised Edition, Joshua 11\rhttp://tinyurl.com/z65778q\r\rJudges 4\rhttp://tinyurl.com/hf82n48\r\rIsrael Finkelstein, “The Forgotten Kingdom:  The Archeology And History Of Northern Israel”, pg. 21\rhttp://tinyurl.com/gnjmjwa\r\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669\r\r\r";
                                       
                                       BiblicalPins *sepphoris = [[BiblicalPins alloc] init];
                                       sepphoris.coordinate = CLLocationCoordinate2DMake(32.7529, 35.2795);
                                       sepphoris.title = @"Sepphoris";
                                       sepphoris.subtitle = @"Capital of Herod Antipas";
                                       sepphoris.image = [UIImage imageNamed:@"sepphoris"];
                                       sepphoris.information = @"\rAlthough it is not mentioned in Scripture, Sepphoris was a major city in Galilee and the captial city of Herod Antipas. It is likely that Jesus of Nazareth worked in or around this city before beginning his prophetic ministry.\r\rFurther Reference:\rWikipedia, “Sepphoris”\rhttp://tinyurl.com/p38eyob\r\rCoordinates:\r32.7529, 35.2795\r\r\r";
                                       
                                       HistoricalPins *nicea = [[HistoricalPins alloc] init];
                                       nicea.coordinate = CLLocationCoordinate2DMake(40.4292, 29.7211);
                                       nicea.title = @"Nicea";
                                       nicea.image = [UIImage imageNamed:@"nicea"];
                                       nicea.subtitle = @"Ecumenical Councils I, VII";
                                       nicea.information = @"\rThe first Council of Nicea was called by the Emperor Constantine in A.D. 325. It condemned the teaching of Arius and declared that Christ is “of the same substance” (homoousious) as God.\r\rThe second Council of Nicea in A.D. 787 brought an end to the iconoclasm controversy by approving the veneration of icons. See the Councils section of the Overview tab. See “Homoousios” in the Historical category of the Dictionary tab.\r\rFurther Reference:\rWikipedia\r“First Council of Nicea” http://tinyurl.com/hd8cm\r“Second Council of Nicea” http://tinyurl.com/yf66az\r\rCoordinates:\r40.2574, 29.4317\r\r\r";
                                       
                                       SocialPins *greenland = [[SocialPins alloc] init];
                                       greenland.coordinate = CLLocationCoordinate2DMake(61.2950, -45.0000);
                                       greenland.title = @"Greenland";
                                       greenland.subtitle = @"Accelerated Glacial Melting";
                                       greenland.image = [UIImage imageNamed:@"greenland"];
                                       greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. Glacial melt intensifies global warming by releasing increased amounts of previously trapped carbon into the atmosphere. Pope Francis has identified the risk to glaciers from climate change by stating:\r\r“Warming has effects on the carbon cycle. It creates a vicious circle which aggravates the situation even more, affecting the availability of essential resources like drinking water, energy and agricultural production in warmer regions, and leading to the extinction of part of the planet’s biodiversity. The melting in the polar ice caps and in high altitude plains can lead to the dangerous release of methane gas, while the decomposition of frozen organic material can further increase the emission of carbon dioxide. Things are made worse by the loss of tropical forests which would otherwise help to mitigate climate change. Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas.”\r-Laudato Si, 24\r\rFurther Reference:\rPope Francis, “Laudato Si'”\rhttp://tinyurl.com/o6sowft\r\rCatholic Climate Movement\rhttp://tinyurl.com/lxe52t7\r\rNational Snow & Ice Data Center\r“Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000\r\r\r";
                                       
                                       SocialPins *greatbr = [[SocialPins alloc] init];
                                       greatbr.coordinate = CLLocationCoordinate2DMake(-18.2861, 147.7000);
                                       greatbr.title = @"Great Barrier Reef";
                                       greatbr.subtitle = @"Threatened Coral Ecosystem";
                                       greatbr.image = [UIImage imageNamed:@"barrier"];
                                       greatbr.information = @"\rAustralia's Great Barrier Reef is the world's largest coral ecosystem. Climate change is putting many elements of the reef under threat. Pope Francis emphasized the importance of safeguarding coral reef systems when he stated:\r\r“In tropical and subtropical seas, we find coral reefs comparable to the great forests on dry land, for they shelter approximately a million species, including fish, crabs, molluscs, sponges and algae. Many of the world’s coral reefs are already barren or in a state of constant decline. ‘Who turned the wonderworld of the seas into underwater cemeteries bereft of colour and life?’ This phenomenon is due largely to pollution which reaches the sea as the result of deforestation, agricultural monocultures, industrial waste and destructive fishing methods, especially those using cyanide and dynamite. It is aggravated by the rise in temperature of the oceans. All of this helps us to see that every intervention in nature can have consequences which are not immediately evident, and that certain ways of exploiting resources prove costly in terms of degradation which ultimately reaches the ocean bed itself.”\r-Laudato Si, 41\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rCatholic Bishops of Queensland, “Pastoral Letter on the Great Barrier Reef”\rhttp://tinyurl.com/one2fma\r\rCatholic Care Australia\rhttp://catholicearthcare.org.au\r\rCoordinates:\r18.2861, 147.7000\r\r\r";
                                       
                                       
                                       HistoricalPins *alexandria = [[HistoricalPins alloc] init];
                                       alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
                                       alexandria.title = @"Alexandria";
                                       alexandria.subtitle = @"Eastern Patriarchate";
                                       alexandria.image = [UIImage imageNamed:@"alexandria"];
                                       alexandria.information = @"\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen and Clement of Alexandira. It was known for its highly allegorical hermeneutical method in contrast with that of Antioch. It later became one of 5 major centers of Christianity in the 4th century in the canons of the Nicene Council.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192\r\r\r";
                                       
                                       HistoricalPins *vatican = [[HistoricalPins alloc] init];
                                       vatican.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
                                       vatican.title = @"The Vatican";
                                       vatican.subtitle = @"Ecumenical Councils XX, XXI";
                                       vatican.image = [UIImage imageNamed:@"vatican"];
                                       vatican.information = @"\rThe First Vatican Council was convoked by Pope Pius IX and held session from 1868-1870. It's major themes were the condemnation of so-called “Modernism” and the definition of the nature of the Church, especially as it relates to the Papacy. In the context of this second point was the doctrine of Papal Infallibility. Vatican I only approved two dogmatic constitutions: the Dogmatic Constitution on the Catholic Faith and the Dogmatic Consititution on the Church of Christ. This latter constitution was the subject of some contention among the assembled bishops. The relevant text reads:\r\r“...we teach and define as a divinely revealed dogma that when the Roman pontiff speaks ex cathedra, that is, when, in the exercise of his office as shepherd and teacher of all Christians, in virtue of his supreme apostolic authority, he defines a doctrine concerning faith or morals to be held by the whole church, he possesses, by the divine assistance promised to him in blessed Peter, that infallibility which the divine Redeemer willed his church to enjoy in defining doctrine concerning faith or morals. Therefore, such definitions of the Roman pontiff are of themselves, and not by the consent of the church, irreformable.”\r-Vatican I, Pastor Aeternus, 9\r\rThe Second Vatican Council was convoked by Pope John XXIII and held session from 1962-1965. A major theme of the council was “aggiornomento”, or the updating of the Church in order to communicate the gospel more effectively to the 20th century. Among the changes introduced at Vatican II were the restoration of the liturgy in the vernacular and the the celebrant turned to face the congregation during the Eucharist. The council also acknowledged the profound scientific, technological, and other social changes that had occured:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis....The recent studies and findings of science, history and philosophy raise new questions which effect life and which demand new theological investigations. Furthermore, theologians, within the requirements and methods proper to theology, are invited to seek continually for more suitable ways of communicating doctrine to the men of their times; for the deposit of Faith or the truths are one thing and the manner in which they are enunciated, in the same meaning and understanding, is another.”\r-Vatican II, Gaudium et Spes, 5, 62.\r\rSee “Councils” in the Overview tab. See “Aggiornomento”, “Liturgy”, “Modernism” in the Dictionary tab.\r\rFurther Reference:\rDecrees and Canons of Vatican I\rhttp://tinyurl.com/zvdqu9u\r\rDocuments of Vatican II\rhttp://tinyurl.com/jmaxecg\r\rCoordinates:\r41.9022, 12.4533\r\r\r";
                                       
                                       HistoricalPins *constantinople = [[HistoricalPins alloc] init];
                                       constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
                                       constantinople.title = @"Constantinople";
                                       constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
                                       constantinople.image = [UIImage imageNamed:@"constantinople"];
                                       constantinople.information = @"\rThe 2nd and 5th Ecumenical Councils in A.D. 381 and 553, respectively, confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. The sixth in A.D. 680-681 condemned monothelitism, and the eighth in A.D. 869-870 deposed Photius and brought and end to the schism named after him. See the “Councils” section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\r“Third Council of Constantinople”\rhttp://tinyurl.com/oetzuo6\r\r“Fourth Council of Constantinople”\rhttp://tinyurl.com/pjc3kx2\r\rCoordinates:\r41.0122, 28.9760\r\r\r";
                                       
                                       SocialPins *sierraLeone = [[SocialPins alloc] init];
                                       sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
                                       sierraLeone.title = @"Freetown";
                                       sierraLeone.subtitle = @"Insufficient Health Care";
                                       sierraLeone.image = [UIImage imageNamed:@"sierra"];
                                       sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014. The city's and larger country's health care infrastructure was devastated by the civil war from 1991-2002.\r\rWikipedia, “Sierra Leone”\rhttp://tinyurl.com/m7ql8\r\rCoordinates: 8.4844, -13.2344\r\r\r";
                                       
                                       SocialPins *camden = [[SocialPins alloc] init];
                                       camden.coordinate = CLLocationCoordinate2DMake(39.9400, -75.1050);
                                       camden.title = @"Camden, NJ";
                                       camden.subtitle = @"Systemic Unemployment & Poverty";
                                       camden.image = [UIImage imageNamed:@"camden"];
                                       camden.information = @"\rIn 2012 Camden, NJ was ranked by the U.S. Census Bureau as the poorest city in the United States per capita as well as the most dangerous, being equally ranked as the crime capital of the United States. Fr. Jeff Putthoff is trying to help provide otherwise absent opportunities for many of the youth in Camden. He is the creator and director of HopeWorks, a non-profit, youth development program that trains young people in the use of and design of technologies such as Web design:\r\r“Hopeworks 'N Camden uses education, technology and entrepreneurship to partner with young men and women as they identify and earn a sustainable future. Together we seize the opportunity to heal and thrive in the midst of violence and poverty. Hopeworks 'N Camden is a nonprofit that has been working for over 15 years with Camden youth. Utilizing an advanced training curriculum in web site design/development, GIS and Salesforce, Hopeworks works with youth 14­-23 to get back in school and find a safe pathway to their future. Healing communities by creating safe pathways through which we own our histories and discover new choices. Hopeworks 'N Camden uses education, technology and entrepreneurship to partner with young men and women as they identify and earn a sustainable future. Together we seize the opportunity to heal and thrive in the midst of violence and poverty. Hopeworks 'N Camden is a nonprofit that has been working for over 15 years with Camden youth. Utilizing an advanced training curriculum in web site design/development, GIS and Salesforce, Hopeworks works with youth 14­-23 to get back in school and find a safe pathway to their future.”\r\rFurther Reference:\rHopeWorks, http://www.hopeworks.org\r\rWikipedia, “Camden, NJ”\rhttp://tinyurl.com/bmuvoem\r\rCoordinates: 39.9400, -75.1050\r\r\r";
                                       
                                       SocialPins *atlantic = [[SocialPins alloc] init];
                                       atlantic.coordinate = CLLocationCoordinate2DMake(38.4667, -28.4000);
                                       atlantic.title = @"The Atlantic Ocean";
                                       atlantic.subtitle = @"Rising Water Levels";
                                       atlantic.image = [UIImage imageNamed:@"ocean"];
                                       atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization. Pope Francis emphasized the importance of maintaining the health of the world's oceans when he stated:\r\r“Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas...Oceans not only contain the bulk of our planet’s water supply, but also most of the immense variety of living creatures, many of them still unknown to us and threatened for various reasons. What is more, marine life in rivers, lakes, seas and oceans, which feeds a great part of the world’s population, is affected by uncontrolled fishing, leading to a drastic depletion of certain species. Selective forms of fishing which discard much of what they collect continue unabated. Particularly threatened are marine organisms which we tend to overlook, like some forms of plankton; they represent a significant element in the ocean food chain, and species used for our food ultimately depend on them.”\r-Laudato Si, 24, 40\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rNOAA, National Ocean Service\rhttp://tinyurl.com/yc7jxud\r\r\r";
                                       
                                       SocialPins *philippines = [[SocialPins alloc] init];
                                       philippines.coordinate = CLLocationCoordinate2DMake(13.1333, 123.7333);
                                       philippines.title = @"Legazpi City";
                                       philippines.subtitle = @"Carbon Mining Coastal Destruction";
                                       philippines.image = [UIImage imageNamed:@"legazpi"];
                                       philippines.information = @"\rThe coast of Legazpi City, Philippines, is suffering from the effects of carbon mining. Pope Francis hightlighted the importance of addressing human intensification of the carbon cycle when he stated:\r\r“Climate change is a global problem with grave implications: environmental, social, economic, political and for the distribution of goods. It represents one of the principal challenges facing humanity in our day. Its worst impact will probably be felt by developing countries in coming decades. Many of the poor live in areas particularly affected by phenomena related to warming, and their means of subsistence are largely dependent on natural reserves and ecosystemic services such as agriculture, fishing and forestry. They have no other financial activities or resources which can enable them to adapt to climate change or to face natural disasters, and their access to social services and protection is very limited. For example, changes in climate, to which animals and plants cannot adapt, lead them to migrate; this in turn affects the livelihood of the poor, who are then forced to leave their homes, with great uncertainty for their future and that of their children. There has been a tragic rise in the number of migrants seeking to flee from the growing poverty caused by environmental degradation. They are not recognized by international conventions as refugees; they bear the loss of the lives they have left behind, without enjoying any legal protection whatsoever.”\r-Laudato Si, 25\r\rFurther Refernce\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rCoordinates:\r13.1333, 123.7333\r\r\r";
                                       
                                       SocialPins *palestine = [[SocialPins alloc] init];
                                       palestine.coordinate = CLLocationCoordinate2DMake(31.6253, 35.1453);
                                       palestine.title = @"Palestine";
                                       palestine.image = [UIImage imageNamed:@"palestine"];
                                       palestine.subtitle = @"Occupied Territory";
                                       palestine.information = @"\rSince the creation of the state of Israel in 1948, Palestinians have been without statehood. The Vatican recently officially recognized the State of Palestine even though such recognition is absent in the United Nations and other governments.\r\rFurther Reference:\rVatican, Joint Statement of the Bilateral Commission of the Holy See and the State of Palestine\rhttp://tinyurl.com/okb4f9b\r\rCoordinates:\r31.6253, 35.1453\r\r\r";
                                       
                                       SocialPins *israel = [[SocialPins alloc] init];
                                       israel.coordinate = CLLocationCoordinate2DMake(31.0000, 35.0000);
                                       israel.title = @"Israel";
                                       israel.subtitle = @"A Contested Homeland";
                                       israel.image = [UIImage imageNamed:@"israel"];
                                       israel.information = @"\rThe modern state of Israel was created in 1948 when the British Mandate for Palestine expired at midnight. David Ben-Gurion announced the creation of Israel with these words:\r\r“Eretz Israel (the Land of Israel) was the birthplace of the Jewish people. Here their spiritual, religious, and political identity was shaped. Here they first attained statehood, created cultural values of national and universal significance and gave to the world the eternal Book of Books. Jews strove in every successive generation to reestablish themselves in their ancient homeland. ... they made deserts bloom, revived the Hebrew language, built villages and towns, and created a thriving community, controlling its own economy and culture, loving peace but knowing how to defend itself...The State of Israel will be open for Jewish immigration... will foster the development of the country for the benefit of all its inhabitants; it will be based on freedom, justice and peace as envisaged by the prophets of Israel; it will ensure complete equality of social and political rights to all its inhabitants irrespective of religion, race or sex; it will guarantee freedom of religion, conscience, language, education and culture; it will safeguard the Holy Places of all religions; and it will be faithful to the principles of the Charter of the United Nations. We extend our hand to all neighbouring states and their peoples in an offer of peace and good neighbourliness, and appeal to them to establish bonds of cooperation and mutual help with the sovereign Jewish people settled in its own land.”\r-Declaration\r\rSince then, Israel has fought numerous wars for its survival with its surrounding Arab neighborsMuch of the present crisis stems from Israel's control of the West Bank and Gaza strip, areas that are legally part of the Palestinan territories. Israel has controlled these areas since the Six-Day War of 1967, in violation of U.N. resolution 242, which is often cited as a factor in continuing threats from disaffected Palestinian groups:\r\r“The Security Council,\r\rExpressing its continuing concern with the grave situation in the Middle East,\r\rEmphasizing the inadmissibility of the acquisition of territory by war and the need to work for a just and lasting peace in which every State in the area can live in security,\r\rEmphasizing further that all Member States in their acceptance of the Charter of the United Nations have undertaken a commitment to act in accordance with Article 2 of the Charter,\r\r1. Affirms that the fulfilment of Charter principles requires the establishment of a just and lasting peace in the Middle East which should include the application of both the following principles:\r\r(i) Withdrawal of Israel armed forces from territories occupied in the recent conflict;\r\r(ii) Termination of all claims or states of belligerency and respect for and acknowledgment of the sovereignty, territorial integrity and political independence of every State in the area and their right to live in peace within secure and recognized boundaries free from threats or acts of force;\r\r2. Affirms further the necessity\r\r(a) For guaranteeing freedom of navigation through international waterways in the area;\r\r(b)	For achieving a just settlement of the refugee problem;\r\r(c)	For guaranteeing the territorial inviolability and political independence of every State in the area, through measures including the establishment of demilitarized zones;\r\r3. Requests the Secretary-General to designate a Special Representative to proceed to the Middle East to establish and maintain contacts with the States concerned in order to promote agreement and assist efforts to achieve a peaceful and accepted settlement in accordance with the provisions and principles in this resolution;\r\r4. Requests the Secretary-General to report to the Security Council on the progress of the efforts of the Special Representative as soon as possible.”\r\rFurther Reference:\rDeclaration of Establishment of the State of Israel\rhttp://tinyurl.com/p56bfn9\r\rUnited Nations Security Council\rResolution 242\rhttp://tinyurl.com/yeszj3t\r\rCoordinates:\r31.6253, 35.1453\r\r\r";
                                       
                                       BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
                                       thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
                                       thessalonica.title = @"Thessalonica";
                                       thessalonica.subtitle = @"Greek Coastal City";
                                       thessalonica.image = [UIImage imageNamed:@"thessalonica"];
                                       thessalonica.information = @"\rThessalonica (modern Thessaloniki) was home to one of the earlier Christian communities founded by the St. Paul. There are two New Testament letters addressed to this community, however only one of them (1 Thessalonians) is counted as authentically Pauline. The other (2 Thessalonians) is among the so-called disputed letters. 1 Thessalonians contains an reference to an earlier oral tradition of Jesus:\r\r“We do not want you to be unaware, brothers, about those who have fallen asleep, so that you may not grieve like the rest, who have no hope. For if we believe that Jesus died and rose, so too will God, through Jesus, bring with him those who have fallen asleep. Indeed, we tell you this, on the word of the Lord, that we who are alive, who are left until the coming of the Lord, will surely not precede those who have fallen asleep. For the Lord himself, with a word of command, with the voice of an archangel and with the trumpet of God, will come down from heaven, and the dead in Christ will rise first. Then we who are alive, who are left, will be caught up together with them in the clouds to meet the Lord in the air. Thus we shall always be with the Lord. Therefore, console one another with these words.” -1 Thessalonians 4: 13-18\r\rFurther Reference:\rNew American Standard Bible Revised Edition\r1 Thessalonians, http://tinyurl.com/obav3c6\r\rCoordinates:\r40.6500, 22.9000\r\r\r";
                                       
                                       BiblicalPins *philippi = [[BiblicalPins alloc] init];
                                       philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
                                       philippi.title = @"Philippi";
                                       philippi.subtitle = @"Major Greek City";
                                       philippi.image = [UIImage imageNamed:@"philippi"];
                                       philippi.information = @"\rAccording to Acts 16: 11-15, Philippi was a Roman colony in which both St. Paul and St. Barnabas conducted missionary work. Philippians contains what many scholars believe to be an early Christian hymn describing the Incarnation:\r\r“Have among yourselves the same attitude that is also yours in Christ Jesus, Who, though he was in the form of God did not regard equality with God something to be grasped. Rather, he emptied himself, taking the form of a slave, coming in human likeness; and found human in appearance, he humbled himself, becoming obedient to death, even death on a cross. Because of this, God greatly exalted him and bestowed on him the name that is above every name, that at the name of Jesus every knee should bend, of those in heaven and on earth and under the earth, and every tongue confess that Jesus Christ is Lord, to the glory of God the Father.”\r-Philippians 2: 5-11\r\rSee “Incarnation” in the Dictionary.\r\rFurther Reference:\rNew American Bible Revised Edition\rPhilippians, http://tinyurl.com/p4byh43\r\rCoordinates:\r41.0131, 24.2864\r\r\r";
                                       
                                       BiblicalPins *antioch = [[BiblicalPins alloc] init];
                                       antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
                                       antioch.title = @"Antioch";
                                       antioch.subtitle = @"Capital of Ancient Syria";
                                       antioch.image = [UIImage imageNamed:@"antioch"];
                                       antioch.information = @"\rAntioch was a major center for Gentile Christianity in the first century as recorded in the Acts of the Apostles. St. Paul and St. Barnabas launched their missionary journeys from this city. The disciples of Jesus were first called Christians in Antioch (Acts 11:26).\r\r“Now those who had been scattered by the persecution that arose because of Stephen went as far as Phoenicia, Cyprus, and Antioch, preaching the word to no one but Jews. There were some Cypriots and Cyrenians among them, however, who came to Antioch and began to speak to the Greeks as well, proclaiming the Lord Jesus. The hand of the Lord was with them and a great number who believed turned to the Lord. The news about them reached the ears of the church in Jerusalem, and they sent Barnabas to Antioch. When he arrived and saw the grace of God, he rejoiced and encouraged them all to remain faithful to the Lord in firmness of heart, for he was a good man, filled with the holy Spirit and faith. And a large number of people was added to the Lord. Then he went to Tarsus to look for Saul, and when he had found him he brought him to Antioch. For a whole year they met with the church and taught a large number of people, and it was in Antioch that the disciples were first called 'Christians'.” - Acts 11: 19-26\r\rFurther Reference:\rNew American Bible Revised Edition\rActs 11, http://tinyurl.com/o3cm45r\r\rCoordinates:\r36.2000, 36.1500\r\r\r";
                                       
                                       BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
                                       bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
                                       bethlehem.title = @"Bethlehem";
                                       bethlehem.image = [UIImage imageNamed:@"bethlehem"];
                                       bethlehem.subtitle = @"Traditional Birthplace of Jesus";
                                       bethlehem.information = @"\rBethlehem is located just south of Jerusalem. While Matthew portrays Bethlehem as Joseph and Mary's hometown, Luke states that Nazareth was their hometown, which they left in order to be in Bethlehem for a census.\r\rFurther Reference:\rWikipedia, “Bethlehem”\rhttp://tinyurl.com/natjqkv\r\rCoordinates:\r31.7031, 35.1956\r\r\r";
                                       
                                       //BiblicalPins *ramah = [[BiblicalPins alloc] init];
                                       //ramah.coordinate = CLLocationCoordinate2DMake(32.936389, 35.367222);
                                       //ramah.title = @"Ramah";
                                       
                                       
                                       BiblicalPins *hebron = [[BiblicalPins alloc] init];
                                       hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
                                       hebron.title = @"Hebron";
                                       hebron.subtitle = @"David's Judahite Capital";
                                       hebron.image = [UIImage imageNamed:@"hebron"];
                                       hebron.information = @"\rOne of the oldest continually occupied cities in the world, Hebron is first mentioned in the biblical story-cycles of Abraham. In Genesis 23, Abraham buys Hebron from Ephron the Hittite for 400 sheckels. Abraham, Isaac, and Jacob are portrayed as buried there. Numbers 13:22 indicates that Hebron was founded around 1720 B.C. In the book of Judges, Joshua assigns Hebron to Caleb as part of the territory of Judah. In the book of 2 Samuel, David is annointed King of Judah and all Israel at Hebron.\r\r“All the tribes of Israel came to David at Hebron and said, 'We are your own flesh and blood. In the past, while Saul was king over us, you were the one who led Israel on their military campaigns. And the LORD said to you, ‘You will shepherd my people Israel, and you will become their ruler.’ When all the elders of Israel had come to King David at Hebron, the king made a covenant with them at Hebron before the LORD, and they anointed David king over Israel.”\r-2 Samuel 5: 1-3\r\rFurther Reference:\rNew American Bible Revised Edition\r2 Samuel 5, http://tinyurl.com/npwcn4a\r\rCoordinates:\r31.5333, 35.0950\r\r\r";
                                       
                                       BiblicalPins *shiloh = [[BiblicalPins alloc] init];
                                       shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
                                       shiloh.title = @"Shiloh";
                                       shiloh.subtitle = @"Shrine of the Ark of the Covenant";
                                       shiloh.image = [UIImage imageNamed:@"shiloh"];
                                       shiloh.information = @"\rAccording to various Old Testament references, Shiloh was a major cultic site asociated with the Ark of the Covenant and the tribe of Levi. It is first mentioned in the context of the Ark of the Covenant in 1 Samuel 4: 3-4:\r\r“When the soldiers returned to camp, the elders of Israel asked, 'Why did the LORD bring defeat on us today before the Philistines? Let us bring the ark of the LORD’s covenant from Shiloh, so that he may go with us and save us from the hand of our enemies.' So the people sent men to Shiloh, and they brought back the ark of the covenant of the LORD Almighty, who is enthroned between the cherubim. And Eli’s two sons, Hophni and Phinehas, were there with the ark of the covenant of God.”\r\rArcheologist Israel Finkelstein claims that although the evidence for a major settlement at Shiloh is scant during the Iron Age I period, there is evidence for cultic activity:\r\r“There was no settlement at Shiloh in the Late Bronze Age, but the favissa found on the northeastern slope hints that cultic-activity did take place at the site at that time. When one attempts to evaluate the nature of Iron I Shiloh, it is impossible to ignore these facts. To summarize this point, although there is no direct evidence of an Iron I shrine at Shiloh, indirect considerations seem to hint that Iron I Shiloh was not a typical highlands settlement, and the long-term evidence, from the Middle and Late Bronze Ages, seems to hint at the existence of a cult place there.”\r-Finkelstein, 25\r\rFurther Reference:\rNew American Standard Bible Revised Edition\r1 Samuel 4, http://tinyurl.com/o7n83hf\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rCoordinates:\r32.0556, 35.2895\r\r\r";
                                       
                                       HistoricalPins *lyon = [[HistoricalPins alloc] init];
                                       lyon.coordinate = CLLocationCoordinate2DMake(45.7600, 4.8400);
                                       lyon.title = @"Lyon";
                                       lyon.subtitle = @"Ecumenical Councils XIII, XIV";
                                       lyon.image = [UIImage imageNamed:@"lyon"];
                                       lyon.information = @"\rThe first Council of Lyon was held in 1245 and was the thirteenth Ecumneical Council of the Church. It was called by Pope Innocent IV to excommunicate Frederick II and call for the 7th Crusade to reconquer the Holy Land. It also dealt with various disciplinary matters.\r\rThe second Council of Lyon was held from 1272-1274 and was the fourteenth Ecumenical Council of the Church. It was called by Pope Gregory X in order to fund the reconquest of the Holy Land and end the Great Schism with the Eastern Orthodox churches. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Lyon”\rhttp://tinyurl.com/msp95mv\r“Second Council of Lyon”\rhttp://tinyurl.com/my3aqa6\r\rCoordinates:\r45.7600, 4.8400\r\r\r";
                                       
                                       HistoricalPins *ephesus2 = [[HistoricalPins alloc] init];
                                       ephesus2.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3500);
                                       ephesus2.title = @"Ephesus";
                                       ephesus2.subtitle = @"Ecumencial Council III";
                                       ephesus2.image = [UIImage imageNamed:@"ephesus2"];
                                       ephesus2.information = @"\rThe Council of Ephesus was called in A.D. 431 by the Roman Emperor Theodosius II. It condemned the teaching of Nestorius, who denied the principle of Communicatio Idiomatum by claiming that the Virgin Mary was the mother of Christ but not of God. The Council taught that the Virgin Mary was “Theotokos”: God-bearer. \r\rFurther Reference:\rWikipedia, “Council of Ephesus”\rhttp://tinyurl.com/mrmvuaw\r\rCoordinates:\r37.9411, 27.3500\r\r\r";
                                       
                                       
                                       HistoricalPins *vienne = [[HistoricalPins alloc] init];
                                       vienne.coordinate = CLLocationCoordinate2DMake(46.5000, 0.5000);
                                       vienne.title = @"Vienne";
                                       vienne.subtitle = @"Ecumenical Council XV";
                                       vienne.image = [UIImage imageNamed:@"vienne"];
                                       vienne.information = @"\rThe Council of Vienne was held from 1311 to 1312 and is counted as the fifteenth ecumenical council by the Catholic Church. It was created by the papal bull of Clement V, “Faciens Misericordiam”, which called for an ecumenical council to create a new Crusade. The bull also established papal commissions to deal with charges against the Knights Templar. The Council also created Chairs of Hebrew, Aramaic, and Greek at the University of Paris. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Vienne”\rhttp://tinyurl.com/ldrffc7\r\rCoordinates:\r46.5000, 0.5000\r\r\r";
                                       
                                       HistoricalPins *chalcedon = [[HistoricalPins alloc] init];
                                       chalcedon.coordinate = CLLocationCoordinate2DMake(40.9833, 29.0333);
                                       chalcedon.title = @"Chalcedon";
                                       chalcedon.subtitle = @"Ecumencial Council IV";
                                       chalcedon.image = [UIImage imageNamed:@"chalcedon"];
                                       chalcedon.information = @"\rThe Council of Chalcedon was held in A.D. 451 and promulgated what would become the classical Christological definition of Jesus Christ as one person in two natures:\r\r“We, then, following the holy Fathers, all with one consent, teach people to confess one and the same Son, our Lord Jesus Christ, the same perfect in Godhead and also perfect in manhood; truly God and truly man, of a rational soul and body; consubstantial with the Father according to the Godhead, and consubstantial with us according to the Manhood; in all things like unto us, without sin; begotten before all ages of the Father according to the Godhead, and in these latter days, for us and for our salvation, born of the Virgin Mary, the Mother of God, according to the Manhood; one and the same Christ, Son, Lord, only begotten, to be acknowledged in two natures, inconfusedly, unchangeably, indivisibly, inseparably; (ἐν δύο φύσεσιν ἀσυγχύτως, ἀτρέπτως, ἀδιαιρέτως, ἀχωρίστως) the distinction of natures being by no means taken away by the union, but rather the property of each nature being preserved, and concurring in one Person (prosopon) and one Subsistence, not parted or divided into two persons, but one and the same Son, and only begotten God, the Word, the Lord Jesus Christ; as the prophets from the beginning [have declared] concerning Him, and the Lord Jesus Christ Himself has taught us, and the Creed of the holy Fathers has handed down to us.”\r\rSee the Councils section in the Overview tab.\r\rFurther Reference:\rCouncil of Chalcedon, Definition\rhttp://tinyurl.com/nhnxvro\r\rCoordinates:\r40.9833, 29.0333\r\r\r";
                                       
                                       HistoricalPins *constance = [[HistoricalPins alloc] init];
                                       constance.coordinate = CLLocationCoordinate2DMake(47.6633, 9.1769);
                                       constance.title = @"Constance";
                                       constance.subtitle = @"Ecumenical Council XVI";
                                       constance.image = [UIImage imageNamed:@"constance"];
                                       constance.information = @"\rThe Council of Constance was held from 1414 to 1418 and ended the so-called “Western Schism” and Avignon Papacy. It was the first Council to specifically advocate Conciliarism by claiming that even the Pope was subject to the decrees of an Ecumenical Council. However, the Pope elected by the Council, Martin V, did not confirm this statement. As such, it was not considered a binding teaching. The Council also condemned the teaching of John Wycliff and Jan Hus. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Constance”\rhttp://tinyurl.com/5upzc5\r\rCoordinates:\r47.6633, 9.1769\r\r\r";
                                       
                                       HistoricalPins *trent = [[HistoricalPins alloc] init];
                                       trent.coordinate = CLLocationCoordinate2DMake(46.0667, 11.1167);
                                       trent.title = @"Trent";
                                       trent.subtitle = @"Ecumenical Council XIX";
                                       trent.image = [UIImage imageNamed:@"trent"];
                                       trent.information = @"\rThe Council of Trent was in session from 1545 to 1563 in Trento, Italy. It was the most signficant Church Council since Nicea until Vatican II. It was called by Pope Paul III as a response to the Protestant Reformation, and consolidated many elements of Catholic teaching, including Sacraments, Latin as the official language of the Church, and the Breviary. The Tridentine Mass became the ordinary form of the Mass until the developments of Vatican II. See Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Trent”\rhttp://tinyurl.com/5t586h\r\rCoordinates:\r46.0667, 11.1167\r\r\r";
                                       
                                       HistoricalPins *florence = [[HistoricalPins alloc] init];
                                       florence.coordinate = CLLocationCoordinate2DMake(43.7833, 11.2500);
                                       florence.title = @"Florence";
                                       florence.subtitle = @"Ecumenical Council XVII";
                                       florence.image = [UIImage imageNamed:@"florence"]; 
                                       florence.information = @"\rInitially convoked by Pope Martin V as the Council of Basel in 1431, the council was moved to Ferrara, and then finally to Florence after a series of political events and the election of an anti-pope. The Council of Florence negotiated reunion with some Eastern churches and established the Filique clause in the Nicene Creed. It also established Papal primacy over an ecumenical council, which was a departure from the previous Council of Constance. See “Filioque”, “Nicene Creed”. See “Councils” section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Florence”\rhttp://tinyurl.com/o2t9hxd\r\rCoordinates:\r43.7833, 11.2500\r\r\r";
                                       
                                       HistoricalPins *lateran = [[HistoricalPins alloc] init];
                                       lateran.coordinate = CLLocationCoordinate2DMake(41.885906, 12.506156);
                                       lateran.title = @"St. John Lateran";
                                       lateran.subtitle = @"Ecumenical Councils IX, X, XI, XII";
                                       lateran.image = [UIImage imageNamed:@"lateran"]; 
                                       lateran.information = @"\rThe First Lateran Council in 1123 was convoked by Pope Callixtus II and did not deal with doctrinal questions. Instead, it promulgated a series of clerical reforms such as the prohibition of Simony and cohabitation with non-familial women.\r\rThe second Lateran Council was convoked by Pope Innocent II in 1139 dealt with the schism initated by the antipope Anicletus II.\r\rThe Third Lateran Council in 1179 was convoked by Pope Alexander III and put an end to the schism caused by the election of two antipopes. Notably, it also decreed that only Cardinals could elect a Pope by a two-thirds majority. It also excommunicated anyone who engaged in usury.\r\rThe Fourth Lateran Council was convoked by Innocent III and began in 1215. It was notable for its large number of attendees, its organization of the Fifth Crusade, as well as the decree that Jews and Muslims be required to wear special clothing. See “Councils” section in the Overview tab.\r\rFurther Refernce:\rWikipedia, “First Council of the Lateran”\rhttp://tinyurl.com/o7w4qna\r\r“Second Council of the Lateran”\rhttp://tinyurl.com/o7rnua5\r\r“Third Council of the Lateran”\rhttp://tinyurl.com/ogkpnwz\r\r“Fourth Council of the Lateran”\rhttp://tinyurl.com/nzjtd9f\r\rCoordinates:\r43.7833, 11.2500\r\r\r";
                                       
                                       SocialPins *uganda = [[SocialPins alloc] init];
                                       uganda.coordinate = CLLocationCoordinate2DMake(1.0667, 31.8833);
                                       uganda.title = @"Uganda";
                                       uganda.subtitle = @"Tribal Warfare & Water Scarcity";
                                       uganda.image = [UIImage imageNamed:@"uganda"];
                                       uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev\r\rCoordinates: 1.0667, 31.8833\r\r\r";
                                       
                                       SocialPins *asheville = [[SocialPins alloc] init];
                                       asheville.coordinate = CLLocationCoordinate2DMake(35.5800, -82.5558);
                                       asheville.title = @"St. Eugene Church";
                                       asheville.subtitle = @"Renewable Energy Exemplar";
                                       asheville.image = [UIImage imageNamed:@"StEugene"];
                                       asheville.information = @"\rSt. Eugene Church in Asheville, North Carolina, recently commited to using 100% renewable energy in the form of solar panels. These will sigificantly reduce its monthly energy bill.\r\rFurther Reference:\rSt. Eugene Church, www.steugene.org\rhttp://tinyurl.com/ofblbtf\r\r\r";
                                       
                                       SocialPins *burma = [[SocialPins alloc] init];
                                       burma.coordinate = CLLocationCoordinate2DMake(22.0000,  96.0000);
                                       burma.title = @"Burma";
                                       burma.subtitle = @"Religous Freedom Violations";
                                       burma.image = [UIImage imageNamed:@"Burma"];
                                       burma.information = @"\rBurma was categorized as a Tier 1 violator of religious freedom by the United States Commission on International Religious Freedom in 2015.\r\rFurther Reference:\rUSCIRF, Annual Report 2015\rhttp://tinyurl.com/m34ndev\r\r\r";
                                       
                                       SocialPins *cali = [[SocialPins alloc] init];
                                       cali.coordinate = CLLocationCoordinate2DMake(37.0000, -120.0000);
                                       cali.title = @"California";
                                       cali.subtitle = @"Catastrophic Drought";
                                       cali.image = [UIImage imageNamed:@"drought"];
                                       cali.information = @"\rIn 2015, California experienced an unprecedented drought which caused the state to implement mandatory water restrictions. Scientists attribute the severtity of the drought to the effects of climate change. Pope Francis highlighted the importance of water for human life and development, when he stated:\r\r“Fresh drinking water is an issue of primary importance, since it is indispensable for human life and for supporting terrestrial and aquatic ecosystems. Sources of fresh water are necessary for health care, agriculture and industry. Water supplies used to be relatively constant, but now in many places demand exceeds the sustainable supply, with dramatic consequences in the short and long term.”\r-Laudato Si, 28.\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rState of California, “Drought”\rhttp://tinyurl.com/prczpha\r\rCoordinates:\r37.0000, 120.0000\r\r\r";
                                       
                                       SocialPins *amazon = [[SocialPins alloc] init];
                                       amazon.coordinate = CLLocationCoordinate2DMake(-3.1600, -60.0300);
                                       amazon.title = @"Amazon Rain Forest";
                                       amazon.subtitle = @"Increasing Deforestation";
                                       amazon.image = [UIImage imageNamed:@"amazon"];
                                       amazon.information = @"\rThe Amazon Rain Forest is a vital eco-system of the South American continent. Pope Francis emphasized the importance of this and similar ecosystems for human development when he stated:\r\r“Let us mention, for example, those richly biodiverse lungs of our planet which are the Amazon and the Congo basins, or the great aquifers and glaciers. We know how important these are for the entire earth and for the future of humanity. The ecosystems of tropical forests possess an enormously complex biodiversity which is almost impossible to appreciate fully, yet when these forests are burned down or levelled for purposes of cultivation, within the space of a few years countless species are lost and the areas frequently become arid wastelands. A delicate balance has to be maintained when speaking about these places, for we cannot overlook the huge global economic interests which, under the guise of protecting them, can undermine the sovereignty of individual nations.”\r-Laudato Si, 38\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rNature, “Stopping Deforestation: Battle for the Amazon”. http://tinyurl.com/ngqjb5q\r\rCoordinates:\r-3.1600, 60.0300\r\r\r";
                                       
                                       SocialPins *texas = [[SocialPins alloc] init];
                                       texas.coordinate = CLLocationCoordinate2DMake(31.0000, -100.0000);
                                       texas.title = @"Texas";
                                       texas.subtitle = @"Leads U.S. in Capital Punishment";
                                       texas.image = [UIImage imageNamed:@"texas"];
                                       texas.information = @"\rWhile numerous states have abolished the death penalty, Texas' rate of execution remains the highest in the nation. Various social groups, such as the Innocence Project, are aimed at abolishing the death penalty in Texas and throughout the country.\r\rFurther Reference:\rThe Innocence Project\rhttp://innocenceproject.org\r\r\r";
                                       
                                       SocialPins *gitmo = [[SocialPins alloc] init];
                                       gitmo.coordinate = CLLocationCoordinate2DMake(19.9000, -75.1500);
                                       gitmo.title = @"Guantanamo Bay";
                                       gitmo.subtitle = @"Enemy Combatant Detention Camp";
                                       gitmo.image = [UIImage imageNamed:@"gitmo"];
                                       gitmo.information = @"\rAfter the 9/11 terrorist attacks on the United States, the U.S. government initiated a policy of detaining foreign nationals who were suspected of being terrorists or supplying material support to terrorist networks. This was controversial because detainees were not classified as prisoners of war and were deprived of the right to habius corpus, effectively allowing indefinite detention without trial. Subsequent news stories and a report by the United States Senate confirmed that torture had been practiced in the prison:\r\r“...CIA personnel, aided by two outside contractors, decided to initiate a program of indefinite secret detention and the use of brutal interrogation techniques in violation of U.S. law, treaty obligations, and our values.”\r-Senate Report, 2\r\rThe United States Conference of Catholic Bishops have written extensively the the U.S. Congress to share the concern of the Church in America on that reported events at Guantanamo:\r\r“Detainees have the right to a just and fair trial held in a timely manner. For at least 86 detainees 'a crime has not first been proven.' The indefinite detention of detainees is not only injurious to those individuals, it also wounds the moral reputation of our nation, compromises our commitment to the rule of law, and undermines our struggle against terrorism.”\r-USCCB, Letter\r\rFurther Reference:\r\rSenate Select Committee on Intelligence,\rStudy of CIA Detention and Interrogation Program\rhttp://tinyurl.com/zz6fn67\r\rUnited States Conference of Catholic Bishops,\rLetter Regarding Detainees at Guantanamo Bay\rhttp://tinyurl.com/hju2a87\r\rCoordinates: 19.9000, -75.1500\r\r\r";
                                       
                                       BiblicalPins *caesarea = [[BiblicalPins alloc] init];
                                       caesarea.coordinate = CLLocationCoordinate2DMake(32.5190, 34.9045);
                                       caesarea.title = @"Caesarea Maritima";
                                       caesarea.subtitle = @"Ancient Roman Sea Port";
                                       caesarea.image = [UIImage imageNamed:@"Caesarea"];
                                       caesarea.information = @"\rCaesarea Maritima was built by Herod the Great on the coast of Palestine and named in honor of Caesar Augustus. It later become the official residence of Roman procutators, such as Pontius Pilate. It boasted of an immense aqueduct that brought water from 7.5 kilometers away to the northeast, an amphitheater, a temple to Augustus, and, according to Josephus, the site of the Jewish act of civil disobedience in A.D. 26 in protest to Pilate's order to install Roman standards in the Temple. The New Testament book of Acts mentions Caesarea as one of the earliest missionary cities visited by the Apostles:\r\r“Now in Caesarea there was a man named Cornelius, a centurion of the Cohort called the Italica, devout and God-fearing along with his whole household, who used to give alms generously to the Jewish people and pray to God constantly. One afternoon about three o’clock, he saw plainly in a vision an angel of God come in to him and say to him, 'Cornelius.' He looked intently at him and, seized with fear, said, 'What is it, sir?' He said to him, 'Your prayers and almsgiving have ascended as a memorial offering before God. Now send some men to Joppa and summon one Simon who is called Peter. He is staying with another Simon, a tanner, who has a house by the sea.' When the angel who spoke to him had left, he called two of his servants and a devout soldier from his staff, explained everything to them, and sent them to Joppa.”\r-Acts 10:1-8\r\rJosephus gives a detailed account of the architecture of Caesarea in his book Antiquities of the Jews:\r\r “The city itself was called 'Caesarea', which was also itself built of fine materials, and was of a fine structure; nay, the very subterranean vaults and cellars had no less of architecture bestowed on them than had the buildings above ground. Some of these vaults carried things at even distances to the haven and to the sea; but one of them ran obliquely, and bound all the rest together, that both the rain and the filth of the citizens were together carried off with ease, and the sea itself, upon the flux of the tide from without, came into the city, and washed it all clean. Herod also built therein a theater of stone; and on the south quarter, behind the port, an amphitheater also, capable of holding a vast number of men, and conveniently situated for a prospect to the sea. So this city was thus finished in twelve years; during which time the king did not fail to go on both with the work, and to pay the charges that were necessary.”\r-Josephus, XV, 9\r\rJosephus later claimed that the desecration of a synogogue in Caesarea was the catalyst of a revolt that precipitated the First Jewish Revolt. Later, from A.D. 230-250, Caesarea became the intellectual home of the great church father, Origen. See ”Apostle”, ”Temple”.\r\rFurther Reference:\rNew American Bible Revised Edition, Acts 10\rhttp://tinyurl.com/zhlfhqb\r\rJosephus, “Antiquities of the Jews”\rhttp://tinyurl.com/j75tfyh\r\rThe Bible and Interpretation, “Caesarea Maritima”\rhttp://tinyurl.com/jcwyslc\r\rCoordinates: 32.5190, 34.9045\r\r\r";
                                       
                                       
                                       
                                       
                                       NSArray *annotations = [NSArray arrayWithObjects:jerusalem, gehenna, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, greatbr, philippines, rome, nazareth, capernaum, sierraLeone, camden, atlantic, vatican, constantinople, palestine, israel, alexandria, thessalonica, philippi, antioch, bethlehem, hebron, shiloh, lyon, vienne, chalcedon, constance, trent, florence, lateran, uganda, colossae, sepphoris, asheville, burma, ephesus2, cali, amazon, texas, gitmo, caesarea, nil];
                                       
                                       [self.mapView addAnnotations:annotations];

                                   
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
