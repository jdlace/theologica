//
//  SystematicTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "SystematicTableViewController.h"
#import "WordDetailViewController.h"
#import "WordDataSource.h"
#import "Word.h"

@interface SystematicTableViewController ()

@property (nonatomic, readonly) NSString *category;
@property (nonatomic, strong) WordDataSource *wordDataSource;
@property (nonatomic, strong) NSArray *searchResults;


@end

@implementation SystematicTableViewController

- (NSString *)category
{
    return @"systematic";
}

//Getter method for wordDataSource object

- (WordDataSource *)wordDataSource
{
    if (!_wordDataSource)
    {
        _wordDataSource = [[WordDataSource alloc] init];
    }
    
    return _wordDataSource;
}

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
    
    //implemented as part of Dynamic Type
        
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
    
    self.searchResults = [[NSArray alloc] init];
}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//search methods from https://www.youtube.com/watch?v=TijuWkbxP1o


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    
    _searchResults = [_systematicTerms filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

//

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.wordDataSource numberOfSectionsInDataSourceCategory:self.category];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return [self.wordDataSource numberOfRowsInSection:section forCategory:self.category];
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
        {
            return [self.searchResults count];
        }
    else
        {
        return [self.wordDataSource numberOfRowsInSection:section forCategory:self.category];;
        }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"systematicCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //Word *word = [self.wordDataSource wordForRowAtIndexPath:indexPath forCategory:self.category];
    //cell.textLabel.text = word.name;
    
    //cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    //need code for setting initial font on table view
   
    //from https://www.youtube.com/watch?v=TijuWkbxP1o
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
        {
        cell.textLabel.text = [self.searchResults objectAtIndex:indexPath.row];
        }
    else
        {
        Word *word = [self.wordDataSource wordForRowAtIndexPath:indexPath forCategory:self.category];
        cell.textLabel.text = word.name;
        
        cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        }
    
    //
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return [self.wordDataSource titleForHeaderInSection:section forCategory:self.category];
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
    
    static UILabel* label;
    if (!label) {
        label = [[UILabel alloc]
                 initWithFrame:CGRectMake(0, 0, FLT_MAX, FLT_MAX)];
        label.text = @"test";
    }
    
    label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [label sizeToFit];
    return label.frame.size.height * 2.75;
    //return 50;
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
    if ([[segue identifier] isEqualToString:@"showWordDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Word *word = [self.wordDataSource wordForRowAtIndexPath:indexPath forCategory:self.category];
    
        WordDetailViewController *WordViewController = [segue destinationViewController];
        WordViewController.currentWordDetail = word;
    }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.wordDataSource sectionIndexTitlesForCategory:self.category];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self.wordDataSource sectionForSectionIndexTitle:title forCategory:self.category];
}

- (IBAction)info:(UIBarButtonItem *)sender
{
    
}

- (IBAction)infoButton:(UIBarButtonItem *)sender
{
    
}
@end
