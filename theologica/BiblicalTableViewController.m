//
//  BiblicalTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "BiblicalTableViewController.h"
#import "BiblicalDetailViewController.h"
#import "Word.h"

@interface BiblicalTableViewController ()
{
    NSDictionary *terms;
    NSArray *letters;
}

@end

@implementation BiblicalTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    terms = @{
              @"A" : @[@"Abba", @"Adonai", @"anthropomorphism", @"apocalypse", @"apocrypha", @"apodictic", @"apostle", @"aqeda", @"Aramaic", @"Asherah", @"Assyria"],
              @"B" : @[@"Ba'al", @"Babel", @"Babylon", @"Ban", @"Bible", @"biblical criticism", @"Beth-El"],
              @"C" : @[@"canon", @"charism", @"Christ", @"covenant"],
              @"D" : @[@"Decalogue", @"Deuteronomic History", @"Deuteronomic Source", @"Deuteronomy", @"Documentary Hypothesis"],
              @"E" : @[@"eisegesis", @"El", @"Elohim", @"Elohist Source",  @"exegesis"],
              @"F" : @[@"fundamentalism"],
              @"G" : @[@"Gehenna", @"gospel"],
              @"H" : @[@"hermeneutics", @"Holy of Holies"],
              @"I" : @[@"inspiration"],
              @"J" : @[@"Jerusalem", @"Jesus of Nazareth", @"jew", @"justification"],
              @"K" : @[@"kosher"],
              @"L" : @[@"liberation theology"],
              @"M" : @[@"Messiah", @"Mishnah"],
              @"N" : @[@"New Testament"],
              @"O" : @[@"Old Testament"],
              @"P" : @[@"Pentateuch", @"Priestly Source"],
              @"Q" : @[@"quintessence"],
              @"R" : @[@"redemption"],
              @"S" : @[@"Satan"],
              @"T" : @[@"tax collector"],
              @"U" : @[@"universalism"],
              @"V" : @[@"vicarious"],
              @"W" : @[@"will"],
              @"X" : @[@"xcode"],
              @"Y" : @[@"Yahwist Source", @"YHWH", @"Yom Kippur"],
              @"Z" : @[@"Zion"],
              };
    
    letters = [[terms allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    //A
    /*
    Word *aaronWord = [[Word alloc] init];
    aaronWord.name = @"Aaron";
    aaronWord.definition = @"the brother of Moses and founder of the Israelite priesthood according to the Priestly (P) source. See 'Documentary Hypothesis'";
    
    Word *alexanderWord = [[Word alloc] init];
    alexanderWord.name = @"Alexander the Great";
    alexanderWord.definition = @"Macedonian king (356-323 BCE) who spead Greek culture throughout the eastern Mediterranean world and requested a Greek translation of the Hebrew Bible. See 'Hellenization'";
    
    Word *amosWord = [[Word alloc] init];
    amosWord.name = @"Amos";
    amosWord.definition = @"A prophet from the southern kingdom of Judah who spoke Divine oracles against the economic injustice of the northern kingdom of Israel in the 8th century BCE";
    */
    Word *abba = [[Word alloc] init];
    abba.name = @"Abba";
    abba.definition = @"The Aramaic term for 'Daddy'; used by Jesus in prayer to God in the gospels.";
    
    Word *adonai = [[Word alloc] init];
    adonai.name = @"Adonai";
    adonai.definition =@"The Hebrew word for 'Ruler'; used as a synonym for YHWH";
    
    Word *anthropomorphism = [[Word alloc] init];
    anthropomorphism.name = @"anthropomorphism";
    anthropomorphism.definition = @"The attribution of human characteristics to a non-human object.";
    /*
    Word *antiochusWord = [[Word alloc]init];
    antiochusWord.name = @"Antiochus IV";
    antiochusWord.definition = @"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
    */
    
    Word *apocalypse = [[Word alloc] init];
    apocalypse.name = @"apocalypse";
    apocalypse.definition = @"1. The revelation of something previously hidden, used by Paul to refer to his experience of the risen Jesus. 2. The name of the last book of the New Testament - from the Greek word αποκαλυπσις (apokalypsis) - 'unveiling'.";
    
    Word *apocrypha = [[Word alloc] init];
    apocrypha.name = @"apocrypha";
    apocrypha.definition = @"The 7 books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom - from the Greek word for 'hidden'";
    
    Word *apodictic = [[Word alloc] init];
    apodictic.name = @"apodictic";
    apodictic.definition = @"A type of law which is based on a moral norm or command; see Exodus 20, 'Decalogue'.";
    
    /*
    Word *apollosWord = [[Word alloc]  init];
    apollosWord.name = @"Apollos";
    apollosWord.definition = @"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
    */
                       
    Word *apostle = [[Word alloc] init];
    apostle.name = @"apostle";
    apostle.definition = @"The disciples which compirised Jesus' inner cirlce and whom he commissioned to spread the good news of the Kingdom of God; also used by Paul to refer to anyone who had seen the risen Christ - from the Greek word αποστολος (apostolos) - 'delegate'";
    
    Word *aqeda = [[Word alloc] init];
    aqeda.name = @"aqeda";
    aqeda.definition = @"The story of the binding and near-sacrifice of Isaac by Abraham - from Hebrew term for 'binding'.";
    
    Word *aramaic = [[Word alloc] init];
    aramaic.name = @"Aramaic";
    aramaic.definition = @"A variant of Hebrew, likely the native language of the historical Jesus";
    /*
    Word *artraxercesWord = [[Word alloc] init];
    artraxercesWord.name = @"Artaxerxes";
    artraxercesWord.definition = @"Word meaning 'ruler' applied to the kings of Persia, specifically to Cyrus the Great";
    
    Word *asherWord = [[Word alloc] init];
    asherWord.name = @"Asher";
    asherWord.definition = @"One of the twelve tribes of Israel";
    */
    
    Word *asherah = [[Word alloc] init];
    asherah.name = @"Asherah";
    asherah.definition = @"In Canaanite mythology, the wife of El and the goddess of fertility";
    
    Word *assyria = [[Word alloc] init];
    assyria.name = @"Assyria";
    assyria.definition = @"One of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 BCE";
    
    //B
    
    Word *baal = [[Word alloc]  init];
    baal.name = @"Ba'al";
    baal.definition = @"In Canannite mythology, the son of El and most active of the gods";
    
    Word *babel = [[Word alloc] init];
    babel.name = @"Babel";
    babel.definition = @"Hebrew word for 'confusion'; named for Tower eitiology in Gen. 11.";
    
    Word *babylon = [[Word alloc] init];
    babylon.name = @"Babylon";
    babylon.definition = @"Empire that conquered the southern kingdom of Judah in 587 BCE.";
    
    Word *ban = [[Word alloc] init];
    ban.name = @"Ban";
    ban.definition = @"The ancient Israelite practice of the wholesale destruction of a people and their environment";
    /*
    Word *bathshebaWord = [[Word alloc] init];
    bathshebaWord.name = @"Bathsheba";
    bathshebaWord.definition = @"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
    */
    
    Word *bible = [[Word alloc] init];
    bible.name = @"Bible";
    bible.definition = @"The collection of the Old and New Testaments regarded as canonical and inspired within Catholicism";
    
    Word *biblicalCriticism = [[Word alloc] init];
    biblicalCriticism.name = @"biblical criticism";
    biblicalCriticism.definition = @"the process of discovering what can be known about the context of any biblical book or passage in order to understand its original meaning.";
    
    Word *bethel = [[Word alloc] init];
    bethel.name = @"Beth-El";
    bethel.definition = @"A sacred site within the patriarchal story cycles in Genesis - from the Hebrew for 'House of El'.";
    
    //C
    
    Word *canon = [[Word alloc] init];
    canon.name = @"canon";
    canon.definition = @"A collection of texts regarded as authoritative for faith and practice within a community - from the Greek word for 'measuring stick' (κανον - kanon)";
    
    Word *charism = [[Word alloc] init];
    charism.name = @"charism";
    charism.definition = @"The spiritual gifts that come with Christian experience of the Holy Spirit - from the Greek word χαρισμα (charisma) - 'gift'.";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - 'annointed one'.";
    
    Word *covenant = [[Word alloc] init];
    covenant.name = @"covenant";
    covenant.definition = @"a sacred contract or agreement - used to refer to the relationship between YHWH and Israel in the Old Testament and between God and humanity in the New Testament.";
    
    //D
    
    Word *decalogue = [[Word alloc] init];
    decalogue.name = @"Decalogue";
    decalogue.definition = @"The term given to the 10 Commandments in Exodus 20 - from the Greek words δεκα (deka) - 'ten' and λογος (logos) - 'word'";
    
    Word *deuteronomicHistory = [[Word alloc] init];
    deuteronomicHistory.name = @"Deuteronomic History";
    deuteronomicHistory.definition = @"The term given to the seven books, beginning with the book of Deuteronomy and extending through 2 Kings in the Hebrew Bible, which details the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel.";
    
    Word *deuteronomicSource = [[Word alloc] init];
    deuteronomicSource.name = @"Deuteronomic Source";
    deuteronomicSource.definition = @"The 'D' source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See 'Documentary Hypothesis.'";
    
    Word *deuteronomy = [[Word alloc] init];
    deuteronomy.name = @"Deuteronomy";
    deuteronomy.definition = @"from the Greek words 'deuteros' (second) and 'nomos' (law) - the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.";
    
    Word *documentaryHypothesis = [[Word alloc] init];
    documentaryHypothesis.name = @"Documentary Hypothesis";
    documentaryHypothesis.definition = @"The theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah; 'Yahwist' (J), 'Elohist' (E), 'Priestly' (P), and 'Deuteronomic' (D).";
    
    //E
    
    Word *eisegesis = [[Word alloc] init];
    eisegesis.name = @"eisegesis";
    eisegesis.definition = @"from the Greek 'eis' (into) and 'ago' (to go) - interpreting a text by reading into it one’s own ideas and presuppositions; the opposite of exegesis.";
    
    Word *el = [[Word alloc] init];
    el.name = @"El";
    el.definition = @"In Canaanite mythology, father of all the gods and husband of Asherah.";
    
    Word *elohim = [[Word alloc] init];
    elohim.name = @"Elohim";
    elohim.definition = @"Hebrew for “gods”, “God” or “angels” depending on the context. The plural of “El”, it can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.";
    
    Word *elohistSource = [[Word alloc] init];
    elohistSource.name = @"Elohist Source";
    elohistSource.definition = @"The 'E' source; comprising various texts throughout Genesis, Exodus, and Numbers; uses 'Elohim' as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.";
    
    Word *exegesis = [[Word alloc] init];
    exegesis.name = @"exegesis";
    exegesis.definition = @"from the Greek 'ex'(out) and 'ago'(to go) - the process of determining the meaning of a text in its original context.";
    
    //F
    
    Word *fundamentalism = [[Word alloc] init];
    fundamentalism.name = @"fundamentalism";
    fundamentalism.definition = @"1. a hermeneutical method which exclusively uses a literalist criterion for intepretation of a text. 2. an anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith.";
    
    //G
    
    Word *gehenna = [[Word alloc] init];
    gehenna.name = @"Gehenna";
    gehenna.definition = @"A valley near Jerusalem (the Valley of Hinnom) where a non-Israelite shrine to a god named Moloch once stood where human sacrifice by burning took place. It seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed), and this was used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.";
    
    Word *gospel = [[Word alloc] init];
    gospel.name = @"gospel";
    gospel.definition = @"from the Greek 'evangelion' (good news) - term used to describe: 1. the message of the historical Jesus concerning the Kingdom of God, 2. the message about Jesus concerning the salvation of the world, and 3. one of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John)";
    
    //H
    
    Word *hermeneutics = [[Word alloc] init];
    hermeneutics.name = @"hermeneutics";
    hermeneutics.definition = @"The science of interpretation and process of determining meaning, usually of a text - from the name of the Greek god 'Hermes', the messenger of the gods.";
    
    Word *holyOfHolies = [[Word alloc] init];
    holyOfHolies.name = @"Holy of Holies";
    holyOfHolies.definition = @"central area of the Temple in Jerusalem where the Ark of the Covenant was believed to reside from the monarchy of Solomon until the Exile in 587 BCE.";
    
    //I
    
    Word *inspiration = [[Word alloc] init];
    inspiration.name = @"inspiration";
    inspiration.definition = @"That which provides the “breath of life” or motivation behind a course of action. Divine Inspiration is therefore understood to mean that God has provided the “breath of life” or motivation for a course of action - from the Latin word for both “spirit” and “breath”.";
    
    //J
    
    Word *jerusalem = [[Word alloc] init];
    jerusalem.name = @"Jerusalem";
    jerusalem.definition = @"The capital of the united monarchy established under David; the captial of the southern kingdom of Judah after the death of Solomon; the location of Mount Zion and the Temple.";
    
    Word *jesus = [[Word alloc] init];
    jesus.name = @"Jesus of Nazareth";
    jesus.definition = @"First-century Jewish prophet who proclaimed the Kingdom of God, whom the early Christians believed to the Christ and Son of God that reconciled the world to God.";
    
    Word *jew = [[Word alloc] init];
    jew.name = @"jew";
    jew.definition = @"Member of the tribe of Judah; used to refer to any Israelite after the return from the Exile in 515 BCE.";
    
    Word *justification = [[Word alloc] init];
    justification.name = @"justification";
    justification.definition = @"The state of being in a just or right relationship; synonymous with 'righteousness'; used by Paul to refer to the state of believers in Jesus.";
    
    //K
    
    Word *kosher = [[Word alloc] init];
    kosher.name = @"kosher";
    kosher.definition = @"Often translated as “clean”, this refers to foods that are “fitting” or “appropriate” to eat or be sacrificed to YHWH according to the Torah.";
    
    //L
    
    //M
    
    Word *messiah = [[Word alloc] init];
    messiah.name = @"Messiah";
    messiah.definition = @"Equivalent title to 'Christ'; used by the early Christians to refer to the divinely designated status of Jesus of Nazareth - from the Hebrew for 'annointed one'.";
    
    Word *mishnah = [[Word alloc] init];
    mishnah.name = @"Mishnah";
    mishnah.definition = @"An oral commentary on the Torah...";
    
    //N
    
    Word *newTestament = [[Word alloc] init];
    newTestament.name = @"New Testament";
    newTestament.definition = @"27 books dealing with the life of Jesus of Nazareth and his followers.";
    
    //O
    
    Word *oldTestament = [[Word alloc] init];
    oldTestament.name = @"Old Testament";
    oldTestament.definition = @"46 books dealing with the people of Israel.";
    
    //P
    
    Word *pentateuch = [[Word alloc] init];
    pentateuch.name = @"Pentateuch";
    pentateuch.definition = @"Another term for the first five books of the Old Testament, the Torah - from the Greek for 'five scrolls'.";
    
    Word *priestly = [[Word alloc] init];
    priestly.name = @"Priestly Source";
    priestly.definition = @"The 'P' Source; compirising various texts throughtout the Torah, but especially Leviticus. The Priestly material can be dated to around the time of Hezekiah; shows a major concern for order, numbers, and categories of holiness and cleanliness; the Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or 'profane'; this source, along with E and D, does not accept the revelation of the name YHWH before the Mosaic epiphany in Exodus 3. The Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word 'compassionate' to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author).";
    
    //Q
    
    //R
    
    //S
    
    Word *synagogue = [[Word alloc] init];
    synagogue.name = @"synagogue";
    synagogue.definition = @"The local place of weekly assembly for Jews during the Exile in Babylon; carried over into post-Exilic Judaism - from the Greek 'to go together'.";
    
    //T
    
    Word *taxCollector = [[Word alloc] init];
    taxCollector.name = @"tax collector";
    taxCollector.definition = @"Jews who collected provincial taxes for the Roman Empire; frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. They were reviled as traitors, likely cheats, and possible idolators. Jesus includes one such person (Matthew) in his inner circle of disciples.";
    
    //U
    
    //V
    
    //W
    
    //X
    
    //Y
    
    Word *yhwh = [[Word alloc] init];
    yhwh.name = @"YHWH";
    yhwh.definition = @"four letter personal name of the God of the Israelites; also called the 'Tetragrammaton', it was likely pronounced 'Yah-way'; according to the E and P sources, this name was not known before it was revealed to Moses in Exodus chapter 3, the J source, however, uses it throughout Genesis, which one argument for the Documentary Hypothesis.";
    
    Word *yomKippur = [[Word alloc] init];
    yomKippur.name = @"Yom Kippur";
    yomKippur.definition = @"the “day of Atonement”; a day set aside on the Jewish calendar dedicated to bringing about reconciliation with YHWH; explained in detail in Leviticus 16.";
    
    //Z
    
    Word *zion = [[Word alloc] init];
    zion.name = @"Zion";
    zion.definition = @"a synonym for the Temple mountain in Jerusalem or for the city of Jerusalem itself.";
    
    _biblicalDetails = [[NSMutableArray alloc] init];

    for (NSString *letter in letters)
    {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
                [array addObject: abba];
                [array addObject: adonai];
                [array addObject: anthropomorphism];
                [array addObject: apocalypse];
                [array addObject: apocrypha];
                [array addObject: apodictic];
                [array addObject: apostle];
                [array addObject: aqeda];
                [array addObject: aramaic];
                [array addObject: asherah];
                [array addObject: assyria];
            }
        else if ([letter isEqualToString:@"B"])
            {
                [array addObject: baal];
                [array addObject: babel];
                [array addObject: babylon];
                [array addObject: ban];
                [array addObject: bible];
                [array addObject: biblicalCriticism];
                [array addObject: bethel];
            }
        else if ([letter isEqualToString:@"C"])
            {
                [array addObject: canon];
                [array addObject: charism];
                [array addObject: Christ];
                [array addObject: covenant]; 
            }
        else if ([letter isEqualToString: @"D"])
            {
                [array addObject: decalogue];
                [array addObject: deuteronomicHistory];
                [array addObject: deuteronomicSource];
                [array addObject: deuteronomy];
                [array addObject: documentaryHypothesis];
            }
        else if ([letter isEqualToString:@"E"])
            {
                [array addObject: eisegesis];
                [array addObject: el]; 
                [array addObject: elohim];
                [array addObject: elohistSource];
                [array addObject: exegesis];
            }
        else if ([letter isEqualToString:@"F"])
            {
                [array addObject: fundamentalism];
            }
        else if ([letter isEqualToString:@"G"])
            {
                [array addObject: gehenna];
                [array addObject: gospel];
            }
        else if ([letter isEqualToString:@"H"])
            {
                [array addObject: hermeneutics];
                [array addObject: holyOfHolies]; 
            }
        else if ([letter isEqualToString:@"I"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"J"])
            {
                [array addObject: jerusalem];
                [array addObject: jesus];
                [array addObject: jew];
                [array addObject: justification];
            }
        else if ([letter isEqualToString:@"K"])
            {
                [array addObject: kosher];
            }
        else if ([letter isEqualToString:@"L"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"M"])
            {
                [array addObject: messiah];
                [array addObject: mishnah];
            }
        else if ([letter isEqualToString:@"N"])
            {
                [array addObject: newTestament];
            }
        else if ([letter isEqualToString:@"O"])
            {
                [array addObject: oldTestament];
            }
        else if ([letter isEqualToString:@"P"])
            {
                [array addObject: pentateuch];
                [array addObject: priestly];
            }
        else if ([letter isEqualToString:@"Q"])
            {
                [ array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"R"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"S"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"T"])
            {
                [array addObject: taxCollector];
            }
        else if ([letter isEqualToString:@"U"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"V"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"W"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"X"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"Y"])
            {
                [array addObject: yhwh];
                [array addObject: yomKippur];
            }
        else if ([letter isEqualToString:@"Z"])
            {
                [array addObject: zion];
            }
        
        [_biblicalDetails addObject:array];
    }
    


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [letters count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    //return [_Words count];
    NSString *sectionTitle = [letters objectAtIndex:section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    return [sectionTerms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"biblicalCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *sectionTitle = [letters objectAtIndex:indexPath.section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    NSString *term = [sectionTerms objectAtIndex:indexPath.row];
    cell.textLabel.text = term;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return [letters objectAtIndex:section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate


-(CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showWord"])
        {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *sectionArray = [_biblicalDetails objectAtIndex:indexPath.section];
        Word *detail = [sectionArray objectAtIndex:indexPath.row];
        
        BiblicalDetailViewController *WordViewController = [segue destinationViewController];
        //systematicDetailViewController.currentSystematicDetail = [_systematicDetail objectAtIndex:indexPath.row];
        WordViewController.currentWordDetail = detail;
        }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return letters;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [letters indexOfObject:title];
}



@end
