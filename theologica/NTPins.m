//
//  NTPins.m
//  theologica
//
//  Created by Jonathan Lace on 6/21/16.
//  Copyright © 2016 techrament. All rights reserved.
//


#import "NTPins.h"

@implementation NTPins
@synthesize coordinate;

-(NSArray *) createNTPins {
    
    NTPins *nazareth = [[NTPins alloc] init];
    nazareth.coordinate = CLLocationCoordinate2DMake(32.7000, 35.3040);
    nazareth.title = @"Nazareth";
    nazareth.subtitle = @"Traditional Hometown of Jesus";
    nazareth.image = [UIImage imageNamed:@"nazareth"];
    nazareth.information = @"\rThe town of Nazareth is not mentioned in the Hebrew Scriptures. It was a small village only 4 miles from Sepphoris, the captial city of Herod Antipas. All of the Gospels claim that Jesus was from Nazareth. One of the terms used to describe the early Christians was “Nazarenes” after the same term was applied to Jesus (Acts 24:5).\r\rFurther Reference:\rPope John Paul II, Jubliee Pilgramage Homily on the Annunciation\rhttp://tinyurl.com/p4sjg9p\r\rWikipedia, “Nazareth”\rhttp://tinyurl.com/jojq76x\r\rCoordinates:\r32.7000, 35.3040\r\r\r";
    
    NTPins *gehenna = [[NTPins alloc] init];
    gehenna.coordinate = CLLocationCoordinate2DMake(31.768406, 35.230439);
    gehenna.title = @"Gehenna";
    gehenna.subtitle = @"The Valley of Ben-Hinnom";
    gehenna.image = [UIImage imageNamed:@"gehenna"];
    gehenna.information = @"\rGehenna was a valley, south of Jerusalem, where apostate Israelites would sacrifice their infants by burning them alive to worship the god Molech. It is mentioned several times in the Hebrew Scriptures. In Second Temple Judaism, it came to regarded as representative and a shorthand for everything evil and worthy of YHWH's punishment. This is the location that Jesus is portrayed as alluding to when he mentions Gehenna, which was later translated as “hell”.\r\rFurther Reference:\rWikipedia, “Gehenna”\rhttp://tinyurl.com/ymbj2d\r\r\rCoordinates: 31.768406, 35.230439";
    
    NTPins *capernaum = [[NTPins alloc] init];
    capernaum.coordinate = CLLocationCoordinate2DMake(32.8811, 35.5750);
    capernaum.title = @"Capernaum";
    capernaum.subtitle = @"Galilean Fishing Village";
    capernaum.image = [UIImage imageNamed:@"synagogue"];
    capernaum.information = @"\rAccording to the Gospel of Matthew, at the beginning of his public ministry, Jesus made his home in and conducting most of his preaching in the neighboring villages around Capernaum. The Synoptic Gospels Peter, Andrew, James, and John as being fisherman from this northern coastal city on the Sea of Galilee.\r\rFurther Reference:\rWikipedia, “Capernaum”\rhttp://tinyurl.com/oldmhj2\r\rCoordinates:\r32.8811, 35.5750\r\r\r";
    
    NTPins *ephesus = [[NTPins alloc] init];
    ephesus.coordinate = CLLocationCoordinate2DMake(37.9411, 27.3419);
    ephesus.title = @"Ephesus";
    ephesus.subtitle = @"Roman Provincial Captial of Asia";
    ephesus.image = [UIImage imageNamed:@"ephesus"];
    ephesus.information = @"\rEphesus was the base for St. Paul's European missionary journeys. A letter in his name is addressed to the Ephesians, although many scholars believe it was originally intended as a general letter since some early manuscripts omit the phrase “who are in Ephesus”. It is counted among the so-called disputed letters of St. Paul. It is noted for its appeal to unity:\r\r“I, then, a prisoner for the Lord, urge you to live in a manner worthy of the call you have received, with all humility and gentleness, with patience, bearing with one another through love, striving to preserve the unity of the spirit through the bond of peace: one body and one Spirit, as you were also called to the one hope of your call; one Lord, one faith, one baptism; one God and Father of all, who is over all and through all and in all.”\r-Ephesians 4: 1-6\r\rFurther Reference:\rNew American Bible Revised Edition\rEphesians 4, http://tinyurl.com/pfgw3mg\r\rCoordinates:\r37.9411, 27.3419\r\r\r";
    
    
    
    NTPins *corinth = [[NTPins alloc] init];
    corinth.coordinate = CLLocationCoordinate2DMake(37.9333, 22.9333);
    corinth.title = @"Corinth";
    corinth.subtitle = @"Major Greek Port City";
    corinth.image = [UIImage imageNamed:@"corinth"];
    corinth.information = @"\rAs a bustling port city, Corinth was famous for its moral corruption. The 2nd century Greek writer Pausanius gives a detailed description of Corinth in Book II of his 'Description of Greece':\r\r“Worth seeing here are a theater and a white-marble race-course. Within the sanctuary of the god stand on the one side portrait statues of athletes who have won victories at the Isthmian games, on the other side pine trees growing in a row, the greater number of them rising up straight. On the temple, which is not very large, stand bronze Tritons. In the fore-temple are images, two of Poseidon, a third of Amphitrite, and a Sea, which also is of bronze. The offerings inside were dedicated in our time by Herodes the Athenian, four horses, gilded except for the hoofs, which are of ivory..There is also an ancient sanctuary called the altar of the Cyclopes, and they sacrifice to the Cyclopes upon it.”\r-Description, 2.1.7-2.2.1\r\rSt. Paul founded the church in Corinth and wrote several letters to this congregation, only 2 of which are extant. Those letters alone can account for about 70% of known facts about early Christianity in the Pauline tradition. In 1 Corinthians, St. Paul addresses both reports he has heard about the Corinthian church as well as a list of written questions presented to him via couriers. 1 Corinthians is famous for displaying St. Paul's ability to respond to new situations with Gospel-inspired principles. His instruction regarding food sacrificed to idols is illuminated in the context of Pausanius's description of Corinthian temples:\r\r“Now in regard to meat sacrificed to idols: we realize that 'all of us have knowledge'; knowledge inflates with pride, but love builds up. If anyone supposes he knows something, he does not yet know as he ought to know. But if one loves God, one is known by him. So about the eating of meat sacrificed to idols: we know that 'there is no idol in the world,' and that 'there is no God but one.' Indeed, even though there are so-called gods in heaven and on earth (there are, to be sure, many 'gods' and many 'lords'), yet for us there is one God, the Father, from whom all things are and for whom we exist, and one Lord, Jesus Christ, through whom all things are and through whom we exist.\r\rBut not all have this knowledge. There are some who have been so used to idolatry up until now that, when they eat meat sacrificed to idols, their conscience, which is weak, is defiled. Now food will not bring us closer to God. We are no worse off if we do not eat, nor are we better off if we do. But make sure that this liberty of yours in no way becomes a stumbling block to the weak. If someone sees you, with your knowledge, reclining at table in the temple of an idol, may not his conscience too, weak as it is, be 'built up' to eat the meat sacrificed to idols? Thus through your knowledge, the weak person is brought to destruction, the brother for whom Christ died. When you sin in this way against your brothers and wound their consciences, weak as they are, you are sinning against Christ. Therefore, if food causes my brother to sin, I will never eat meat again, so that I may not cause my brother to sin.”\r-1 Corinthians 8\r\rFurther Reference:\rPausanius, “Description of Greece”\rhttp://tinyurl.com/q6lxdl7\r\rNew American Bible Revised Edition\r1 Corinthians 8, http://tinyurl.com/qa83h5s\r\rCoordinates: 37.9333, 22.9333\r\r\r";
    
    
    NTPins *thessalonica = [[NTPins alloc] init];
    thessalonica.coordinate = CLLocationCoordinate2DMake(40.6500, 22.9000);
    thessalonica.title = @"Thessalonica";
    thessalonica.subtitle = @"Greek Coastal City";
    thessalonica.image = [UIImage imageNamed:@"thessalonica"];
    thessalonica.information = @"\rThessalonica (modern Thessaloniki) was home to one of the earlier Christian communities founded by the St. Paul. There are two New Testament letters addressed to this community, however only one of them (1 Thessalonians) is counted as authentically Pauline. The other (2 Thessalonians) is among the so-called disputed letters. 1 Thessalonians contains an reference to an earlier oral tradition of Jesus:\r\r“We do not want you to be unaware, brothers, about those who have fallen asleep, so that you may not grieve like the rest, who have no hope. For if we believe that Jesus died and rose, so too will God, through Jesus, bring with him those who have fallen asleep. Indeed, we tell you this, on the word of the Lord, that we who are alive, who are left until the coming of the Lord, will surely not precede those who have fallen asleep. For the Lord himself, with a word of command, with the voice of an archangel and with the trumpet of God, will come down from heaven, and the dead in Christ will rise first. Then we who are alive, who are left, will be caught up together with them in the clouds to meet the Lord in the air. Thus we shall always be with the Lord. Therefore, console one another with these words.”\r-1 Thessalonians 4: 13-18\r\rFurther Reference:\rNew American Standard Bible Revised Edition\r1 Thessalonians, http://tinyurl.com/obav3c6\r\rCoordinates:\r40.6500, 22.9000\r\r\r";
    
    NTPins *philippi = [[NTPins alloc] init];
    philippi.coordinate = CLLocationCoordinate2DMake(41.0131, 24.2864);
    philippi.title = @"Philippi";
    philippi.subtitle = @"Major Greek City";
    philippi.image = [UIImage imageNamed:@"philippi"];
    philippi.information = @"\rAccording to Acts 16: 11-15, Philippi was a Roman colony in which both St. Paul and St. Barnabas conducted missionary work. Philippians contains what many scholars believe to be an early Christian hymn describing the Incarnation:\r\r“Have among yourselves the same attitude that is also yours in Christ Jesus, Who, though he was in the form of God did not regard equality with God something to be grasped. Rather, he emptied himself, taking the form of a slave, coming in human likeness; and found human in appearance, he humbled himself, becoming obedient to death, even death on a cross. Because of this, God greatly exalted him and bestowed on him the name that is above every name, that at the name of Jesus every knee should bend, of those in heaven and on earth and under the earth, and every tongue confess that Jesus Christ is Lord, to the glory of God the Father.”\r-Philippians 2: 5-11\r\rSee “Incarnation” in the Dictionary.\r\rFurther Reference:\rNew American Bible Revised Edition\rPhilippians 2, http://tinyurl.com/p4byh43\r\rCoordinates:\r41.0131, 24.2864\r\r\r";
    
    
    NTPins *rome = [[NTPins alloc] init];
    rome.coordinate = CLLocationCoordinate2DMake(41.8900, 12.4938);
    rome.title = @"Rome";
    rome.subtitle = @"Capital of the Roman Empire";
    rome.image = [UIImage imageNamed:@"rome-1"];
    rome.information = @"\rRome was the capital of the Roman Republic and Empire. It was the longest lasting dominant civilization in the Western hemisphere. The Church of Rome was established in the first century and quickly acquired a reputation for generosity. St. Paul wrote a letter to the Roman church towards the end of his missionary career. It is famous for laying out his thesis of righteousness through faith in Jesus Christ apart from the Law:\r\r“But now the righteousness of God has been manifested apart from the law, though testified to by the law and the prophets, the righteousness of God through faith in Jesus Christ for all who believe. For there is no distinction; all have sinned and are deprived of the glory of God. They are justified freely by his grace through the redemption in Christ Jesus, whom God set forth as an expiation, through faith, by his blood, to prove his righteousness because of the forgiveness of sins previously committed, through the forbearance of God—to prove his righteousness in the present time, that he might be righteous and justify the one who has faith in Jesus.”\r-Romans 3:21-26\r\rAccording to tradition, Sts. Peter and Paul were martyred there during the persecution under the Emperor Nero in A.D. 64. The Roman historian Tacitus recounts the circumstances of the arrests:\r\r“Consequently, to get rid of the report, Nero fastened the guilt and inflicted the most exquisite tortures on a class hated for their abominations, called Christians by the populace. Christus, from whom the name had its origin, suffered the extreme penalty during the reign of Tiberius at the hands of one of our procurators, Pontius Pilatus, and a most mischievous superstition, thus checked for the moment, again broke out not only in Judæa, the first source of the evil, but even in Rome, where all things hideous and shameful from every part of the world find their centre and become popular. Accordingly, an arrest was first made of all who pleaded guilty; then, upon their information, an immense multitude was convicted, not so much of the crime of firing the city, as of hatred against mankind. Mockery of every sort was added to their deaths. Covered with the skins of beasts, they were torn by dogs and perished, or were nailed to crosses, or were doomed to the flames and burnt, to serve as a nightly illumination, when daylight had expired.”\r-Annals, 15.44\r\rFurther Reference:\rNew American Bible Revised Edition\rRomans 3, http://tinyurl.com/ponhbaj\r\rTacitus, Annals Book XV\rhttp://tinyurl.com/nbwlrkw\r\rCoordinates:\r41.8900, 12.4938\r\r\r";
    
    
    NTPins *jerusalem = [[NTPins alloc] init];
    jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
    jerusalem.title = @"Jerusalem";
    jerusalem.subtitle = @"Capital of the Davidic Dynasty";
    jerusalem.image = [UIImage imageNamed:@"jerusalem"];
    jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Judges 1:8 gives portrays a violent capture of the city by the sons of Judah. David eventually brought the Ark to Jerusalem from Keraith Jearim. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rFurther Reference:\rWikipedia, “Jerusalem”\rhttp://tinyurl.com/2f662p\r\rCoordinates:\r31.7883, 35.2167\r\r\r";
    
    
    NTPins *colossae = [[NTPins alloc] init];
    colossae.coordinate = CLLocationCoordinate2DMake(37.7878, 29.2615);
    colossae.title = @"Colossae";
    colossae.subtitle = @"Greek City in the Lycus Valley";
    colossae.image = [UIImage imageNamed:@"colossae"];
    colossae.information = @"\rThe town of Colossae was located in the Lycus valley near Ephesus and Laodicea. There is one letter to the Colossians written in the name of St. Paul that is classified among the disputed letters. Like Philippians, it contains an early Christian hymn:\r\r“He is the image of the invisible God, the firstborn of all creation. For in him were created all things in heaven and on earth, the visible and the invisible, whether thrones or dominions or principalities or powers; all things were created through him and for him. He is before all things, and in him all things hold together. He is the head of the body, the church. He is the beginning, the firstborn from the dead, that in all things he himself might be preeminent. For in him all the fullness was pleased to dwell, and through him to reconcile all things for him, making peace by the blood of his cross [through him], whether those on earth or those in heaven.”\r-Colossians 1: 15-20\r\rFurther Refernce:\rNew American Bible Revised Edition\rColossians, http://tinyurl.com/qe6h9ur\r\rCoordinates:\r37.7878, 29.2615\r\r\r";
    
    
    NTPins *temple = [[NTPins alloc] init];
    temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
    temple.title = @"The Temple";
    temple.subtitle = @"The House of Yahweh";
    temple.image = [UIImage imageNamed:@"temple"];
    temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great before being destroyed again by the Roman army in A.D. 70.\r\rFurther Reference:\rPBS, “Recreating the Temple”\rhttp://tinyurl.com/jr83lcj\r\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";
    
    NTPins *antioch = [[NTPins alloc] init];
    antioch.coordinate = CLLocationCoordinate2DMake(36.2000, 36.1500);
    antioch.title = @"Antioch";
    antioch.subtitle = @"Capital of Ancient Syria";
    antioch.image = [UIImage imageNamed:@"antioch"];
    antioch.information = @"\rAntioch was a major center for Gentile Christianity in the first century as recorded in the Acts of the Apostles. St. Paul and St. Barnabas launched their missionary journeys from this city. The disciples of Jesus were first called Christians in Antioch (Acts 11:26).\r\r“Now those who had been scattered by the persecution that arose because of Stephen went as far as Phoenicia, Cyprus, and Antioch, preaching the word to no one but Jews. There were some Cypriots and Cyrenians among them, however, who came to Antioch and began to speak to the Greeks as well, proclaiming the Lord Jesus. The hand of the Lord was with them and a great number who believed turned to the Lord. The news about them reached the ears of the church in Jerusalem, and they sent Barnabas to Antioch. When he arrived and saw the grace of God, he rejoiced and encouraged them all to remain faithful to the Lord in firmness of heart, for he was a good man, filled with the holy Spirit and faith. And a large number of people was added to the Lord. Then he went to Tarsus to look for Saul, and when he had found him he brought him to Antioch. For a whole year they met with the church and taught a large number of people, and it was in Antioch that the disciples were first called 'Christians'.” - Acts 11: 19-26\r\rFurther Reference:\rNew American Bible Revised Edition\rActs 11, http://tinyurl.com/o3cm45r\r\rCoordinates:\r36.2000, 36.1500\r\r\r";
    
    
    NTPins *bethlehem = [[NTPins alloc] init];
    bethlehem.coordinate = CLLocationCoordinate2DMake(31.7063, 35.2090);
    bethlehem.title = @"Bethlehem";
    bethlehem.image = [UIImage imageNamed:@"bethlehem"];
    bethlehem.subtitle = @"Traditional Birthplace of Jesus";
    bethlehem.information = @"\rBethlehem is located just south of Jerusalem. While Matthew portrays Bethlehem as Joseph and Mary's hometown, Luke states that Nazareth was their hometown, which they left in order to be in Bethlehem for a census.\r\rFurther Reference:\rWikipedia, “Bethlehem”\rhttp://tinyurl.com/natjqkv\r\rCoordinates:\r31.7031, 35.1956\r\r\r";
    
    
    NTPins *sepphoris = [[NTPins alloc] init];
    sepphoris.coordinate = CLLocationCoordinate2DMake(32.7529, 35.2795);
    sepphoris.title = @"Sepphoris";
    sepphoris.subtitle = @"Capital of Herod Antipas";
    sepphoris.image = [UIImage imageNamed:@"sepphoris"];
    sepphoris.information = @"\rAlthough it is not mentioned in Scripture, Sepphoris was a major city in Galilee and the captial city of Herod Antipas. It is likely that Jesus of Nazareth worked in or around this city before beginning his prophetic ministry.\r\rFurther Reference:\rWikipedia, “Sepphoris”\rhttp://tinyurl.com/p38eyob\r\rCoordinates:\r32.7529, 35.2795\r\r\r";
    
    NTPins *caesarea = [[NTPins alloc] init];
    caesarea.coordinate = CLLocationCoordinate2DMake(32.5190, 34.9045);
    caesarea.title = @"Caesarea Maritima";
    caesarea.subtitle = @"Ancient Roman Sea Port";
    caesarea.image = [UIImage imageNamed:@"Caesarea"];
    caesarea.information = @"\rCaesarea Maritima was built by Herod the Great on the coast of Palestine and named in honor of Caesar Augustus. It later become the official residence of Roman procutators, such as Pontius Pilate. It boasted of an immense aqueduct that brought water from 7.5 kilometers away to the northeast, an amphitheater, a temple to Augustus, and, according to Josephus, the site of the Jewish act of civil disobedience in A.D. 26 in protest to Pilate's order to install Roman standards in the Temple. The New Testament book of Acts mentions Caesarea as one of the earliest missionary cities visited by the Apostles:\r\r“Now in Caesarea there was a man named Cornelius, a centurion of the Cohort called the Italica, devout and God-fearing along with his whole household, who used to give alms generously to the Jewish people and pray to God constantly. One afternoon about three o’clock, he saw plainly in a vision an angel of God come in to him and say to him, 'Cornelius.' He looked intently at him and, seized with fear, said, 'What is it, sir?' He said to him, 'Your prayers and almsgiving have ascended as a memorial offering before God. Now send some men to Joppa and summon one Simon who is called Peter. He is staying with another Simon, a tanner, who has a house by the sea.' When the angel who spoke to him had left, he called two of his servants and a devout soldier from his staff, explained everything to them, and sent them to Joppa.”\r-Acts 10:1-8\r\rJosephus gives a detailed account of the architecture of Caesarea in his book Antiquities of the Jews:\r\r “The city itself was called 'Caesarea', which was also itself built of fine materials, and was of a fine structure; nay, the very subterranean vaults and cellars had no less of architecture bestowed on them than had the buildings above ground. Some of these vaults carried things at even distances to the haven and to the sea; but one of them ran obliquely, and bound all the rest together, that both the rain and the filth of the citizens were together carried off with ease, and the sea itself, upon the flux of the tide from without, came into the city, and washed it all clean. Herod also built therein a theater of stone; and on the south quarter, behind the port, an amphitheater also, capable of holding a vast number of men, and conveniently situated for a prospect to the sea. So this city was thus finished in twelve years; during which time the king did not fail to go on both with the work, and to pay the charges that were necessary.”\r-Josephus, XV, 9\r\rJosephus later claimed that the desecration of a synogogue in Caesarea was the catalyst of a revolt that precipitated the First Jewish Revolt. Later, from A.D. 230-250, Caesarea became the intellectual home of the great church father, Origen. See ”Apostle”, ”Temple”.\r\rFurther Reference:\rNew American Bible Revised Edition, Acts 10\rhttp://tinyurl.com/zhlfhqb\r\rJosephus, “Antiquities of the Jews”\rhttp://tinyurl.com/j75tfyh\r\rThe Bible and Interpretation, “Caesarea Maritima”\rhttp://tinyurl.com/jcwyslc\r\rCoordinates: 32.5190, 34.9045\r\r\r";
    
    NSArray *annotations = [NSArray arrayWithObjects: nazareth, ephesus, corinth, rome, thessalonica, philippi, capernaum, colossae, temple, jerusalem, antioch, bethlehem, sepphoris, gehenna, caesarea, nil];
    
    return annotations; 
}

@end

