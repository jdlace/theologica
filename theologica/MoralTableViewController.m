//
//  MoralTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "MoralTableViewController.h"
#import "MoralDetailViewController.h"
#import "MoralDetail.h"

@interface MoralTableViewController ()
{
    
    NSDictionary *terms;
    NSArray *letters;
}

@end

@implementation MoralTableViewController

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
              @"A" : @[@"accidence", @"adoption", @"agape", @"aggiornomento", @"agnostic", @"allegory", @"analogy"
                       , @"apologetics", @"apophatic", @"atonement"],
              @"B" : @[@"baptism", @"blasphemy"],
              @"C" : @[@"canon", @"creed"],
              @"D" : @[@"deism"],
              @"E" : @[@"epistemology", @"essence", @"ex nihilo"],
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

    
    _moralTerms = [[NSArray alloc] initWithObjects:@"abortion", @"abstinence", @"act", @"adultery", nil];
    
    MoralDetail *abortionMoralDetail = [[MoralDetail alloc] init];
    abortionMoralDetail.moralName = @"abortion";
    abortionMoralDetail.moralDescription = @"the intentional killing of an unborn human being";
    
    MoralDetail *abstinenceMoralDetail = [[MoralDetail alloc] init];
    abstinenceMoralDetail.moralName = @"abstinence";
    abstinenceMoralDetail.moralDescription = @"to refrain from a given activity";
    
    MoralDetail *actMoralDetail = [[MoralDetail alloc] init];
    actMoralDetail.moralName = @"act";
    actMoralDetail.moralDescription = @"In moral theology, an truly 'human' act refers to actions made with freedom and will.";
    
    MoralDetail *adulteryMoralDetail = [[MoralDetail alloc] init];
    adulteryMoralDetail.moralName = @"adultery";
    adulteryMoralDetail.moralDescription = @"Marital infidelity or sexual relations between two people, one of which being married to another person";
    
    _moralDetails = [[NSMutableArray alloc] init];
    [_moralDetails addObject: abortionMoralDetail];
    [_moralDetails addObject: abstinenceMoralDetail];
    [_moralDetails addObject: actMoralDetail];
    [_moralDetails addObject: adulteryMoralDetail];
    
    for (NSString *letter in letters)
        {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
            [array addObject: abortionMoralDetail];
            [array addObject: abstinenceMoralDetail];
            [array addObject: actMoralDetail];
            [array addObject: adulteryMoralDetail];
            }
        else if ([letter isEqualToString:@"B"])
            {
            //[array addObject: baptismSystematicDetail];
            //[array addObject: blasphemySystematicDetail];
            }
        
        [_moralDetails addObject:array];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return  [_moralDetails count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"moralCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = [_moralTerms objectAtIndex:indexPath.row];
    return cell;
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
    if ([[segue identifier] isEqualToString:@"showMoralDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        MoralDetailViewController *moralDetailViewController = [segue destinationViewController];
        moralDetailViewController.currentMoralDetail = [_moralDetails objectAtIndex:indexPath.row];
    }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return[NSArray arrayWithObjects:@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z", nil];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}

@end
