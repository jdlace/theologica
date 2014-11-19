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
              @"A" : @[@"Abba", @"Adonai", @"anthropomorphism", @"apocalypse", @"apocrypha", @"apodictic", @"apostle", @"aqeda", @"Aramaic", @"Asherah", @"Assyria", @"atonement"],
              @"B" : @[@"Ba'al", @"Babel", @"Babylon", @"Ban", @"Bible", @"biblical criticism", @"Beth-El"],
              @"C" : @[@"call narrative", @"canon", @"charism", @"Christ", @"circumcision", @"codex", @"covenant"],
              @"D" : @[@"Dead Sea Scrolls", @"Decalogue", @"Dei Verbum", @"Deuteronomic History", @"Deuteronomic Source", @"diachronic", @"Divino Afflante Spiritu", @"Documentary Hypothesis", @"dynamic equivalence"],
              @"E" : @[@"eisegesis", @"El", @"Elohim", @"Elohist Source", @"Essenes", @"epistle", @"evangelist", @"exegesis",],
              @"F" : @[@"folio", @"formal equivalence", @"form criticism", @"fundamentalism",],
              @"G" : @[@"Gehenna", @"genre", @"gentile", @"gospel"],//51
              @"H" : @[@"hermeneutics", @"hermeneutical circle", @"Historical Books", @"historical-critical method", @"historical criticism", @"Holy of Holies"],
              @"I" : @[@"inspiration", @"interpretation"],
              @"J" : @[@"Jerusalem", @"Jesus of Nazareth", @"Jew", @"justification"],
              @"K" : @[@"Ketuv'im", @"kosher"],
              @"L" : @[@"Law", @"literary criticism", @"LXX"],
              @"M" : @[@"manuscript", @"Messiah", @"Mishnah"],
              @"N" : @[@"Nevi'im", @"New Testament"],
              @"O" : @[@"Old Testament"],
              @"P" : @[@"papyrus", @"parable", @"Passover", @"Pentateuch", @"pericope", @"Pharisees", @"Priestly Source", @"prophet", @"Prophetic Books", @"Providentissimus Deus"],
              @"Q" : @[@"Q Source", @"Qumran"],
              @"R" : @[@"redaction criticism", @"redemption", @"resurrection"],
              @"S" : @[@"Sadducces", @"saga", @"Satan", @"Septuagint", @"source criticism", @"Servant Songs", @"story cycle", @"synagogue", @"synchronic", @"synoptic"],
              @"T" : @[@"Tanak", @"Tax Collector", @"textual criticism", @"theophany", @"Torah"],
              @"U" : @[@"universalism"],
              @"V" : @[@"vicarious justification"],
              @"W" : @[@"wisdom literature"],
              @"X" : @[@"x"],
              @"Y" : @[@"Yahwist Source", @"YHWH", @"Yom Kippur"],
              @"Z" : @[@"Zealot", @"ziggurat", @"Zion"],//115
              };
    
    letters = [[terms allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
   /*
    NSArray * items = ...;
    NSMutableString * bulletList = [NSMutableString stringWithCapacity:items.count*30];
    for (NSString * s in items)
        {
        [bulletList appendFormat:@"\u2022 %@\n", s];
        }
    textView.text = bulletList;
    */
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
    abba.definition = @"The Aramaic term for “Daddy”; used by Jesus in prayer to God in the gospels.";
    
    Word *adonai = [[Word alloc] init];
    adonai.name = @"Adonai";
    adonai.definition =@"The Hebrew word for “Ruler”; used as a synonym for YHWH.";
    
    Word *anthropomorphism = [[Word alloc] init];
    anthropomorphism.name = @"anthropomorphism";
    anthropomorphism.definition = @"The attribution of human characteristics to a non-human object. The J Source uses anthropomorphism extensively in its portrayal of YHWH.";
    /*
    Word *antiochusWord = [[Word alloc]init];
    antiochusWord.name = @"Antiochus IV";
    antiochusWord.definition = @"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
    */
    
    Word *apocalypse = [[Word alloc] init];
    apocalypse.name = @"apocalypse";
    apocalypse.definition = @"1. The revelation of something previously hidden, used by Paul to refer to his experience of the risen Jesus. 2. The name of the last book of the New Testament - from the Greek word αποκαλυπσις (apokalypsis) - “unveiling'.";
    
    Word *apocrypha = [[Word alloc] init];
    apocrypha.name = @"apocrypha";
    apocrypha.definition = @"The 7 books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom - from the Greek word for “hidden”";
    
    Word *apodictic = [[Word alloc] init];
    apodictic.name = @"apodictic";
    apodictic.definition = @"A type of law which is based on a moral norm or command; see Exodus 20, “Decalogue”.";
    
    /*
    Word *apollosWord = [[Word alloc]  init];
    apollosWord.name = @"Apollos";
    apollosWord.definition = @"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
    */
                       
    Word *apostle = [[Word alloc] init];
    apostle.name = @"apostle";
    apostle.definition = @"The disciples which compirised Jesus' inner cirlce and whom he commissioned to spread the good news of the Kingdom of God; also used by Paul to refer to anyone who had seen the risen Christ - from the Greek word αποστολος (apostolos) - “delegate”.";
    
    Word *aqeda = [[Word alloc] init];
    aqeda.name = @"aqeda";
    aqeda.definition = @"The story of the binding and near-sacrifice of Isaac by Abraham - from Hebrew word for “binding”.";
    
    Word *aramaic = [[Word alloc] init];
    aramaic.name = @"Aramaic";
    aramaic.definition = @"A variant of Hebrew, likely the native language of the historical Jesus.";
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
    asherah.definition = @"In Canaanite mythology, the wife of El and the goddess of fertility; mentioned numerous times throughout the Old Testament; according to 2 Kings 23:4 a large Asherah idol was housed in the Temple and dressed by her cult's prostitutes before Josiah's Deuteronomic reform.";
    
    Word *assyria = [[Word alloc] init];
    assyria.name = @"Assyria";
    assyria.definition = @"One of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 BCE.";
    
    //B
    
    Word *baal = [[Word alloc]  init];
    baal.name = @"Ba'al";
    baal.definition = @"In Canannite mythology, the son of El and most active of the gods; according to to 2 Kings 23:4 an image of Ba'al was housed in the Temple before Josiah's Deuternomic reform.";
    
    Word *babel = [[Word alloc] init];
    babel.name = @"Babel";
    babel.definition = @"The Hebrew word for “confusion”; named for Tower eitiology in Gen. 11.";
    
    Word *babylon = [[Word alloc] init];
    babylon.name = @"Babylon";
    babylon.definition = @"The empire that conquered the southern kingdom of Judah in 587 BCE.";
    
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
    bible.definition = @"The collection of the Old and New Testaments regarded as canonical and inspired within Catholicism. From the Greek word βιβλος (biblos) - “scroll”.";
    
    Word *biblicalCriticism = [[Word alloc] init];
    biblicalCriticism.name = @"biblical criticism";
    biblicalCriticism.definition = @"The process of discovering what can be known about the context of any biblical book or passage in order to understand its original meaning.";
    
    Word *bethel = [[Word alloc] init];
    bethel.name = @"Beth-El";
    bethel.definition = @"A sacred site within the patriarchal story cycles in Genesis - from the Hebrew for “House of El”.";
    
    //C
    
    Word *callNarrative = [[Word alloc] init];
    callNarrative.name = @"call narrative";
    callNarrative.definition = @"A literary form used throughout the Bible in which a person is called by God for a specific task; consisting of three parts: call, concern, commission. The stories of Moses, Jeremiah, and Isaiah all involve a call narrative.";
    
    Word *canon = [[Word alloc] init];
    canon.name = @"canon";
    canon.definition = @"A collection of texts regarded as authoritative for faith and practice within a community - from the Greek word κανον (kanon) - “measuring stick“.";
    
    Word *charism = [[Word alloc] init];
    charism.name = @"charism";
    charism.definition = @"According to the Apostle Paul, the spiritual gifts that come with Christian experience of the Holy Spirit - from the Greek word χαρισμα (charisma) - “gift”. See 1 Corinthians 12.";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - “annointed one”.";
    
    Word *circumcision = [[Word alloc] init];
    circumcision.name = @"circumcision";
    circumcision.definition = @"The ritual cutting of the male foreskin; the sign of the covenant according to the Priestly author, described in Genesis 17.";
    
    Word *codex = [[Word alloc] init];
    codex.name = @"codex";
    codex.definition = @"A collection of manuscripts.";
    
    Word *covenant = [[Word alloc] init];
    covenant.name = @"covenant";
    covenant.definition = @"A sacred contract or agreement - used to refer to the relationship between YHWH and Israel in the Old Testament and between God and humanity in the New Testament.";
    
    //D
    
    Word *decalogue = [[Word alloc] init];
    decalogue.name = @"Decalogue";
    decalogue.definition = @"The term given to the 10 Commandments in Exodus 20 - from the Greek words δεκα (deka) - “ten” and λογος (logos) - “word”";
    
    Word *deiVerbum = [[Word alloc] init];
    deiVerbum.name = @"Dei Verbum";
    deiVerbum.definition = @"One of the four dogmatic constitutions of the Second Vatican Council (1962-1965); it is the most definitive statement on the Church's belief in Divine revelation, the Scriptures and Tradition.";
    
    Word *deuteronomicHistory = [[Word alloc] init];
    deuteronomicHistory.name = @"Deuteronomic History";
    deuteronomicHistory.definition = @"The term given to the seven books, beginning with the book of Deuteronomy and extending through 2 Kings in the Hebrew Bible, which details the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel.";
    
    Word *deuteronomicSource = [[Word alloc] init];
    deuteronomicSource.name = @"Deuteronomic Source";
    deuteronomicSource.definition = @"The “D” source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See “Documentary Hypothesis.”";
    
    Word *deuteronomy = [[Word alloc] init];
    deuteronomy.name = @"Deuteronomy";
    deuteronomy.definition = @"from the Greek words “deuteros” (second) and “nomos” (law) - the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.";
    
    Word *diachronic = [[Word alloc] init];
    diachronic.name = @"diachronic";
    diachronic.definition = @"The type of truth within a text which transcends time and culture - from the Greek...";
    
    
    Word *documentaryHypothesis = [[Word alloc] init];
    documentaryHypothesis.name = @"Documentary Hypothesis";
    documentaryHypothesis.definition = @"The theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah; “Yahwist” (J), “Elohist” (E), “Priestly” (P), and “Deuteronomic” (D).";
    
    Word *dynamic = [[Word alloc] init];
    dynamic.name = @"dynamic equivalence";
    dynamic.definition = @"A translation philosophy that seeks to render the text idea for idea.";
    
    //E
    
    Word *eisegesis = [[Word alloc] init];
    eisegesis.name = @"eisegesis";
    eisegesis.definition = @"Interpreting a text by reading into it one’s own ideas and presuppositions; the opposite of exegesis; from the Greek εις (eis) - “into” and αγω (ago) - “to go”.";
    
    Word *el = [[Word alloc] init];
    el.name = @"El";
    el.definition = @"In Canaanite mythology, father of all the gods and husband of Asherah; referred to throughout the patriarchal sagas...";
    
    Word *elohim = [[Word alloc] init];
    elohim.name = @"Elohim";
    elohim.definition = @"The Hebrew word for “gods”, “God” or “angels” depending on the context. The plural of “El”, it can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.";
    
    Word *elohistSource = [[Word alloc] init];
    elohistSource.name = @"Elohist Source";
    elohistSource.definition = @"The “E” source; comprising various texts throughout Genesis, Exodus, and Numbers; uses 'Elohim' as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.";
    
    Word *epistle = [[Word alloc] init];
    epistle.name = @"epistle";
    epistle.definition = @"A letter sent by an apostle.";
    
    Word *evangelist = [[Word alloc] init];
    evangelist.name = @"evangelist";
    evangelist.definition = @"A person who spreads good news; 2. One of the authors of the four gospels.";
    
    Word *exegesis = [[Word alloc] init];
    exegesis.name = @"exegesis";
    exegesis.definition = @"The process of determining the meaning of a text in its original context; a necessary element of hermeneutics; from the Greek εξ (ex) - “out” and αγω (ago) - “to go”.";
    
    //F
    
    
    Word *folio = [[Word alloc] init];
    folio.name = @"folio";
    folio.definition = @"A page within a manuscript.";
    
    Word *formalEquivalence = [[Word alloc] init];
    formalEquivalence.name = @"formal eqivalence";
    formalEquivalence.definition = @"A translation philosophy that seeks to render the text word for word.";
    
    Word *formCriticism = [[Word alloc] init];
    formCriticism.name = @"form criticism";
    formCriticism.definition = @"A type of criticism which deciphers and analyzes a text's genre or literary form; mentioned as necessary exegesis in Dei Verbum, 12: “To search out the intention of the sacred writers, attention should be given, among other things, to 'literary forms'. For truth is set forth and expressed differently in texts which are variously historical, prophetic, poetic, or of other forms of discourse.”";
    
    
    Word *fundamentalism = [[Word alloc] init];
    fundamentalism.name = @"fundamentalism";
    fundamentalism.definition = @"1. A hermeneutical method which exclusively uses a literalist criterion for intepretation of a text; 2. An anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith.";
    
    //G
    
    Word *gehenna = [[Word alloc] init];
    gehenna.name = @"Gehenna";
    gehenna.definition = @"A valley near Jerusalem (the Valley of Hinnom) where a non-Israelite shrine to the Canaanite god Moloch once stood where human sacrifice by burning took place. It seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed); used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.";
    
    Word *genre = [[Word alloc] init];
    genre.name = @"genre";
    genre.definition = @"A French word referring to the literary form of a text.";
    
    Word *gospel = [[Word alloc] init];
    gospel.name = @"gospel";
    gospel.definition = @"1. The message of the historical Jesus concerning the Kingdom of God; 2. The message about Jesus concerning the salvation of the world; 3. One of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John); from the Greek word ευαγγελιον (evangelion) - “good news”.";
    
    //H
    
    Word *hermeneutics = [[Word alloc] init];
    hermeneutics.name = @"hermeneutics";
    hermeneutics.definition = @"The science of interpretation and process of determining meaning, usually of a text - from the name of the Greek god “Hermes”, the messenger of the gods.";
    
    Word *historicalBooks = [[Word alloc] init];
    historicalBooks.name = @"Historical Books";
    historicalBooks.definition = @"The second of four divisions within the Old Testament; contains 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, Nehemiah, Tobit, Judith, Esther, 1 & 2 Maccabees.";
    
    Word *hcm = [[Word alloc] init];
    hcm.name = @"historical-critical method";
    hcm.definition = @"The hermeneutical method which seeks to uncover the intention of the author through exegetical analysis of history, language, literature, sources, and culture; according to the Pontifical Biblical Commission's “The Interpretation of the Bible in the Church”, it is the one essential method for Catholic hermeneutics.";
    
    Word *historicalCriticism = [[Word alloc] init];
    historicalCriticism.name = @"historical criticism";
    historicalCriticism.definition = @"The type of exegetical criticism which deciphers and analyzes the historical context of a text.";
    
    Word *holyOfHolies = [[Word alloc] init];
    holyOfHolies.name = @"Holy of Holies";
    holyOfHolies.definition = @"The innermmost area of the Temple in Jerusalem where the Ark of the Covenant was believed to reside from the monarchy of Solomon until the Exile in 587 BCE.";
    
    //I
    
    Word *inspiration = [[Word alloc] init];
    inspiration.name = @"inspiration";
    inspiration.definition = @"That which provides the “breath of life” or motivation behind a course of action. Divine Inspiration is therefore understood to mean that God has provided the “breath of life” or motivation for a course of action - from the Latin word for both “spirit” and “breath”.";
    
    Word *interpretation = [[Word alloc] init];
    interpretation.name = @"interpretation";
    interpretation.definition = @"The explanation of the meaning, significance, and relevance of a text.";
    
    //J
    
    Word *jerusalem = [[Word alloc] init];
    jerusalem.name = @"Jerusalem";
    jerusalem.definition = @"The capital of the united monarchy established under David; the captial of the southern kingdom of Judah after the death of Solomon; the location of Mount Zion and the Temple.";
    
    Word *jesus = [[Word alloc] init];
    jesus.name = @"Jesus of Nazareth";
    jesus.definition = @"The first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.";
    
    Word *jew = [[Word alloc] init];
    jew.name = @"Jew";
    jew.definition = @"A member of the tribe of Judah; used to refer to any Israelite after the return from the Exile in 515 BCE.";
    
    Word *justification = [[Word alloc] init];
    justification.name = @"justification";
    justification.definition = @"The state of being in a just or right relationship; synonymous with “righteousness”; used by Paul to refer to the state of believers in Jesus.";
    
    //K
    
    Word *ketuvim = [[Word alloc] init];
    ketuvim.name = @"Ketuv'im";
    ketuvim.definition = @"The Hebrew word for “writings”; the third of three sections in the Tanak; see “Tanak”";
    
    Word *kosher = [[Word alloc] init];
    kosher.name = @"kosher";
    kosher.definition = @"Often translated as “clean”, this refers to foods that are “fitting” or “appropriate” to eat or be sacrificed to YHWH according to the Torah.";
    
    //L
    
    Word *law = [[Word alloc] init];
    law.name = @"Law";
    law.definition = @"1. The first five books of the Torah containing a collection of various commandments and legal codes for the Israelites.";
    
    Word *literary = [[Word alloc] init];
    literary.name = @"literary criticism";
    literary.definition = @"The type of exegetical criticism that deciphers and analyzes the literary characteristics of a text, including form, setting, plot, characterization, denouement, theme, and climax.";
    
    Word *lxx = [[Word alloc] init];
    lxx.name = @"LXX";
    lxx.definition = @"The numerical symbol for the Septuagint; named for the supposed 70 translators of the Tanak into Greek at the request of Alexander the Great.";
    
    //M
    
    Word *manuscript = [[Word alloc] init];
    manuscript.name = @"manuscript";
    manuscript.definition = @"A hand-written copy of a text.";
    
    Word *messiah = [[Word alloc] init];
    messiah.name = @"Messiah";
    messiah.definition = @"Equivalent title to 'Christ”; used by the early Christians to refer to the divinely designated status of Jesus of Nazareth - from the Hebrew for “annointed one”.";
    
    Word *mishnah = [[Word alloc] init];
    mishnah.name = @"Mishnah";
    mishnah.definition = @"An oral commentary on the Torah...";
    
    //N
    
    Word *neviim = [[Word alloc] init];
    neviim.name = @"Nevi'im";
    neviim.definition = @"The Hebrew word for “Prophets”; the term given the second of the three sections of the Tanak.";
    
    Word *newTestament = [[Word alloc] init];
    newTestament.name = @"New Testament";
    newTestament.definition = @"The second of two major sections of the Bible; 27 books dealing with the life of Jesus of Nazareth and his followers; contains the 4 gospels, the Acts of the Apostles, numerous epistles, and the Apocalypse.";
    
    //O
    
    Word *oldTestament = [[Word alloc] init];
    oldTestament.name = @"Old Testament";
    oldTestament.definition = @"The first of two major sections of the Bible; 46 books dealing with the people of Israel; contains the Pentateuch, Historical Books, Wisdom Books, and Prophetic Books.";
    
    //P
    
    Word *parable = [[Word alloc] init];
    parable.name = @"parable";
    parable.definition = @"A fable-like story that makes a theological claim; used frequently by Jesus in the synoptic gospels.";
    
    Word *papyrus = [[Word alloc] init];
    papyrus.name = @"papyrus";
    papyrus.definition = @"A type of paper used for writing created from a plant...";
    
    Word *passover = [[Word alloc] init];
    passover.name = @"Passover";
    passover.definition = @"The feast that commemorates the exodus of the Israelites from slavery in Egypt...";
    
    Word *pentateuch = [[Word alloc] init];
    pentateuch.name = @"Pentateuch";
    pentateuch.definition = @"Another term for the first five books of the Old Testament, the Torah - from the Greek for “five scrolls”.";
    
    Word *pericope = [[Word alloc] init];
    pericope.name = @"pericope";
    pericope.definition = @"A given section of a larger text...";
    
    
    Word *priestly = [[Word alloc] init];
    priestly.name = @"Priestly Source";
    priestly.definition = @"The “P” Source; compirising various texts throughtout the Torah, but especially Leviticus. The Priestly material can be dated to around the time of Hezekiah; shows a major concern for order, numbers, and categories of holiness and cleanliness; the Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or “profane”; this source, along with E and D, does not accept the revelation of the name YHWH before the Mosaic epiphany in Exodus 3. The Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word “compassionate” to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author). For more information see http://en.wikipedia.org/wiki/Priestly_source";
    
    Word *prophet = [[Word alloc] init];
    prophet.name = @"prophet";
    prophet.definition = @"One who speaks in place of God; used in the Old Testament to refer to either a court prophet (such as Nathan) or an independent prophet (such as Amos).";
    
    Word *prophetic = [[Word alloc] init];
    prophetic.name = @"Prophetic Books";
    prophetic.definition = @"The fourth of four sections in the Old Testament...";
    
    //Q
    
    Word *q = [[Word alloc] init];
    q.name = @"Q Source";
    q.definition = @"The hypothetical written source that lies behind the similar passages, exclusive to Matthew and Luke, which contain various teachings of Jesus; from the German word “quelle' - “source”.";
    //R
    
    Word *redaction = [[Word alloc] init];
    redaction.name = @"redaction criticism";
    redaction.definition = @"The type of exegetical criticism that seeks to decipher and analyze the various stages of redaction of a text.";
    
    //S
    
    Word *Satan = [[Word alloc] init];
    Satan.name = @"Satan";
    Satan.definition = @"The adversarial being found in post-Exilic Hebrew literature that serves to represent evil events...";
    
    Word *septuagint = [[Word alloc] init];
    septuagint.name = @"Septuagint";
    septuagint.definition = @"The Greek translation of the Old Testament...";
    
    Word *source = [[Word alloc] init];
    source.name = @"source criticism";
    source.definition = @"The exegetical criticism that seeks to decipher and analyze the underlying source of a text.";
   
    Word *synagogue = [[Word alloc] init];
    synagogue.name = @"synagogue";
    synagogue.definition = @"The local place of weekly assembly for Jews during the Exile in Babylon; carried over into post-Exilic Judaism - from the Greek “to go together“.";
    
    Word *synchronic = [[Word alloc] init];
    synchronic.name = @"synchronic";
    synchronic.definition  = @"The type of truth that is relative to the time of a text's composition, usually relating to the worldview of the author.";
    
    Word *synoptic = [[Word alloc] init];
    synoptic.name = @"synoptic";
    synoptic.definition = @"A term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity of narrative and Christology contrasted with the gospel of John; from the Greek word συν (syn) - “together” and οπσις (opsis) - “appearance”";
    
    
    //T
    
    Word *tanak = [[Word alloc] init];
    tanak.name = @"Tanak";
    tanak.definition = @"Acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im. Since Hebrew has no vowels, those are added.";
    
    Word *taxCollector = [[Word alloc] init];
    taxCollector.name = @"tax collector";
    taxCollector.definition = @"Jews who collected provincial taxes for the Roman Empire; frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. They were reviled as traitors, likely cheats, and possible idolators. Jesus includes one such person (Matthew) in his inner circle of disciples.";
    
    Word *textual = [[Word alloc] init];
    textual.name = @"textual criticism";
    textual.definition = @"The exegetical criticism that deciphers and analyzes the original language of a text.";
    
    Word *theophany = [[Word alloc] init];
    theophany.name = @"theophany";
    theophany.definition = @"An appearance of God to a human being. Numerous theophanies are recorded throughout the Bible with the account of Moses being paradigmatic.";
    
    Word *torah = [[Word alloc] init];
    torah.name = @"Torah";
    torah.definition = @"The first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy.";
    
    //U
    
    //V
    
    //W
    
    Word *wisdom = [[Word alloc] init];
    wisdom.name = @"wisdom literature";
    wisdom.definition = @"A type of literature that contains wise sayings and philosophical reflections on life.";
    
    Word *widsomBooks = [[Word alloc] init];
    widsomBooks.name = @"poetic";
    widsomBooks.definition = @"The third of four sections in the Old Testament; it consists mainly of various writings; contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.";
    
    //X
    
    //Y
    
    Word *yahwist = [[Word alloc] init];
    yahwist.name = @"Yahwist Source";
    yahwist.definition = @"The “J” Source...";
    
    Word *yhwh = [[Word alloc] init];
    yhwh.name = @"YHWH";
    yhwh.definition = @"The four letter personal name of the God of the Israelites, also called the 'Tetragrammaton'; it was likely pronounced 'Yah-way”; according to the E and P sources, this name was not known before it was revealed to Moses in Exodus chapter 3, the J source, however, uses it throughout Genesis, which is one argument for the Documentary Hypothesis.";
    
    Word *yomKippur = [[Word alloc] init];
    yomKippur.name = @"Yom Kippur";
    yomKippur.definition = @"The “Day of Atonement”; a day set aside on the Jewish calendar dedicated to bringing about reconciliation with YHWH; explained in detail in Leviticus 16.";
    
    //Z
    
    Word *zion = [[Word alloc] init];
    zion.name = @"Zion";
    zion.definition = @"A synonym for the Temple mountain in Jerusalem or for the city of Jerusalem itself.";
    
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
                [array addObject: callNarrative];
                [array addObject: canon];
                [array addObject: charism];
                [array addObject: Christ];
                [array addObject: circumcision]; 
                [array addObject: codex];
                [array addObject: covenant];
            }
        else if ([letter isEqualToString: @"D"])
            {
                [array addObject: decalogue];
                [array addObject: deiVerbum];
                [array addObject: deuteronomicHistory];
                [array addObject: deuteronomicSource];
                [array addObject: diachronic];
                [array addObject: documentaryHypothesis];
                [array addObject: dynamic];
            }
        else if ([letter isEqualToString:@"E"])
            {
                [array addObject: eisegesis];
                [array addObject: el]; 
                [array addObject: elohim];
                [array addObject: elohistSource];
                [array addObject: epistle];
                [array addObject: evangelist];
                [array addObject: exegesis];
            }
        else if ([letter isEqualToString:@"F"])
            {
                [array addObject: folio];
                [array addObject: formalEquivalence];
                [array addObject: formCriticism];
                [array addObject: fundamentalism];
            }
        else if ([letter isEqualToString:@"G"])
            {
                [array addObject: gehenna];
                [array addObject: genre];
                [array addObject: gospel];
            }
        else if ([letter isEqualToString:@"H"])
            {
                [array addObject: hermeneutics];
                [array addObject: historicalBooks];
                [array addObject: hcm];
                [array addObject: historicalCriticism];
                [array addObject: holyOfHolies];
            }
        else if ([letter isEqualToString:@"I"])
            {
                [array addObject: inspiration];
                [array addObject: interpretation];
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
                [array addObject: ketuvim];
                [array addObject: kosher];
            }
        else if ([letter isEqualToString:@"L"])
            {
                [array addObject: law];
                [array addObject: literary];
                [array addObject: lxx];
            }
        else if ([letter isEqualToString:@"M"])
            {
                [array addObject: manuscript]; 
                [array addObject: messiah];
                [array addObject: mishnah];
            }
        else if ([letter isEqualToString:@"N"])
            {
                [array addObject: neviim];
                [array addObject: newTestament];
            }
        else if ([letter isEqualToString:@"O"])
            {
                [array addObject: oldTestament];
            }
        else if ([letter isEqualToString:@"P"])
            {
                [array addObject: papyrus];
                [array addObject: parable];
                [array addObject: passover];
                [array addObject: pentateuch];
                [array addObject: pericope];
                [array addObject: priestly];
            }
        else if ([letter isEqualToString:@"Q"])
            {
                [ array addObject: q];
            }
        else if ([letter isEqualToString:@"R"])
            {
                [array addObject: redaction];
            }
        else if ([letter isEqualToString:@"S"])
            {
                [array addObject: Satan];
                [array addObject: septuagint];
                [array addObject: source];
                [array addObject: synagogue];
                [array addObject: synchronic];
                [array addObject: synoptic];
            }
        else if ([letter isEqualToString:@"T"])
            {
                [array addObject: tanak];
                [array addObject: taxCollector];
                [array addObject: textual];
                [array addObject: theophany];
                [array addObject: torah];
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
                [array addObject: wisdom];
                [array addObject: widsomBooks];
            }
        else if ([letter isEqualToString:@"X"])
            {
                [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"Y"])
            {
                [array addObject: yahwist]; 
                [array addObject: yhwh];
                [array addObject: yomKippur];
            }
        else if ([letter isEqualToString:@"Z"])
            {
                [array addObject: zion];
            }
        
        [_biblicalDetails addObject:array];
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
    

    }
    


    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    [self.tableView reloadData];
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
    
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
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
    
    static UILabel* label;
    if (!label) {
        label = [[UILabel alloc]
                 initWithFrame:CGRectMake(0, 0, FLT_MAX, FLT_MAX)];
        label.text = @"test";
    }
    
    label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [label sizeToFit];
    return label.frame.size.height * 2.75;

    //return 50;
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
