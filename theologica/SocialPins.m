//
//  SocialPins.m
//  theologica
//
//  Created by Jonathan Lace on 12/21/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "SocialPins.h"

@implementation SocialPins

-(NSArray *)createSocialPins {
    
    
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
    
    return annotations;
}

@end
