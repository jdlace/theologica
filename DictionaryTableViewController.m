//
//  DictionaryTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "DictionaryTableViewController.h"
#import "WordDetailViewController.h"
#import "WordDataSource.h"
#import "Word.h"

#import "TADataStore.h"
#import "TAWord.h"

@interface DictionaryTableViewController () <UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) WordDataSource *wordDataSource;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSMutableArray *searchResults; //filtered search
@property (copy, nonatomic) NSString *category;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation DictionaryTableViewController

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
    
   /*
    // Create a mutable array to contain products for the search results table.
    self.searchResults = [NSMutableArray arrayWithCapacity:[self.systematicTerms count]];
    
    // The table view controller is in a nav controller, and so the containing nav controller is the 'search results controller'
    UINavigationController *searchResultsController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SystematicNavController"];
    
    
    */
    
    
    
    
    //Add a UISearchController with search bar (currently not in IB object library)
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.frame = CGRectMake(0.0, 0.0, 280.0, 40.0);
    self.tableView.tableHeaderView = _searchController.searchBar;
    //self.searchController.searchBar.
    
    self.searchController.dimsBackgroundDuringPresentation = YES;
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
    self.searchController.searchBar.tintColor = [UIColor whiteColor];
    self.searchController.searchBar.returnKeyType = UIReturnKeySearch;
    
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

//

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    // Return the number of sections.
//    return [self.wordDataSource numberOfSectionsInDataSourceCategory:self.category];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [self.wordDataSource numberOfRowsInSection:section forCategory:self.category];
//    
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"DictionaryCell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    
//    // Configure the cell...
//    Word *word = [self.wordDataSource wordForRowAtIndexPath:indexPath forCategory:self.category];
//    cell.textLabel.text = word.name;
//    cell.detailTextLabel.text = word.category;
//    
//    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
//    //need code for setting initial font on table view
//    
//    return cell;
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//
//    return [self.wordDataSource titleForHeaderInSection:section forCategory:self.category];
//}

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

//-(CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    static UILabel* label;
//    if (!label) {
//        label = [[UILabel alloc]
//                 initWithFrame:CGRectMake(0, 0, FLT_MAX, FLT_MAX)];
//        label.text = @"test";
//    }
//    
//    label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
//    [label sizeToFit];
//    return label.frame.size.height * 2.75;
//    //return 50;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // Navigation logic may go here. Create and push another view controller.
//    /*
//     DetailViewController *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
//     // ...
//     // Pass the selected object to the new view controller.
//     [self.navigationController pushViewController:detailViewController animated:YES];
//     */
//}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showWordDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TAWord *word = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
        WordDetailViewController *WordViewController = [segue destinationViewController];
        WordViewController.word = word;
    }
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return [self.wordDataSource sectionIndexTitlesForCategory:self.category];
//}
//
//- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
//{
//    return [self.wordDataSource sectionForSectionIndexTitle:title forCategory:self.category];
//}


- (IBAction)termsButton:(id)sender
{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Choose the category of Terms\rfor the Dictionary."
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* systematicAction = [UIAlertAction actionWithTitle:@"Systematic" style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action)
                                      {
                                        self.category = @"Systematic";
                                      [self.tableView reloadData];
                                      
                                      }];
    
    UIAlertAction* historicalAction = [UIAlertAction actionWithTitle:@"Historical" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                        self.category = @"Historical";
                                        [self.tableView reloadData];
                                   
                                   }];
    
    UIAlertAction* moralAction = [UIAlertAction actionWithTitle:@"Moral" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action)
                                     {
                                        self.category = @"Moral";
                                        [self.tableView reloadData];
                                     
                                     
                                     }];
    
    UIAlertAction *biblicalAction = [UIAlertAction actionWithTitle:@"Biblical" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action)
                                    {
                                        self.category = @"Biblical";
                                        [self.tableView reloadData];
                                    
                                    }];
    
    UIAlertAction *liturgicalAction = [UIAlertAction actionWithTitle:@"Liturgical" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action)
                                     {
                                     self.category = @"Liturgical";
                                     [self.tableView reloadData];
                                     
                                     }];
    
    UIAlertAction *culturalAction = [UIAlertAction actionWithTitle:@"Cultural" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action)
    
                                    {
                                        self.category = @"Cultural";
                                        [self.tableView reloadData];
                                    
                                    }];
    
    UIAlertAction *allAction = [UIAlertAction actionWithTitle:@"All" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action)
    
                                    {
                                    
                                        self.category = nil;
                                        [self.tableView reloadData]; 
                                    
                                    }];

    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive
                                                         handler:^(UIAlertAction * action)
                                   {
                                   [self dismissViewControllerAnimated:YES completion:nil];
                                   }];
    
    [alert addAction:systematicAction];
    [alert addAction:historicalAction];
    [alert addAction:moralAction];
    [alert addAction:biblicalAction];
    [alert addAction:liturgicalAction];
    [alert addAction:culturalAction];
    [alert addAction:allAction];
    [alert addAction:cancelAction]; 
    
    
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (IBAction)savedButton:(id)sender
{

}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DictionaryCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    TAWord *word = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = word.name;
    cell.detailTextLabel.text = word.category;
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}


#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Word" inManagedObjectContext:[TADataStore sharedStore].managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[TADataStore sharedStore].managedObjectContext sectionNameKeyPath:@"name" cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
#ifdef DEBUG
        abort();
#endif
    }
    
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        default:
            return;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
 // Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed.
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
 {
 // In the simplest, most efficient, case, reload the table view.
 [self.tableView reloadData];
 }
 */


@end
