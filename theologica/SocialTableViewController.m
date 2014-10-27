//
//  SocialTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "SocialTableViewController.h"
#import "SocialDetailViewController.h"
#import "SocialDetail.h"

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
    

    
    
    
   // _socialTerms = [[NSArray alloc] initWithObjects: @"action", @"analysis", @"awareness", @"Catholic Social Teaching", @"common good", @"commutative justice", @"contributive justice", @"development", @"dignity", nil];
    
    SocialDetail *actionSocialDetail = [[SocialDetail alloc]init];
    actionSocialDetail.socialName = @"action";
    actionSocialDetail.socialDescription = @"the third of three steps in achieving justice";
    
    
    SocialDetail *analysisSocialDetail = [[SocialDetail alloc] init];
    analysisSocialDetail.socialName = @"analysis";
    analysisSocialDetail.socialDescription = @"the second of the 3 steps in achieving justice";
    
    SocialDetail *awarenessSocialDetail = [[SocialDetail alloc] init];
    awarenessSocialDetail.socialName = @"awareness";
    awarenessSocialDetail.socialDescription = @"the first of 3 steps in achieving justice";
    
    SocialDetail *catholicsocialteachingSocialDetail = [[SocialDetail alloc]init];
    catholicsocialteachingSocialDetail.socialName = @"Catholic Social Teaching";
    catholicsocialteachingSocialDetail.socialDescription = @"the teaching of the Church which applies principles of social justice to the signs of the times";
    
    SocialDetail *commongoodSocialDetail = [[SocialDetail alloc]init];
    commongoodSocialDetail.socialName = @"common good";
    commongoodSocialDetail.socialDescription = @"the social condition in which all people are allowed to reach their full development";
    
    SocialDetail *commutativejusticeSocialDetail = [[SocialDetail alloc]init];
    commutativejusticeSocialDetail.socialName = @"commutative justice";
    commutativejusticeSocialDetail.socialDescription = @"one of the three types of justice which emphasizes obligations between individuals";
    
    SocialDetail *contributivejusticeSocialDetail = [[SocialDetail alloc]init];
    contributivejusticeSocialDetail.socialName = @"contributive justice";
    contributivejusticeSocialDetail.socialDescription = @"one of the three types of justice which emphasizes the obligation of individuals toward society";
    
    SocialDetail *developmentSocialDetail = [[SocialDetail alloc]init];
    developmentSocialDetail.socialName = @"development";
    developmentSocialDetail.socialDescription = @"the process of becoming fully human";
    
    SocialDetail *dignitySocialDetail = [[SocialDetail alloc]init];
    dignitySocialDetail.socialName = @"dignity";
    dignitySocialDetail.socialDescription = @"the sacred status of human beings because of the constant love of God";
    
    _socialDetails = [[NSMutableArray alloc]init];
    /*
    [_socialDetails addObject:actionSocialDetail];
    [_socialDetails addObject:analysisSocialDetail];
    [_socialDetails addObject:awarenessSocialDetail];
    [_socialDetails addObject:catholicsocialteachingSocialDetail];
    [_socialDetails addObject:commongoodSocialDetail];
    [_socialDetails addObject:commutativejusticeSocialDetail];
    [_socialDetails addObject:contributivejusticeSocialDetail]; 
    [_socialDetails addObject:developmentSocialDetail];
    [_socialDetails addObject:dignitySocialDetail]; 
    */
    
    for (NSString *letter in letters)
    {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
            [array addObject: actionSocialDetail];
            [array addObject: analysisSocialDetail];
            [array addObject: awarenessSocialDetail];
            }
        else if ([letter isEqualToString:@"B"])
            {
            [array addObject: @""];
            }
        else if ([letter isEqualToString:@"C"])
            {
            [array addObject: catholicsocialteachingSocialDetail];
            [array addObject: commongoodSocialDetail];
            [array addObject: commutativejusticeSocialDetail];
            [array addObject: contributivejusticeSocialDetail];
            }
        else if ([letter isEqualToString:@"D"])
            {
            [array addObject: developmentSocialDetail];
            [array addObject: dignitySocialDetail];
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
    //return [_socialDetails count];
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
    
    // Configure the cell...
    //cell.textLabel.text = [_socialTerms objectAtIndex:indexPath.row];
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
    if ([[segue identifier] isEqualToString:@"showSocialDetail"])
        {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *sectionArray = [_socialDetails objectAtIndex:indexPath.section];
        SocialDetail *detail = [sectionArray objectAtIndex:indexPath.row];
        
        SocialDetailViewController *socialDetailViewController = [segue destinationViewController];
        //systematicDetailViewController.currentSystematicDetail = [_systematicDetail objectAtIndex:indexPath.row];
        socialDetailViewController.currentSocialDetail = detail;
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
