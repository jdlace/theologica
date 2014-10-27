//
//  BiblicalTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "BiblicalTableViewController.h"
#import "BiblicalDetailViewController.h"
#import "BiblicalDetail.h"

@interface BiblicalTableViewController ()
{
    NSDictionary *terms;
    NSArray *letters;
}

@end

@implementation BiblicalTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    terms = @{
              @"A" : @[@"Abba", @"Adonai", @"anthropomorphism", @"apocalypse", @"apocrypha", @"apodictic", @"apostle", @"aqeda", @"Aramaic", @"Asherah", @"Assyria"],
              @"B" : @[@"Ba'al", @"Babel", @"Babylon", @"Ban", @"Bible", @"Beth-El"],
              @"C" : @[@"canon", @"Charism", @"Christ", @"covenant"],
              @"D" : @[@"Decalogue", @"Deuteronomic Source", @"Deuteronomic History", @"Deuteronomy", @"Documentary Hypothesis"],
              @"E" : @[@"El", @"Elohim", @"Elohist Source"],
              @"F" : @[@"faith"],
              @"G" : @[@"gospel"],
              @"H" : @[@"heresy"],
              @"I" : @[@"immanence"],
              @"J" : @[@"justification"],
              @"K" : @[@"kataphatic"],
              @"L" : @[@"liberation theology"],
              @"M" : @[@"Messiah"],
              @"N" : @[@"natural theology"],
              @"O" : @[@"orthodoxy", @"orthodpraxy"],
              @"P" : @[@"philosophy", @"predestination"],
              @"Q" : @[@"quintessence"],
              @"R" : @[@"redemption"],
              @"S" : @[@"salvation", @"systematic theology"],
              @"T" : @[@"theodicy", @"theology", @"trinity"],
              @"U" : @[@"universalism"],
              @"V" : @[@"vicarious"],
              @"W" : @[@"will"],
              @"X" : @[@"xcode"],
              @"Y" : @[@"YHWH"],
              @"Z" : @[@"zion"],
              };
    
    letters = [[terms allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    

    
    
    //_biblicalTerms = [[NSArray alloc] initWithObjects:@"Aaron", @"Alexander the Great", @"Amos", @"anthropomorphism", @"Antiochus IV", @"apocalypse", @"apocrypha", @"apodictic", @"Apollos", @"apostle", @"aqeda", @"Aramaic", @"Artaxerxes", @"Asher", @"Asherah", @"Assyria", @"Ba'al", @"Ban", @"Bathsheba", @"Bible", @"Beth'El", @"canon", @"Deuteronomic Source", @"Elohist Source",nil];
    /*
    BiblicalDetail *aaronBiblicalDetail = [[BiblicalDetail alloc] init];
    aaronBiblicalDetail.biblicalName = @"Aaron";
    aaronBiblicalDetail.biblicalDescription = @"the brother of Moses and founder of the Israelite priesthood according to the Priestly (P) source. See 'Documentary Hypothesis'";
    
    BiblicalDetail *alexanderBiblicalDetail = [[BiblicalDetail alloc] init];
    alexanderBiblicalDetail.biblicalName = @"Alexander the Great";
    alexanderBiblicalDetail.biblicalDescription = @"Macedonian king (356-323 BCE) who spead Greek culture throughout the eastern Mediterranean world and requested a Greek translation of the Hebrew Bible. See 'Hellenization'";
    
    BiblicalDetail *amosBiblicalDetail = [[BiblicalDetail alloc] init];
    amosBiblicalDetail.biblicalName = @"Amos";
    amosBiblicalDetail.biblicalDescription = @"A prophet from the southern kingdom of Judah who spoke Divine oracles against the economic injustice of the northern kingdom of Israel in the 8th century BCE";
    */
    BiblicalDetail *abbaBiblicalDetail = [[BiblicalDetail alloc] init];
    abbaBiblicalDetail.biblicalName = @"Abba";
    abbaBiblicalDetail.biblicalDescription = @"Aramaic term for 'Daddy'; used by Jesus in prayer to God in the gospels.";
    
    BiblicalDetail *adonaiBiblicalDetail = [[BiblicalDetail alloc] init];
    adonaiBiblicalDetail.biblicalName = @"Adonai";
    adonaiBiblicalDetail.biblicalDescription =@"Hebrew word for 'Ruler'; used as a synonym for YHWH";
    
    BiblicalDetail *anthropomorphismBiblicalDetail = [[BiblicalDetail alloc] init];
    anthropomorphismBiblicalDetail.biblicalName = @"anthropomorphism";
    anthropomorphismBiblicalDetail.biblicalDescription = @"the attribution of human characteristics to a non-human object";
    /*
    BiblicalDetail *antiochusBiblicalDetail = [[BiblicalDetail alloc]init];
    antiochusBiblicalDetail.biblicalName = @"Antiochus IV";
    antiochusBiblicalDetail.biblicalDescription = @"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
    */
    
    BiblicalDetail *apocalypseBiblicalDetail = [[BiblicalDetail alloc] init];
    apocalypseBiblicalDetail.biblicalName = @"apocalypse";
    apocalypseBiblicalDetail.biblicalDescription = @"the Greek word for 'unveiling' something previously hidden, used by Paul to refer to his experience of the risen Jesus; also the name of the last book of the New Testament";
    
    BiblicalDetail *apocryphaBiblicalDetail = [[BiblicalDetail alloc] init];
    apocryphaBiblicalDetail.biblicalName = @"apocrypha";
    apocryphaBiblicalDetail.biblicalDescription = @"the Greek word for 'hidden'; it refers to the 7 books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom";
    
    BiblicalDetail *apodicticBiblicalDetail = [[BiblicalDetail alloc] init];
    apodicticBiblicalDetail.biblicalName = @"apodictic";
    apodicticBiblicalDetail.biblicalDescription = @"a type of law which is based on a moral norm or command";
    
    /*
    BiblicalDetail *apollosBiblicalDetail = [[BiblicalDetail alloc]  init];
    apollosBiblicalDetail.biblicalName = @"Apollos";
    apollosBiblicalDetail.biblicalDescription = @"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
    */
                       
    BiblicalDetail *apostleBiblicalDetail = [[BiblicalDetail alloc] init];
    apostleBiblicalDetail.biblicalName = @"apostle";
    apostleBiblicalDetail.biblicalDescription = @"from the Greek word for 'delegate'; used to refer to those whom Jesus commissioned to spread the good news of the Kingdom of God; also used by Paul to refer to anyone who had seen the risen Christ";
    
    BiblicalDetail *aqedaBiblicalDetail = [[BiblicalDetail alloc] init];
    aqedaBiblicalDetail.biblicalName = @"aqeda";
    aqedaBiblicalDetail.biblicalDescription = @"Hebrew term for 'binding'; used to refer to story of the binding and near-sacrifice of Isaac by Abraham";
    
    BiblicalDetail *aramaicBiblicalDetail = [[BiblicalDetail alloc] init];
    aramaicBiblicalDetail.biblicalName = @"Aramaic";
    aramaicBiblicalDetail.biblicalDescription = @"a variant of Hebrew, likely the native language of the historical Jesus";
    /*
    BiblicalDetail *artraxercesBiblicalDetail = [[BiblicalDetail alloc] init];
    artraxercesBiblicalDetail.biblicalName = @"Artaxerxes";
    artraxercesBiblicalDetail.biblicalDescription = @"Word meaning 'ruler' applied to the kings of Persia, specifically to Cyrus the Great";
    
    BiblicalDetail *asherBiblicalDetail = [[BiblicalDetail alloc] init];
    asherBiblicalDetail.biblicalName = @"Asher";
    asherBiblicalDetail.biblicalDescription = @"One of the twelve tribes of Israel";
    */
    
    BiblicalDetail *asherahBiblicalDetail = [[BiblicalDetail alloc] init];
    asherahBiblicalDetail.biblicalName = @"Asherah";
    asherahBiblicalDetail.biblicalDescription = @"In Canaanite mythology, the wife of El and the goddess of fertility";
    
    BiblicalDetail *assyriaBiblicalDetail = [[BiblicalDetail alloc] init];
    assyriaBiblicalDetail.biblicalName = @"Assyria";
    assyriaBiblicalDetail.biblicalDescription = @"One of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 BCE";
    
    BiblicalDetail *baalBiblicalDetail = [[BiblicalDetail alloc]  init];
    baalBiblicalDetail.biblicalName = @"Ba'al";
    baalBiblicalDetail.biblicalDescription = @"In Canannite mythology, the son of El and most active of the gods";
    
    BiblicalDetail *babelBiblicalDetail = [[BiblicalDetail alloc] init];
    babelBiblicalDetail.biblicalName = @"Babel";
    babelBiblicalDetail.biblicalDescription = @"Hebrew word for 'confusion'; named for Tower eitiology in Gen. 11.";
    
    BiblicalDetail *babylonBiblicalDetail = [[BiblicalDetail alloc] init];
    babylonBiblicalDetail.biblicalName = @"Babylon";
    babylonBiblicalDetail.biblicalDescription = @"Empire that conquered the southern kingdom of Judah in 587 BCE.";
    
    BiblicalDetail *banBiblicalDetail = [[BiblicalDetail alloc] init];
    banBiblicalDetail.biblicalName = @"Ban";
    banBiblicalDetail.biblicalDescription = @"The ancient Israelite practice of the wholesale destruction of a people and their environment";
    /*
    BiblicalDetail *bathshebaBiblicalDetail = [[BiblicalDetail alloc] init];
    bathshebaBiblicalDetail.biblicalName = @"Bathsheba";
    bathshebaBiblicalDetail.biblicalDescription = @"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
    */
    
    BiblicalDetail *bibleBiblicalDetail = [[BiblicalDetail alloc] init];
    bibleBiblicalDetail.biblicalName = @"Bible";
    bibleBiblicalDetail.biblicalDescription = @"The collection of the Old and New Testaments regarded as canonical and inspired within Catholicism";
    
    BiblicalDetail *bethelBiblicalDetail = [[BiblicalDetail alloc] init];
    bethelBiblicalDetail.biblicalName = @"Beth'El";
    bethelBiblicalDetail.biblicalDescription = @"Hebrew for 'House of El'; a sacred site within the patriarchal story cycles in Genesis";
    
    BiblicalDetail *canonBiblicalDetail = [[BiblicalDetail alloc] init];
    canonBiblicalDetail.biblicalName = @"canon";
    canonBiblicalDetail.biblicalDescription = @"Greek word for 'measuring stick'; used metaphorically to refer to a collection of texts regarded as authoritative for faith and practice within a community";
    
    BiblicalDetail *deuteronomicSourceBiblicalDetail = [[BiblicalDetail alloc] init];
    deuteronomicSourceBiblicalDetail.biblicalName = @"Deuteronomic Source";
    deuteronomicSourceBiblicalDetail.biblicalDescription = @"The 'D' source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See 'Documentary Hypothesis.'";
    
    BiblicalDetail *elohistSourceBiblicalDetail = [[BiblicalDetail alloc] init];
    elohistSourceBiblicalDetail.biblicalName = @"Elohist Source";
    elohistSourceBiblicalDetail.biblicalDescription = @"The 'E' source; comprising various texts throughout Genesis, Exodus, and Numbers; uses 'Elohim' as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.";
    
    
     _biblicalDetails = [[NSMutableArray alloc] init];
    /*
    [_biblicalDetails addObject: aaronBiblicalDetail];
    [_biblicalDetails addObject: alexanderBiblicalDetail]; 
    [_biblicalDetails addObject: amosBiblicalDetail];
    [_biblicalDetails addObject: anthropomorphismBiblicalDetail]; 
    [_biblicalDetails addObject: antiochusBiblicalDetail];
    [_biblicalDetails addObject: apocalypseBiblicalDetail];
    [_biblicalDetails addObject: apocryphaBiblicalDetail];
    [_biblicalDetails addObject: apodicticBiblicalDetail];
    [_biblicalDetails addObject: apollosBiblicalDetail];
    [_biblicalDetails addObject: apostleBiblicalDetail];
    [_biblicalDetails addObject: aqedaBiblicalDetail];
    [_biblicalDetails addObject: aramaicBiblicalDetail];
    [_biblicalDetails addObject: artraxercesBiblicalDetail];
    [_biblicalDetails addObject: asherBiblicalDetail];
    [_biblicalDetails addObject: asherahBiblicalDetail];
    [_biblicalDetails addObject: assyriaBiblicalDetail];
    [_biblicalDetails addObject: baalBiblicalDetail];
    [_biblicalDetails addObject: banBiblicalDetail];
    [_biblicalDetails addObject: bathshebaBiblicalDetail];
    [_biblicalDetails addObject: bibleBiblicalDetail];
    [_biblicalDetails addObject: bethelBiblicalDetail];
    [_biblicalDetails addObject: canonBiblicalDetail];
    [_biblicalDetails addObject: deuteronomicSourceBiblicalDetail];
    [_biblicalDetails addObject: elohistSourceBiblicalDetail];
     */
    
    for (NSString *letter in letters)
    {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
            [array addObject: abbaBiblicalDetail]; 
            [array addObject: adonaiBiblicalDetail];
            [array addObject: anthropomorphismBiblicalDetail];
            [array addObject: apocalypseBiblicalDetail];
            [array addObject: apocryphaBiblicalDetail];
            [array addObject: apodicticBiblicalDetail];
            [array addObject: apostleBiblicalDetail];
            [array addObject: aqedaBiblicalDetail];
            [array addObject: aramaicBiblicalDetail];
            [array addObject: asherahBiblicalDetail];
            [array addObject: assyriaBiblicalDetail];
            }
        else if ([letter isEqualToString:@"B"])
            {
            [array addObject: baalBiblicalDetail];
            [array addObject: babelBiblicalDetail];
            [array addObject: babylonBiblicalDetail];
            [array addObject: banBiblicalDetail];
            [array addObject: bibleBiblicalDetail];
            [array addObject: bethelBiblicalDetail];
            }
        else if ([letter isEqualToString:@"C"])
            {
                [array addObject:canonBiblicalDetail];
            }
        else if ([letter isEqualToString: @"D"])
            {
            [array addObject: deuteronomicSourceBiblicalDetail];
            }
        
        [_biblicalDetails addObject:array];
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
    //return [_biblicalDetails count];
    NSString *sectionTitle = [letters objectAtIndex:section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    return [sectionTerms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"biblicalCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [letters objectAtIndex:indexPath.section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    NSString *term = [sectionTerms objectAtIndex:indexPath.row];
    cell.textLabel.text = term;
    
    //cell.textLabel.text = [_biblicalTerms objectAtIndex:indexPath.row];
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
    if ([[segue identifier] isEqualToString:@"showBiblicalDetail"])
        {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *sectionArray = [_biblicalDetails objectAtIndex:indexPath.section];
        BiblicalDetail *detail = [sectionArray objectAtIndex:indexPath.row];
        
        BiblicalDetailViewController *biblicalDetailViewController = [segue destinationViewController];
        //systematicDetailViewController.currentSystematicDetail = [_systematicDetail objectAtIndex:indexPath.row];
        biblicalDetailViewController.currentBiblicalDetail = detail;
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
