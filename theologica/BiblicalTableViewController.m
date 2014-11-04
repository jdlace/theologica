//
//  BiblicalTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "BiblicalTableViewController.h"
#import "BiblicalDetailViewController.h"
#import "Word.h"

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
    Word *aaronWord = [[Word alloc] init];
    aaronWord.name = @"Aaron";
    aaronWord.definition = @"the brother of Moses and founder of the Israelite priesthood according to the Priestly (P) source. See 'Documentary Hypothesis'";
    
    Word *alexanderWord = [[Word alloc] init];
    alexanderWord.name = @"Alexander the Great";
    alexanderWord.definition = @"Macedonian king (356-323 BCE) who spead Greek culture throughout the eastern Mediterranean world and requested a Greek translation of the Hebrew Bible. See 'Hellenization'";
    
    Word *amosWord = [[Word alloc] init];
    amosWord.name = @"Amos";
    amosWord.definition = @"A prophet from the southern kingdom of Judah who spoke Divine oracles against the economic injustice of the northern kingdom of Israel in the 8th century BCE";
    */
    Word *abba = [[Word alloc] init];
    abba.name = @"Abba";
    abba.definition = @"Aramaic term for 'Daddy'; used by Jesus in prayer to God in the gospels.";
    
    Word *adonai = [[Word alloc] init];
    adonai.name = @"Adonai";
    adonai.definition =@"Hebrew word for 'Ruler'; used as a synonym for YHWH";
    
    Word *anthropomorphism = [[Word alloc] init];
    anthropomorphism.name = @"anthropomorphism";
    anthropomorphism.definition = @"the attribution of human characteristics to a non-human object";
    /*
    Word *antiochusWord = [[Word alloc]init];
    antiochusWord.name = @"Antiochus IV";
    antiochusWord.definition = @"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
    */
    
    Word *apocalypse = [[Word alloc] init];
    apocalypse.name = @"apocalypse";
    apocalypse.definition = @"the Greek word for 'unveiling' something previously hidden, used by Paul to refer to his experience of the risen Jesus; also the name of the last book of the New Testament";
    
    Word *apocrypha = [[Word alloc] init];
    apocrypha.name = @"apocrypha";
    apocrypha.definition = @"the Greek word for 'hidden'; it refers to the 7 books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom";
    
    Word *apodictic = [[Word alloc] init];
    apodictic.name = @"apodictic";
    apodictic.definition = @"a type of law which is based on a moral norm or command";
    
    /*
    Word *apollosWord = [[Word alloc]  init];
    apollosWord.name = @"Apollos";
    apollosWord.definition = @"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
    */
                       
    Word *apostle = [[Word alloc] init];
    apostle.name = @"apostle";
    apostle.definition = @"from the Greek word for 'delegate'; used to refer to those whom Jesus commissioned to spread the good news of the Kingdom of God; also used by Paul to refer to anyone who had seen the risen Christ";
    
    Word *aqeda = [[Word alloc] init];
    aqeda.name = @"aqeda";
    aqeda.definition = @"Hebrew term for 'binding'; used to refer to story of the binding and near-sacrifice of Isaac by Abraham";
    
    Word *aramaic = [[Word alloc] init];
    aramaic.name = @"Aramaic";
    aramaic.definition = @"a variant of Hebrew, likely the native language of the historical Jesus";
    /*
    Word *artraxercesWord = [[Word alloc] init];
    artraxercesWord.name = @"Artaxerxes";
    artraxercesWord.definition = @"Word meaning 'ruler' applied to the kings of Persia, specifically to Cyrus the Great";
    
    Word *asherWord = [[Word alloc] init];
    asherWord.name = @"Asher";
    asherWord.definition = @"One of the twelve tribes of Israel";
    */
    
    Word *asherah = [[Word alloc] init];
    asherah.name = @"Asherah";
    asherah.definition = @"In Canaanite mythology, the wife of El and the goddess of fertility";
    
    Word *assyria = [[Word alloc] init];
    assyria.name = @"Assyria";
    assyria.definition = @"One of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 BCE";
    
    Word *baal = [[Word alloc]  init];
    baal.name = @"Ba'al";
    baal.definition = @"In Canannite mythology, the son of El and most active of the gods";
    
    Word *babel = [[Word alloc] init];
    babel.name = @"Babel";
    babel.definition = @"Hebrew word for 'confusion'; named for Tower eitiology in Gen. 11.";
    
    Word *babylon = [[Word alloc] init];
    babylon.name = @"Babylon";
    babylon.definition = @"Empire that conquered the southern kingdom of Judah in 587 BCE.";
    
    Word *ban = [[Word alloc] init];
    ban.name = @"Ban";
    ban.definition = @"The ancient Israelite practice of the wholesale destruction of a people and their environment";
    /*
    Word *bathshebaWord = [[Word alloc] init];
    bathshebaWord.name = @"Bathsheba";
    bathshebaWord.definition = @"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
    */
    
    Word *bible = [[Word alloc] init];
    bible.name = @"Bible";
    bible.definition = @"The collection of the Old and New Testaments regarded as canonical and inspired within Catholicism";
    
    Word *bethel = [[Word alloc] init];
    bethel.name = @"Beth'El";
    bethel.definition = @"Hebrew for 'House of El'; a sacred site within the patriarchal story cycles in Genesis";
    
    Word *canon = [[Word alloc] init];
    canon.name = @"canon";
    canon.definition = @"Greek word for 'measuring stick'; used metaphorically to refer to a collection of texts regarded as authoritative for faith and practice within a community";
    
    Word *deuteronomicSource = [[Word alloc] init];
    deuteronomicSource.name = @"Deuteronomic Source";
    deuteronomicSource.definition = @"The 'D' source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See 'Documentary Hypothesis.'";
    
    Word *elohistSource = [[Word alloc] init];
    elohistSource.name = @"Elohist Source";
    elohistSource.definition = @"The 'E' source; comprising various texts throughout Genesis, Exodus, and Numbers; uses 'Elohim' as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.";
    
    
     _biblicalDetails = [[NSMutableArray alloc] init];
    /*
    [_Words addObject: aaronWord];
    [_Words addObject: alexanderWord]; 
    [_Words addObject: amosWord];
    [_Words addObject: anthropomorphismWord]; 
    [_Words addObject: antiochusWord];
    [_Words addObject: apocalypseWord];
    [_Words addObject: apocryphaWord];
    [_Words addObject: apodicticWord];
    [_Words addObject: apollosWord];
    [_Words addObject: apostleWord];
    [_Words addObject: aqedaWord];
    [_Words addObject: aramaicWord];
    [_Words addObject: artraxercesWord];
    [_Words addObject: asherWord];
    [_Words addObject: asherahWord];
    [_Words addObject: assyriaWord];
    [_Words addObject: baalWord];
    [_Words addObject: banWord];
    [_Words addObject: bathshebaWord];
    [_Words addObject: bibleWord];
    [_Words addObject: bethelWord];
    [_Words addObject: canonWord];
    [_Words addObject: deuteronomicSourceWord];
    [_Words addObject: elohistSourceWord];
     */
    
    for (NSString *letter in letters)
    {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
            [array addObject: abba];
            [array addObject: adonai];
            [array addObject: anthropomorphism];
            [array addObject: apocalypse];
            [array addObject: apocrypha];
            [array addObject: apodictic];
            [array addObject: apostle];
            [array addObject: aqeda];
            [array addObject: aramaic];
            [array addObject: asherah];
            [array addObject: assyria];
            }
        else if ([letter isEqualToString:@"B"])
            {
            [array addObject: baal];
            [array addObject: babel];
            [array addObject: babylon];
            [array addObject: ban];
            [array addObject: bible];
            [array addObject: bethel];
            }
        else if ([letter isEqualToString:@"C"])
            {
                [array addObject:canon];
            }
        else if ([letter isEqualToString: @"D"])
            {
            [array addObject: deuteronomicSource];
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
    //return [_Words count];
    NSString *sectionTitle = [letters objectAtIndex:section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    return [sectionTerms count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"biblicalCell";
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
        NSArray *sectionArray = [_biblicalDetails objectAtIndex:indexPath.section];
        Word *detail = [sectionArray objectAtIndex:indexPath.row];
        
        BiblicalDetailViewController *WordViewController = [segue destinationViewController];
        //systematicDetailViewController.currentSystematicDetail = [_systematicDetail objectAtIndex:indexPath.row];
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
