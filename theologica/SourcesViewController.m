//
//  SourcesTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 12/29/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "SourcesViewController.h"
#import "SourcesDetailViewController.h"
//#import "TwitterTableViewController.h"
//#import <TwitterKit/TwitterKit.h>


@interface SourcesViewController ()

@end

@implementation SourcesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = self.signView.frame;
    rect.origin = CGPointMake(self.sourceView.bounds.size.width, rect.origin.y);
    self.signView.frame = rect;
    
    self.scrollView.contentSize = CGSizeMake(self.signView.bounds.size.width + self.sourceView.bounds.size.width, self.scrollView.contentSize.height);
    
    self.scrollView.delegate = self;
    
    //self.pageControl.defersCurrentPageDisplay = NO;
    //[self.navigationController.navigationBar setBarStyle:UIStatusBarStyleLightContent];
/*
    [[Twitter sharedInstance] logInGuestWithCompletion:^(TWTRGuestSession *guestSession, NSError *error)
    {
        [[[Twitter sharedInstance] APIClient] loadTweetWithID:@"20" completion:^(TWTRTweet *tweet, NSError *error)
         {
            TWTRTweetView *tweetView = [[TWTRTweetView alloc] initWithTweet:tweet style:TWTRTweetViewStyleRegular];
            [self.view addSubview:tweetView];
        }];
    }];
*/
}




-(IBAction) pageControlTapped:(id)sender
{
    CGRect rect = CGRectMake(self.scrollView.frame.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    [self.scrollView scrollRectToVisible:rect animated:YES];
    
    
    
    //self.pageControl.currentPage = 0;
    //[self.pageControl updateCurrentPageDisplay];

}

//delegate method
-(void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"scriptureDetail"])
        {
        Source *scriptureSource = [[Source alloc] init];
        scriptureSource.name = @"Sacred Scripture";
        scriptureSource.twitterDef = @"The Word of God in Human Language";
        scriptureSource.comment = @"Throughout the history of the Catholic tradition, the canon of Scripture has always played a central and dialectic role in the community life of the Church. The Dogmatic Constitution on Divine Revelation (Dei Verbum) from Vatican II contains the most authoritative statement on the Church's belief about Sacred Scripture:\r\r“Those divinely revealed realities which are contained and presented in Sacred Scripture have been committed to writing under the inspiration of the Holy Spirit. For holy mother Church, relying on the belief of the Apostles (see John 20:31; 2 Tim. 3:16; 2 Peter 1:19-20, 3:15-16), holds that the books of both the Old and New Testaments in their entirety, with all their parts, are sacred and canonical because written under the inspiration of the Holy Spirit, they have God as their author and have been handed on as such to the Church herself. In composing the sacred books, God chose men and while employed by Him they made use of their powers and abilities, so that with Him acting in them and through them, they, as true authors, consigned to writing everything and only those things which He wanted.” (Dei Verbum, 11).\r\rThe Hebrew Bible is the foundation of the Biblical tradition.\r\rThe Old Testament\r\rConsisting of the Hebrew canon plus seven additional books of the Apocrypha, the Old Testament contains the story of the people of Israel. It is divided into the Pentateuch, Historical Books, Novellas, Prophetic Books, and Wisdom Books.\r\rThe Pentateuch contains the 5 books of the Torah: Genesis, Exodus, Leviticus, Numbers, and Deuteronomy. The Historical Books contain Joshua, Judges, Ruth, 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, and Nehemiah. The Novellas are Tobit, Judith, Esther, and 1 & 2 Maccabees. The Prophetic Books consist of Isaiah, Jeremiah, Lamentations, Baruch, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, and Malachi. The Wisdom Books contain Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.\r\rThe New Testament\r\rThe gospels of Matthew, Mark, Luke, and John narrate the life of Jesus through the perspective of faith in his divine sonship. These are followed by the Acts of the Apostles, which describes the birth and growth of the nacent Church “...in Jerusalem, throughout all Judea and Samaria, and the uttermost parts of the world” (Acts 1:8). The letters of St. Paul follow next with Romans, 1 & 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, and 1 & 2 Thessalonians, 1 & 2 Timothy, Titus, and Philemon. Then follow the so-called General letters - Hebrews, James, 1 & 2 Peter, 1 - 3 John, and Jude. The book of Revelation concludes the New Testament.\r\rManuscripts\r\rThe manuscript tradition of the New Testament contains over 3,000 extant fragments and complete copies of the canonical 27 books. Codex Siniaiticus is the oldest extant complete copy of the New Testament (dating back to the 4th century) and papyrus fragment 52 is the oldest piece of the New Testament (dating back as early as A.D. 120).\r\rFurther Reference:\rWikipedia, “New Testament”\rhttp://tinyurl.com/sxnv4                 \r\r";
        scriptureSource.bigPic = [UIImage imageNamed:@"codex"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = scriptureSource;
        }
    else if ([segue.identifier isEqualToString:@"magisteriumDetail"])
        {
        Source *catechismSource = [[Source alloc] init];
        catechismSource.name = @"Magisterium";
        catechismSource.twitterDef = @"The Teaching Authority of the Church";
        catechismSource.comment = @"The Magisterium represents the teaching authority of the Church which derives from the prophetic office of Christ. The Church formulates its teaching from the Deposit of Faith, which it constantly interprets and which it has received from the Apostles. In the hierarchy of the Church, the Bishops are the successors of the Apostles and the primary responsibles for teaching the Faith. The Magisterium shares in the Infallibility of the Church when it teaches in communion with the Bishop of Rome, the Pope. The Bishop of Rome (the Pope) is the visible sign of unity of the Bishops and the Church. According to the Catechism of the Catholic Church, 85:\r\r“The task of giving an authentic interpretation of the Word of God, whether in its written form or in the form of Tradition, has been entrusted to the living teaching office of the Church alone. Its authority in this matter is exercised in the name of Jesus Christ. This means that the task of interpretation has been entrusted to the bishops in communion with the successor of Peter, the Bishop of Rome.”\r\rThe Faithful share in the Infallibility of the Church as well when they manifest a “universal consent in matters of faith and morals”.";
        catechismSource.bigPic = [UIImage imageNamed:@"peter"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = catechismSource;
        //[((SourcesDetailViewController *)segue.destinationViewController) p
        }
    else if ([segue.identifier isEqualToString:@"fathersDetail"])
    {
        Source *fathersSource = [[Source alloc] init];
        fathersSource.name = @"Church Fathers";
        fathersSource.twitterDef = @"Stewards of the Faith";
        fathersSource.comment = @"The Fathers of the Church occupy a special place in the Catholic Tradition. They were the earliest intepreters of the Faith against heresies and controversies through the first eight centuries of the Church. The age of the Fathers ususally is dated from the end of the 2nd century through the the end of the 8th century.The most frequently used organization of the Fathers is made in reference to the Nicene Council:\r\r-Ante-Nicene\r-Nicene\r-Post-Nicene\r\rAnte-Nicene Fathers\r\rThe Ante-Nicene fathers include writers such as St. Clement of Rome, St. Ignatius of Antioch, St. Justin Martyr, St. Irenaeus of Lyon, Origen of Alexandria, St. Clement of Alexandria, Tertullian of Carthage, St. Hippolytus of Rome, and St. Polycarp of Smyrna.\r\rNicene & Post-Nicne Fathers\r\rThe Nicene & Post-Nicene Fathers include writers such as St. Athanasius, St. Gregory of Nazianzus, Basil of Caesarea, St. Gregory of Nyssa, St. Jerome, St. Augustine of Hippo, St. Vincent of Lerins, St. Cyril of Alexandria, and St. Maximus the Confessor.\r\rThe Second Vatican Council drew heavily upon Patristics as seen in the French term “ressourcement” (a return to the sources) which was one of two major emphases at Vatican II.\r\r\r\r";
        fathersSource.bigPic = [UIImage imageNamed:@"fathers"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = fathersSource;
    }
    
    else if ([segue.identifier isEqualToString:@"liturgyDetail"])
        {
        Source *liturgySource = [[Source alloc] init];
        liturgySource.name = @"Liturgy";
        liturgySource.twitterDef = @"The Worship of the Church";
        liturgySource.comment = @"\rIn its broadest sense, Liturgy is the participation of the Church in the Paschal Mystery. More colloquially, the public worship of the Church is commonly referred to as Liturgy. The Sunday Mass is composed of the Liturgy of the Word and the Liturgy of the Eucharist. The former celebrates the Word of God and the latter celebrates the mystery of Christ's death and resurrection. The daily worship of the Church is known as the Liturgy of the Hours. In each of these, the Church expresses what it believes. This is known as the principle of Lex Orandi-Lex Credendi (“the law of prayer is the law of belief”). Liturgy is a source for Theology for precisely this reason.\r\rThe Dogmatic Constitution on the Sacred Liturgy, promulgated by the Second Vatican Council, is the most authoritative teaching by the Church on the Liturgy. Paragraph 2 states that the Liturgy,:\r\r“...through which the work of our redemption is accomplished, most of all in the divine sacrifice of the Eucharist, is the outstanding means whereby the faithful may express in their lives, and manifest to others, the mystery of Christ and the real nature of the true Church.”\r\rOne of the major reforms of Vatican II was the inclusion of the Liturgy in the vernacular, as opposed to Latin exclusively. The 1970 Novus Ordo was the basis of subsequent vernacular translations. Most recently, in 2011, the U.S. Bishops published a revised version of the Roman Missal, based on a formal correspondence translation philosophy.\r\rFurther Reference:\rCatechism of the Catholic Church, 1136-1199\rhttp://tinyurl.com/oa9lfkj";
        liturgySource.bigPic = [UIImage imageNamed:@"liturgy7"];
        //liturgySource.scrollPic = [UIImage imageNamed:@"stainedColor"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                    style:UIBarButtonItemStylePlain
                   target:nil
                   action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = liturgySource;

        }
    
    else if ([segue.identifier isEqualToString:@"councilsDetail"])
        {
        Source *councilsSource = [[Source alloc] init];
        councilsSource.name = @"Ecumenical Councils";
        councilsSource.twitterDef = @"The Church Seeking Discernment";
        councilsSource.comment = @"\rEcumenical Councils are called to settle matters of faith and practice. In the Catholic Tradition, there have been 21 such Councils. The most recent Council, Vatican, II, was convoked by Pope John XXIII in 1962 and held session until 1965. Its procedings were approved by Pope Paul VI. Vatican II produced four Dogmatic Constitutions, which are teachings that carry the highest authority within Magisterial statements.";
        councilsSource.bigPic = [UIImage imageNamed:@"vaticanII"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                    style:UIBarButtonItemStylePlain
                   target:nil
                  action:nil];
        self.navigationItem.backBarButtonItem = backButton;
         ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = councilsSource;
        
        }
    
    else if ([segue.identifier isEqualToString:@"creedsDetail"])
        {
        Source *creedsSource = [[Source alloc] init];
        creedsSource.name = @"Creeds";
        creedsSource.twitterDef = @"Statements of Faith";
        creedsSource.comment = @"\rThe Creeds of the Church give expression to the Faith of the Church.";
        creedsSource.bigPic = [UIImage imageNamed:@"creed2"];

        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                    style:UIBarButtonItemStylePlain
                   target:nil
                   action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = creedsSource;
        }
    
    else if ([segue.identifier isEqualToString:@"scienceDetail"])
        {
        Source *scienceSource = [[Source alloc] init];
        scienceSource.name = @"Science";
        scienceSource.twitterDef = @"Knowlege of the Physical World";
        scienceSource.comment = @"\rAs a separate but related domain of knowledge, science is akin to theology in that it involves a specific methodology designed to answer a specific set of questions about human experience. Science is a specific and limited discipline that posits natural explanations for physical phenomena using empirical methods of analysis. Science originated as part of the broader quest for wisdom in the form of ancient Philosophy. In relation to Aristotle's Four Types of Causation, Science would be equivalent to efficient causation. Science necessarily limits its explanations to natural causes in order to ensure testability by using the Scientific Method.\r\rScience is a Sign of the Times because it provides ever-increasing knowledge about the created order, and this knowledge directly affects how Theology understands the God-World relationship. In a letter to the then-director of the Vatican Observatory in 1998, Pope John Paul II claimed that in order to be authentic and relevant Theology must incorporate the findings of Science:\r\r“Theology will have to call on the findings of science to one degree or another as it pursues its primary concern for the human person, the reaches of freedom, the possibilities of Christian community, the nature of belief and the intelligibility of nature and history. The vitality and significance of theology for humanity will in a profound way be reflected in its ability to incorporate these findings.”\r\rSince Vatican II, the Church has recognized the impact of scientific findings on Theology. In Gaudium et Spes, Dogmatic Constitution on the Church in the Modern World, the Council fathers specifically mentioned that scientific findings had been among recent challenges in the larger context of the Signs of the Times:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis...The recent studies and findings of science, history and philosophy raise new questions which effect life and which demand new theological investigations.”\r\rThat acknowledgement launched over half a century of renewed theological engagement with the sciences. While science has its own autonomy, the proper incorporation of Science into Theology contextualizes scientific findings in the larger perspective of the work of the Creator. As Dr. John Haught claims:\r\r“We live in an age of science, astrophysics, evolutionary biology, and information. These cumulatively have given us an entirely new picture, or story, of the universe, and we are obliged to treat the notion of revelation in terms that relate it to these developments. The perennial human questions concerning what this universe is all about are being raised in a new and striking way today. Does cosmic evolution have any direction to it? How does our species fit into the evolutionary picture? How are we to understand our own existence now that it has become clearer than ever that we too are part of an evolving world? What sense can we make of the apparent randomness, struggle, and impersonal natural selection that seem to be the main ingredients of evolution? Why did the universe take fifteen billion years to bring forth conscious beings here on earth? What sense can we possibly make of the immense size of the universe, in which so far we have no evidence that other intelligent life exists? And what if intelligent or spiritual life does exist elsewhere? Then what is the meaning of Israel’s election or of the redemptive significance of Jesus of Nazareth with respect to these hypothetical cosmological conjectures?\r\rScientifically informed people are asking such questions today, and their inquiries should not remain off-limits to our theologies of revelation. Working along with science, theology is obliged at least to attempt some response to them from the point of view of whatever intelligibility is discerned by faith in revelation. From the beginning, Christians have been called upon to give an account of their faith in terms of contemporary modes of thought (for example, 1 Peter 3:15). Questions about the universe and our place in it enchant more and more people today, but revelation theology remains pretty much mute with respect to them. Yet if our theologies of revelation cannot respond -- in some fashion at least -- to the big questions of our time, then they will quite rightly be ignored by contemporary culture.”\r\rThe International Theological Commission published Communion and Stewardship: Human Persons Created in the Image of God in 2004. In paragraph 62, the Commission stated that:\r\r“...Christians have the responsibility to locate the modern scientific understanding of the universe within the context of the theology of creation. The place of human beings in the history of this evolving universe, as it has been charted by modern sciences, can only be seen in its complete reality in the light of faith.”\r\rSee “Divine Revelation”, “Evolution” in the Dictionary tab.\r\rFurther Reference:\r";
        scienceSource.bigPic = [UIImage imageNamed:@"station"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                    style:UIBarButtonItemStylePlain
                   target:nil
                  action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = scienceSource;
        }
    
    else if ([segue.identifier isEqualToString:@"philosophyDetail"])
        {
        Source *philosophySource = [[Source alloc] init];
        philosophySource.name = @"Philosophy";
        philosophySource.twitterDef = @"The Love of Wisdom";
        philosophySource.comment = @"\rPhilosophy is a product of the human quest to know reality. As such, it has a unique relation to Theology among other Signs of the Times in that it offers a set of rational tools that Theology uses to better understand the Faith. However, apart from its theological appropriation, Philosophy also has an authentic independence which is exercised in the search for truth. The most extensive Magisterial treatment of the relationship between Theology and Philosophy was Pope John Paul II's 1998 encyclical, Fides Et Ratio (Faith and Reason). ";
        philosophySource.bigPic = [UIImage imageNamed:@"thinker"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                    style:UIBarButtonItemStylePlain
                   target:nil
                  action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = philosophySource;
        }
    
    else if ([segue.identifier isEqualToString:@"technologyDetail"])
        {
        
        Source *technologySource = [[Source alloc] init];
        technologySource.name = @"Technology";
        technologySource.twitterDef = @"Tools From and For Human Development";
        technologySource.comment = @"\rSince it coincided with and enabled the evolution of homo sapiens, technology has always influenced and been an expression of human creativity.";
        technologySource.bigPic = [UIImage imageNamed:@"tech1"]; 
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = technologySource;

        }
    
    else if ([segue.identifier isEqualToString:@"economicsDetail"])
        {
        Source *economicsSource = [[Source alloc] init];
        economicsSource.name = @"Economics";
        economicsSource.twitterDef = @"Material Goods and Services";
        economicsSource.comment = @"\rHuman development is includes an economic aspect.";
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = economicsSource;
        
        }
    else if ([segue.identifier isEqualToString:@"artsDetail"])
        {
        Source *artsSource = [[Source alloc] init];
        artsSource.name = @"Politics";
        artsSource.twitterDef = @"The Affairs of the People";
        artsSource.comment = @"\rThe regulation of human society is essential to its survival and development.";
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = artsSource;
        }
    else if ([segue.identifier isEqualToString:@"politicsDetail"])
        {
        Source *politicsSource = [[Source alloc] init];
        politicsSource.name = @"Politics";
        politicsSource.twitterDef = @"The Affairs of the People";
        politicsSource.comment = @"\rThe regulation of human society is essential to its survival and development.";
        
        SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
        
        sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = politicsSource;

        }

}

- (IBAction)scriptureButton:(id)sender
{
    /*
    Source *scriptureSource = [[Source alloc] init];
    scriptureSource.name = @"Sacred Scripture";
    scriptureSource.twitterDef = @"The Word of God in Human Language";
    scriptureSource.comment = @"\rThroughout the history of the Catholic tradition, the canon of Scripture has always played a central and dialectic role in the community life of the Church. The Hebrew Bible is the foundation of the Biblical tradition.<img>\r\rThe Old Testament\r\rConsisting of the Hebrew canon plus seven additional books of the Apocrypha, the Old Testament contains the story of the people of Israel. It is divided into the Pentateuch, Historical Books, Prophets, and Wisdom Books.\r\rThe New Testament\r\rThe gospels of Matthew, Mark, Luke, and John narrate the life of Jesus through the perspective of faith in his divine sonship.";
    scriptureSource.image = [UIImage imageNamed:@"appicon"];
    scriptureSource.bigPic = [UIImage imageNamed:@"codex"];
    //scriptureSource.scrollPic = [UIImage imageNamed:@"codex"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard]
            instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = scriptureSource;
    
   // [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
     */
}

- (IBAction)fathersButton:(id)sender
{
    /*
    Source *fathersSource = [[Source alloc] init];
    fathersSource.name = @"Fathers of the Church";
    fathersSource.twitterDef = @"Stewards of the Faith";
    fathersSource.comment = @"\rThe Fathers of the Church occupy a special place in the Catholic Tradition.";
    fathersSource.image = [UIImage imageNamed:@"appicon"];
    fathersSource.bigPic = [UIImage imageNamed:@"fathers"];
    //fathersSource.scrollPic = [UIImage imageNamed:@"fathersColor"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = fathersSource;
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];}
     */
}

- (IBAction)catechismButton:(id)sender
{
    /*
    Source *catechismSource = [[Source alloc] init];
    catechismSource.name = @"Magisterium";
    catechismSource.twitterDef = @"The Teaching Authority of the Church";
    catechismSource.comment = @"\fThe Magisterium represents the teaching authority of the Church.";
    catechismSource.image = [UIImage imageNamed:@"appicon"];
    catechismSource.bigPic = [UIImage imageNamed:@"peter"];
    //catechismSource.scrollPic = [UIImage imageNamed:@"peter"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = catechismSource;

    
    //[self.navigationController pushViewController:sourcesDetailViewController animated:YES];
*/
    
}

- (IBAction)liturgyButton:(id)sender
{
/*
    Source *liturgySource = [[Source alloc] init];
    liturgySource.name = @"Liturgy";
    liturgySource.twitterDef = @"The Worship of the Church";
    liturgySource.comment = @"\fThe liturgy of the Church expresses what it believes. Lex Orandi-Lex Credendi.";
    liturgySource.image = [UIImage imageNamed:@"appicon"];
    liturgySource.bigPic = [UIImage imageNamed:@"stained"];
    //liturgySource.scrollPic = [UIImage imageNamed:@"stainedColor"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = liturgySource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
*/
}

- (IBAction)councilsButton:(id)sender
{
    /*
    Source *councilsSource = [[Source alloc] init];
    councilsSource.name = @"Ecumenical Councils";
    councilsSource.twitterDef = @"\rThe Church Seeking Discernment";
    councilsSource.comment = @"\rEcumenical Councils are called to settle matters of faith and practice.";
    councilsSource.image = [UIImage imageNamed:@"appicon"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = councilsSource;

    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
     */
}

- (IBAction)scienceButton:(id)sender
{
    /*
    Source *scienceSource = [[Source alloc] init];
    scienceSource.name = @"Science";
    scienceSource.twitterDef = @"Knowlege of the Physical World";
    scienceSource.comment = @"\rAs a separate but related domain of knowledge, science is akin to theology in that it involves a specific methodology designed to answer a specific set of questions about human experience.";
    scienceSource.image = [UIImage imageNamed:@"appicon"];
    scienceSource.bigPic = [UIImage imageNamed:@"station"];
    //scienceSource.scrollPic = [UIImage imageNamed:@"station"];

    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = scienceSource;
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];}
*/
}
- (IBAction)artsButton:(id)sender
{
    
    /*
    Source *artsSource = [[Source alloc] init];
    artsSource.name = @"The Arts";
    artsSource.twitterDef = @"The Heart in Motion";
    artsSource.comment = @"\rThe Arts express the existential situation of the human person.";
    artsSource.image = [UIImage imageNamed:@"appicon"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = artsSource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
     */
}

- (IBAction)mediaButton:(id)sender
{
    /*
    Source *mediaSource = [[Source alloc] init];
    mediaSource.name = @"Technology";
    mediaSource.twitterDef = @"Tools From and For Human Development";
    mediaSource.comment = @"\rSince it coincided with and enabled the evolution of homo sapiens, technology has always influenced and been an expression of human creativity.";
    mediaSource.image = [UIImage imageNamed:@"appicon"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = mediaSource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
     */
}

- (IBAction)politicsButton:(id)sender
{
    /*
    Source *politicsSource = [[Source alloc] init];
    politicsSource.name = @"Politics";
    politicsSource.twitterDef = @"The Affairs of the People";
    politicsSource.comment = @"\rThe regulation of human society is essential to its survival and development.";
    politicsSource.image = [UIImage imageNamed:@"appicon"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = politicsSource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
     */
}

- (IBAction)philosophyButton:(id)sender
{
    /*
    Source *philosophySource = [[Source alloc] init];
    philosophySource.name = @"Philosophy";
    philosophySource.twitterDef = @"The Love of Wisdom";
    philosophySource.comment = @"\rPhilosophy has an authentic independence from theology.";
    philosophySource.image = [UIImage imageNamed:@"appicon"];
    philosophySource.bigPic = [UIImage imageNamed:@"thinker"];
    

    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = philosophySource;

    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
     */
}

- (IBAction)theologicaButton:(id)sender
{
    
    
    //SourcesDetailViewController *aboutDetail = [[self storyboard]
                                                //instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    //[self.navigationController pushViewController:aboutDetail animated:YES];
    

    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"The Sources of Theology"  message:@"Theology draws on its Sources (Magisterium, Scripture, Fathers, Councils, Creeds, Liturgy) to interpret the Signs of the Times; cultural trends that affect the worldview of human beings in any given time." preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Amen" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    /*
    Source *theologicaSource = [[Source alloc] init];
    theologicaSource.name = @"Theology";
    theologicaSource.twitterDef = @"Faith Seeking Understanding";
    theologicaSource.image = [UIImage imageNamed:@"appicon"];
    theologicaSource.comment = @"\rTheology has been called faith seeking understanding and the intelligence of faith.";
    theologicaSource.bigPic = [UIImage imageNamed:@"defdetail-1"]; 
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Home"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = theologicaSource;

    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
     */
}

- (IBAction)aboutButton:(id)sender
{
    
        AboutViewController *aboutDetail = [[self storyboard]
                                       instantiateViewControllerWithIdentifier:@"AboutViewController"];
    
        [aboutDetail view];
    
        aboutDetail.textView.text =  @"\rThank you for purchasing Theologica; the simple, yet comprehensive, Catholic theological resource for the iPhone. Drawing from the rich treasures of the intellectual tradition of the Church, from the 1st to the 21st century, this is app is designed to be an essential study tool for both students and teachers of Theology as well as anyone who is called to “think faith”.\r\rThe app features 5 tabs: Home, Reference, Dictionary, Maps, and People.\r\rThe Home tab presents a wide-angle view of both the traditional Sources of Theology (Magisterium, Scripture, Fathers, Councils, Creeds, and Liturgy) and the Signs of the Times (Philosophy, Science, Technology, Politics, Economics, and the Arts).\r\rTheology is a dialectical enterprise that continuously seeks to better understand the Faith of the Church in a given historical situation. To fulfill that vocation, Theology draws on various Sources in order to faithfully interpret the Signs of the Times.\r\r The primary Sources are:\r\rThe Magisterium\rSacred Scripture\rThe Church Fathers\rEcumenical Councils\rCreeds\rThe Liturgy\r\rAll of these Sources, though distinct, are organically related to the life of the Church.\r\rTheology is always practiced in a particular historical and cultural context. Thus, cutlural trends and indicators of the worlview of modern men and women necessarily affect the way in which the Faith of the Church is understood. It is therefore vital for Theology to pay attention to these Signs in order to fulfill its vocation. These Signs include:\r\rPhilosophy\rScience\rTechnology\rPolitics\rEconomics\rThe Arts\r\rWhile not exhaustive, these aspects of life in the 21st century are areas which affect the thinking of people everwhere.\r\rThe Links tab features a table of live links for each category in the Home tab along with those to sites that feature Theology in action.\r\rThe Glossary tab includes over 500 of the most commonly used theologial terms in both high school and college classrooms, along with relevant links to the Conciliar Documents, the Catechism of the Catholic Church, the Compendium of the Social Doctrine of the Church, Papal Encyclicals, Pontifical Commission Documents, and other curated links available online.\r\rThe Maps tab includes custom pin annotations for the Old Testament, New Testament, Historical Sites, and Social Justice sites of interest.\r\rThe People tab features interviews with contemporary theologians who are actively engaged in making Theology relevant to the larger culture.\r\rTheologica started out as an idea for a simple dictionary app and slowly evolved (over 3 years) into what you have in your hands. It was inspired by the sequence and scope of instruction in the Department of Theology at Seton Hall Preparatory School in West Orange, NJ. Every aspect of the app has been thoughtfully considered/obsessed over in order to create a tool that enables its users to enhance their knowledge of Theology.\r\rSpecial thanks to Melissa Lace, Jim Schultz, and the Theology Faculty at Seton Hall Prepraratory School.\r\r";
    
    aboutDetail.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:aboutDetail animated:YES completion:nil];

     
    
     
     

}

- (IBAction)infoButton:(id)sender
{
    /*
    TwitterTableViewController *tweets = [[self storyboard]
                                          instantiateViewControllerWithIdentifier:@"TwitterTableViewController"];
    
    [tweets view];
    infoDetail.textView.text = @"\rThank you for purchasing Theologica; the simple, yet comprehensive, Catholic theological resource for the iPhone. Drawing from the rich treasures of the intellectual tradition of the Church, from the 1st to the 21st century, this is app is designed to be an essential study tool for both students and teachers of Theology as well as anyone who is called to “think faith”.\r\rFollow @theologica_ on Twitter\rhttps://twitter.com/theologica_\r\rFor questions, concerns, or comments please email techrament@icloud.com";
    
    
    tweets.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:tweets animated:YES completion:nil];
    */
    


    AboutViewController *infoDetail = [[self storyboard] instantiateViewControllerWithIdentifier: @"AboutViewController"];
    
    [infoDetail view];
    
     infoDetail.textView.text = @"\rThank you for purchasing Theologica; the simple, yet comprehensive, Catholic theological resource for the iPhone. Drawing from the rich treasures of the intellectual tradition of the Church, from the 1st to the 21st century, this is app is designed to be an essential study tool for both students and teachers of Theology as well as anyone who is called to “think faith”.\r\rFollow @theologica_ on Twitter\rhttps://twitter.com/theologica_\r\rFor questions, concerns, or comments please email techrament@icloud.com";
    infoDetail.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:infoDetail animated:YES completion:nil];
    
}


@end
