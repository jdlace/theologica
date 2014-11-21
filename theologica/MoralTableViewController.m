//
//  MoralTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//
#import "MoralTableViewController.h"
#import "MoralDetailViewController.h"
#import "WordDataSource.h"
#import "Word.h"

@interface MoralTableViewController ()

@property (nonatomic, readonly) NSString *category;
@property (nonatomic, strong) WordDataSource *wordDataSource;

@end

@implementation MoralTableViewController

- (NSString *)category
{
    return @"moral";
}

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
    
    
    //change nav bar attributes
    /*
     NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
     [UIColor blackColor],NSForegroundColorAttributeName,
     [UIColor blackColor],NSBackgroundColorAttributeName,nil];
     self.navigationController.navigationBar.titleTextAttributes = textAttributes;
     */
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];
    
    [UIFont fontWithName:@"HelveticaNeueLight"size:20.0];
    
    
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
    static NSString *CellIdentifier = @"moralCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    Word *word = [self.wordDataSource wordForRowAtIndexPath:indexPath forCategory:self.category];
    cell.textLabel.text = word.name;
    
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    //need code for setting initial font on table view
    
    //Original Code
    //cell.textLabel.text = [_systematicTerms objectAtIndex:indexPath.row];
    
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
    if ([[segue identifier] isEqualToString:@"showWord"])
        {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Word *word = [self.wordDataSource wordForRowAtIndexPath:indexPath forCategory:self.category];
        
        MoralDetailViewController *WordViewController = [segue destinationViewController];
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

@end
