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

    _socialTerms = [[NSArray alloc] initWithObjects: @"action", @"analysis", @"awareness", @"Catholic Social Teaching", @"common good", @"commutative justice", @"contributive justice", @"development", @"dignity", nil];
    
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
    [_socialDetails addObject:actionSocialDetail];
    [_socialDetails addObject:analysisSocialDetail];
    [_socialDetails addObject:awarenessSocialDetail];
    [_socialDetails addObject:catholicsocialteachingSocialDetail];
    [_socialDetails addObject:commongoodSocialDetail];
    [_socialDetails addObject:commutativejusticeSocialDetail];
    [_socialDetails addObject:contributivejusticeSocialDetail]; 
    [_socialDetails addObject:developmentSocialDetail];
    [_socialDetails addObject:dignitySocialDetail]; 
    

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
    return [_socialDetails count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"socialCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_socialTerms objectAtIndex:indexPath.row];
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
    if ([[segue identifier] isEqualToString:@"showSocialDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SocialDetailViewController *socialDetailViewController = [segue destinationViewController];
        socialDetailViewController.currentSocialDetail = [_socialDetails objectAtIndex:indexPath.row];
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
