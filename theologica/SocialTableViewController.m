//
//  SocialTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "SocialTableViewController.h"
#import "SocialDetailViewController.h"
#import "Word.h"

@interface SocialTableViewController ()
{
    NSDictionary *terms;
    NSArray *letters;
}

@end

@implementation SocialTableViewController

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
              @"A" : @[@"action", @"analysis", @"awareness"],
              @"B" : @[@"baptism", @"blasphemy"],
              @"C" : @[@"Catholic Social Teaching", @"common good", @"commutative justice", @"contributive justice"],
              @"D" : @[@"development", @"dignity"],
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
    
    Word *action = [[Word alloc]init];
    action.name = @"action";
    action.definition = @"the third of three steps in achieving justice";
    
    
    Word *analysis = [[Word alloc] init];
    analysis.name = @"analysis";
    analysis.definition = @"the second of the 3 steps in achieving justice";
    
    Word *awareness = [[Word alloc] init];
    awareness.name = @"awareness";
    awareness.definition = @"the first of 3 steps in achieving justice";
    
    //B
    
    //C
    
    Word *catholicsocialteaching = [[Word alloc]init];
    catholicsocialteaching.name = @"Catholic Social Teaching";
    catholicsocialteaching.definition = @"the teaching of the Church which applies principles of social justice to the signs of the times";
    
    Word *commongood = [[Word alloc]init];
    commongood.name = @"common good";
    commongood.definition = @"the social condition in which all people are allowed to reach their full development";
    
    Word *commutativejustice = [[Word alloc]init];
    commutativejustice.name = @"commutative justice";
    commutativejustice.definition = @"one of the three types of justice which emphasizes obligations between individuals";
    
    Word *contributivejustice = [[Word alloc]init];
    contributivejustice.name = @"contributive justice";
    contributivejustice.definition = @"one of the three types of justice which emphasizes the obligation of individuals toward society";
    
    //D
    
    Word *development = [[Word alloc]init];
    development.name = @"development";
    development.definition = @"the process of becoming fully human";
    
    Word *dignity = [[Word alloc]init];
    dignity.name = @"dignity";
    dignity.definition = @"the sacred status of human beings because of the constant love of God";

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

    
    
    _socialDetails = [[NSMutableArray alloc]init];
    
    for (NSString *letter in letters)
    {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
                [array addObject: action];
                [array addObject: analysis];
                [array addObject: awareness];
            }
        else if ([letter isEqualToString:@"B"])
            {
                [array addObject: @""];
            }
        else if ([letter isEqualToString:@"C"])
            {
                [array addObject: catholicsocialteaching];
                [array addObject: commongood];
                [array addObject: commutativejustice];
                [array addObject: contributivejustice];
            }
        else if ([letter isEqualToString:@"D"])
            {
                [array addObject: development];
                [array addObject: dignity];
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
        else if ([letter isEqualToString:@"X"])
            {
            
            }
        else if ([letter isEqualToString:@"Y"])
            {
            
            }
        else if ([letter isEqualToString:@"Z"])
            {
            
            }

        [_socialDetails addObject:array];
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
    static NSString *CellIdentifier = @"socialCell";
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
        NSArray *sectionArray = [_socialDetails objectAtIndex:indexPath.section];
        Word *detail = [sectionArray objectAtIndex:indexPath.row];
        
        SocialDetailViewController *WordViewController = [segue destinationViewController];
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
