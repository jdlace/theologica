//
//  ExplorationsTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 6/23/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "ExplorationsTableViewController.h"
#import "VerbatimViewController.h"
#import "WebViewController.h"

@interface ExplorationsTableViewController ()

@end

@implementation ExplorationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"Explorations" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.explorations = dict;
    
    NSArray *array = @[@"Lectures", @"Interviews"];
    self.explorationKeys = array;
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Explorations" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(preferredContentSizeChanged:)
     name:UIContentSizeCategoryDidChangeNotification
     object:nil];

    
}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.explorationKeys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSString *key = [_explorationKeys objectAtIndex:section];
    NSArray *exploration = [_explorations objectForKey:key];
    return [exploration count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = [_explorationKeys objectAtIndex:indexPath.section];
    NSArray *exploration = [_explorations objectForKey:key];
    
    static NSString *cellIdentifier = @"explorationsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary *dict = exploration[indexPath.row];
    
    cell.textLabel.text = dict[@"Name"];
    cell.detailTextLabel.text = dict[@"URL"];
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cell.textLabel.numberOfLines = 4;
    
    return cell;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSString *key = [_explorationKeys objectAtIndex:section];
    return key;
}

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
    
    //return 60;
}

/*
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WebViewController *webViewController = [[WebViewController alloc] init];
    
    NSString *key = [_explorationKeys objectAtIndex:indexPath.section];
    NSArray *explorations = [_explorations objectForKey:key];
    
    NSDictionary *dict = explorations[indexPath.row];
    webViewController.urlString = dict[@"URL"];
    
    [self.navigationController pushViewController:webViewController animated:YES];
}
*/
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"explorationsDetail"])
        {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WebViewController *webViewController = [segue destinationViewController];
        //webViewController.urlString = [self.linkKeys objectAtIndex:indexPath.row];
        
        NSString *key = [_explorationKeys objectAtIndex:indexPath.section];
        NSArray *explorations = [_explorations objectForKey:key];
        
        NSDictionary *dict = explorations[indexPath.row];
        webViewController.urlString = dict[@"URL"];
                
        NSLog(@"dict is %@", dict);
        }
}

//////orientation/////////

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
