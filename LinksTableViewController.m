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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Links" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.links = dict;
    
    NSArray *array = @[@"Magisterium", @"Scripture", @"Fathers", @"Councils", @"Creeds", @"Liturgy", @"Theology", @"Philosophy", @"Science", @"Technology", @"Politics", @"Economy", @"Arts"];
    self.linkKeys = array;
    

    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.linkKeys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [_linkKeys objectAtIndex:section];
    NSArray *link = [_links objectForKey:key];
    return [link count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    //Configure the cell
    NSString *key = [_linkKeys objectAtIndex:indexPath.section];
    NSArray *link = [_links objectForKey:key];
    
    static NSString *cellIdentifier = @"linksCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary *dict = link[indexPath.row];
    
    cell.textLabel.text = dict[@"Name"];
    cell.detailTextLabel.text = dict[@"URL"]; 
    cell.textLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cell.textLabel.numberOfLines = 4;
    
    /*
    UIFont* font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    
    UIColor* textColor = [UIColor blackColor]; //colorWithRed:0.175f green:0.458f blue:0.831f alpha:1.0f];
    NSDictionary *attrs = @{ NSForegroundColorAttributeName : textColor,
                             NSFontAttributeName : font,
                             NSTextEffectAttributeName : NSTextEffectLetterpressStyle};
    
    NSAttributedString* attrString = [[NSAttributedString alloc]
                                      initWithString:cell.textLabel.text
                                      attributes:attrs];
    
    cell.textLabel.attributedText = attrString;
     */
    return cell;
   

}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    NSString *key = [_linkKeys objectAtIndex:section];
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
/*



*/
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
        //webViewController.urlString = [self.linkKeys objectAtIndex:indexPath.row];
        
        NSString *key = [_linkKeys objectAtIndex:indexPath.section];
        NSArray *link = [_links objectForKey:key];
        
        NSDictionary *dict = link[indexPath.row];
        webViewController.urlString = dict[@"URL"];
        
        NSLog(@"dict is %@", dict); 
                
        
        }
}


@end
