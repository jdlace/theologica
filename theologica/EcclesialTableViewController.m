//
//  EcclesialTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "EcclesialTableViewController.h"
#import "EcclesialDetailViewController.h"
#import "EcclesialDetail.h"

@interface EcclesialTableViewController ()

@end

@implementation EcclesialTableViewController

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
    
    _ecclesialTerms = [[NSArray alloc] initWithObjects:@"absolution", @"acolyte", @"altar", @"antiphon", nil];
    
    EcclesialDetail *absolutionEcclesialDetail = [[EcclesialDetail alloc] init];
    absolutionEcclesialDetail.ecclesialName = @"absolution";
    absolutionEcclesialDetail.ecclesialDescription = @"the act by which a priest declares the forgiveness of sins"; 
    
    EcclesialDetail *acolyteEcclesialDetail = [[EcclesialDetail alloc] init];
    acolyteEcclesialDetail.ecclesialName = @"acolyte";
    acolyteEcclesialDetail.ecclesialDescription = @"an assistant to a deacon";
    
    EcclesialDetail *altarEcclesialDetail = [[EcclesialDetail alloc] init];
    altarEcclesialDetail.ecclesialName = @"altar";
    altarEcclesialDetail.ecclesialDescription = @"the object upon which the Eucharist is placed during the act of consecration";
    
    EcclesialDetail *antiphonEcclesialDetail = [[EcclesialDetail alloc] init];
    antiphonEcclesialDetail.ecclesialName = @"antiphon";
    antiphonEcclesialDetail.ecclesialDescription = @"the choral response sung during the entrace processional";
    
    _ecclesialDetails = [[NSMutableArray alloc] init];
    [_ecclesialDetails addObject: absolutionEcclesialDetail]; 
    [_ecclesialDetails addObject: acolyteEcclesialDetail];
    [_ecclesialDetails addObject: altarEcclesialDetail];
    [_ecclesialDetails addObject: antiphonEcclesialDetail];
    

    

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
    return [_ecclesialDetails count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ecclesialCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_ecclesialTerms objectAtIndex:indexPath.row];
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
    if ([[segue identifier] isEqualToString:@"showEcclesialDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EcclesialDetailViewController *ecclesialDetailViewController = [segue destinationViewController];
        ecclesialDetailViewController.currentEcclesialDetail = [_ecclesialDetails objectAtIndex:indexPath.row];
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
