//
//  SourcesTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 12/29/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "SourcesViewController.h"
#import "SourcesDetailViewController.h"

@interface SourcesViewController ()

@end

@implementation SourcesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect rect = self.signView.frame;
    rect.origin = CGPointMake(self.sourceView.bounds.size.width, rect.origin.y);
    self.signView.frame = rect;
    
    self.scrollView.contentSize = CGSizeMake(self.signView.frame.origin.x + self.sourceView.bounds.size.width, self.scrollView.contentSize.height);
    
    self.scrollView.delegate = self;
    
    [self updateCurrentPageDisplay];

}


- (void)updateCurrentPageDisplay
{
    /*
    UIPageControl *pageControl = [UIPageControl new];
    
    if ((pageControl.currentPage == 0))
        {
            pageControl.
        }
     */
}

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

- (IBAction)scriptureButton:(id)sender
{
    
    Source *scriptureSource = [[Source alloc] init];
    scriptureSource.name = @"Sacred Scripture";
    scriptureSource.twitterDef = @"The Word of God in Human Language";
    scriptureSource.comment = @"Throughout the history of the Catholic tradition, the canon of Scripture has always played a central and dialectic role in the community life of the Church. The Hebrew Bible is the foundation of the Biblical tradition.\r\rThe Old Testament\r\rConsisting of the Hebrew canon plus seven additional books of the Apocrypha, the Old Testament contains the story of the people of Israel. It is divided into the Pentateuch, Historical Books, Prophets, and Wisdom Books.\r\rThe New Testament\r\rThe gospels of Matthew, Mark, Luke, and John narrate the life of Jesus through the perspective of faith in his divine sonship.";
    scriptureSource.image = [UIImage imageNamed:@"appicon"];
    scriptureSource.bigPic = [UIImage imageNamed:@"codex"]; 
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard]
            instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = scriptureSource;
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}

- (IBAction)fathersButton:(id)sender
{
    Source *fathersSource = [[Source alloc] init];
    fathersSource.name = @"Fathers of the Church";
    fathersSource.twitterDef = @"Stewards of the Faith";
    fathersSource.comment = @"The Fathers of the Church occupy a special place in the Catholic Tradition.";
    fathersSource.image = [UIImage imageNamed:@"appicon"];
    fathersSource.bigPic = [UIImage imageNamed:@"fathers"]; 
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = fathersSource;
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];}

- (IBAction)catechismButton:(id)sender
{
    Source *catechismSource = [[Source alloc] init];
    catechismSource.name = @"Magisterium";
    catechismSource.twitterDef = @"The Teaching Authority of the Church";
    catechismSource.comment = @"The Magisterium represents the teaching authority of the Church.";
    catechismSource.image = [UIImage imageNamed:@"appicon"];
    catechismSource.bigPic = [UIImage imageNamed:@"peter"]; 
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = catechismSource;

    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];

    
}

- (IBAction)liturgyButton:(id)sender
{
    Source *liturgySource = [[Source alloc] init];
    liturgySource.name = @"Liturgy";
    liturgySource.twitterDef = @"The Worship of the Church";
    liturgySource.comment = @"The liturgy of the Church expresses what it believes. Lex Orandi-Lex Credendi.";
    liturgySource.image = [UIImage imageNamed:@"appicon"];
    liturgySource.bigPic = [UIImage imageNamed:@"consecration-cross"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = liturgySource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
    
}

- (IBAction)councilsButton:(id)sender
{
    Source *councilsSource = [[Source alloc] init];
    councilsSource.name = @"Ecumenical Councils";
    councilsSource.twitterDef = @"";
    councilsSource.comment = @"Ecumenical Councils are called to settle matters of faith and practice.";
    councilsSource.image = [UIImage imageNamed:@"appicon"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = councilsSource;

    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}

- (IBAction)scienceButton:(id)sender
{
    Source *scienceSource = [[Source alloc] init];
    scienceSource.name = @"Science";
    scienceSource.twitterDef = @"Knowlege of the Physical World";
    scienceSource.comment = @"As a separate but related domain of knowledge, science is akin to theology in that it involves a specific methodology designed to answer a specific set of questions about human experience.";
    scienceSource.image = [UIImage imageNamed:@"appicon"];
    scienceSource.bigPic = [UIImage imageNamed:@"station"];

    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = scienceSource;
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];}

- (IBAction)artsButton:(id)sender
{
    Source *artsSource = [[Source alloc] init];
    artsSource.name = @"The Arts";
    artsSource.twitterDef = @"The Heart in Motion";
    artsSource.comment = @"The Arts express the existential situation of the human person.";
    artsSource.image = [UIImage imageNamed:@"appicon"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = artsSource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}

- (IBAction)mediaButton:(id)sender
{
    Source *mediaSource = [[Source alloc] init];
    mediaSource.name = @"Technology";
    mediaSource.twitterDef = @"Tools From and For Human Development";
    mediaSource.comment = @"Since it coincided with and enabled the evolution of homo sapiens, technology has always influenced and been an expression of human creativity.";
    mediaSource.image = [UIImage imageNamed:@"appicon"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = mediaSource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}

- (IBAction)politicsButton:(id)sender
{
    Source *politicsSource = [[Source alloc] init];
    politicsSource.name = @"Politics";
    politicsSource.twitterDef = @"The Affairs of the People";
    politicsSource.comment = @"The regulation of human society is essential to its survival and development.";
    politicsSource.image = [UIImage imageNamed:@"appicon"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = politicsSource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}

- (IBAction)philosophyButton:(id)sender
{
    Source *philosophySource = [[Source alloc] init];
    philosophySource.name = @"Environment";
    philosophySource.twitterDef = @"The Stewardship of Creation";
    philosophySource.comment = @"Philosophy has an authentic independence from theology.";
    philosophySource.image = [UIImage imageNamed:@"appicon"];
    philosophySource.bigPic = [UIImage imageNamed:@"thinker"];
    

    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = philosophySource;

    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}

- (IBAction)theologicaButton:(id)sender
{
    Source *theologicaSource = [[Source alloc] init];
    theologicaSource.name = @"Theology";
    theologicaSource.twitterDef = @"Faith Seeking Understanding";
    theologicaSource.image = [UIImage imageNamed:@"appicon"];
    theologicaSource.comment = @"Theology has been called faith seeking understanding and the intelligence of faith.";
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Overview"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = theologicaSource;

    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}

- (IBAction)aboutButton:(id)sender
{
    
        AboutViewController *aboutDetail = [[self storyboard]
                                       instantiateViewControllerWithIdentifier:@"AboutViewController"];
    
        [aboutDetail view];
    
        aboutDetail.textView.text =  @"Theologica is the curated, Catholic theology app for the iPhone. Drawing from over 100 years of teaching experience in the classroom, it is designed as a simple, yet comprehensive resource for both students and teachers of Theology. It features 5 tabs: Overview, Links, Glossary, Map, and Verbatim.\r\rThe Overview tab presents a wide-angle view of both the traditional Sources of Theology (Magisterium, Scripture, Fathers, Councils, Creeds, and Liturgy) and the Signs of the Times (Environment, Science, Technology, Politics, Economics, and the Arts).\r\rThe Links tab features a table of live links for each category in the Overview tab along with those to sites that feature Theology in action.\r\rThe Glossary tab includes over 500 of the most commonly used theologial terms in both high school and college classrooms, along with relevant links to the Conciliar Documents, the Catechism of the Catholic Church, the Compendium of the Social Doctrine of the Church, Papal Encyclicals, Pontifical Commission Documents, and other curated links available online.\r\rThe Map tab includes custom pin annotations for the Old Testament, New Testament, Historical Sites, and Social Justice sites of concern.\r\rThe Verbatim tab features interviews with contemporary theologians who are actively engaged in making Theology relevant to the larger culture. ";
    
    aboutDetail.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:aboutDetail animated:YES completion:nil];
    
    


    
    
    /*
    SourcesDetailViewController *aboutDetail = [[self storyboard]
                                          instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    [self.navigationController pushViewController:aboutDetail animated:YES];
     
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Start exploring Theologica"  message:@"Theology draws on its Sources (Magisterium, Scripture, Fathers, Councils, Creeds, Liturgy) to interpret the Signs of the Times; cultural trends that affect the worldview of human beings in any given time." preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Start" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
     
     */
     
     

}

- (IBAction)infoButton:(id)sender
{
    
    AboutViewController *infoDetail = [[self storyboard]
                                          instantiateViewControllerWithIdentifier:@"AboutViewController"];
    
    [infoDetail view];
    
    infoDetail.textView.text = @"Thank you for purchasing Theologica.\r\rThis app started out as an idea for a simple dictionary and slowly evolved (over 3 years) into what you hold in your hands. It was inspired by the sequence and scope of instruction in the Department of Theology at Seton Hall Preparatory School in West Orange, NJ. Every aspect of the app has been thoughtfully considered/obsessed over in order to create a tool for studying the various aspects of Theology.\r\rSpecial thanks to Melissa Lace, Jim Schultz, and the Theology Faculty at Seton Hall Prepraratory School.\r\rFor questions, concerns, or comments please email techrament@icloud.com";
    
    infoDetail.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:infoDetail animated:YES completion:nil];
    

    
}















@end
