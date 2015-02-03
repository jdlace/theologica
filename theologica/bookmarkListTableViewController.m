//
//  bookmarkListTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 11/11/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "bookmarkListTableViewController.h"
#import "WordDetailViewController.h"

@interface bookmarkListTableViewController ()

@end

@implementation bookmarkListTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self readFromPlist];
    
    
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


-(NSString *) filePath
{
    NSArray *pathToPlist = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *pathDirectory = [pathToPlist objectAtIndex:0];
    
    return [pathDirectory stringByAppendingPathComponent:@"Bookmarks.plist"];
}


-(void)readFromPlist
{

    NSString *pathToFile = [self filePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:pathToFile])
        {
            NSMutableDictionary *myPlistDict = [[NSMutableDictionary alloc]initWithContentsOfFile:pathToFile];
        
            self.termDict = myPlistDict;
        }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.termsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [_termsArray objectAtIndex:section];
    NSArray *term = [_termDict objectForKey:key];
    return [term count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *key = [self.termsArray objectAtIndex:indexPath.section];
    NSArray  *terms = [self.termDict objectForKey:key];
    
    static NSString *cellIdentifier = @"bookmarkCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    NSDictionary *dict = terms[indexPath.row];
    
    cell.textLabel.text = dict[@"Term"];
    return cell;

}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
        {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
        {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }   
}

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
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

 
 
}


- (IBAction)done:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)edit:(id)sender
{
    
}











@end
