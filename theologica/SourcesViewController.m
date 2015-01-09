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
/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}
*/

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"showSourceDetail" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([[segue identifier] isEqualToString:@"showSourceDetail"])
        {
        
        SourcesWebViewController *detailVC = [segue destinationViewController];
        detailVC.view = detailVC.webView;
        
        }
    // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.

 }
*/


- (IBAction)scriptureButton:(id)sender
{
    
    Source *scriptureSource = [[Source alloc] init];
    scriptureSource.name = @"Sacred Scripture";
    scriptureSource.twitterDef = @"The Word of God in Human Language";
    scriptureSource.comment = @"Throughout the history of the Catholic tradition, the canon of Scripture has always played a central and dialectic role in the community life of the Church. The Hebrew Bible is the foundation of the Biblical tradition.\r\rThe Old Testament\r\rConsisting of the Hebrew canon plus seven additional books of the Apocrypha, the Old Testament contains the story of the people of Israel. It is divided into the Pentateuch, Historical Books, Prophets, and Wisdom Books.\r\rThe New Testament\r\rThe gospels of Matthew, Mark, Luke, and John narrate the life of Jesus through the perspective of faith in his divine sonship.";
    scriptureSource.image = [UIImage imageNamed:@"biblelines"];
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
    fathersSource.image = [UIImage imageNamed:@"men"];
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
    catechismSource.image = [UIImage imageNamed:@"papal2"];
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
    liturgySource.image = [UIImage imageNamed:@"winelines"];
    liturgySource.bigPic = [UIImage imageNamed:@"orans"];
    
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
    councilsSource.image = [UIImage imageNamed:@"churchlines"];
    
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
    scienceSource.image = [UIImage imageNamed:@"atomlines"];
    scienceSource.bigPic = [UIImage imageNamed:@"station"];

    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
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
    artsSource.image = [UIImage imageNamed:@"headphonelines"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
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
    mediaSource.image = [UIImage imageNamed:@"radarlines"];
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
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
    politicsSource.image = [UIImage imageNamed:@"citylines"]; 
    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = politicsSource;

    
    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}

- (IBAction)philosophyButton:(id)sender
{
    Source *philosophySource = [[Source alloc] init];
    philosophySource.name = @"Philosophy";
    philosophySource.twitterDef = @"The Love of Wisdom"; 
    philosophySource.comment = @"Philosophy has an authentic independence from theology.";
    philosophySource.image = [UIImage imageNamed:@"lightlines"];
    philosophySource.bigPic = [UIImage imageNamed:@"thinker"];
    

    
    SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
    
    sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
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
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    sourcesDetailViewController.currentSourceDetail = theologicaSource;

    
    [self.navigationController pushViewController:sourcesDetailViewController animated:YES];
}
@end
