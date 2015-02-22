//
//  DictionaryTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "DictionaryTableViewController.h"
#import "WordDetailViewController.h"

#import "TADataStore.h"
#import "TAWord.h"

@interface DictionaryTableViewController () <NSFetchedResultsControllerDelegate/*,UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate*/>

@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSMutableArray *searchResults; //filtered search
@property (copy, nonatomic) NSString *category;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation DictionaryTableViewController

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
    
//    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//    self.searchController.searchResultsUpdater = self;
//    self.searchController.searchBar.frame = CGRectMake(0.0, 0.0, 280.0, 40.0);
//    self.tableView.tableHeaderView = _searchController.searchBar;
//    //self.searchController.searchBar.
//    
//    self.searchController.dimsBackgroundDuringPresentation = YES;
//    self.searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
//    self.searchController.searchBar.tintColor = [UIColor whiteColor];
//    self.searchController.searchBar.returnKeyType = UIReturnKeySearch;
    
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

#pragma mark - Table view delegate

-(CGFloat) tableView: (UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static UILabel* label;
    if (!label) {
        label = [[UILabel alloc]
                initWithFrame:CGRectMake(0, 0, FLT_MAX, FLT_MAX)];
        label.text = @"test";
    }
   
    label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [label sizeToFit];
    return label.frame.size.height * 3.00;
    return 60;
}

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


- (IBAction)termsButton:(id)sender
{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Choose the category of Terms\rfor the Dictionary."
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* systematicAction = [UIAlertAction actionWithTitle:@"Systematic" style:UIAlertActionStyleDefault
                                                            handler:^(UIAlertAction * action)
                                      {
                                    self.category = @"Systematic";
                                      self.fetchedResultsController = nil;
                                      [self.tableView reloadData];
                                      
                                      }];
    
    UIAlertAction* historicalAction = [UIAlertAction actionWithTitle:@"Historical" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action)
                                   {
                                        self.category = @"Historical";
                                   self.fetchedResultsController = nil;

                                        [self.tableView reloadData];
                                   
                                   }];
    
    UIAlertAction* moralAction = [UIAlertAction actionWithTitle:@"Moral" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction * action)
                                     {
                                        self.category = @"Moral";
                                     self.fetchedResultsController = nil;

                                        [self.tableView reloadData];
                                     
                                     
                                     }];
    
    UIAlertAction *biblicalAction = [UIAlertAction actionWithTitle:@"Biblical" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action)
                                    {
                                        self.category = @"Biblical";
                                    self.fetchedResultsController = nil;

                                        [self.tableView reloadData];
                                    
                                    }];
    
    UIAlertAction *liturgicalAction = [UIAlertAction actionWithTitle:@"Liturgical" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action)
                                     {
                                     self.category = @"Liturgical";
                                     self.fetchedResultsController = nil;

                                     [self.tableView reloadData];
                                     
                                     }];
    
    UIAlertAction *culturalAction = [UIAlertAction actionWithTitle:@"Cultural" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action)
    
                                    {
                                        self.category = @"Cultural";
                                    self.fetchedResultsController = nil;

                                        [self.tableView reloadData];
                                    
                                    }];
    
    UIAlertAction *allAction = [UIAlertAction actionWithTitle:@"All" style:UIAlertActionStyleDefault
                                                           handler:^(UIAlertAction *action)
    
                                    {
                                    
                                        self.category = nil;
                                        self.fetchedResultsController = nil;

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
    //cell.detailTextLabel.text = word.category;
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    //cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.fetchedResultsController sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:section];
    TAWord *word = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return [[word.name substringWithRange:NSMakeRange(0, 1)] uppercaseString]; 
}


#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TAWord" inManagedObjectContext:[TADataStore sharedStore].managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    if (self.category)
        {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category MATCHES %@", self.category];
        
            [fetchRequest setPredicate:predicate];
        }

    
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[TADataStore sharedStore].managedObjectContext sectionNameKeyPath:@"firstLetter" cacheName:nil];
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
