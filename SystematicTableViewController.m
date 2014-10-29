//
//  SystematicTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "SystematicTableViewController.h"
#import "SystematicDetailViewController.h"
#import "Word.h"

@interface SystematicTableViewController ()
{
    NSDictionary *terms;
    NSArray *letters;
}

@end

@implementation SystematicTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /* Original Code
    letters = [NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
    terms = _systematicTerms;
    */
    
    
    terms = @{
              @"A" : @[@"accidence", @"adoption", @"agape", @"aggiornomento", @"agnostic", @"allegory", @"analogy"
                       , @"apologetics", @"apophatic", @"atonement"],
              @"B" : @[@"baptism", @"blasphemy"],
              @"C" : @[@"canon", @"creed"],
              @"D" : @[@"deism"],
              @"E" : @[@"epistemology", @"eschatology", @"essence", @"ex nihilo"],
              @"F" : @[@"faith"],
              @"G" : @[@"gospel"],
              @"H" : @[@"heresy"],
              @"I" : @[@"immanence"],
              @"J" : @[@"jesus"],
              @"K" : @[@"kataphatic"],
              @"L" : @[@"liberation theology"],
              @"M" : @[@"metaphysics"],
              @"N" : @[@"natural theology"],
              @"O" : @[@"orthodoxy", @"orthodpraxy"],
              @"P" : @[@"philosophy", @"predestination"],
              @"Q" : @[@"quintessence"],
              @"R" : @[@"redemption"],
              @"S" : @[@"salvation", @"systematic theology"],
              @"T" : @[@"theodicy", @"theology", @"trinity"],
              @"U" : @[@"universalism"],
              @"V" : @[@"vicarious"],
              @"W" : @[@"will"],
              @"X" : @[@"xcode"],
              @"Y" : @[@"YHWH"],
              @"Z" : @[@"zion"],
             };
                                                                                                                        
    letters = [[terms allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    /*
    //Added by Derek Lee Bronston
    //PATH TO LOCAL FILE THAT STORES CONTACTS
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"Contacts.plist"];
    NSLog(@"%@",finalPath);
    
    //AUTOMATICALLY PARSE FILE INTO CONTACTS ARRAY -- LOOK AT THE Conatcts.plist file
    contacts = [NSArray arrayWithContentsOfFile:finalPath];
    NSLog(@"%@",contacts);
    
    */
    //need to reexamine the data model.
    
    
    
    
    
    //_systematicTerms = [[NSArray alloc] initWithObjects:@"accident", @"adoption", @"agape", @"aggiornomento", @"agnostic", @"allegory", @"analogy", @"apologetics", @"apophatic", @"criteria", nil];
    
    Word *accidenceWord = [[Word alloc] init];
    accidenceWord.name = @"accidence";
    accidenceWord.definition = @"In Aristotelean philosophy, a nonessential property or quality of a substance.";
    
    Word *adoptionWord = [[Word alloc] init];
    adoptionWord.name = @"adoption";
    adoptionWord.definition = @"the process of becoming a child of God through Jesus Christ";
    
    Word *agapeWord = [[Word alloc] init];
    agapeWord.name = @"agape";
    agapeWord.definition = @"The Greek word meaning 'universal and unconditional will for the good of another'. The gospel writers use this word to describe Jesus' teaching on love for God, neighbors and enemies.";
    
    Word *aggiornomentoWord= [[Word alloc] init];
    aggiornomentoWord.name = @"aggiornomento";
    aggiornomentoWord.definition = @"An Italian word meaning 'to bring up to date' which became popular during the Second Vatican Council (1962-1965).";
    
    Word *agnosticWord = [[Word alloc] init];
    agnosticWord.name = @"agnostic";
    agnosticWord.definition = @"From the Greek word for 'not knowing', a term used to describe uncertainty about the question of God's existence.";
    
    Word *allegoryWord = [[Word alloc] init];
    allegoryWord.name = @"allegory";
    allegoryWord.definition = @"From the Greek word for 'speaking by way of something else', a reference to an interpretation of a text that goes beyond the literal meaning to find a deeper connection to a higher order of reality";
    
    Word *analogyWord = [[Word alloc] init];
    analogyWord.name = @"analogy";
    analogyWord.definition = @"a way of probing eternal truths...";
    
    Word *apologeticsWord = [[Word alloc] init];
    apologeticsWord.name = @"apologetics";
    apologeticsWord.definition = @"the rational defense of the Christian faith.";
    
    Word *apophaticWord = [[Word alloc] init];
    apophaticWord.name = @"apophatic";
    apophaticWord.definition = @"language which claims what God is not or a negation.";
    
    Word *atonementWord = [[Word alloc] init];
    atonementWord.name = @"atonement";
    atonementWord.definition = @"the act of making restitution for inflicted harm";
    
    Word *baptismWord = [[Word alloc] init];
    baptismWord.name = @"baptism";
    baptismWord.definition = @"a ritual washing used for initiation into the Christian community";
    
    Word *blasphemyWord = [[Word alloc] init];
    blasphemyWord.name = @"blasphemy";
    blasphemyWord.definition = @"a form of religious slander";
    

    
    _systematicDetails = [[NSMutableArray alloc] init];
    /*
    [_Words addObject: accidenceWord];
    [_Words addObject: adoptionWord];
    [_Words addObject: agapeWord];
    [_Words addObject: agiornomentoWord];
    [_Words addObject: agnosticWord];
    [_Words addObject: allegoryWord];
    [_Words addObject: analogyWord];
    [_Words addObject: apologeticsWord]; 
    [_Words addObject: apophaticWord];
    [_Words addObject: baptismWord]; 

 */
    //@boxenjim's solution
    for (NSString *letter in letters)
    {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
        {
            [array addObject: accidenceWord];
            [array addObject: adoptionWord];
            [array addObject: agapeWord];
            [array addObject: aggiornomentoWord];
            [array addObject: agnosticWord];
            [array addObject: allegoryWord];
            [array addObject: analogyWord];
            [array addObject: apologeticsWord];
            [array addObject: apophaticWord];
            [array addObject: atonementWord];
        }
        else if ([letter isEqualToString:@"B"])
        {
            [array addObject: baptismWord];
            [array addObject: blasphemyWord]; 
        }
        else if ([letter isEqualToString:@"C"])
        {
        
        }
        else if ([letter isEqualToString:@"D"])
        {
            
        }
        else if ([letter isEqualToString:@"E"])
            {
            
            }
        else if ([letter isEqualToString:@"F"])
            {
            
            }
        else if ([letter isEqualToString:@"G"])
            {
            
            }
        else if ([letter isEqualToString:@"H"])
            {
            
            }
        else if ([letter isEqualToString:@"I"])
            {
            
            }
        else if ([letter isEqualToString:@"J"])
            {
            
            }
        else if ([letter isEqualToString:@"K"])
            {
            
            }
        else if ([letter isEqualToString:@"L"])
            {
            
            }
        else if ([letter isEqualToString:@"M"])
            {
            
            }
        else if ([letter isEqualToString:@"N"])
            {
            
            }
        else if ([letter isEqualToString:@"O"])
            {
            
            }
        else if ([letter isEqualToString:@"P"])
            {
            
            }
        else if ([letter isEqualToString:@"Q"])
            {
            
            }
        else if ([letter isEqualToString:@"R"])
            {
            
            }
        else if ([letter isEqualToString:@"S"])
            {
            
            }
        else if ([letter isEqualToString:@"T"])
            {
            
            }
        else if ([letter isEqualToString:@"U"])
            {
            
            }
        else if ([letter isEqualToString:@"V"])
            {
            
            }
        else if ([letter isEqualToString:@"W"])
            {
            
            }
        else if ([letter isEqualToString:@"Y"])
            {
            
            }
        else if ([letter isEqualToString:@"Z"])
            {
            
            }
             [_systematicDetails addObject:array];
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
    //Original Code
    //return 26;
    return [letters count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Original Code
    // Return the number of rows in the section.
    //return [_Words count];
    NSString *sectionTitle = [letters objectAtIndex:section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    return [sectionTerms count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"systematicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [letters objectAtIndex:indexPath.section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    NSString *term = [sectionTerms objectAtIndex:indexPath.row];
    cell.textLabel.text = term;
    
    //Original Code
    //cell.textLabel.text = [_systematicTerms objectAtIndex:indexPath.row];
    
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
        NSArray *sectionArray = [_systematicDetails objectAtIndex:indexPath.section];
        Word *detail = [sectionArray objectAtIndex:indexPath.row];
    
        SystematicDetailViewController *WordViewController = [segue destinationViewController];
        //WordViewController.currentWord = [_Word objectAtIndex:indexPath.row];
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
