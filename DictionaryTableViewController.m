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

@interface DictionaryTableViewController () <UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate>

@property (nonatomic, strong) WordDataSource *wordDataSource;
@property (strong, nonatomic) UISearchController *searchController;
@property (strong, nonatomic) NSMutableArray *searchResults; //filtered search
@property (copy, nonatomic) NSString *category;


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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.wordDataSource numberOfSectionsInDataSourceCategory:self.category];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.wordDataSource numberOfRowsInSection:section forCategory:self.category];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DictionaryCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Word *word = [self.wordDataSource wordForRowAtIndexPath:indexPath forCategory:self.category];
    cell.textLabel.text = word.name;
    cell.detailTextLabel.text = word.category;
    
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    //need code for setting initial font on table view
    
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
     DetailViewController *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
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


- (IBAction)typeButton:(id)sender
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
@end
