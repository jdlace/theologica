//
//  LinksTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 1/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "LinksTableViewController.h"
#import "WebViewController.h"

@interface LinksTableViewController ()


@end

@implementation LinksTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.hierarchy = [[NSArray alloc] initWithObjects:@"Vatican", @"Council of Bishops", nil];
    self.scripture = [[NSArray alloc] initWithObjects: @"Bible", @"Pontifical Biblical Commission", nil];
    self.fathers = [[NSArray alloc] initWithObjects:@"Patristics Archive", nil];
    self.councils = [[NSArray alloc] initWithObjects:@"Vatican II", nil];
    self.creeds = [[NSArray alloc] initWithObjects:@"Nicene Creed", nil];
    self.liturgy = [[NSArray alloc] initWithObjects:@"Liturgy Sites", nil];
    self.science = [[NSArray alloc] initWithObjects:@"National Center for Science Education", nil];
    self.philosophy = [[NSArray alloc] initWithObjects:@"Philosophy Sites", nil];
    self.economics = [[NSArray alloc] initWithObjects:@"Economics", nil];
    self.ethics = [[NSArray alloc] initWithObjects:@"Catholic Moral Theology", nil];
                      
    
    
    
    /*
    self.hierarchy = [@[@"Vatican", @"U.S. Conference of Catholic Bishops"]mutableCopy];
    self.scripture = [@[@"Pontifical Biblical Commission", @"Oxford Biblical Studies"] mutableCopy];
    self.councils = [@[@"Church Councils"]mutableCopy];
    self.catechism = [@[@"Catechism of the Catholic Church"]mutableCopy];
    self.liturgy = [@[@"Worship Sites"] mutableCopy];
    self.history = [@[@"Church History sites"] mutableCopy];
    self.ethics = [@[@"Catholic Moral Theology"] mutableCopy];
    self.philosophy = [@[@"Stanford Encyclopedia of Philosophy", @"Internet Philosophy Archive"] mutableCopy];
    self.science = [@[@"National Academy of Sciences"]mutableCopy];
    self.arts = [@[@"Arts"]mutableCopy];
     */
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
    return 12;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*
    NSDictionary *linkDictionary = @{
        
                                        @"Magisterium" : @[self.hierarchy],
                                        @"Scripture"   : @[self.scripture],
                                        @"Fathers"     : @[self.fathers],
                                        @"Councils"    : @[self.councils],
                                        @"Creeds"      : @[self.creeds],
                                        @"Liturgy"     : @[self.liturgy],
                                        @"Science"     : @[self.science],
                                        @"Philosophy"  : @[self.philosophy],
                                        @"Economics"   : @[self.economics],
                                        @"Ethics"      : @[self.ethics],
                                    };
    
    return [linkDictionary count];
    */
    /*
    // Return the number of rows in the section.
    switch (section)
        {
            case 0:
            return self.hierarchy.count;
            break;
            
            case 1:
            return self.scripture.count;
            break;
            
            case 2:
            return self.councils.count;
            break;
            
            case 3:
            return self.catechism.count;
            break;
            
            case 4:
            return self.liturgy.count;
            break;
            
            case 5:
            return self.history.count;
            break;
            
            case 6:
            return self.ethics.count;
            break;
            
            case 7:
            return self.philosophy.count;
            
            case 8:
            return self.science.count;
            
            case 9:
            return self.arts.count;
            break;
        }
    
    return section; 
     */
    
    return [self.scripture count]; 
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Configure the cell
    static NSString *cellIdentifier = @"linksCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [self.scripture objectAtIndex:indexPath.row];
    return cell; 
   
    /*
    NSDictionary *linkDictionary = @{
                                     
                                     @"Magisterium" : @[self.hierarchy],
                                     @"Scripture"   : @[self.scripture],
                                     @"Fathers"     : @[self.fathers],
                                     @"Councils"    : @[self.councils],
                                     @"Creeds"      : @[self.creeds],
                                     @"Liturgy"     : @[self.liturgy],
                                     @"Science"     : @[self.science],
                                     @"Philosophy"  : @[self.philosophy],
                                     @"Economics"   : @[self.economics],
                                     @"Ethics"      : @[self.ethics],
                                     };
    
    NSArray *links = [linkDictionary allKeys];
    cell = links[indexPath.row];
    return cell; 
     */
    
    /*
    NSString *entry;
    
    if (indexPath.section == 0)
        {
        entry = self.hierarchy[indexPath.row];
        }
    else if (indexPath.section == 1)
        {
        entry = self.scripture[indexPath.row];
        }
    else if (indexPath.section == 2)
        {
        entry = self.councils[indexPath.row];
        }
    else if (indexPath.section == 3)
        {
        entry = self.catechism[indexPath.row];
        }
    
    cell.textLabel.text = entry;
    
    return cell;
     
     */
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSString *headerTitle;
    
    if (section == 0)
        {
        return @"Hierarchy";
        }
    else if (section == 1)
        {
        return @"Scripture";
        }
    
    else if (section == 2)
        {
        return @"Councils";
        }
    else if (section == 3)
        {
        return @"Catechism";
        }
    
    return headerTitle;
}



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

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
        WebViewController *webViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"WebViewController"]; 
    
    [self.navigationController pushViewController:webViewController animated:YES];
    
        
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"linksDetail"])
        {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WebViewController *webViewController = [segue destinationViewController];
        webViewController.webView = [self.scripture objectAtIndex:indexPath.row]; 
        }
}


@end
