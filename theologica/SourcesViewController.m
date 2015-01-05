//
//  SourcesTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 12/29/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "SourcesViewController.h"
#import "WordDetailViewController.h"

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
    scriptureSource.twitterDef = @"The Old and New Testaments";
    scriptureSource.comment = @"Throughout the history of the Catholic tradition, the canon of Scripture has always played a central and dialectic role in the community life of the Church. The Hebrew Bible is the foundation of the Biblical tradition.\r\rThe Old Testament\r\rConsisting of the Hebrew canon plus seven additional books, the Old Testament contains the story of the people of Israel.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    detailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = scriptureSource.name;
    word.definition = scriptureSource.comment;
    word.twitterDef = scriptureSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (IBAction)fathersButton:(id)sender
{
    Source *fathersSource = [[Source alloc] init];
    fathersSource.name = @"Fathers of the Church";
    fathersSource.twitterDef = @"Early Christian Thinkers";
    fathersSource.comment = @"The Fathers of the Church occupy a special place in the Catholic Tradition.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = fathersSource.name;
    word.definition = fathersSource.comment;
    word.twitterDef = fathersSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (IBAction)catechismButton:(id)sender
{
    Source *catechismSource = [[Source alloc] init];
    catechismSource.name = @"Magisterium";
    catechismSource.twitterDef = @"The Teaching Authority of the Church";
    catechismSource.comment = @"The Magisterium represents the teaching authority of the Church.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = catechismSource.name;
    word.definition = catechismSource.comment;
    word.twitterDef = catechismSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

    
}

- (IBAction)liturgyButton:(id)sender
{
    Source *liturgySource = [[Source alloc] init];
    liturgySource.name = @"Liturgy";
    liturgySource.twitterDef = @"The Worship of the Church";
    liturgySource.comment = @"The liturgy of the Church expresses what it believes. Lex Orandi-Lex Credendi.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = liturgySource.name;
    word.definition = liturgySource.comment;
    word.twitterDef = liturgySource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

    
}

- (IBAction)councilsButton:(id)sender
{
    Source *councilsSource = [[Source alloc] init];
    councilsSource.name = @"Ecumenical Councils";
    councilsSource.twitterDef = @"Gatherings of Bishops";
    councilsSource.comment = @"Ecumenical Councils are called to settle matters of faith and practice.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = councilsSource.name;
    word.definition = councilsSource.comment;
    word.twitterDef = councilsSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

    
}

- (IBAction)scienceButton:(id)sender
{
    Source *scienceSource = [[Source alloc] init];
    scienceSource.name = @"Science";
    scienceSource.twitterDef = @"Knowlege of the Physical World";
    scienceSource.comment = @"As a separate but related domain of knowledge, science is akin to theology in that it involves a specific methodology designed to answer a specific set of questions about human experience.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = scienceSource.name;
    word.definition = scienceSource.comment;
    word.twitterDef = scienceSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

}

- (IBAction)artsButton:(id)sender
{
    Source *artsSource = [[Source alloc] init];
    artsSource.name = @"The Arts";
    artsSource.twitterDef = @"The Expression";
    artsSource.comment = @"The Arts express the existential situation of the human person.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = artsSource.name;
    word.definition = artsSource.comment;
    word.twitterDef = artsSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

}

- (IBAction)mediaButton:(id)sender
{
    Source *mediaSource = [[Source alloc] init];
    mediaSource.name = @"Technology";
    mediaSource.comment = @"Since it coincided with and enabled the evolution of homo sapiens, technology has always influenced and been an expression of human creativity.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = mediaSource.name;
    word.definition = mediaSource.comment;
    word.twitterDef = mediaSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

}

- (IBAction)politicsButton:(id)sender
{
    Source *politicsSource = [[Source alloc] init];
    politicsSource.name = @"Politics";
    politicsSource.comment = @"The regulation of human society is essential to its survival and development.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = politicsSource.name;
    word.definition = politicsSource.comment;
    word.twitterDef = politicsSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

}

- (IBAction)philosophyButton:(id)sender
{
    Source *philosophySource = [[Source alloc] init];
    philosophySource.name = @"Philosophy";
    philosophySource.twitterDef = @"The Love of Wisdom"; 
    philosophySource.comment = @"Philosophy has an authentic independence from theology.";
    philosophySource.image = [UIImage imageNamed:@"lightlines"]; 
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = philosophySource.name;
    word.definition = philosophySource.comment;
    word.twitterDef = philosophySource.twitterDef;
    
    detailViewController.currentWordDetail = word;

    
    [self.navigationController pushViewController:detailViewController animated:YES];

    
}

- (IBAction)theologicaButton:(id)sender
{
    Source *theologicaSource = [[Source alloc] init];
    theologicaSource.name = @"Theology";
    theologicaSource.comment = @"Theology has been called faith seeking understanding and the intelligence of faith.";
    
    WordDetailViewController *detailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WordDetailViewController"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                   style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    Word *word = [[Word alloc] init];
    word.name = theologicaSource.name;
    word.definition = theologicaSource.comment;
    word.twitterDef = theologicaSource.twitterDef;
    
    detailViewController.currentWordDetail = word;
    
    [self.navigationController pushViewController:detailViewController animated:YES];

}
@end
