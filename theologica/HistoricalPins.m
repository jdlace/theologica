//
//  HistoricalPins.m
//  theologica
//
//  Created by Jonathan Lace on 12/21/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "HistoricalPins.h"

@implementation HistoricalPins

-(NSArray *) createHistoricalPins {
    
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
    
    return annotations;
    
}

@end
