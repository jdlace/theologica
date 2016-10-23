//
//  Old Testament.m
//  theologica
//
//  Created by Jonathan Lace on 6/21/16.
//  Copyright © 2016 techrament. All rights reserved.
//

#import "OTPins.h"

@implementation OTPins
@synthesize coordinate;

-(NSArray*)createOTPins {

OTPins *jerusalem = [[OTPins alloc]init];
jerusalem.coordinate = CLLocationCoordinate2DMake(31.7570, 35.1790);
jerusalem.title = @"Jerusalem";
jerusalem.subtitle = @"Capital of the Davidic Dynasty";
jerusalem.image = [UIImage imageNamed:@"jerusalem"];
jerusalem.information = @"\rAccording to 2 Samuel 24:24, King David purchased Jerusalem from the Jebusites and designated it the capital of his united kingdom. Judges 1:8 gives portrays a violent capture of the city by the sons of Judah. David eventually brought the Ark to Jerusalem from Keraith Jearim. Solomon built the Temple on Mount Moriah in Jerusalem along with his palace. The city was destroyed by the Babylonians in 587 B.C. and re-established in 538 after the return of the Jews from the Exile. It served as the religious center of Palestine during the Roman occupation from 63 B.C. to its destruction in A.D. 70 by the Romans.\r\rThe city was rebuilt successively throughout the period of the Ottoman Empire. It is currently divided between Palestine and Israel.\r\rFurther Reference:\rWikipedia, “Jerusalem”\rhttp://tinyurl.com/2f662p\r\rCoordinates:\r31.7883, 35.2167\r\r\r";

OTPins *gehenna = [[OTPins alloc] init];
gehenna.coordinate = CLLocationCoordinate2DMake(31.768406, 35.230439);
gehenna.title = @"Gehenna";
gehenna.subtitle = @"The Valley of Ben-Hinnom";
gehenna.image = [UIImage imageNamed:@"gehenna"];
gehenna.information = @"\rGehenna was a valley, south of Jerusalem, where apostate Israelites would sacrifice their infants by burning them alive to worship the god Molech. It is mentioned several times in the Hebrew Scriptures. In Second Temple Judaism, it came to regarded as representative and a shorthand for everything evil and worthy of YHWH's punishment. This is the location that Jesus is portrayed as alluding to when he mentions Gehenna, which was later translated as “hell”.\r\rFurther Reference:\rWikipedia, “Gehenna”\rhttp://tinyurl.com/ymbj2d\r\r\rCoordinates: 31.768406, 35.230439";

OTPins *bethEl = [[OTPins alloc] init];
bethEl.coordinate = CLLocationCoordinate2DMake(31.9390, 35.2260);
bethEl.title = @"Beth-El";
bethEl.subtitle = @"Southern Israelite Cultic Site";
bethEl.image = [UIImage imageNamed:@"bethel"];
bethEl.information = @"\rMeaning “House of God”, Beth-El was a popular cultic site devoted to the Canaanite god El, the father of the Canaanite pantheon prior to the emergence of Israel. In Genesis 28 it is associated with the Hebrew patriarch Jacob:\r\r“When Jacob awoke from his sleep, he said, 'Truly, the Lord is in this place and I did not know it!' He was afraid and said: 'How awesome this place is! This is nothing else but the house of God, the gateway to heaven!' Early the next morning Jacob took the stone that he had put under his head, set it up as a sacred pillar, and poured oil on top of it. He named that place Beth-El, whereas the former name of the town had been Luz.”\r-Genesis 28: 16-19\r\rLater in 1 Kings, Bethel becomes one of two alternative worship sites established by King Jeroboam of the Northern Kingdom:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Bethel, the other in Dan. This led to sin, because the people frequented these calves in Bethel and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r-1 Kings 12: 28-31\r\rArcheologist Israel Finkelstein claims that its pottery evidence suggests that Beth-El was actually deserted during the reign of Jeroboam I:\r\r“Bethel is the other site mentioned in 1 Kgs 12:29 as a cult place that was erected by Jeroboam I. The mound at the village of Beitin east of Ramallah, the location of biblical Bethel, was thoroughly excavated in the 1930s and 1950s. A comprehensive investigation of the finds from this dig, stored in Jerusalem and Pittsburgh, also cast doubt on the historicity of this verse. This investigation revealed that most of the Iron IIA pottery types known from sites in the vicinity, for example, Stratum 14 in the City of David in Jerusalem, are rare or absent at Bethel and that there are no diagnostic early Iron IIA items at the site (Finkelstein and Singer-Avitz 2009). In other words, Bethel, too, produced no clear indication of activity in the time of Jeroboam I.”\r-Finkelstein, 74\r\rSee “Dan”.\r\rFurther Reference:\rNew American Bible Revised Edition\rGenesis 28, http://tinyurl.com/joct23k\r\r1 Kings 12, http://tinyurl.com/qhd4nug\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rCoordinates:\r31.9390, 35.2260\r\r\r";


OTPins *dan = [[OTPins alloc] init];
dan.coordinate = CLLocationCoordinate2DMake(33.2490, 35.6520);
dan.title = @"Dan";
dan.image = [UIImage imageNamed:@"dan"];
dan.subtitle = @"Northern Israelite Cultic Site";
dan.information = @"\rAccording to 1 Kings 12, Dan becomes one of two alternative worship sites established by King Jeroboam I of the Northern Kingdom of Israel:\r\r“Jeroboam thought to himself: 'Now the kingdom will return to the house of David. If this people go up to offer sacrifices in the house of the Lord in Jerusalem, the hearts of this people will return to their master, Rehoboam, king of Judah, and they will kill me and return to Rehoboam, king of Judah.' The king took counsel, made two calves of gold, and said to the people: 'You have been going up to Jerusalem long enough. Here are your gods, O Israel, who brought you up from the land of Egypt.' And he put one in Beth-El, the other in Dan. This led to sin, because the people frequented these calves in Beth-El and in Dan. He also built temples on the high places and made priests from among the common people who were not Levites.”\r-1 Kings 12: 28-31\r\rHowever, according to some archeologists, its pottery evidence suggest that Dan:\r\r-was destroyed by the end of late Iron Age I\r-was deserted during the time of Jeroboam I\r-was rebuilt by Hazael in the late 9th century B.C.\r-became Israelite for the first time around 800 B.C.\r\rIsrael Finkelstein claims:\r\r“...the evidence from Dan does not support the tradition about Jeroboam I at Dan... it means that the tradition about the erection of the bamah [altar] at Dan is a retrojection into the past of a reality from the days of Jeroboam II, in the first half of the eighth century B.C.E.”\r-Finkelstein, 74\r\rDan is also the site (known as “Tel-Dan”) where one of the most significant archeological finds was discovered by Avraham Biran in 1993; an inscription that referred to the “House of David”. According to the Biblical Archeological Society (BAS):\r\r“Avraham Biran and his team of archaeologists found a remarkable inscription from the ninth century B.C.E. that refers both to the 'House of David' and to the 'King of Israel.' This is the first time that the name David has been found in any ancient inscription outside the Bible. That the inscription refers not simply to a 'David' but to the House of David, the dynasty of the great Israelite king, is even more remarkable. 'King of Israel' is a term frequently found in the Bible, especially in the Book of Kings. This, however, may be the oldest extrabiblical reference to Israel in Semitic script. If this inscription proves anything, it shows that both Israel and Judah, contrary to the claims of some scholarly Biblical minimizers, were important kingdoms at this time.”\r-BAS, 33\r\rSee “Beth-El”.\r\rFurther Reference:\rNew American Bible Revised Edition\r1 Kings 12, http://tinyurl.com/qhd4nug\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rBiblical Archeological Society, “Top Ten Biblical Archeological Discoveries”\rhttp://tinyurl.com/goqp9qf\r\rWikipedia, “Dan”\rhttp://tinyurl.com/mxyh5wr\r\rCoordinates: 33.2490, 35.6520\r\r\r";

OTPins *temple = [[OTPins alloc] init];
temple.coordinate = CLLocationCoordinate2DMake(31.7780, 35.2354);
temple.title = @"The Temple";
temple.subtitle = @"The House of Yahweh";
temple.image = [UIImage imageNamed:@"temple"];
temple.information = @"\rThe Temple was originally built by Solomon in the 10th century B.C. During the reign of Josiah, it purportedly housed a large statue of the Canaanite goddess Asherah. It was destroyed by the Babylonians in 587 B.C. during their conquest of Judah. Upon their return from the Exile, the Jews rebuilt the Temple and dedicated it in 515 B.C.\r\rIt was later expanded by Herod the Great before being destroyed again by the Roman army in A.D. 70.\r\rFurther Reference:\rNOVA, “Recreating the Temple” (video)\rhttp://tinyurl.com/jr83lcj\r\rWikipedia, “Solomon's Temple”\rhttp://tinyurl.com/2fvnju\r\rCoordinates:\r31.7780, 35.2354\r\r\r";

OTPins *hazor = [[OTPins alloc] init];
hazor.coordinate = CLLocationCoordinate2DMake(33.0167, 35.5669);
hazor.title = @"Hazor";
hazor.image = [UIImage imageNamed:@"hazor"];
hazor.subtitle = @"Major Ancient Canaanite City";
hazor.information = @"\rHazor was a major city in ancient Canaan. It was described as being destroyed in Joshua within months of other campaigns against Jericho and Ai:\r\r“At that time Joshua, turning back, captured Hazor and struck down its king with the sword; for Hazor formerly was the chief of all those kingdoms. He also struck down with the sword every person there, carrying out the ban, till none was left alive. Hazor itself he burned.”\r-Joshua 11: 10-11\r\rHowever, according to the book of Judges, Hazor was still standing and a functional monarchy:\r\r“So the LORD sold them into the power of the Canaanite king, Jabin, who reigned in Hazor. The general of his army was Sisera, who lived in Harosheth-ha-goiim.”\r-Judges 4: 2\r\rIn addition to this discrepancy, recent archeological findings show that Hazor was destroyed in the late 13th century while Jericho and Ai were destroyed in 1500 B.C. and 2200 B.C., respectively. These findings further show Hazor was destoryed by internal revolt rather than external attack. These data are best explained by the Social Revolution Model of Settlement. See “Social Revolution Model” in the the Dictionary tab.\r\rFurther Reference:\rNew American Bible Revised Edition, Joshua 11\rhttp://tinyurl.com/z65778q\r\rJudges 4\rhttp://tinyurl.com/hf82n48\r\rIsrael Finkelstein, “The Forgotten Kingdom:  The Archeology And History Of Northern Israel”, pg. 21\rhttp://tinyurl.com/gnjmjwa\r\rWikipedia, “Hazor”\rhttp://tinyurl.com/o6gnwhx\r\rCoordinates:\r33.0167, 35.5669\r\r\r";

OTPins *jericho = [[OTPins alloc] init];
jericho.coordinate = CLLocationCoordinate2DMake(31.8500, 35.4500);
jericho.title = @"Jericho";
jericho.subtitle = @"Walled Canaanite City";
jericho.image = [UIImage imageNamed:@"jericho"];
jericho.information = @"\rJericho was a major Canaanite City which, according to the book of Joshua, was destroyed by the Israelite army after an intelligence-gathering mission revealed weaknesses in the city's defenses.\r\rFurther Reference:\rWikipedia, “Jericho”\rhttp://tinyurl.com/fklof\r\r Coordinates: 31.8500, 35.4500\r\r\r";

OTPins *shiloh = [[OTPins alloc] init];
shiloh.coordinate = CLLocationCoordinate2DMake(32.0556, 35.2895);
shiloh.title = @"Shiloh";
shiloh.subtitle = @"Shrine of the Ark of the Covenant";
shiloh.image = [UIImage imageNamed:@"shiloh"];
shiloh.information = @"\rAccording to various Old Testament references, Shiloh was a major cultic site asociated with the Ark of the Covenant and the tribe of Levi. It is first mentioned in the context of the Ark of the Covenant in 1 Samuel 4: 3-4:\r\r“When the soldiers returned to camp, the elders of Israel asked, 'Why did the LORD bring defeat on us today before the Philistines? Let us bring the ark of the LORD’s covenant from Shiloh, so that he may go with us and save us from the hand of our enemies.' So the people sent men to Shiloh, and they brought back the ark of the covenant of the LORD Almighty, who is enthroned between the cherubim. And Eli’s two sons, Hophni and Phinehas, were there with the ark of the covenant of God.”\r\rArcheologist Israel Finkelstein claims that although the evidence for a major settlement at Shiloh is scant during the Iron Age I period, there is evidence for cultic activity:\r\r“There was no settlement at Shiloh in the Late Bronze Age, but the favissa found on the northeastern slope hints that cultic-activity did take place at the site at that time. When one attempts to evaluate the nature of Iron I Shiloh, it is impossible to ignore these facts. To summarize this point, although there is no direct evidence of an Iron I shrine at Shiloh, indirect considerations seem to hint that Iron I Shiloh was not a typical highlands settlement, and the long-term evidence, from the Middle and Late Bronze Ages, seems to hint at the existence of a cult place there.”\r-Finkelstein, 25\r\rFurther Reference:\rNew American Standard Bible Revised Edition\r1 Samuel 4, http://tinyurl.com/o7n83hf\r\rIsrael Finkelstein, “The Forgotten Kingdom: The Archeology And History Of Northern Israel”\rhttp://tinyurl.com/gnjmjwa\r\rCoordinates:\r32.0556, 35.2895\r\r\r";


OTPins *hebron = [[OTPins alloc] init];
hebron.coordinate = CLLocationCoordinate2DMake(31.5333, 35.0950);
hebron.title = @"Hebron";
hebron.subtitle = @"David's Judahite Capital";
hebron.image = [UIImage imageNamed:@"hebron"];
hebron.information = @"\rOne of the oldest continually occupied cities in the world, Hebron is first mentioned in the biblical story-cycles of Abraham. In Genesis 23, Abraham buys Hebron from Ephron the Hittite for 400 sheckels. Abraham, Isaac, and Jacob are portrayed as buried there. Numbers 13:22 indicates that Hebron was founded around 1720 B.C. In the book of Judges, Joshua assigns Hebron to Caleb as part of the territory of Judah. In the book of 2 Samuel, David is annointed King of Judah and all Israel at Hebron.\r\r“All the tribes of Israel came to David at Hebron and said, 'We are your own flesh and blood. In the past, while Saul was king over us, you were the one who led Israel on their military campaigns. And the LORD said to you, ‘You will shepherd my people Israel, and you will become their ruler.’ When all the elders of Israel had come to King David at Hebron, the king made a covenant with them at Hebron before the LORD, and they anointed David king over Israel.”\r-2 Samuel 5: 1-3\r\rFurther Reference:\rNew American Bible Revised Edition\r2 Samuel 5, http://tinyurl.com/npwcn4a\r\rCoordinates:\r31.5333, 35.0950\r\r\r";
    
    OTPins *haran = [[OTPins alloc] init];
    haran.coordinate = CLLocationCoordinate2DMake(35.5239, 39.0202);
    haran.title = @"Haran";
    haran.subtitle = @"Ancestral Home of Abraham (J)";
    haran.image = [UIImage imageNamed:@"haran"];
    haran.information = @"\rThe Yahwist Source claims that Abraham orignially lived in Haran and from there immigrated into Canaan.\r\r“The LORD said to Abram: Go forth from your land, your relatives, and from your father’s house to a land that I will show you. I will make of you a great nation, and I will bless you; I will make your name great, so that you will be a blessing. I will bless those who bless you and curse those who curse you. All the families of the earth will find blessing in you. Abram went as the LORD directed him, and Lot went with him. Abram was seventy-five years old when he left Haran.”\r-Genesis 12:1-4\r\rSee “Yahwhist Source“ in the Dictionary tab.\r\rFurther Reference:\rNew American Bible Revised Edition\rGenesis 12, http://tinyurl.com/npwcn4a\r\rCoordinates:\r35.5239, 39.0202\r\r\r";
    
OTPins *ugarit = [[OTPins alloc] init];
ugarit.coordinate = CLLocationCoordinate2DMake(35.602, 35.782);
ugarit.title = @"Ugarit";
ugarit.subtitle = @"Ancient Canaanite Port City";
ugarit.image = [UIImage imageNamed:@"ugarit"];
ugarit.information = @"\rUgarit was a major porty of entry for trading routes to ancient Mesapotamia and the Tigris and Euphrates rivers. Although it is not mentioned in the Bible, archeological discoveries at Ugarit have yielded insights into ancient Canaanite religious beliefs and practices (e.g. the so-called Amarna Letters) and, as a result, a better understanding of early Hebrew culture. Its pantheon included Ba'al, Hadad, and Dagon (also mentioned in the Old Testament). The most famous literary discovery has been the so-called Ba'al Cycle, which details the Canaanite belief in the seasons as being the result of divine actions. This can be seen in the various references to Ba'al in the Old Testament, especially in the story of Elijah and the prophets of Ba'al in 1 Kings 18. It was closely assocated with the Hittite Empire.\r\rFurther Reference:\rOxford Research Encyclopedia:\r“Ugaritic and Biblical Literature”\rhttp://tinyurl.com/z3ah8f4\r\r\r";
    
    OTPins *ur = [[OTPins alloc] init];
    ur.coordinate = CLLocationCoordinate2DMake(30.5745, 46.0611);
    ur.title = @"Ur";
    ur.subtitle = @"Ancestral Home of Abraham (P)";
    ur.image = [UIImage imageNamed:@"ur"];
    ur.information = @"\rThe Priestly Source claims that Abraham originally lived in Ur and then later migrated to Haran and evetually Canaan. This conflicts with the Yahwist author's claim that Abraham originated from Haran.\r\r“Terah took his son Abram, his grandson Lot son of Haran, and his daughter-in-law Sarai, the wife of his son Abram, and together they set out from Ur of the Chaldeans to go to Canaan. But when they came to Harran, they settled there. Terah took his son Abram, his grandson Lot son of Haran, and his daughter-in-law Sarai, the wife of his son Abram, and together they set out from Ur of the Chaldeans to go to Canaan. But when they came to Harran, they settled there.“\r-Genesis 11:31\r\rSee “Priestly Source“ in the Dictionary tab.\r\rFurther Reference:\rNew American Bible Revised Edition\rGenesis 11, http://tinyurl.com/h9hu2uz\r\rCoordinates:\r30.5745, 46.0611\r\r\r";

    NSArray *annotations = [NSArray arrayWithObjects:jerusalem, gehenna, dan, bethEl, temple, hazor,jericho, shiloh, hebron, ugarit, haran, ur, nil];
    
   return annotations;
}


@end
