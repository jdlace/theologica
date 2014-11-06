//
//  MoralTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "MoralTableViewController.h"
#import "MoralDetailViewController.h"
#import "Word.h"

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
              @"A" : @[@"abortion", @"abstinence", @"act", @"adultery"],
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
    
    //A
    
    Word *abortion = [[Word alloc] init];
    abortion.name = @"abortion";
    abortion.definition = @"the intentional killing of an unborn human being";
    
    Word *abstinence = [[Word alloc] init];
    abstinence.name = @"abstinence";
    abstinence.definition = @"to refrain from a given activity";
    
    Word *act = [[Word alloc] init];
    act.name = @"act";
    act.definition = @"In moral theology, an truly 'human' act refers to actions made with freedom and will.";
    
    Word *adultery = [[Word alloc] init];
    adultery.name = @"adultery";
    adultery.definition = @"Marital infidelity or sexual relations between two people, one of which being married to another person";
    
    //B
    
    //C
    
    //D
    
    //E
    
    //F
    
    //G
    
    //H
    
    //I
    
    //J
    
    //K
    
    //L
    
    //M
    
    //N
    
    //O
    
    //P
    
    //Q
    
    //R
    
    //S
    
    //T
    
    //U
    
    //V
    
    //W
    
    //X
    
    //Y
    
    //Z
    
    
    
    
    _moralDetails = [[NSMutableArray alloc] init];
    
    for (NSString *letter in letters)
        {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
                [array addObject: abortion];
                [array addObject: abstinence];
                [array addObject: act];
                [array addObject: adultery];
            }
        else if ([letter isEqualToString:@"B"])
            {
            
            }
        else if ([letter isEqualToString:@"C"])
            {
            
            }
        else if ([letter isEqualToString:@"D"])
            {
            
            }
        else if ([letter isEqualToString:@"D"])
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
        else if ([letter isEqualToString:@"X"])
            {
            
            }
        else if ([letter isEqualToString:@"Y"])
            {
            
            }
        else if ([letter isEqualToString:@"Z"])
            {
            
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
    return [letters count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [letters objectAtIndex:section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    return [sectionTerms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"moralCell";
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
        NSArray *sectionArray = [_moralDetails objectAtIndex:indexPath.section];
        MoralDetailViewController *WordViewController = [segue destinationViewController];
        Word *detail = [sectionArray objectAtIndex:indexPath.row];
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
