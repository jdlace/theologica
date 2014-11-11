//
//  MoralTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "MoralTableViewController.h"
#import "MoralDetailViewController.h"
#import "Word.h"

@interface MoralTableViewController ()
{
    
    NSDictionary *terms;
    NSArray *letters;
}

@end

@implementation MoralTableViewController

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
    
    terms = @{
              @"A" : @[@"abortion", @"abstinence", @"action", @"adultery"],
              @"B" : @[@""],
              @"C" : @[@"casuistry", @"common good", @"conscience"],
              @"D" : @[@"deontology", @"divine command theory"],
              @"E" : @[@"epistemology", @"ethics"],
              @"F" : @[@"faith"],
              @"G" : @[@"gospel"],
              @"H" : @[@"human rights"],
              @"I" : @[@"immanence"],
              @"J" : @[@"justice", @"jus ad bellum", @"jus im bello", @"just war"],
              @"K" : @[@"kataphatic"],
              @"L" : @[@"liberation theology"],
              @"M" : @[@"morality"],
              @"N" : @[@"natural law"],
              @"O" : @[@"omission"],
              @"P" : @[@"pacifism", @"preferential option"],
              @"Q" : @[@"quintessence"],
              @"R" : @[@"redemption"],
              @"S" : @[@"scholasticism", @"structural sin"],
              @"T" : @[@"teleology"],
              @"U" : @[@"utilitarianism"],
              @"V" : @[@"vice", @"virtue"],
              @"W" : @[@"will"],
              @"X" : @[@""],
              @"Y" : @[@"YHWH"],
              @"Z" : @[@""],
              };
    
    letters = [[terms allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    //A
    
    Word *abortion = [[Word alloc] init];
    abortion.name = @"abortion";
    abortion.definition = @"the intentional killing of an unborn human being";
    
    Word *abstinence = [[Word alloc] init];
    abstinence.name = @"abstinence";
    abstinence.definition = @"to refrain from a given activity";
    
    Word *act = [[Word alloc] init];
    act.name = @"act";
    act.definition = @"In moral theology, an truly 'human' act refers to actions made with freedom and will.";
    
    Word *adultery = [[Word alloc] init];
    adultery.name = @"adultery";
    adultery.definition = @"Marital infidelity or sexual relations between two people, one of which being married to another person";
    
    //B
    
    //C
    
    Word *casuistry = [[Word alloc] init];
    casuistry.name = @"casuistry";
    casuistry.definition = @"the study of case law";
    
    //D
    
    Word *deontology = [[Word alloc] init];
    deontology.name = @"deontology";
    deontology.definition = @"from the Greek word for 'duty' (deon) - the study of ethics from the framework of moral duties in the form of rules and laws.";
    
    //E
    
    Word *epistemology = [[Word alloc] init];
    epistemology.name = @"epistemology";
    epistemology.definition = @"the study of the origin, nature, and limits of human knowledge; one of the three traditional subjects of Western philosophy.";
    
    Word *ethics = [[Word alloc] init];
    ethics.name = @"ethics";
    ethics.definition = @"the study of moral systems";
    
    //F
    
    //G
    
    //H
    
    Word *humanRights = [[Word alloc] init];
    humanRights.name = @"human rights";
    humanRights.definition = @"rights due to a person by virtue of his or her being a human being; thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights.";
    
    //I
    
    //J
    
    Word *justice = [[Word alloc] init];
    justice.name = @"justice";
    justice.definition = @"the state of right relationships between individuals and groups in society.";
    
    Word *jusAdBellum = [[Word alloc] init];
    jusAdBellum.name = @"jus ad bellum";
    jusAdBellum.definition = @"Latin for 'justice to war' - a set of criteria used to determine if war is justified in a given situation: just cause, comparative justice, competent authority, right intention, probability of success, last resort, proportionality; see 'Just War Theory'.";
    
    Word *jusImBello = [[Word alloc] init];
    jusImBello.name = @"jus im bello";
    jusImBello.definition = @"Latin for 'justice in war' - a set of criteria used to determine if the methods of war are justified: distinction, proportionality, military necessity; see 'Just War Theory'";
    
    Word *justWar = [[Word alloc] init];
    justWar.name = @"Just War Theory";
    justWar.definition = @"The theory first developed by Augustine and later refined by Aquinas which consists of criteria for determining the justice of both the conditions and methods of war; see jus ad bellum and jus im bello.";
    
    //K
    
    //L
    
    //M
    
    Word *morality = [[Word alloc] init];
    morality.name = @"morality";
    morality.definition = @"customary norms of behavior considered good or evil, right or wrong in a given system.";
    
    //N
    
    //O
    
    //P
    
    //Q
    
    //R
    
    //S
    
    //T
    
    //U
    
    //V
    
    //W
    
    //X
    
    //Y
    
    //Z
    
    _moralDetails = [[NSMutableArray alloc] init];
    
    for (NSString *letter in letters)
    {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
                [array addObject: abortion];
                [array addObject: abstinence];
                [array addObject: act];
                [array addObject: adultery];
            }
        else if ([letter isEqualToString:@"B"])
            {
            
            }
        else if ([letter isEqualToString:@"C"])
            {
                [array addObject: casuistry];
            }
        else if ([letter isEqualToString:@"D"])
            {
                [array addObject: deontology];
            }
        else if ([letter isEqualToString:@"E"])
            {
                [array addObject: epistemology];
                [array addObject: ethics];
            }
        else if ([letter isEqualToString:@"F"])
            {
            
            }
        else if ([letter isEqualToString:@"G"])
            {
            
            }
        else if ([letter isEqualToString:@"H"])
            {
                [array addObject: humanRights];
            }
        else if ([letter isEqualToString:@"I"])
            {
            
            }
        else if ([letter isEqualToString:@"J"])
            {
                [array addObject: justice];
                [array addObject: jusAdBellum];
                [array addObject: jusImBello];
                [array addObject: justWar];
            }
        else if ([letter isEqualToString:@"K"])
            {
            
            }
        else if ([letter isEqualToString:@"L"])
            {
            
            }
        else if ([letter isEqualToString:@"M"])
            {
                [array addObject: morality];
            }
        else if ([letter isEqualToString:@"N"])
            {
            
            }
        else if ([letter isEqualToString:@"O"])
            {
            
            }
        else if ([letter isEqualToString:@"P"])
            {
            
            }
        else if ([letter isEqualToString:@"Q"])
            {
            
            }
        else if ([letter isEqualToString:@"R"])
            {
            
            }
        else if ([letter isEqualToString:@"S"])
            {
            
            }
        else if ([letter isEqualToString:@"T"])
            {
            
            }
        else if ([letter isEqualToString:@"U"])
            {
            
            }
        else if ([letter isEqualToString:@"V"])
            {
            
            }
        else if ([letter isEqualToString:@"W"])
            {
            
            }
        else if ([letter isEqualToString:@"X"])
            {
            
            }
        else if ([letter isEqualToString:@"Y"])
            {
            
            }
        else if ([letter isEqualToString:@"Z"])
            {
            
            }
        
        [_moralDetails addObject:array];
        
    }
    
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
    return [letters count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *sectionTitle = [letters objectAtIndex:section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    return [sectionTerms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"moralCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *sectionTitle = [letters objectAtIndex:indexPath.section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    NSString *term = [sectionTerms objectAtIndex:indexPath.row];
    cell.textLabel.text = term;

    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return [letters objectAtIndex:section];
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

    if ([[segue identifier] isEqualToString:@"showWord"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *sectionArray = [_moralDetails objectAtIndex:indexPath.section];
        MoralDetailViewController *WordViewController = [segue destinationViewController];
        Word *detail = [sectionArray objectAtIndex:indexPath.row];
        WordViewController.currentWordDetail = detail;
        }
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return letters;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [letters indexOfObject:title];
}

@end
