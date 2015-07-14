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
    gehenna.information = @"\rGehenna was a valley, south of Jerusalem, where apostate Israelites would sacrifice their infants by burning them alive to worship the god Molech. 2 Kings 23 describes King Josiah destroying the shrine as part of his larger Deuteronomic Reform:\r\r10“The king also defiled Topheth in the Valley of Ben-hinnom, so that there would no longer be any immolation of sons or daughters by fire in honor of Molech.”\r\rLater, in Second Temple Judaism, it came to regarded as representative and a shorthand for everything evil and worthy of YHWH's punishment; a metonym for “hell”. This is the location and concept which Jesus mentions several times in the Synoptic Gospels. See “Second Temple Judaism”, “Synoptic Gospels” in the Dictionary tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 1034\rhttp://tinyurl.com/k3f2f8p\r\rNew American Bible Revised Edition\r2 Kings 23\rhttp://tinyurl.com/oety8xz\r\rCoordinates: 31.768406, 35.230439\r\r\r";
    
    BiblicalPins *rome = [[BiblicalPins alloc] init];
    rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
    rome.title = @"Rome";
    rome.subtitle = @"Capital of the Roman Empire";
    rome.image = [UIImage imageNamed:@"rome-1"];
    rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. St. Paul wrote a letter to the Roman church towards the end of his missionary career. It is famous for laying out his thesis of righteousness through faith in Jesus Christ apart from the Law:\r\r“But now the righteousness of God has been manifested apart from the law, though testified to by the law and the prophets, the righteousness of God through faith in Jesus Christ for all who believe. For there is no distinction; all have sinned and are deprived of the glory of God. They are justified freely by his grace through the redemption in Christ Jesus, whom God set forth as an expiation, through faith, by his blood, to prove his righteousness because of the forgiveness of sins previously committed, through the forbearance of God—to prove his righteousness in the present time, that he might be righteous and justify the one who has faith in Jesus.”\r-Romans 3:21-26\r\rAccording to tradition, Sts. Peter and Paul were martyred there during the persecution under the Emperor Nero in A.D. 64. The Roman historian Tacitus recounts the circumstances of the arrests:\r\r“Consequently, to get rid of the report, Nero fastened the guilt and inflicted the most exquisite tortures on a class hated for their abominations, called Christians by the populace. Christus, from whom the name had its origin, suffered the extreme penalty during the reign of Tiberius at the hands of one of our procurators, Pontius Pilatus, and a most mischievous superstition, thus checked for the moment, again broke out not only in Judæa, the first source of the evil, but even in Rome, where all things hideous and shameful from every part of the world find their centre and become popular. Accordingly, an arrest was first made of all who pleaded guilty; then, upon their information, an immense multitude was convicted, not so much of the crime of firing the city, as of hatred against mankind. Mockery of every sort was added to their deaths. Covered with the skins of beasts, they were torn by dogs and perished, or were nailed to crosses, or were doomed to the flames and burnt, to serve as a nightly illumination, when daylight had expired.”\r-Annals, 15.44\r\rFurther Reference:\rNew American Bible Revised Edition\rRomans, http://tinyurl.com/px9njnr\r\rTacitus, Annals Book XV\rhttp://tinyurl.com/nbwlrkw\r\rCoordinates:\r41.8900, 12.4938\r\r\r";
    
    BiblicalPins *nazareth = [[BiblicalPins alloc] init];
    nazareth.coordinate = CLLocationCoordinate2DMake(32.7000, 35.3040);
    nazareth.title = @"Nazareth";
    nazareth.subtitle = @"Traditional Hometown of Jesus";
    nazareth.image = [UIImage imageNamed:@"nazareth"];
    nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus (Acts 24:5).\r\rFurther Reference:\rPope John Paul II, Jubliee Pilgramage Homily on the Annunciation\rhttp://tinyurl.com/p4sjg9p\r\rCoordinates:\r32.7000, 35.3040\r\r\r";
    
    BiblicalPins *bethEl = [[BiblicalPins alloc] init];
    bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
    bethEl.title = @"Beth-El";
    bethEl.subtitle = @"Canaanite cultic site of El";
    bethEl.image = [UIImage imageNamed:@"bethel"];
    bethEl.information = @"\rBeth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon. In Genesis 32 and 35 it is associated with the Hebrew patriarch Jacob:\r\r“Jacob departed from Beer-sheba and proceeded toward Haran. When he came upon a certain place, he stopped there for the night, since the sun had already set. Taking one of the stones at the place, he put it under his head and lay down in that place. Then he had a dream: a stairway rested on the ground, with its top reaching to the heavens; and God’s angels were going up and down on it. And there was the LORD standing beside him and saying: I am the LORD, the God of Abraham your father and the God of Isaac; the land on which you are lying I will give to you and your descendants. Your descendants will be like the dust of the earth, and through them you will spread to the west and the east, to the north and the south. In you and your descendants all the families of the earth will find blessing. I am with you and will protect you wherever you go, and bring you back to this land. I will never leave you until I have done what I promised you. When Jacob awoke from his sleep, he said, 'Truly, the Lord is in this place and I did not know it!' He was afraid and said: 'How awesome this place is! This is nothing else but the house of God, the gateway to heaven!' Early the next morning Jacob took the stone that he had put under his head, set it up as a sacred pillar, and poured oil on top of it. He named that place Bethel, whereas the former name of the town had been Luz.”\r-Genesis 28: 10-19\r\rLater in 1 Kings, Bethel becomes one of two alternative worship sites established by King Jeroboam of the Northern Kingdom:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Bethel, the other in Dan. This led to sin, because the people frequented these calves in Bethel and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r\rFurther Reference:\rNew American Bible Revised Edition\rGenesis 32, http://tinyurl.com/nhpry6r\r\r1 Kings 12, http://tinyurl.com/nujmge2\r\rCoordinates:\r31.9390, 35.2260\r\r\r";
    
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
    ephesus.information = @"\rEphesus was the base for St. Paul's European missionary journeys. A letter in his name is addressed to the Ephesians, although many scholars believe it was originally intended as a general letter since some early manuscripts omit the phrase “who are in Ephesus”. It is counted among the so-called disputed letters of St. Paul. It is noted for its appeal to unity:\r\r“I, then, a prisoner for the Lord, urge you to live in a manner worthy of the call you have received, with all humility and gentleness, with patience, bearing with one another through love, striving to preserve the unity of the spirit through the bond of peace: one body and one Spirit, as you were also called to the one hope of your call; one Lord, one faith, one baptism; one God and Father of all, who is over all and through all and in all.”\r-Ephesians 4: 1-6\r\rFurther Reference:\rNew American Bible Revised Edition\rEphesians. http://tinyurl.com/nteryma\r\rCoordinates:\r37.9411, 27.3419\r\r\r";
    
    BiblicalPins *corinth = [[BiblicalPins alloc] init];
    corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
    corinth.title = @"Corinth";
    corinth.subtitle = @"Major Greek Port City";
    corinth.image = [UIImage imageNamed:@"corinth"];
    corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. The 2nd century Greek writer Pausanius gives a detailed description of Corinth in Book II of his 'Description of Greece':\r\r“Worth seeing here are a theater and a white-marble race-course. Within the sanctuary of the god stand on the one side portrait statues of athletes who have won victories at the Isthmian games, on the other side pine trees growing in a row, the greater number of them rising up straight. On the temple, which is not very large, stand bronze Tritons. In the fore-temple are images, two of Poseidon, a third of Amphitrite, and a Sea, which also is of bronze. The offerings inside were dedicated in our time by Herodes the Athenian, four horses, gilded except for the hoofs, which are of ivory..There is also an ancient sanctuary called the altar of the Cyclopes, and they sacrifice to the Cyclopes upon it.”\r-Description, 2.1.7-2.2.1\r\rSt. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition. In 1 Corinthians, St. Paul addresses both reports he has heard about the Corinthian church as well as a list of written questions presented to him via couriers. 1 Corinthians is famous for displaying St. Paul's ability to respond to new situations with Gospel-inspired principles. His instruction regarding food sacrificed to idols is illuminated in the context of Pausanius's description of Corinthian temples:\r\r“Now in regard to meat sacrificed to idols: we realize that 'all of us have knowledge'; knowledge inflates with pride, but love builds up. If anyone supposes he knows something, he does not yet know as he ought to know. But if one loves God, one is known by him. So about the eating of meat sacrificed to idols: we know that 'there is no idol in the world,' and that 'there is no God but one.' Indeed, even though there are so-called gods in heaven and on earth (there are, to be sure, many 'gods' and many 'lords'), yet for us there is one God, the Father, from whom all things are and for whom we exist, and one Lord, Jesus Christ, through whom all things are and through whom we exist.\r\rBut not all have this knowledge. There are some who have been so used to idolatry up until now that, when they eat meat sacrificed to idols, their conscience, which is weak, is defiled. Now food will not bring us closer to God. We are no worse off if we do not eat, nor are we better off if we do. But make sure that this liberty of yours in no way becomes a stumbling block to the weak. If someone sees you, with your knowledge, reclining at table in the temple of an idol, may not his conscience too, weak as it is, be 'built up' to eat the meat sacrificed to idols? Thus through your knowledge, the weak person is brought to destruction, the brother for whom Christ died. When you sin in this way against your brothers and wound their consciences, weak as they are, you are sinning against Christ. Therefore, if food causes my brother to sin, I will never eat meat again, so that I may not cause my brother to sin.”\r-1 Corinthians 8\r\rFurther Reference:\rPausanius, “Description of Greece”\rhttp://tinyurl.com/q6lxdl7\r\rNew American Bible Revised Edition\r1 Corinthians 8. http://tinyurl.com/qgkfxju\r\rCoordinates: 37.9333, 22.9333\r\r\r";
    
    BiblicalPins *colossae = [[BiblicalPins alloc] init];
    colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
    colossae.title = @"Colossae";
    colossae.subtitle = @"Greek City in the Lycus Valley";
    colossae.image = [UIImage imageNamed:@"colossae"];
    colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters. Like Philippians, it contains an early Christian hymn:\r\r“He is the image of the invisible God, the firstborn of all creation. For in him were created all things in heaven and on earth, the visible and the invisible, whether thrones or dominions or principalities or powers; all things were created through him and for him. He is before all things, and in him all things hold together. He is the head of the body, the church. He is the beginning, the firstborn from the dead, that in all things he himself might be preeminent. For in him all the fullness was pleased to dwell, and through him to reconcile all things for him, making peace by the blood of his cross [through him], whether those on earth or those in heaven.”\r-Colossians 1: 15-20\r\rFurther Refernce:\rNew American Bible Revised Edition\rColossians, http://tinyurl.com/pna6o9t\r\rCoordinates:\r37.7878, 29.2615\r\r\r";
    
    BiblicalPins *dan = [[BiblicalPins alloc] init];
    dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
    dan.title = @"Dan";
    dan.image = [UIImage imageNamed:@"dan"];
    dan.subtitle = @"Northern Israelite Cultic Site";
    dan.information = @"\rDan was one of the two sites at which Jeroboam established alternative worship sites for the newly established northern kingdom as described in 1 Kings 12.\r\rFurther Reference:\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520\r\r\r";
    
    BiblicalPins *jericho = [[BiblicalPins alloc] init];
    jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
    jericho.title = @"Jericho";
    jericho.subtitle = @"Walled Canaanite City";
    jericho.image = [UIImage imageNamed:@"jericho"];
    jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500\r\r\r";

    
    BiblicalPins *temple = [[BiblicalPins alloc] init];
    temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
    temple.title = @"The Temple";
    temple.subtitle = @"The House of YHWH";
    temple.image = [UIImage imageNamed:@"temple"];
    temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great.\r\rFurther Reference:\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
    
    BiblicalPins *hazor = [[BiblicalPins alloc] init];
    hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
    hazor.title = @"Hazor";
    hazor.image = [UIImage imageNamed:@"hazor"];
    hazor.subtitle = @"Major Ancient Canaanite City";
    hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai. However, recent archeological findings show that Hazor was destroyed by internal revolt rather than external attack. This is one datum that is explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the the Dictionary tab.\r\rFurther Reference:\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669\r\r\r";
    
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
    greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. Glacial melt intensifies global warming by releasing increased amounts of previously trapped carbon into the atmosphere. Pope Francis has identified the risk to glaciers from climate change by stating:\r\r“Warming has effects on the carbon cycle. It creates a vicious circle which aggravates the situation even more, affecting the availability of essential resources like drinking water, energy and agricultural production in warmer regions, and leading to the extinction of part of the planet’s biodiversity. The melting in the polar ice caps and in high altitude plains can lead to the dangerous release of methane gas, while the decomposition of frozen organic material can further increase the emission of carbon dioxide. Things are made worse by the loss of tropical forests which would otherwise help to mitigate climate change. Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas.” -Laudito Si'', 24\r\rFurther Reference:\rPope Francis, “Laudito Si''”\rhttp://tinyurl.com/o6sowft\r\rCatholic Climate Movement\rhttp://tinyurl.com/lxe52t7\r\rNational Snow & Ice Data Center\r“Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000\r\r\r";
    
    SocialPins *greatbr = [[SocialPins alloc] init];
    greatbr.coordinate = CLLocationCoordinate2DMake(-18.2861, 147.7000);
    greatbr.title = @"Great Barrier Reef";
    greatbr.subtitle = @"Threatened Coral Ecosystem";
    greatbr.image = [UIImage imageNamed:@"barrier"];
    greatbr.information = @"\rAustralia's Great Barrier Reef is the world's largest coral ecosystem. Climate change is putting many elements of the reef under threat. Pope Francis emphasized the importance of safeguarding coral reef systems when he stated:\r\r“In tropical and subtropical seas, we find coral reefs comparable to the great forests on dry land, for they shelter approximately a million species, including fish, crabs, molluscs, sponges and algae. Many of the world’s coral reefs are already barren or in a state of constant decline. ‘Who turned the wonderworld of the seas into underwater cemeteries bereft of colour and life?’ This phenomenon is due largely to pollution which reaches the sea as the result of deforestation, agricultural monocultures, industrial waste and destructive fishing methods, especially those using cyanide and dynamite. It is aggravated by the rise in temperature of the oceans. All of this helps us to see that every intervention in nature can have consequences which are not immediately evident, and that certain ways of exploiting resources prove costly in terms of degradation which ultimately reaches the ocean bed itself.” -Laudito Si', 41\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rCatholic Bishops of Queensland, “Pastoral Letter on the Great Barrier Reef”\rhttp://tinyurl.com/one2fma\r\rCatholic Care Australia\rhttp://catholicearthcare.org.au\r\rCoordinates:\r18.2861, 147.7000\r\r\r";
    
    
    HistoricalPins *alexandria = [[HistoricalPins alloc] init];
    alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
    alexandria.title = @"Alexandria";
    alexandria.subtitle = @"Eastern Patriarchate";
    alexandria.image = [UIImage imageNamed:@"alexandria"]; 
    alexandria.information = @"\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen and Clement of Alexandira. It was known for its highly allegorical hermeneutical method in contrast with that of Antioch. It later became one of 5 major centers of Christianity in the 4th century in the canons of the Nicene Council.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192\r\r\r";
    
    HistoricalPins *rome2 = [[HistoricalPins alloc] init];
    rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
    rome2.title = @"Church of Rome";
    rome2.subtitle = @"The Apostolic See";
    rome2.image = [UIImage imageNamed:@"vatican"];
    rome2.information = @"\rThe Church of Rome acquired a prominence in the earliest years of the Church, thanks in part, to the martyrdoms of both Peter and Paul in A.D. 64.  The earliest Christian writers testify to its importance. Ignatius of Antioch, Clement of Rome, Irenaeus of Lyon, and others all bear witness to the fact that the Roman church was regarded as a source of unity among all churches. Over time, this view developed into the idea that Peter was the first Bishop of Rome, (the Pope), and subsequent bishops of Rome inherited his Apostolic authority. Later Church teaching would declare that the Bishop of Rome held authority over the whole Church, and his approval was necessary to confirm the proceedings of an Ecumenical Council. The Apostolic See is also the head of Vatican City, the smallest nation on Earth, which was created in 1929 as part of the Lateran Treaty between the Italian government and the Holy See. The Pope is thus also formally recognized as a head of state.\r\rFurther Reference:\rWikipedia, “Holy See”\rhttp://tinyurl.com/fdy54\r\rCoordinates:\r41.9022, 12.4533\r\r\r";
    
    HistoricalPins *constantinople = [[HistoricalPins alloc] init];
    constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
    constantinople.title = @"Constantinople";
    constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
    constantinople.image = [UIImage imageNamed:@"constantinople"];
    constantinople.information = @"\rThe 2nd and 5th Ecumenical Councils of Constantinople, in A.D. 381 and 553, respectively, confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. See “Councils” section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\rCoordinates:\r41.0122, 28.9760\r\r\r";
    
    SocialPins *sierraLeone = [[SocialPins alloc] init];
    sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
    sierraLeone.title = @"Freetown";
    sierraLeone.subtitle = @"Insufficient Health Care";
    sierraLeone.image = [UIImage imageNamed:@"sierra"];
    sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014. The city's and larger country's health care infrastructure was devastated by the civil war from 1991-2002.\r\rWikipedia, “Sierra Leone”\rhttp://tinyurl.com/m7ql8\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates: 8.4844, -13.2344\r\r\r";
    
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
    atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization. Pope Francis emphasized the importance of maintaining the health of the world's oceans when he stated:\r\r“Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas...Oceans not only contain the bulk of our planet’s water supply, but also most of the immense variety of living creatures, many of them still unknown to us and threatened for various reasons. What is more, marine life in rivers, lakes, seas and oceans, which feeds a great part of the world’s population, is affected by uncontrolled fishing, leading to a drastic depletion of certain species. Selective forms of fishing which discard much of what they collect continue unabated. Particularly threatened are marine organisms which we tend to overlook, like some forms of plankton; they represent a significant element in the ocean food chain, and species used for our food ultimately depend on them.” -Laudito Si', 24, 40\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rNOAA, National Ocean Service\rhttp://tinyurl.com/yc7jxud\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\r\r";
    
    SocialPins *philippines = [[SocialPins alloc] init];
    philippines.coordinate = CLLocationCoordinate2DMake(13.1333, 123.7333);
    philippines.title = @"Legazpi City";
    philippines.subtitle = @"Carbon Mining Coastal Destruction";
    philippines.image = [UIImage imageNamed:@"legazpi"];
    philippines.information = @"\rThe coast of Legazpi City, Philippines, is suffering from the effects of carbon mining. Pope Francis hightlighted the importance of addressing human intensification of the carbon cycle when he stated:\r\r“Climate change is a global problem with grave implications: environmental, social, economic, political and for the distribution of goods. It represents one of the principal challenges facing humanity in our day. Its worst impact will probably be felt by developing countries in coming decades. Many of the poor live in areas particularly affected by phenomena related to warming, and their means of subsistence are largely dependent on natural reserves and ecosystemic services such as agriculture, fishing and forestry. They have no other financial activities or resources which can enable them to adapt to climate change or to face natural disasters, and their access to social services and protection is very limited. For example, changes in climate, to which animals and plants cannot adapt, lead them to migrate; this in turn affects the livelihood of the poor, who are then forced to leave their homes, with great uncertainty for their future and that of their children. There has been a tragic rise in the number of migrants seeking to flee from the growing poverty caused by environmental degradation. They are not recognized by international conventions as refugees; they bear the loss of the lives they have left behind, without enjoying any legal protection whatsoever.” -Laudito Si', 25\r\rFurther Refernce\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates:\r13.1333, 123.7333\r\r\r";
    
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
    thessalonica.information = @"\rThessalonica (modern Thessaloniki) was home to one of the earlier Christian communities founded by the St. Paul. There are two New Testament letters addressed to this community, however only one of them (1 Thessalonians) is counted as authentically Pauline. The other (2 Thessalonians) is among the so-called disputed letters. 1 Thessalonians contains an reference to an earlier oral tradition of Jesus:\r\r“We do not want you to be unaware, brothers, about those who have fallen asleep, so that you may not grieve like the rest, who have no hope. For if we believe that Jesus died and rose, so too will God, through Jesus, bring with him those who have fallen asleep. Indeed, we tell you this, on the word of the Lord, that we who are alive, who are left until the coming of the Lord, will surely not precede those who have fallen asleep. For the Lord himself, with a word of command, with the voice of an archangel and with the trumpet of God, will come down from heaven, and the dead in Christ will rise first. Then we who are alive, who are left, will be caught up together with them in the clouds to meet the Lord in the air. Thus we shall always be with the Lord. Therefore, console one another with these words.” -1 Thessalonians 4: 13-18\r\rFurther Reference:\rNew American Standard Bible\r1 Thessalonians, http://tinyurl.com/okmr7h9\r\rCoordinates:\r40.6500, 22.9000\r\r\r";
    
    BiblicalPins *philippi = [[BiblicalPins alloc] init];
    philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
    philippi.title = @"Philippi";
    philippi.subtitle = @"Major Greek City";
    philippi.image = [UIImage imageNamed:@"philippi"];
    philippi.information = @"\rAccording to Acts 16: 11-15, Philippi was a Roman colony in which both St. Paul and St. Barnabas conducted missionary work. Philippians contains what many scholars believe to be an early Christian hymn describing the Incarnation:\r\r“Have among yourselves the same attitude that is also yours in Christ Jesus, Who, though he was in the form of God did not regard equality with God something to be grasped. Rather, he emptied himself, taking the form of a slave, coming in human likeness; and found human in appearance, he humbled himself, becoming obedient to death, even death on a cross. Because of this, God greatly exalted him and bestowed on him the name that is above every name, that at the name of Jesus every knee should bend, of those in heaven and on earth and under the earth, and every tongue confess that Jesus Christ is Lord, to the glory of God the Father.”\r-Philippians 2: 5-11\r\rSee “Incarnation” in the Dictionary.\r\rFurther Reference:\rNew American Bible Revised Edition\rPhilippians, http://tinyurl.com/qaucygv\r\rCoordinates:\r41.0131, 24.2864\r\r\r";
    
    BiblicalPins *antioch = [[BiblicalPins alloc] init];
    antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
    antioch.title = @"Antioch";
    antioch.subtitle = @"Capital of Ancient Syria";
    antioch.image = [UIImage imageNamed:@"antioch"];
    antioch.information = @"\rAntioch was a major center for Gentile Christianity in the first century as recorded in the Acts of the Apostles. St. Paul and St. Barnabas launched their missionary journeys from this city. The disciples of Jesus were first called Christians in Antioch (Acts 11:26).\r\r“Now those who had been scattered by the persecution that arose because of Stephen went as far as Phoenicia, Cyprus, and Antioch, preaching the word to no one but Jews. There were some Cypriots and Cyrenians among them, however, who came to Antioch and began to speak to the Greeks as well, proclaiming the Lord Jesus. The hand of the Lord was with them and a great number who believed turned to the Lord. The news about them reached the ears of the church in Jerusalem, and they sent Barnabas to Antioch. When he arrived and saw the grace of God, he rejoiced and encouraged them all to remain faithful to the Lord in firmness of heart, for he was a good man, filled with the holy Spirit and faith. And a large number of people was added to the Lord. Then he went to Tarsus to look for Saul, and when he had found him he brought him to Antioch. For a whole year they met with the church and taught a large number of people, and it was in Antioch that the disciples were first called 'Christians'.” - Acts 11: 19-26\r\rFurther Reference:\rNew American Bible Revised Edition\rActs 11, http://tinyurl.com/oqf4rcz\r\rCoordinates:\r36.2000, 36.1500\r\r\r";
    
    BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
    bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
    bethlehem.title = @"Bethlehem";
    bethlehem.image = [UIImage imageNamed:@"bethlehem"]; 
    bethlehem.subtitle = @"Traditional Birthplace of Jesus";
    bethlehem.information = @"\rBethlehem is located just south of Jerusalem. While Matthew portrays Bethlehem as Joseph and Mary's hometown, Luke states that Nazareth was their hometown, which they left in order to be in Bethlehem for a census.\r\rFurther Reference:\rWikipedia, “Bethlehem”\rhttp://tinyurl.com/natjqkv\r\rCoordinates:\r31.7031, 35.1956\r\r\r";
    
    BiblicalPins *ramah = [[BiblicalPins alloc] init];
    ramah.coordinate = CLLocationCoordinate2DMake(32.936389, 35.367222);
    ramah.title = @"Ramah";
    
    
    BiblicalPins *hebron = [[BiblicalPins alloc] init];
    hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
    hebron.title = @"Hebron";
    hebron.subtitle = @"David's Judahite Capital";
    hebron.image = [UIImage imageNamed:@"hebron"];
    hebron.information = @"\rOne of the oldest continually occupied cities in the world, Hebron is first mentioned in the biblical story-cycles of Abraham. In Genesis 23, Abraham buys Hebron from Ephron the Hittite for 400 sheckels. Abraham, Isaac, and Jacob are portrayed as buried there. Numbers 13:22 indicates that Hebron was founded around 1720 B.C. In the book of Judges, Joshua assigns Hebron to Caleb as part of the territory of Judah. In the book of 2 Samuel, David is annointed King of Judah and all Israel at Hebron.\r\r“All the tribes of Israel came to David at Hebron and said, 'We are your own flesh and blood. In the past, while Saul was king over us, you were the one who led Israel on their military campaigns. And the LORD said to you, ‘You will shepherd my people Israel, and you will become their ruler.’ When all the elders of Israel had come to King David at Hebron, the king made a covenant with them at Hebron before the LORD, and they anointed David king over Israel.”\r-2 Samuel 5: 1-3\r\rFurther Reference:\rWikipedia, “Hebron”. http://tinyurl.com/ppdn6q8\r\rCoordinates:\r31.5333, 35.0950\r\r\r";
    
    BiblicalPins *shiloh = [[BiblicalPins alloc] init];
    shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
    shiloh.title = @"Shiloh";
    shiloh.subtitle = @"Shrine of the Ark of the Covenant";
    shiloh.image = [UIImage imageNamed:@"shiloh"];
    shiloh.information = @"\rShiloh was a major cultic site asociated with the Ark of the Covenant and the tribe of Levi. It is first mentioned in the context of the Ark of the Covenant in 1 Samuel 4: 3-4\r\r“When the soldiers returned to camp, the elders of Israel asked, 'Why did the LORD bring defeat on us today before the Philistines? Let us bring the ark of the LORD’s covenant from Shiloh, so that he may go with us and save us from the hand of our enemies.' So the people sent men to Shiloh, and they brought back the ark of the covenant of the LORD Almighty, who is enthroned between the cherubim. And Eli’s two sons, Hophni and Phinehas, were there with the ark of the covenant of God.”\r\rFurther Reference:\rWikipedia, “Shiloh”\rhttp://tinyurl.com/qevxuoy\r\r\r";
    
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
    chalcedon.information = @"\rThe Council of Chalcedon was held in A.D. 451 and promulgated what would become the classical Christological definition of Jesus Christ as one person in two natures:\r\r“We, then, following the holy Fathers, all with one consent, teach people to confess one and the same Son, our Lord Jesus Christ, the same perfect in Godhead and also perfect in manhood; truly God and truly man, of a rational soul and body; consubstantial with the Father according to the Godhead, and consubstantial with us according to the Manhood; in all things like unto us, without sin; begotten before all ages of the Father according to the Godhead, and in these latter days, for us and for our salvation, born of the Virgin Mary, the Mother of God, according to the Manhood; one and the same Christ, Son, Lord, only begotten, to be acknowledged in two natures, inconfusedly, unchangeably, indivisibly, inseparably; (ἐν δύο φύσεσιν ἀσυγχύτως, ἀτρέπτως, ἀδιαιρέτως, ἀχωρίστως) the distinction of natures being by no means taken away by the union, but rather the property of each nature being preserved, and concurring in one Person (prosopon) and one Subsistence, not parted or divided into two persons, but one and the same Son, and only begotten God, the Word, the Lord Jesus Christ; as the prophets from the beginning [have declared] concerning Him, and the Lord Jesus Christ Himself has taught us, and the Creed of the holy Fathers has handed down to us.” See the Councils section in the Overview tab.\r\rCoordinates:\r40.9833, 29.0333\r\r\r";
    
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
    uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates: 1.0667, 31.8833\r\r\r";
    
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
    cali.information = @"\rIn 2015, California experienced an unprecedented drought which caused the state to implement mandatory water restrictions. Scientists attribute the severtity of the drought to the effects of climate change. Pope Francis highlighted the importance of water for human life and development, when he stated:\r\r“Fresh drinking water is an issue of primary importance, since it is indispensable for human life and for supporting terrestrial and aquatic ecosystems. Sources of fresh water are necessary for health care, agriculture and industry. Water supplies used to be relatively constant, but now in many places demand exceeds the sustainable supply, with dramatic consequences in the short and long term.” -Laudito Si', 28.\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rState of California, “Drought”\rhttp://tinyurl.com/prczpha\r\rCoordinates:\r37.0000, 120.0000\r\r\r";
    
    SocialPins *amazon = [[SocialPins alloc] init];
    amazon.coordinate = CLLocationCoordinate2DMake(-3.1600, -60.0300);
    amazon.title = @"Amazon Rain Forest";
    amazon.subtitle = @"Increasing Deforestation";
    amazon.image = [UIImage imageNamed:@"amazon"];
    amazon.information = @"\rThe Amazon Rain Forest is a vital eco-system of the South American continent. Pope Francis emphasized the importance of this and similar ecosystems for human development when he stated:\r\r“Let us mention, for example, those richly biodiverse lungs of our planet which are the Amazon and the Congo basins, or the great aquifers and glaciers. We know how important these are for the entire earth and for the future of humanity. The ecosystems of tropical forests possess an enormously complex biodiversity which is almost impossible to appreciate fully, yet when these forests are burned down or levelled for purposes of cultivation, within the space of a few years countless species are lost and the areas frequently become arid wastelands. A delicate balance has to be maintained when speaking about these places, for we cannot overlook the huge global economic interests which, under the guise of protecting them, can undermine the sovereignty of individual nations.” -Laudito Si', 38\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rNature, “Stopping Deforestation: Battle for the Amazon”. http://tinyurl.com/ngqjb5q\r\rCoordinates:\r-3.1600, 60.0300\r\r\r";
    
    SocialPins *texas = [[SocialPins alloc] init];
    texas.coordinate = CLLocationCoordinate2DMake(31.0000, -100.0000);
    texas.title = @"Texas";
    texas.subtitle = @"Leads U.S. in Capital Punishment";
    texas.image = [UIImage imageNamed:@"texas"];
    texas.information = @"\rWhile numerous states have abolished the death penalty, Texas' rate of execution remains the highest in the nation. Various social groups, such as the Innocence Project, are aimed at abolishing the death penalty in Texas and throughout the country.\r\rFurther Reference:\rThe Innocence Project\rhttp://innocenceproject.org\r\r\r";



    
    NSArray *annotations = [NSArray arrayWithObjects:jerusalem, gehenna, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, greatbr, philippines, rome, nazareth, capernaum, sierraLeone, camden, atlantic, rome2, constantinople, palestine, israel, alexandria, thessalonica, philippi, antioch, bethlehem, hebron, shiloh, lyon, vienne, chalcedon, constance, trent, florence, lateran, uganda, colossae, sepphoris, asheville, burma, ephesus2, cali, amazon, texas, nil];
    
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
    
    UIAlertAction* israelAction = [UIAlertAction actionWithTitle:@"Old Testament" style:UIAlertActionStyleDefault
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
                                      bethEl.subtitle = @"Canaanite cultic site of El";
                                      bethEl.image = [UIImage imageNamed:@"bethel"];
                                      bethEl.information = @"\rBeth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon. In Genesis 32 and 35 it is associated with the Hebrew patriarch Jacob:\r\r“Jacob departed from Beer-sheba and proceeded toward Haran. When he came upon a certain place, he stopped there for the night, since the sun had already set. Taking one of the stones at the place, he put it under his head and lay down in that place. Then he had a dream: a stairway rested on the ground, with its top reaching to the heavens; and God’s angels were going up and down on it. And there was the LORD standing beside him and saying: I am the LORD, the God of Abraham your father and the God of Isaac; the land on which you are lying I will give to you and your descendants. Your descendants will be like the dust of the earth, and through them you will spread to the west and the east, to the north and the south. In you and your descendants all the families of the earth will find blessing. I am with you and will protect you wherever you go, and bring you back to this land. I will never leave you until I have done what I promised you. When Jacob awoke from his sleep, he said, 'Truly, the Lord is in this place and I did not know it!' He was afraid and said: 'How awesome this place is! This is nothing else but the house of God, the gateway to heaven!' Early the next morning Jacob took the stone that he had put under his head, set it up as a sacred pillar, and poured oil on top of it. He named that place Bethel, whereas the former name of the town had been Luz.”\r-Genesis 28: 10-19\r\rFurther Reference:\rWikipeida, “Bethel”\rhttp://tinyurl.com/b5fpuc\r\rCoordinates:\r31.9390, 35.2260\r\r\r";

                                      
                                          BiblicalPins *dan = [[BiblicalPins alloc] init];
                                          dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
                                          dan.title = @"Dan";
                                          dan.image = [UIImage imageNamed:@"dan"];
                                          dan.subtitle = @"Northern Israelite Cultic Site";
                                          dan.information = @"\rDan was one of the two sites at which Jeroboam established alternative worship sites for the newly established northern kingdom as described in 1 Kings 12.\r\rFurther Reference:\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520\r\r\r";
                                      
                                      BiblicalPins *temple = [[BiblicalPins alloc] init];
                                      temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                      temple.title = @"The Temple";
                                      temple.subtitle = @"The House of YHWH";
                                      temple.image = [UIImage imageNamed:@"temple"];
                                      temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great.\r\rFurther Reference:\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
                                      
                                      BiblicalPins *hazor = [[BiblicalPins alloc] init];
                                      hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
                                      hazor.title = @"Hazor";
                                      hazor.image = [UIImage imageNamed:@"hazor"];
                                      hazor.subtitle = @"Major Ancient Canaanite City";
                                      hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai. However, recent archeological findings show that Hazor was destroyed by internal revolt rather than external attack. This is one datum that is explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the “Biblical” category of the Dictionary tab.\r\rFurther Reference:\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669\r\r\r";
                                      
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
                                      shiloh.information = @"\rShiloh was a major cultic site asociated with the Ark of the Covenant and the tribe of Levi. It is first mentioned in the context of the Ark of the Covenant in 1 Samuel 4: 3-4\r\r“When the soldiers returned to camp, the elders of Israel asked, 'Why did the LORD bring defeat on us today before the Philistines? Let us bring the ark of the LORD’s covenant from Shiloh, so that he may go with us and save us from the hand of our enemies.' So the people sent men to Shiloh, and they brought back the ark of the covenant of the LORD Almighty, who is enthroned between the cherubim. And Eli’s two sons, Hophni and Phinehas, were there with the ark of the covenant of God.”\r\rFurther Reference:\rWikipedia, “Shiloh”\rhttp://tinyurl.com/qevxuoy\r\r\r";

                                      
                                      BiblicalPins *hebron = [[BiblicalPins alloc] init];
                                      hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
                                      hebron.title = @"Hebron";
                                      hebron.subtitle = @"David's Judahite Capital";
                                      hebron.image = [UIImage imageNamed:@"hebron"];
                                      hebron.information = @"\rOne of the oldest continually occupied cities in the world, Hebron is first mentioned in the biblical story-cycles of Abraham. In Genesis 23, Abraham buys Hebron from Ephron the Hittite for 400 sheckels. Abraham, Isaac, and Jacob are portrayed as buried there. Numbers 13:22 indicates that Hebron was founded around 1720 B.C. In the book of Judges, Joshua assigns Hebron to Caleb as part of the territory of Judah. In the book of 2 Samuel, David is annointed King of Judah and all Israel at Hebron.\r\r“All the tribes of Israel came to David at Hebron and said, 'We are your own flesh and blood. In the past, while Saul was king over us, you were the one who led Israel on their military campaigns. And the LORD said to you, ‘You will shepherd my people Israel, and you will become their ruler.’ When all the elders of Israel had come to King David at Hebron, the king made a covenant with them at Hebron before the LORD, and they anointed David king over Israel.”\r-2 Samuel 5: 1-3\r\rFurther Reference:\rWikipedia, “Hebron”. http://tinyurl.com/ppdn6q8\r\rCoordinates:\r31.5333, 35.0950\r\r\r";

                                      
                                      
                                      
                                      
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
                                   nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus.\r\rFurther Reference:\rWikipedia, “Nazareth”\r\rCoordinates:\r32.7000, 35.3040\r\r\r";
                                   
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
                                   ephesus.information = @"\rEphesus was the base for St. Paul's European missionary journeys. A letter in his name is addressed to the Ephesians, although many scholars believe it was originally intended as a general letter since some early manuscripts omit the phrase “who are in Ephesus”. It is counted among the so-called disputed letters of St. Paul. It is noted for its appeal to unity:\r\r“I, then, a prisoner for the Lord, urge you to live in a manner worthy of the call you have received, with all humility and gentleness, with patience, bearing with one another through love, striving to preserve the unity of the spirit through the bond of peace: one body and one Spirit, as you were also called to the one hope of your call; one Lord, one faith, one baptism; one God and Father of all, who is over all and through all and in all.”\r-Ephesians 4: 1-6\r\rFurther Reference:\rWikipedia, “Ephesus”\rhttp://tinyurl.com/olvyv\r\rCoordinates:\r37.9411, 27.3419\r\r\r";

                                   
                                   BiblicalPins *corinth = [[BiblicalPins alloc] init];
                                   corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
                                   corinth.title = @"Corinth";
                                   corinth.subtitle = @"Major Greek Port City";
                                   corinth.image = [UIImage imageNamed:@"corinth"];
                                   corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. The 2nd century Greek writer Pausanius gives a detailed description of Corinth in Book II of his 'Description of Greece':\r\r“Worth seeing here are a theater and a white-marble race-course. Within the sanctuary of the god stand on the one side portrait statues of athletes who have won victories at the Isthmian games, on the other side pine trees growing in a row, the greater number of them rising up straight. On the temple, which is not very large, stand bronze Tritons. In the fore-temple are images, two of Poseidon, a third of Amphitrite, and a Sea, which also is of bronze. The offerings inside were dedicated in our time by Herodes the Athenian, four horses, gilded except for the hoofs, which are of ivory..There is also an ancient sanctuary called the altar of the Cyclopes, and they sacrifice to the Cyclopes upon it.”\r-Description, 2.1.7-2.2.1\r\rSt. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition. In 1 Corinthians, St. Paul addresses both reports he has heard about the Corinthian church as well as a list of written questions presented to him via couriers. 1 Corinthians is famous for displaying St. Paul's ability to respond to new situations with Gospel-inspired principles. His instruction regarding food sacrificed to idols is illuminated in the context of Pausanius's description of Corinthian temples:\r\r“Now in regard to meat sacrificed to idols: we realize that 'all of us have knowledge'; knowledge inflates with pride, but love builds up. If anyone supposes he knows something, he does not yet know as he ought to know. But if one loves God, one is known by him. So about the eating of meat sacrificed to idols: we know that 'there is no idol in the world,' and that 'there is no God but one.' Indeed, even though there are so-called gods in heaven and on earth (there are, to be sure, many 'gods' and many 'lords'), yet for us there is one God, the Father, from whom all things are and for whom we exist, and one Lord, Jesus Christ, through whom all things are and through whom we exist.\r\rBut not all have this knowledge. There are some who have been so used to idolatry up until now that, when they eat meat sacrificed to idols, their conscience, which is weak, is defiled. Now food will not bring us closer to God. We are no worse off if we do not eat, nor are we better off if we do. But make sure that this liberty of yours in no way becomes a stumbling block to the weak. If someone sees you, with your knowledge, reclining at table in the temple of an idol, may not his conscience too, weak as it is, be 'built up' to eat the meat sacrificed to idols? Thus through your knowledge, the weak person is brought to destruction, the brother for whom Christ died. When you sin in this way against your brothers and wound their consciences, weak as they are, you are sinning against Christ. Therefore, if food causes my brother to sin, I will never eat meat again, so that I may not cause my brother to sin.”\r-1 Corinthians 8\r\rFurther Reference:\rPausanius, “Description of Greece”\rhttp://tinyurl.com/q6lxdl7\r\rNew American Bible Revised Edition\r1 Corinthians 8. http://tinyurl.com/qgkfxju\r\rCoordinates: 37.9333, 22.9333\r\r\r";

                                   
                                   BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
                                   thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
                                   thessalonica.title = @"Thessalonica";
                                   thessalonica.subtitle = @"Greek Coastal City";
                                   thessalonica.image = [UIImage imageNamed:@"thessalonica"];
                                   thessalonica.information = @"\rThessalonica (modern Thessaloniki) was home to one of the earlier Christian communities founded by the St. Paul. There are two New Testament letters addressed to this community, however only one of them (1 Thessalonians) is counted as authentically Pauline. The other (2 Thessalonians) is among the so-called disputed letters. 1 Thessalonians contains an reference to an earlier oral tradition of Jesus:\r\r“We do not want you to be unaware, brothers, about those who have fallen asleep, so that you may not grieve like the rest, who have no hope. For if we believe that Jesus died and rose, so too will God, through Jesus, bring with him those who have fallen asleep. Indeed, we tell you this, on the word of the Lord, that we who are alive, who are left until the coming of the Lord, will surely not precede those who have fallen asleep. For the Lord himself, with a word of command, with the voice of an archangel and with the trumpet of God, will come down from heaven, and the dead in Christ will rise first. Then we who are alive, who are left, will be caught up together with them in the clouds to meet the Lord in the air. Thus we shall always be with the Lord. Therefore, console one another with these words.” -1 Thessalonians 4: 13-18\r\rFurther Reference:\rWikipedia, “Thessaloniki”\rhttp://tinyurl.com/nstv7sc\r\rCoordinates:\r40.6500, 22.9000\r\r\r";
                                   
                                   BiblicalPins *philippi = [[BiblicalPins alloc] init];
                                   philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
                                   philippi.title = @"Philippi";
                                   philippi.subtitle = @"Major Greek City";
                                   philippi.image = [UIImage imageNamed:@"philippi"];
                                   philippi.information = @"\rAccording to Acts 16: 11-15, Philippi was a Roman colony in which both St. Paul and St. Barnabas conducted missionary work. Philippians contains what many scholars believe to be an early Christian hymn describing the Incarnation:\r\r“Have among yourselves the same attitude that is also yours in Christ Jesus, Who, though he was in the form of God did not regard equality with God something to be grasped. Rather, he emptied himself, taking the form of a slave, coming in human likeness; and found human in appearance, he humbled himself, becoming obedient to death, even death on a cross. Because of this, God greatly exalted him and bestowed on him the name that is above every name, that at the name of Jesus every knee should bend, of those in heaven and on earth and under the earth, and every tongue confess that Jesus Christ is Lord, to the glory of God the Father.”\r-Philippians 2: 5-11\r\rSee “Incarnation” in the Dictionary.\r\rFurther Reference:\rWikipedia, “Philippi”\rhttp://tinyurl.com/pkb8fmp\r\rCoordinates:\r41.0131, 24.2864\r\r\r";

                                   
                                   BiblicalPins *rome = [[BiblicalPins alloc] init];
                                   rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
                                   rome.title = @"Rome";
                                   rome.subtitle = @"Capital of the Roman Empire";
                                   rome.image = [UIImage imageNamed:@"rome-1"];
                                   rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. St. Paul wrote a letter to the Roman church towards the end of his missionary career. It is famous for laying out his thesis of righteousness through faith in Jesus Christ apart from the Law:\r\r“But now the righteousness of God has been manifested apart from the law, though testified to by the law and the prophets, the righteousness of God through faith in Jesus Christ for all who believe. For there is no distinction; all have sinned and are deprived of the glory of God. They are justified freely by his grace through the redemption in Christ Jesus, whom God set forth as an expiation, through faith, by his blood, to prove his righteousness because of the forgiveness of sins previously committed, through the forbearance of God—to prove his righteousness in the present time, that he might be righteous and justify the one who has faith in Jesus.”\r-Romans 3:21-26\r\rIgnatius of Antioch refers to the Roman church as that which “presides in love”. According to tradition, both Peter and Paul were martyred there during the persecution under Nero in A.D. 64.\r\rFurther Reference:\rWikipedia, “Ancient Rome”\rhttp://tinyurl.com/8wskr\r\rCoordinates:\r41.8900, 12.4938\r\r\r";

                                   
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
                                   colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters. Like Philippians, it contains an early Christian hymn:\r\r“He is the image of the invisible God, the firstborn of all creation. For in him were created all things in heaven and on earth, the visible and the invisible, whether thrones or dominions or principalities or powers; all things were created through him and for him. He is before all things, and in him all things hold together. He is the head of the body, the church. He is the beginning, the firstborn from the dead, that in all things he himself might be preeminent. For in him all the fullness was pleased to dwell, and through him to reconcile all things for him, making peace by the blood of his cross [through him], whether those on earth or those in heaven.”\r-Colossians 1: 15-20\r\rFurther Refernce:\rWikipedia, “Colossae”\rhttp://tinyurl.com/pyz559n\r\rCoordinates:\r37.7878, 29.2615\r\r\r";

                                   
                                   BiblicalPins *temple = [[BiblicalPins alloc] init];
                                   temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                   temple.title = @"The Temple Mount";
                                   temple.subtitle = @"The House of YHWH";
                                   temple.image = [UIImage imageNamed:@"temple"];
                                   temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great.\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
                                   
                                   BiblicalPins *antioch = [[BiblicalPins alloc] init];
                                   antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
                                   antioch.title = @"Antioch";
                                   antioch.subtitle = @"Capital of Ancient Syria";
                                   antioch.image = [UIImage imageNamed:@"antioch"];
                                   antioch.information = @"\rAntioch was a major center for Gentile Christianity in the first century as recorded in the Acts of the Apostles. St. Paul and St. Barnabas launched their missionary journeys from this city. The disciples of Jesus were first called Christians in Antioch (Acts 11:26).\r\r“Now those who had been scattered by the persecution that arose because of Stephen went as far as Phoenicia, Cyprus, and Antioch, preaching the word to no one but Jews. There were some Cypriots and Cyrenians among them, however, who came to Antioch and began to speak to the Greeks as well, proclaiming the Lord Jesus. The hand of the Lord was with them and a great number who believed turned to the Lord. The news about them reached the ears of the church in Jerusalem, and they sent Barnabas to Antioch. When he arrived and saw the grace of God, he rejoiced and encouraged them all to remain faithful to the Lord in firmness of heart, for he was a good man, filled with the holy Spirit and faith. And a large number of people was added to the Lord. Then he went to Tarsus to look for Saul, and when he had found him he brought him to Antioch. For a whole year they met with the church and taught a large number of people, and it was in Antioch that the disciples were first called 'Christians'.” - Acts 11: 19-26\r\rFurther Reference:\rWikipedia, “Antioch”\rhttp://tinyurl.com/oec7o85\r\rCoordinates:\r36.2000, 36.1500\r\r\r";

                                   
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
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects: nazareth, ephesus, corinth, rome, thessalonica, philippi, capernaum, colossae, temple, jerusalem, antioch, bethlehem, sepphoris, gehenna, nil];
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
                                       alexandria.information = @"\rEastern Patriarchate \r\rMajor catechumenical center in early Christianity. \r\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192\r\r\r";
                                   
                                       HistoricalPins *rome2 = [[HistoricalPins alloc] init];
                                       rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
                                       rome2.title = @"Church of Rome";
                                       rome2.subtitle = @"The Apostolic See";
                                       rome2.image = [UIImage imageNamed:@"vatican"];
                                       rome2.information = @"\rThe Church of Rome acquired a prominence in the earliest years of the Church, thanks in part, to the martyrdoms of both Peter and Paul in A.D. 64.  The earliest Christian writers testify to its importance. Ignatius of Antioch, Clement of Rome, Irenaeus of Lyon, and others all bear witness to the fact that the Roman church was regarded as a source of unity among all churches. Over time, this view developed into the idea that Peter was the first Bishop of Rome, (the Pope), and subsequent bishops of Rome inherited his Apostolic authority. Later Church teaching would declare that the Bishop of Rome held authority over the whole Church, and his approval was necessary to confirm the proceedings of an Ecumenical Council. The Apostolic See is also the head of Vatican City, the smallest nation on Earth, which was created in 1929 as part of the Lateran Treaty between the Italian government and the Holy See. The Pope is thus also formally recognized as a head of state.\r\rFurther Reference:\rWikipedia, “Holy See”\rhttp://tinyurl.com/fdy54\r\rCoordinates:\r41.9022, 12.4533\r\r\r";
                                   
                                   HistoricalPins *constantinople = [[HistoricalPins alloc] init];
                                   constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
                                   constantinople.title = @"Constantinople";
                                   constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
                                   constantinople.image = [UIImage imageNamed:@"constantinople"];
                                   constantinople.information = @"\rA.D. 381, 553 \r\rThe 2nd and 5th Ecumenical Councils of Constantinople confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\rCoordinates:\r41.0122, 28.9760\r\r\r";
                             
                                   
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
                                   chalcedon.information = @"\rThe Council of Chalcedon was held in A.D. 451 and promulgated what would become the classical Christological definition of Jesus Christ as one person in two natures:\r\r“We, then, following the holy Fathers, all with one consent, teach people to confess one and the same Son, our Lord Jesus Christ, the same perfect in Godhead and also perfect in manhood; truly God and truly man, of a rational soul and body; consubstantial with the Father according to the Godhead, and consubstantial with us according to the Manhood; in all things like unto us, without sin; begotten before all ages of the Father according to the Godhead, and in these latter days, for us and for our salvation, born of the Virgin Mary, the Mother of God, according to the Manhood; one and the same Christ, Son, Lord, only begotten, to be acknowledged in two natures, inconfusedly, unchangeably, indivisibly, inseparably; (ἐν δύο φύσεσιν ἀσυγχύτως, ἀτρέπτως, ἀδιαιρέτως, ἀχωρίστως) the distinction of natures being by no means taken away by the union, but rather the property of each nature being preserved, and concurring in one Person (prosopon) and one Subsistence, not parted or divided into two persons, but one and the same Son, and only begotten God, the Word, the Lord Jesus Christ; as the prophets from the beginning [have declared] concerning Him, and the Lord Jesus Christ Himself has taught us, and the Creed of the holy Fathers has handed down to us.”\r\rCoordinates:\r40.9833, 29.0333\r\r\r";
                                   
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


                                   
                                   
                                   
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects:nicea, alexandria, rome2, constantinople, lyon, vienne, chalcedon, constance, trent, florence,lateran, ephesus2, nil];
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
                                     greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. Glacial melt intensifies global warming by releasing increased amounts of previously trapped carbon into the atmosphere. Pope Francis has identified the risk to glaciers from climate change by stating:\r\r“Warming has effects on the carbon cycle. It creates a vicious circle which aggravates the situation even more, affecting the availability of essential resources like drinking water, energy and agricultural production in warmer regions, and leading to the extinction of part of the planet’s biodiversity. The melting in the polar ice caps and in high altitude plains can lead to the dangerous release of methane gas, while the decomposition of frozen organic material can further increase the emission of carbon dioxide. Things are made worse by the loss of tropical forests which would otherwise help to mitigate climate change. Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas.” -Laudito Si', 24\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rCatholic Climate Movement\rhttp://tinyurl.com/lxe52t7\r\rNational Snow & Ice Data Center\r“Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000\r\r\r";
                                     
                                     SocialPins *greatbr = [[SocialPins alloc] init];
                                     greatbr.coordinate = CLLocationCoordinate2DMake(-18.2861, 147.7000);
                                     greatbr.title = @"Great Barrier Reef";
                                     greatbr.subtitle = @"Threatened Coral Ecosystem";
                                     greatbr.image = [UIImage imageNamed:@"barrier"];
                                     greatbr.information = @"\rAustralia's Great Barrier Reef is the world's largest coral ecosystem. Climate change is putting many elements of the reef under threat. Pope Francis emphasized the importance of safeguarding coral reef systems when he stated:\r\r“In tropical and subtropical seas, we find coral reefs comparable to the great forests on dry land, for they shelter approximately a million species, including fish, crabs, molluscs, sponges and algae. Many of the world’s coral reefs are already barren or in a state of constant decline. ‘Who turned the wonderworld of the seas into underwater cemeteries bereft of colour and life?’ This phenomenon is due largely to pollution which reaches the sea as the result of deforestation, agricultural monocultures, industrial waste and destructive fishing methods, especially those using cyanide and dynamite. It is aggravated by the rise in temperature of the oceans. All of this helps us to see that every intervention in nature can have consequences which are not immediately evident, and that certain ways of exploiting resources prove costly in terms of degradation which ultimately reaches the ocean bed itself.” -Laudito Si', 41\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rCatholic Bishops of Queensland, “Pastoral Letter on the Great Barrier Reef”\rhttp://tinyurl.com/one2fma\r\rCatholic Care Australia\rhttp://catholicearthcare.org.au\r\rCoordinates:\r18.2861, 147.7000\r\r\r";
                                     
                                     SocialPins *philippines = [[SocialPins alloc] init];
                                     philippines.coordinate = CLLocationCoordinate2DMake(13.1333, 123.7333);
                                     philippines.title = @"Legazpi City";
                                     philippines.subtitle = @"Carbon Mining Coastal Destruction";
                                     philippines.image = [UIImage imageNamed:@"legazpi"];
                                     philippines.information = @"\rThe coast of Legazpi City, Philippines, is suffering from the effects of carbon mining. Pope Francis hightlighted the importance of addressing human intensification of the carbon cycle when he stated:\r\r“Climate change is a global problem with grave implications: environmental, social, economic, political and for the distribution of goods. It represents one of the principal challenges facing humanity in our day. Its worst impact will probably be felt by developing countries in coming decades. Many of the poor live in areas particularly affected by phenomena related to warming, and their means of subsistence are largely dependent on natural reserves and ecosystemic services such as agriculture, fishing and forestry. They have no other financial activities or resources which can enable them to adapt to climate change or to face natural disasters, and their access to social services and protection is very limited. For example, changes in climate, to which animals and plants cannot adapt, lead them to migrate; this in turn affects the livelihood of the poor, who are then forced to leave their homes, with great uncertainty for their future and that of their children. There has been a tragic rise in the number of migrants seeking to flee from the growing poverty caused by environmental degradation. They are not recognized by international conventions as refugees; they bear the loss of the lives they have left behind, without enjoying any legal protection whatsoever.” -Laudito Si', 25\r\rFurther Refernce\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates:\r13.1333, 123.7333\r\r\r";

                                     
                                         SocialPins *sierraLeone = [[SocialPins alloc] init];
                                         sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
                                         sierraLeone.title = @"Freetown";
                                         sierraLeone.subtitle = @"Insufficient Health Care";
                                         sierraLeone.image = [UIImage imageNamed:@"sierra"];
                                         sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014. The city's and larger country's health care infrastructure was devastated by the civil war from 1991-2002.\r\rWikipedia, “Sierra Leone”\rhttp://tinyurl.com/m7ql8\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates: 8.4844, -13.2344\r\r\r";

                                     
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
                                     atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization. Pope Francis emphasized the importance of maintaining the health of the world's oceans when he stated:\r\r“Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas...Oceans not only contain the bulk of our planet’s water supply, but also most of the immense variety of living creatures, many of them still unknown to us and threatened for various reasons. What is more, marine life in rivers, lakes, seas and oceans, which feeds a great part of the world’s population, is affected by uncontrolled fishing, leading to a drastic depletion of certain species. Selective forms of fishing which discard much of what they collect continue unabated. Particularly threatened are marine organisms which we tend to overlook, like some forms of plankton; they represent a significant element in the ocean food chain, and species used for our food ultimately depend on them.” -Laudito Si', 24, 40\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rWikipedia, “Atlantic Ocean”\rhttp://tinyurl.com/sea3p\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates: 38.4667, -28.4000\r\r\r";
                                     
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
                                     uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates: 1.0667, 31.8833\r\r\r";
                                     
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
                                     cali.information = @"\rIn 2015, California experienced an unprecedented drought which caused the state to implement mandatory water restrictions. Scientists attribute the severtity of the drought to the effects of climate change. Pope Francis highlighted the importance of water for human life and development, when he stated:\r\r“Fresh drinking water is an issue of primary importance, since it is indispensable for human life and for supporting terrestrial and aquatic ecosystems. Sources of fresh water are necessary for health care, agriculture and industry. Water supplies used to be relatively constant, but now in many places demand exceeds the sustainable supply, with dramatic consequences in the short and long term.” -Laudito Si', 28.\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rState of California, “Drought”\rhttp://tinyurl.com/prczpha\r\rCoordinates:\r37.0000, 120.0000\r\r\r";
                                     
                                     SocialPins *amazon = [[SocialPins alloc] init];
                                     amazon.coordinate = CLLocationCoordinate2DMake(-3.1600, -60.0300);
                                     amazon.title = @"Amazon Rain Forest";
                                     amazon.subtitle = @"Increasing Deforestation";
                                     amazon.image = [UIImage imageNamed:@"amazon"];
                                     amazon.information = @"\rThe Amazon Rain Forest is a vital eco-system of the South American continent. Pope Francis emphasized the importance of this and similar ecosystems for human development when he stated:\r\r“Let us mention, for example, those richly biodiverse lungs of our planet which are the Amazon and the Congo basins, or the great aquifers and glaciers. We know how important these are for the entire earth and for the future of humanity. The ecosystems of tropical forests possess an enormously complex biodiversity which is almost impossible to appreciate fully, yet when these forests are burned down or levelled for purposes of cultivation, within the space of a few years countless species are lost and the areas frequently become arid wastelands. A delicate balance has to be maintained when speaking about these places, for we cannot overlook the huge global economic interests which, under the guise of protecting them, can undermine the sovereignty of individual nations.” -Laudito Si', 38\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rNature, “Stopping Deforestation: Battle for the Amazon”. http://tinyurl.com/ngqjb5q\r\rCoordinates:\r-3.1600, 60.0300\r\r\r";
                                     
                                     SocialPins *texas = [[SocialPins alloc] init];
                                     texas.coordinate = CLLocationCoordinate2DMake(31.0000, -100.0000);
                                     texas.title = @"Texas";
                                     texas.subtitle = @"Leads U.S. in Capital Punishment";
                                     texas.image = [UIImage imageNamed:@"texas"];
                                     texas.information = @"\rWhile numerous states have abolished the death penalty, Texas' rate of execution remains the highest in the nation. Various social groups, such as the Innocence Project, are aimed at abolishing the death penalty in Texas and throughout the country.\r\rFurther Reference:\rThe Innocence Project\rhttp://innocenceproject.org\r\r\r";
                                     
                                     
                                     NSArray *annotations = [NSArray arrayWithObjects:greenland, greatbr, philippines, sierraLeone, camden, atlantic, palestine, israel, uganda, asheville, burma, cali, amazon, texas, nil];
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
                                   jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Judges 1:8 gives portrays a violent capture of the city by the sons of Judah. David eventually brought the Ark to Jerusalem from Keraith Jearim. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rFurther Reference:\rWikipedia, “Jerusalem”\rhttp://tinyurl.com/2f662p\r\rCoordinates:\r31.7883, 35.2167\r\r\r";
                                   
                                   BiblicalPins *gehenna = [[BiblicalPins alloc] init];
                                   gehenna.coordinate = CLLocationCoordinate2DMake(31.768406, 35.230439);
                                   gehenna.title = @"Gehenna";
                                   gehenna.subtitle = @"The Valley of Ben-Hinnom";
                                   gehenna.image = [UIImage imageNamed:@"gehenna"];
                                   gehenna.information = @"\rGehenna was a valley, south of Jerusalem, where apostate Israelites would sacrifice their infants by burning them alive to worship the god Molech. It is mentioned several times in the Hebrew Scriptures. In Second Temple Judaism, it came to regarded as representative and a shorthand for everything evil and worthy of YHWH's punishment. This is the location that Jesus is portrayed as alluding to when he mentions Gehenna, which was later translated as “hell”.\r\rFurther Reference:\rWikipedia, “Gehenna”\rhttp://tinyurl.com/ymbj2d\r\rCoordinates: 31.768406, 35.230439\r\r\r";
                                   
                                   BiblicalPins *rome = [[BiblicalPins alloc] init];
                                   rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
                                   rome.title = @"Rome";
                                   rome.subtitle = @"Capital of the Roman Empire";
                                   rome.image = [UIImage imageNamed:@"rome-1"];
                                   rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. St. Paul wrote a letter to the Roman church towards the end of his missionary career. It is famous for laying out his thesis of righteousness through faith in Jesus Christ apart from the Law:\r\r“But now the righteousness of God has been manifested apart from the law, though testified to by the law and the prophets, the righteousness of God through faith in Jesus Christ for all who believe. For there is no distinction; all have sinned and are deprived of the glory of God. They are justified freely by his grace through the redemption in Christ Jesus, whom God set forth as an expiation, through faith, by his blood, to prove his righteousness because of the forgiveness of sins previously committed, through the forbearance of God—to prove his righteousness in the present time, that he might be righteous and justify the one who has faith in Jesus.”\r-Romans 3:21-26\r\rIgnatius of Antioch refers to the Roman church as that which “presides in love”. According to tradition, both Peter and Paul were martyred there during the persecution under Nero in A.D. 64.\r\rFurther Reference:\rWikipedia, “Ancient Rome”\rhttp://tinyurl.com/8wskr\r\rCoordinates:\r41.8900, 12.4938\r\r\r";
                                   
                                   BiblicalPins *nazareth = [[BiblicalPins alloc] init];
                                   nazareth.coordinate = CLLocationCoordinate2DMake(32.7000, 35.3040);
                                   nazareth.title = @"Nazareth";
                                   nazareth.subtitle = @"Traditional Hometown of Jesus";
                                   nazareth.image = [UIImage imageNamed:@"nazareth"];
                                   nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus.\r\rFurther Reference:\rWikipedia, “Nazareth”\r\rCoordinates:\r32.7000, 35.3040\r\r\r";
                                   
                                   BiblicalPins *bethEl = [[BiblicalPins alloc] init];
                                   bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
                                   bethEl.title = @"Beth-El";
                                   bethEl.subtitle = @"Canaanite cultic site of El";
                                   bethEl.image = [UIImage imageNamed:@"bethel"];
                                   bethEl.information = @"\rBeth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon. In Genesis 32 and 35 it is associated with the Hebrew patriarch Jacob:\r\r“Jacob departed from Beer-sheba and proceeded toward Haran. When he came upon a certain place, he stopped there for the night, since the sun had already set. Taking one of the stones at the place, he put it under his head and lay down in that place. Then he had a dream: a stairway rested on the ground, with its top reaching to the heavens; and God’s angels were going up and down on it. And there was the LORD standing beside him and saying: I am the LORD, the God of Abraham your father and the God of Isaac; the land on which you are lying I will give to you and your descendants. Your descendants will be like the dust of the earth, and through them you will spread to the west and the east, to the north and the south. In you and your descendants all the families of the earth will find blessing. I am with you and will protect you wherever you go, and bring you back to this land. I will never leave you until I have done what I promised you. When Jacob awoke from his sleep, he said, 'Truly, the Lord is in this place and I did not know it!' He was afraid and said: 'How awesome this place is! This is nothing else but the house of God, the gateway to heaven!' Early the next morning Jacob took the stone that he had put under his head, set it up as a sacred pillar, and poured oil on top of it. He named that place Bethel, whereas the former name of the town had been Luz.”\r-Genesis 28: 10-19\r\rFurther Reference:\rWikipeida, “Bethel”\rhttp://tinyurl.com/b5fpuc\r\rCoordinates:\r31.9390, 35.2260\r\r\r";
                                   
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
                                   ephesus.information = @"\rEphesus was the base for St. Paul's European missionary journeys. A letter in his name is addressed to the Ephesians, although many scholars believe it was originally intended as a general letter since some early manuscripts omit the phrase “who are in Ephesus”. It is counted among the so-called disputed letters of St. Paul. It is noted for its appeal to unity:\r\r“I, then, a prisoner for the Lord, urge you to live in a manner worthy of the call you have received, with all humility and gentleness, with patience, bearing with one another through love, striving to preserve the unity of the spirit through the bond of peace: one body and one Spirit, as you were also called to the one hope of your call; one Lord, one faith, one baptism; one God and Father of all, who is over all and through all and in all.”\r-Ephesians 4: 1-6\r\rFurther Reference:\rWikipedia, “Ephesus”\rhttp://tinyurl.com/olvyv\r\rCoordinates:\r37.9411, 27.3419\r\r\r";
                                   
                                   BiblicalPins *corinth = [[BiblicalPins alloc] init];
                                   corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
                                   corinth.title = @"Corinth";
                                   corinth.subtitle = @"Major Greek Port City";
                                   corinth.image = [UIImage imageNamed:@"corinth"];
                                   corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. The 2nd century Greek writer Pausanius gives a detailed description of Corinth in Book II of his 'Description of Greece':\r\r“Worth seeing here are a theater and a white-marble race-course. Within the sanctuary of the god stand on the one side portrait statues of athletes who have won victories at the Isthmian games, on the other side pine trees growing in a row, the greater number of them rising up straight. On the temple, which is not very large, stand bronze Tritons. In the fore-temple are images, two of Poseidon, a third of Amphitrite, and a Sea, which also is of bronze. The offerings inside were dedicated in our time by Herodes the Athenian, four horses, gilded except for the hoofs, which are of ivory..There is also an ancient sanctuary called the altar of the Cyclopes, and they sacrifice to the Cyclopes upon it.”\r-Description, 2.1.7-2.2.1\r\rSt. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition. In 1 Corinthians, St. Paul addresses both reports he has heard about the Corinthian church as well as a list of written questions presented to him via couriers. 1 Corinthians is famous for displaying St. Paul's ability to respond to new situations with Gospel-inspired principles. His instruction regarding food sacrificed to idols is illuminated in the context of Pausanius's description of Corinthian temples:\r\r“So about the eating of meat sacrificed to idols: we know that 'there is no idol in the world,' and that 'there is no God but one.' Indeed, even though there are so-called gods in heaven and on earth (there are, to be sure, many 'gods' and many 'lords'), yet for us there is one God, the Father, from whom all things are and for whom we exist, and one Lord, Jesus Christ, through whom all things are and through whom we exist...If someone sees you, with your knowledge, reclining at table in the temple of an idol, may not his conscience too, weak as it is, be 'built up' to eat the meat sacrificed to idols? Thus through your knowledge, the weak person is brought to destruction, the brother for whom Christ died. When you sin in this way against your brothers and wound their consciences, weak as they are, you are sinning against Christ. Therefore, if food causes my brother to sin, I will never eat meat again, so that I may not cause my brother to sin.”\r-1 Corinthians 8: 4-6, 10-13\r\rFurther Reference:\rPausanius, “Description of Greece”\rhttp://tinyurl.com/q6lxdl7\r\rNew American Bible Revised Edition\r1 Corinthians 8. http://tinyurl.com/qgkfxju\r\rCoordinates: 37.9333, 22.9333\r\r\r";
                                   
                                   BiblicalPins *colossae = [[BiblicalPins alloc] init];
                                   colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
                                   colossae.title = @"Colossae";
                                   colossae.subtitle = @"Greek City in the Lycus Valley";
                                   colossae.image = [UIImage imageNamed:@"colossae"];
                                   colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters. Like Philippians, it contains an early Christian hymn:\r\r“He is the image of the invisible God, the firstborn of all creation. For in him were created all things in heaven and on earth, the visible and the invisible, whether thrones or dominions or principalities or powers; all things were created through him and for him. He is before all things, and in him all things hold together. He is the head of the body, the church. He is the beginning, the firstborn from the dead, that in all things he himself might be preeminent. For in him all the fullness was pleased to dwell, and through him to reconcile all things for him, making peace by the blood of his cross [through him], whether those on earth or those in heaven.”\r-Colossians 1: 15-20\r\rFurther Refernce:\rWikipedia, “Colossae”\rhttp://tinyurl.com/pyz559n\r\rCoordinates:\r37.7878, 29.2615\r\r\r";
                                   
                                   BiblicalPins *dan = [[BiblicalPins alloc] init];
                                   dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
                                   dan.title = @"Dan";
                                   dan.image = [UIImage imageNamed:@"dan"];
                                   dan.subtitle = @"Northern Israelite Cultic Site";
                                   dan.information = @"\rDan was one of the two sites at which Jeroboam established alternative worship sites for the newly established northern kingdom as described in 1 Kings 12.\r\rFurther Reference:\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520\r\r\r";
                                   
                                   BiblicalPins *jericho = [[BiblicalPins alloc] init];
                                   jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
                                   jericho.title = @"Jericho";
                                   jericho.subtitle = @"Walled Canaanite City";
                                   jericho.image = [UIImage imageNamed:@"jericho"];
                                   jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500\r\r\r";
                                   
                                   
                                   BiblicalPins *temple = [[BiblicalPins alloc] init];
                                   temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
                                   temple.title = @"The Temple";
                                   temple.subtitle = @"The House of YHWH";
                                   temple.image = [UIImage imageNamed:@"temple"];
                                   temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great.\r\rFurther Reference:\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
                                   
                                   BiblicalPins *hazor = [[BiblicalPins alloc] init];
                                   hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
                                   hazor.title = @"Hazor";
                                   hazor.image = [UIImage imageNamed:@"hazor"];
                                   hazor.subtitle = @"Major Ancient Canaanite City";
                                   hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai. However, recent archeological findings show that Hazor was destroyed by internal revolt rather than external attack. This is one datum that is explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the the Dictionary tab.\r\rFurther Reference:\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669\r\r\r";
                                   
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
                                   greenland.information = @"\rGreenland is an examplar of the effects of climate change. The glacial sheet is melting at a rate that climatologists warn could adversely affect millions living in coastal regions. Glacial melt intensifies global warming by releasing increased amounts of previously trapped carbon into the atmosphere. Pope Francis has identified the risk to glaciers from climate change by stating:\r\r“Warming has effects on the carbon cycle. It creates a vicious circle which aggravates the situation even more, affecting the availability of essential resources like drinking water, energy and agricultural production in warmer regions, and leading to the extinction of part of the planet’s biodiversity. The melting in the polar ice caps and in high altitude plains can lead to the dangerous release of methane gas, while the decomposition of frozen organic material can further increase the emission of carbon dioxide. Things are made worse by the loss of tropical forests which would otherwise help to mitigate climate change. Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas.” -Laudito Si', 24\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rCatholic Climate Movement\rhttp://tinyurl.com/lxe52t7\r\rNational Snow & Ice Data Center\r“Greenland Ice Sheet Today”\rhttp://tinyurl.com/a422blp\r\rCoordinates: 50.0000, -40.0000\r\r\r";
                                   
                                   SocialPins *greatbr = [[SocialPins alloc] init];
                                   greatbr.coordinate = CLLocationCoordinate2DMake(-18.2861, 147.7000);
                                   greatbr.title = @"Great Barrier Reef";
                                   greatbr.subtitle = @"Threatened Coral Ecosystem";
                                   greatbr.image = [UIImage imageNamed:@"barrier"];
                                   greatbr.information = @"\rAustralia's Great Barrier Reef is the world's largest coral ecosystem. Climate change is putting many elements of the reef under threat. Pope Francis emphasized the importance of safeguarding coral reef systems when he stated:\r\r“In tropical and subtropical seas, we find coral reefs comparable to the great forests on dry land, for they shelter approximately a million species, including fish, crabs, molluscs, sponges and algae. Many of the world’s coral reefs are already barren or in a state of constant decline. ‘Who turned the wonderworld of the seas into underwater cemeteries bereft of colour and life?’ This phenomenon is due largely to pollution which reaches the sea as the result of deforestation, agricultural monocultures, industrial waste and destructive fishing methods, especially those using cyanide and dynamite. It is aggravated by the rise in temperature of the oceans. All of this helps us to see that every intervention in nature can have consequences which are not immediately evident, and that certain ways of exploiting resources prove costly in terms of degradation which ultimately reaches the ocean bed itself.” -Laudito Si', 41\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rCatholic Bishops of Queensland, “Pastoral Letter on the Great Barrier Reef”\rhttp://tinyurl.com/one2fma\r\rCatholic Care Australia\rhttp://catholicearthcare.org.au\r\rCoordinates:\r18.2861, 147.7000\r\r\r";
                                   
                                   
                                   HistoricalPins *alexandria = [[HistoricalPins alloc] init];
                                   alexandria.coordinate = CLLocationCoordinate2DMake(31.1980, 29.9192);
                                   alexandria.title = @"Alexandria";
                                   alexandria.subtitle = @"Eastern Patriarchate";
                                   alexandria.image = [UIImage imageNamed:@"alexandria"];
                                   alexandria.information = @"\rAlexandria contained the largest library in the ancient world as well as the famous Catechetical School, which produced such minds as Origen and Clement of Alexandira. It was known for its highly allegorical hermeneutical method in contrast with that of Antioch. It later became one of 5 major centers of Christianity in the 4th century in the canons of the Nicene Council.\r\rFurther Reference:\rWikipedia, “Alexandria”\rhttp://tinyurl.com/mwgrl\r\rCoordinates:\r31.1980, 29.9192\r\r\r";
                                   
                                   HistoricalPins *rome2 = [[HistoricalPins alloc] init];
                                   rome2.coordinate = CLLocationCoordinate2DMake(41.9022, 12.4533);
                                   rome2.title = @"Church of Rome";
                                   rome2.subtitle = @"The Apostolic See";
                                   rome2.image = [UIImage imageNamed:@"vatican"];
                                   rome2.information = @"\rThe Church of Rome acquired a prominence in the earliest years of the Church, thanks in part, to the martyrdoms of both Peter and Paul in A.D. 64.  The earliest Christian writers testify to its importance. Ignatius of Antioch, Clement of Rome, Irenaeus of Lyon, and others all bear witness to the fact that the Roman church was regarded as a source of unity among all churches. Over time, this view developed into the idea that Peter was the first Bishop of Rome, (the Pope), and subsequent bishops of Rome inherited his Apostolic authority. Later Church teaching would declare that the Bishop of Rome held authority over the whole Church, and his approval was necessary to confirm the proceedings of an Ecumenical Council. The Apostolic See is also the head of Vatican City, the smallest nation on Earth, which was created in 1929 as part of the Lateran Treaty between the Italian government and the Holy See. The Pope is thus also formally recognized as a head of state.\r\rFurther Reference:\rWikipedia, “Holy See”\rhttp://tinyurl.com/fdy54\r\rCoordinates:\r41.9022, 12.4533\r\r\r";
                                   
                                   HistoricalPins *constantinople = [[HistoricalPins alloc] init];
                                   constantinople.coordinate = CLLocationCoordinate2DMake(41.0122, 28.9760);
                                   constantinople.title = @"Constantinople";
                                   constantinople.subtitle = @"Ecumenical Councils II, V, VI, VIII";
                                   constantinople.image = [UIImage imageNamed:@"constantinople"];
                                   constantinople.information = @"\rThe 2nd and 5th Ecumenical Councils of Constantinople, in A.D. 381 and 553, respectively, confirmed the Nicene Council's creed and clarified the teaching on the nature of Christ, respectively. See “Councils” section in the Overview tab.\r\rFurther Reference:\rWikipedia, “First Council of Constantinople”\rhttp://tinyurl.com/4yrb2sp\r“Second Council of Constantinople”\rhttp://tinyurl.com/3tmetan\r\rCoordinates:\r41.0122, 28.9760\r\r\r";
                                   
                                   SocialPins *sierraLeone = [[SocialPins alloc] init];
                                   sierraLeone.coordinate = CLLocationCoordinate2DMake(8.4844, -13.2344);
                                   sierraLeone.title = @"Freetown";
                                   sierraLeone.subtitle = @"Insufficient Health Care";
                                   sierraLeone.image = [UIImage imageNamed:@"sierra"];
                                   sierraLeone.information = @"\rFreetown in Sierra Leone was the locus of an Ebola epidemic in 2014. The city's and larger country's health care infrastructure was devastated by the civil war from 1991-2002.\r\rWikipedia, “Sierra Leone”\rhttp://tinyurl.com/m7ql8\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates: 8.4844, -13.2344\r\r\r";
                                   
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
                                   atlantic.information = @"\rThe Atlantic Ocean is the 2nd largest ocean in the world, after the Pacific Ocean. It includes the Gulf Stream and North Atlantic Drift currents. These waterways could be adversely affected by increasing levels of fresh water, causing acccelerated sea level rise, hypoxia, and desalinization. Pope Francis emphasized the importance of maintaining the health of the world's oceans when he stated:\r\r“Carbon dioxide pollution increases the acidification of the oceans and compromises the marine food chain. If present trends continue, this century may well witness extraordinary climate change and an unprecedented destruction of ecosystems, with serious consequences for all of us. A rise in the sea level, for example, can create extremely serious situations, if we consider that a quarter of the world’s population lives on the coast or nearby, and that the majority of our megacities are situated in coastal areas...Oceans not only contain the bulk of our planet’s water supply, but also most of the immense variety of living creatures, many of them still unknown to us and threatened for various reasons. What is more, marine life in rivers, lakes, seas and oceans, which feeds a great part of the world’s population, is affected by uncontrolled fishing, leading to a drastic depletion of certain species. Selective forms of fishing which discard much of what they collect continue unabated. Particularly threatened are marine organisms which we tend to overlook, like some forms of plankton; they represent a significant element in the ocean food chain, and species used for our food ultimately depend on them.” -Laudito Si', 24, 40\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rWikipedia, “Atlantic Ocean”\rhttp://tinyurl.com/sea3p\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates: 38.4667, -28.4000\r\r\r";
                                   
                                   SocialPins *philippines = [[SocialPins alloc] init];
                                   philippines.coordinate = CLLocationCoordinate2DMake(13.1333, 123.7333);
                                   philippines.title = @"Legazpi City";
                                   philippines.subtitle = @"Carbon Mining Coastal Destruction";
                                   philippines.image = [UIImage imageNamed:@"legazpi"];
                                   philippines.information = @"\rThe coast of Legazpi City, Philippines, is suffering from the effects of carbon mining. Pope Francis hightlighted the importance of addressing human intensification of the carbon cycle when he stated:\r\r“Climate change is a global problem with grave implications: environmental, social, economic, political and for the distribution of goods. It represents one of the principal challenges facing humanity in our day. Its worst impact will probably be felt by developing countries in coming decades. Many of the poor live in areas particularly affected by phenomena related to warming, and their means of subsistence are largely dependent on natural reserves and ecosystemic services such as agriculture, fishing and forestry. They have no other financial activities or resources which can enable them to adapt to climate change or to face natural disasters, and their access to social services and protection is very limited. For example, changes in climate, to which animals and plants cannot adapt, lead them to migrate; this in turn affects the livelihood of the poor, who are then forced to leave their homes, with great uncertainty for their future and that of their children. There has been a tragic rise in the number of migrants seeking to flee from the growing poverty caused by environmental degradation. They are not recognized by international conventions as refugees; they bear the loss of the lives they have left behind, without enjoying any legal protection whatsoever.” -Laudito Si', 25\r\rFurther Refernce\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates:\r13.1333, 123.7333\r\r\r";
                                   
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
                                   israel.information = @"\rThe modern state of Israel was created in 1948 when the British Mandate for Palestine expired at midnight. Since then, Israel has fought numerous wars for its survival with its surrounding Arab neighbors. Much of the present crisis stems from Israel's control of the West Bank and Gaza strip, areas that are legally part of the Palestinan territories. Israel has controlled these areas since the Six-Day War of 1967, in violation of U.N. resolution 242, which is often cited as a factor in continuing threats from disaffected Palestinian groups:\r\r“The Security Council,\r\rExpressing its continuing concern with the grave situation in the Middle East,\r\rEmphasizing the inadmissibility of the acquisition of territory by war and the need to work for a just and lasting peace in which every State in the area can live in security,\r\rEmphasizing further that all Member States in their acceptance of the Charter of the United Nations have undertaken a commitment to act in accordance with Article 2 of the Charter,\r\r1.	Affirms that the fulfilment of Charter principles requires the establishment of a just and lasting peace in the Middle East which should include the application of both the following principles:\r\r(i) Withdrawal of Israel armed forces from territories occupied in the recent conflict;\r\r(ii) Termination of all claims or states of belligerency and respect for and acknowledgment of the sovereignty, territorial integrity and political independence of every State in the area and their right to live in peace within secure and recognized boundaries free from threats or acts of force;\r\r2.	Affirms further the necessity\r\r(a) For guaranteeing freedom of navigation through international waterways in the area;\r\r(b)	For achieving a just settlement of the refugee problem;\r\r(c)	For guaranteeing the territorial inviolability and political independence of every State in the area, through measures including the establishment of demilitarized zones;\r\r3. Requests the Secretary-General to designate a Special Representative to proceed to the Middle East to establish and maintain contacts with the States concerned in order to promote agreement and assist efforts to achieve a peaceful and accepted settlement in accordance with the provisions and principles in this resolution;\r\r4.	Requests the Secretary-General to report to the Security Council on the progress of the efforts of the Special Representative as soon as possible.”\r\rFurther Reference:\rUnited Nations Security Council\rResolution 242. http://tinyurl.com/yeszj3t\r\rWikipedia, “Israel”\rhttp://tinyurl.com/ofvklkr\r\rCoordinates:\r31.6253, 35.1453\r\r\r";
                                   
                                   BiblicalPins *thessalonica = [[BiblicalPins alloc] init];
                                   thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
                                   thessalonica.title = @"Thessalonica";
                                   thessalonica.subtitle = @"Greek Coastal City";
                                   thessalonica.image = [UIImage imageNamed:@"thessalonica"];
                                   thessalonica.information = @"\rThessalonica (modern Thessaloniki) was home to one of the earlier Christian communities founded by the St. Paul. There are two New Testament letters addressed to this community, however only one of them (1 Thessalonians) is counted as authentically Pauline. The other (2 Thessalonians) is among the so-called disputed letters. 1 Thessalonians contains an reference to an earlier oral tradition of Jesus:\r\r“We do not want you to be unaware, brothers, about those who have fallen asleep, so that you may not grieve like the rest, who have no hope. For if we believe that Jesus died and rose, so too will God, through Jesus, bring with him those who have fallen asleep. Indeed, we tell you this, on the word of the Lord, that we who are alive, who are left until the coming of the Lord, will surely not precede those who have fallen asleep. For the Lord himself, with a word of command, with the voice of an archangel and with the trumpet of God, will come down from heaven, and the dead in Christ will rise first. Then we who are alive, who are left, will be caught up together with them in the clouds to meet the Lord in the air. Thus we shall always be with the Lord. Therefore, console one another with these words.” -1 Thessalonians 4: 13-18\r\rFurther Reference:\rWikipedia, “Thessaloniki”\rhttp://tinyurl.com/nstv7sc\r\rCoordinates:\r40.6500, 22.9000\r\r\r";
                                   
                                   BiblicalPins *philippi = [[BiblicalPins alloc] init];
                                   philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
                                   philippi.title = @"Philippi";
                                   philippi.subtitle = @"Major Greek City";
                                   philippi.image = [UIImage imageNamed:@"philippi"];
                                   philippi.information = @"\rAccording to Acts 16: 11-15, Philippi was a Roman colony in which both St. Paul and St. Barnabas conducted missionary work. Philippians contains what many scholars believe to be an early Christian hymn describing the Incarnation:\r\r“Have among yourselves the same attitude that is also yours in Christ Jesus, Who, though he was in the form of God did not regard equality with God something to be grasped. Rather, he emptied himself, taking the form of a slave, coming in human likeness; and found human in appearance, he humbled himself, becoming obedient to death, even death on a cross. Because of this, God greatly exalted him and bestowed on him the name that is above every name, that at the name of Jesus every knee should bend, of those in heaven and on earth and under the earth, and every tongue confess that Jesus Christ is Lord, to the glory of God the Father.”\r-Philippians 2: 5-11\r\rSee “Incarnation” in the Dictionary.\r\rFurther Reference:\rWikipedia, “Philippi”\rhttp://tinyurl.com/pkb8fmp\r\rCoordinates:\r41.0131, 24.2864\r\r\r";
                                   
                                   BiblicalPins *antioch = [[BiblicalPins alloc] init];
                                   antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
                                   antioch.title = @"Antioch";
                                   antioch.subtitle = @"Capital of Ancient Syria";
                                   antioch.image = [UIImage imageNamed:@"antioch"];
                                   antioch.information = @"\rAntioch was a major center for Gentile Christianity in the first century as recorded in the Acts of the Apostles. St. Paul and St. Barnabas launched their missionary journeys from this city. The disciples of Jesus were first called Christians in Antioch (Acts 11:26).\r\r“Now those who had been scattered by the persecution that arose because of Stephen went as far as Phoenicia, Cyprus, and Antioch, preaching the word to no one but Jews. There were some Cypriots and Cyrenians among them, however, who came to Antioch and began to speak to the Greeks as well, proclaiming the Lord Jesus. The hand of the Lord was with them and a great number who believed turned to the Lord. The news about them reached the ears of the church in Jerusalem, and they sent Barnabas to Antioch. When he arrived and saw the grace of God, he rejoiced and encouraged them all to remain faithful to the Lord in firmness of heart, for he was a good man, filled with the holy Spirit and faith. And a large number of people was added to the Lord. Then he went to Tarsus to look for Saul, and when he had found him he brought him to Antioch. For a whole year they met with the church and taught a large number of people, and it was in Antioch that the disciples were first called 'Christians'.” - Acts 11: 19-26\r\rFurther Reference:\rWikipedia, “Antioch”\rhttp://tinyurl.com/oec7o85\r\rCoordinates:\r36.2000, 36.1500\r\r\r";
                                   
                                   BiblicalPins *bethlehem = [[BiblicalPins alloc] init];
                                   bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
                                   bethlehem.title = @"Bethlehem";
                                   bethlehem.image = [UIImage imageNamed:@"bethlehem"];
                                   bethlehem.subtitle = @"Traditional Birthplace of Jesus";
                                   bethlehem.information = @"\rBethlehem is located just south of Jerusalem. While Matthew portrays Bethlehem as Joseph and Mary's hometown, Luke states that Nazareth was their hometown, which they left in order to be in Bethlehem for a census.\r\rFurther Reference:\rWikipedia, “Bethlehem”\rhttp://tinyurl.com/natjqkv\r\rCoordinates:\r31.7031, 35.1956\r\r\r";
                                   
                                   BiblicalPins *ramah = [[BiblicalPins alloc] init];
                                   ramah.coordinate = CLLocationCoordinate2DMake(32.936389, 35.367222);
                                   ramah.title = @"Ramah";
                                   
                                   
                                   BiblicalPins *hebron = [[BiblicalPins alloc] init];
                                   hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
                                   hebron.title = @"Hebron";
                                   hebron.subtitle = @"David's Judahite Capital";
                                   hebron.image = [UIImage imageNamed:@"hebron"];
                                   hebron.information = @"\rOne of the oldest continually occupied cities in the world, Hebron is first mentioned in the biblical story-cycles of Abraham. In Genesis 23, Abraham buys Hebron from Ephron the Hittite for 400 sheckels. Abraham, Isaac, and Jacob are portrayed as buried there. Numbers 13:22 indicates that Hebron was founded around 1720 B.C. In the book of Judges, Joshua assigns Hebron to Caleb as part of the territory of Judah. In the book of 2 Samuel, David is annointed King of Judah and all Israel at Hebron.\r\r“All the tribes of Israel came to David at Hebron and said, 'We are your own flesh and blood. In the past, while Saul was king over us, you were the one who led Israel on their military campaigns. And the LORD said to you, ‘You will shepherd my people Israel, and you will become their ruler.’ When all the elders of Israel had come to King David at Hebron, the king made a covenant with them at Hebron before the LORD, and they anointed David king over Israel.”\r-2 Samuel 5: 1-3\r\rFurther Reference:\rWikipedia, “Hebron”. http://tinyurl.com/ppdn6q8\r\rCoordinates:\r31.5333, 35.0950\r\r\r";
                                   
                                   BiblicalPins *shiloh = [[BiblicalPins alloc] init];
                                   shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
                                   shiloh.title = @"Shiloh";
                                   shiloh.subtitle = @"Shrine of the Ark of the Covenant";
                                   shiloh.image = [UIImage imageNamed:@"shiloh"];
                                   shiloh.information = @"\rShiloh was a major cultic site asociated with the Ark of the Covenant and the tribe of Levi. It is first mentioned in the context of the Ark of the Covenant in 1 Samuel 4: 3-4\r\r“When the soldiers returned to camp, the elders of Israel asked, 'Why did the LORD bring defeat on us today before the Philistines? Let us bring the ark of the LORD’s covenant from Shiloh, so that he may go with us and save us from the hand of our enemies.' So the people sent men to Shiloh, and they brought back the ark of the covenant of the LORD Almighty, who is enthroned between the cherubim. And Eli’s two sons, Hophni and Phinehas, were there with the ark of the covenant of God.”\r\rFurther Reference:\rWikipedia, “Shiloh”\rhttp://tinyurl.com/qevxuoy\r\r\r";
                                   
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
                                   chalcedon.information = @"\rThe Council of Chalcedon was held in A.D. 451 and promulgated what would become the classical Christological definition of Jesus Christ as one person in two natures:\r\r“We, then, following the holy Fathers, all with one consent, teach people to confess one and the same Son, our Lord Jesus Christ, the same perfect in Godhead and also perfect in manhood; truly God and truly man, of a rational soul and body; consubstantial with the Father according to the Godhead, and consubstantial with us according to the Manhood; in all things like unto us, without sin; begotten before all ages of the Father according to the Godhead, and in these latter days, for us and for our salvation, born of the Virgin Mary, the Mother of God, according to the Manhood; one and the same Christ, Son, Lord, only begotten, to be acknowledged in two natures, inconfusedly, unchangeably, indivisibly, inseparably; (ἐν δύο φύσεσιν ἀσυγχύτως, ἀτρέπτως, ἀδιαιρέτως, ἀχωρίστως) the distinction of natures being by no means taken away by the union, but rather the property of each nature being preserved, and concurring in one Person (prosopon) and one Subsistence, not parted or divided into two persons, but one and the same Son, and only begotten God, the Word, the Lord Jesus Christ; as the prophets from the beginning [have declared] concerning Him, and the Lord Jesus Christ Himself has taught us, and the Creed of the holy Fathers has handed down to us.” See the Councils section in the Overview tab.\r\rCoordinates:\r40.9833, 29.0333\r\r\r";
                                   
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
                                   trent.information = @"\rThe Council of Trent was in session from 1545 to 1563 in Trento, Italy. It was the most signficant Church Council since Nicea until Vatican II. It was called by Pope Paul III as a response to the Protestant Reformation, and consolidated many elements of Catholic teaching, including Sacraments, Latin as the official language of the Church, and the Breviary. The Tridentine Mass became the ordinary form of the Mass until the developments of Vatican II. See the Councils section in the Overview tab.\r\rFurther Reference:\rWikipedia, “Council of Trent”\rhttp://tinyurl.com/5t586h\r\rCoordinates:\r46.0667, 11.1167\r\r\r";
                                   
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
                                   uganda.information = @"\rAs part of Sub-Saharan Africa, Uganda has been the location of severe Water Scarcity. This situation has only been compounded by the various political crises since the country gained independence from \r\rCoordinates: 1.0667, 31.8833\r\rFurther Reference:\rUNDP, Uganda http://tinyurl.com/kqrstkw\r\rWikipedia, “Uganda” http://tinyurl.com/jmaev\r\rDonate to Catholic Relief Services\rhttp://www.crs.org/donate/\r\rCoordinates: 1.0667, 31.8833\r\r\r";
                                   
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
                                   cali.information = @"\rIn 2015, California experienced an unprecedented drought which caused the state to implement mandatory water restrictions. Scientists attribute the severtity of the drought to the effects of climate change. Pope Francis highlighted the importance of water for human life and development, when he stated:\r\r“Fresh drinking water is an issue of primary importance, since it is indispensable for human life and for supporting terrestrial and aquatic ecosystems. Sources of fresh water are necessary for health care, agriculture and industry. Water supplies used to be relatively constant, but now in many places demand exceeds the sustainable supply, with dramatic consequences in the short and long term.” -Laudito Si', 28.\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rState of California, “Drought”\rhttp://tinyurl.com/prczpha\r\rCoordinates:\r37.0000, 120.0000\r\r\r";
                                   
                                   SocialPins *amazon = [[SocialPins alloc] init];
                                   amazon.coordinate = CLLocationCoordinate2DMake(-3.1600, -60.0300);
                                   amazon.title = @"Amazon Rain Forest";
                                   amazon.subtitle = @"Increasing Deforestation";
                                   amazon.image = [UIImage imageNamed:@"amazon"];
                                   amazon.information = @"\rThe Amazon Rain Forest is a vital eco-system of the South American continent. Pope Francis emphasized the importance of this and similar ecosystems for human development when he stated:\r\r“Let us mention, for example, those richly biodiverse lungs of our planet which are the Amazon and the Congo basins, or the great aquifers and glaciers. We know how important these are for the entire earth and for the future of humanity. The ecosystems of tropical forests possess an enormously complex biodiversity which is almost impossible to appreciate fully, yet when these forests are burned down or levelled for purposes of cultivation, within the space of a few years countless species are lost and the areas frequently become arid wastelands. A delicate balance has to be maintained when speaking about these places, for we cannot overlook the huge global economic interests which, under the guise of protecting them, can undermine the sovereignty of individual nations.” -Laudito Si', 38\r\rFurther Reference:\rPope Francis, “Laudito Si'”\rhttp://tinyurl.com/o6sowft\r\rNature, “Stopping Deforestation: Battle for the Amazon”. http://tinyurl.com/ngqjb5q\r\rCoordinates:\r-3.1600, 60.0300\r\r\r";
                                   
                                   SocialPins *texas = [[SocialPins alloc] init];
                                   texas.coordinate = CLLocationCoordinate2DMake(31.0000, -100.0000);
                                   texas.title = @"Texas";
                                   texas.subtitle = @"Leads U.S. in Capital Punishment";
                                   texas.image = [UIImage imageNamed:@"texas"];
                                   texas.information = @"\rWhile numerous states have abolished the death penalty, Texas' rate of execution remains the highest in the nation. Various social groups, such as the Innocence Project, are aimed at abolishing the death penalty in Texas and throughout the country.\r\rFurther Reference:\rThe Innocence Project\rhttp://innocenceproject.org\r\r\r";
                                   
                                   NSArray *annotations = [NSArray arrayWithObjects:jerusalem, bethEl, ephesus, corinth, dan, temple, hazor, nicea, greenland, greatbr, philippines, rome, nazareth, capernaum, sierraLeone, camden, atlantic, rome2, constantinople, palestine, israel, alexandria, thessalonica, philippi, antioch, bethlehem, ramah, hebron, shiloh, lyon, vienne, chalcedon, constance, trent, florence, lateran, uganda, colossae, sepphoris, asheville, burma, ephesus2, gehenna, cali, amazon, texas, nil];
                                   
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


/////orientation///////

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
