//
//  SystematicTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "SystematicTableViewController.h"
#import "SystematicDetailViewController.h"
#import "Word.h"

@interface SystematicTableViewController ()
{
    NSDictionary *terms;
    NSArray *letters;
}

@end

@implementation SystematicTableViewController

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
    
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor blackColor],NSForegroundColorAttributeName,
                                    [UIColor blackColor],NSBackgroundColorAttributeName,nil];
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    

    terms = @{
              @"A" : @[@"accidence", @"adoption", @"aesthetics", @"agape", @"aggiornomento", @"agnostic", @"allegory", @"analogy"
                       , @"apologetics", @"apophatic", @"a priori", @"a posteriori", @"argument", @"atonement"],
              @"B" : @[@"baptism", @"blasphemy"],
              @"C" : @[@"canon", @"Christ", @"compatiblism", @"Cosmological Argument", @"creationism", @"creed"],
              @"D" : @[@"deductive argument", @"deism", @"determinism", @"Development of Doctrine", @"dualism"],
              @"E" : @[@"epistemology", @"eschatology", @"essence", @"exclusivism", @"evolution", @"ex nihilo", @"explanans", @"explanandum"],
              @"F" : @[@"faith", @"fideism", @"foreknowledge", @"free-will"],
              @"G" : @[@"gospel", @"grace"],
              @"H" : @[@"heaven", @"hell", @"henotheism", @"heresy"],
              @"I" : @[@"idolatry", @"immanence", @"inclusivism", @"inductive argument"],
              @"J" : @[@"Jesus of Nazareth"],//50
              @"K" : @[@"kataphatic", @"kenosis"],
              @"L" : @[@"Law of Non-Contradiction", @"Liberation Theology", @"logic"],
              @"M" : @[@"metaphysics", @"miracle", @"monotheism", @"mystery"],
              @"N" : @[@"natural theology", @"numinous"],
              @"O" : @[@"objective", @"omnibenevolence", @"omnipotence", @"omnipresence", @"omniscience", @"Ontological Argument", @"open theism", @"orthodoxy", @"orthodpraxy"],
              @"P" : @[@"person", @"philosophy", @"physicalism", @"pluralism", @"polytheism", @"predestination", @"Problem of Evil", @"Process Theology"],
              @"Q" : @[@"quintessence"],
              @"R" : @[@"redemption", @"religious experience", @"repentance"],
              @"S" : @[@"salvation", @"science", @"sensus fidelium", @"soteriology", @"subjective", @"substance", @"Systematic Theology"],
              @"T" : @[@"Teleological Argument", @"theism", @"theodicy", @"theology", @"Trinity"],
              @"U" : @[@"universalism"],
              @"V" : @[@"vicarious"],
              @"W" : @[@"will"],
              @"X" : @[@"x"],
              @"Y" : @[@"YHWH"],
              @"Z" : @[@"zeitgeist", @"zionism"],//98
             };
                                                                                                                        
    letters = [[terms allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    //A
    
    Word *accidence = [[Word alloc] init];
    accidence.name = @"accidence";
    accidence.definition = @"In Aristotelean philosophy, a nonessential property or quality of a substance.";
    
    Word *adoption = [[Word alloc] init];
    adoption.name = @"adoption";
    adoption.definition = @"The process of becoming a child of God through Jesus Christ";
    
    Word *agape = [[Word alloc] init];
    agape.name = @"agape";
    agape.definition = @"The Greek word meaning 'universal and unconditional will for the good of another'. The gospel writers use this word to describe Jesus' teaching on love for God, neighbors and enemies.";
    
    Word *aggiornomento = [[Word alloc] init];
    aggiornomento.name = @"aggiornomento";
    aggiornomento.definition = @"An Italian word meaning 'to bring up to date' which became popular during the Second Vatican Council (1962-1965).";
    
    Word *agnostic = [[Word alloc] init];
    agnostic.name = @"agnostic";
    agnostic.definition = @"From the Greek word for 'not knowing', a term used to describe uncertainty about the question of God's existence.";
    
    Word *allegory = [[Word alloc] init];
    allegory.name = @"allegory";
    allegory.definition = @"From the Greek word for 'speaking by way of something else', a reference to an interpretation of a text that goes beyond the literal meaning to find a deeper connection to a higher order of reality";
    
    Word *analogy = [[Word alloc] init];
    analogy.name = @"analogy";
    analogy.definition = @"A way of probing eternal truths...";
    
    Word *apologetics = [[Word alloc] init];
    apologetics.name = @"apologetics";
    apologetics.definition = @"The rational defense of the Christian faith; from the Greek words    (apo) - 'from' and     (logia) - 'reason'.";
    
    Word *apophatic = [[Word alloc] init];
    apophatic.name = @"apophatic";
    apophatic.definition = @"Language that uses negation to describe God.";
    
    Word *atonement = [[Word alloc] init];
    atonement.name = @"atonement";
    atonement.definition = @"The act of making restitution for inflicted harm";
    
    //B
    
    Word *baptism = [[Word alloc] init];
    baptism.name = @"baptism";
    baptism.definition = @"A ritual washing used for initiation into the Christian community";
    
    Word *blasphemy = [[Word alloc] init];
    blasphemy.name = @"blasphemy";
    blasphemy.definition = @"A form of religious slander";
    
    //C
    
    Word *canon = [[Word alloc] init];
    canon.name = @"canon";
    canon.definition = @"Greek word for 'measuring stick'; used metaphorically to refer to a collection of texts regarded as authoritative for faith and practice within a community";

    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - 'annointed one'.";
    
    Word *creed = [[Word alloc] init];
    creed.name = @"creed";
    creed.definition = @"from the Latin 'credo' (I believe) - a statement of belief; used to refer to the historical creeds of the Church, most notably the Apostle's and Nicene creed.";
    
    //D
    
    Word *deism = [[Word alloc] init];
    deism.name = @"deism";
    deism.definition = @"The belief that God created the world but does not intervene in the natural course of the world.";
    
    //E
    
    Word *epistemology = [[Word alloc] init];
    epistemology.name = @"epistemology";
    epistemology.definition = @"The study of the origin, nature, and limits of human knowledge; one of the three traditional subjects of Western philosophy.";
    
    Word *eschatology = [[Word alloc] init];
    eschatology.name = @"eschatology";
    eschatology.definition = @"from the Greek 'eschaton' (last thing) - the belief that history will have an end brought about by Divine intervention.";
    
    Word *essence = [[Word alloc] init];
    essence.name = @"essence";
    essence.definition = @"in Aristotelean philosophy, the property that makes an object what it is.";
    
    Word *exNihilo = [[Word alloc] init];
    exNihilo.name = @"ex nihilo";
    exNihilo.definition = @"from the Latin 'out of nothing' - The belief that God created the world out of nothing.";
    
    
    //F
    
    Word *faith = [[Word alloc] init];
    faith.name = @"faith";
    faith.definition = @"1. Trust or confidence; 2. The content of a religious system ('The Christian faith').";
    
    //G
    
    //H
    
    //I
    
    Word *immanence = [[Word alloc] init];
    immanence.name = @"immanence";
    immanence.definition = @"The quality of being within human experience.";
    
    //J
    
    Word *jesus = [[Word alloc] init];
    jesus.name = @"Jesus of Nazareth";
    jesus.definition = @"The first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.";
    
    //K
    
    //L
    
    //M
    
    Word *metaphysics = [[Word alloc] init];
    metaphysics.name = @"metaphysics";
    metaphysics.definition = @"The study of the fundamental nature of reality.";
    
    //N
    
    //O
    
    //P
    
    Word *philosophy = [[Word alloc] init];
    philosophy.name = @"philosophy";
    philosophy.definition = @"The critical examination of human thought; the love of wisdom.";
    
    //Q
    
    //R
    
    //S
    
    //T
    
    Word *transcendence = [[Word alloc] init];
    transcendence.name = @"transcendence";
    transcendence.definition = @"The quality of going beyond human experience.";
    
    //U
    
    Word *universalism = [[Word alloc] init];
    universalism.name = @"universalism";
    universalism.definition = @"The belief that all of humanity will ultimately experience salvation.";
    
    //V
    
    //W
    
    //X
    
    //Y
    
    //Z
    
       _systematicDetails = [[NSMutableArray alloc] init];

    //@boxenjim's solution
    for (NSString *letter in letters)
    {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
                [array addObject: accidence];
                [array addObject: adoption];
                [array addObject: agape];
                [array addObject: aggiornomento];
                [array addObject: agnostic];
                [array addObject: allegory];
                [array addObject: analogy];
                [array addObject: apologetics];
                [array addObject: apophatic];
                [array addObject: atonement];
            }
        else if ([letter isEqualToString:@"B"])
            {
                [array addObject: baptism];
                [array addObject: blasphemy];
            }
        else if ([letter isEqualToString:@"C"])
            {
                [array addObject: canon];
                [array addObject: Christ];
                [array addObject: creed];
            }
        else if ([letter isEqualToString:@"D"])
            {
                [array addObject: deism];
            }
        else if ([letter isEqualToString:@"E"])
            {
                [array addObject: epistemology];
                [array addObject: eschatology];
                [array addObject: essence];
                [array addObject: exNihilo]; 
            }
        else if ([letter isEqualToString:@"F"])
            {
                [array addObject: faith]; 
            }
        else if ([letter isEqualToString:@"G"])
            {
            
            }
        else if ([letter isEqualToString:@"H"])
            {
            
            }
        else if ([letter isEqualToString:@"I"])
            {
                [array addObject: immanence];
            }
        else if ([letter isEqualToString:@"J"])
            {
                [array addObject:jesus]; 
            }
        else if ([letter isEqualToString:@"K"])
            {
            
            }
        else if ([letter isEqualToString:@"L"])
            {
            
            }
        else if ([letter isEqualToString:@"M"])
            {
                [array addObject: metaphysics];
            }
        else if ([letter isEqualToString:@"N"])
            {
            
            }
        else if ([letter isEqualToString:@"O"])
            {
            
            }
        else if ([letter isEqualToString:@"P"])
            {
                [array addObject: philosophy];
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
                [array addObject: transcendence];
            }
        else if ([letter isEqualToString:@"U"])
            {
                [array addObject: universalism]; 
            }
        else if ([letter isEqualToString:@"V"])
            {
            
            }
        else if ([letter isEqualToString:@"W"])
            {
            
            }
        else if ([letter isEqualToString:@"Y"])
            {
            
            }
        else if ([letter isEqualToString:@"Z"])
            {
            
            }
    
             [_systematicDetails addObject:array];
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
    //Original Code
    //return 26;
    return [letters count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //Original Code
    // Return the number of rows in the section.
    //return [_Words count];
    NSString *sectionTitle = [letters objectAtIndex:section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    return [sectionTerms count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"systematicCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *sectionTitle = [letters objectAtIndex:indexPath.section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    NSString *term = [sectionTerms objectAtIndex:indexPath.row];
    cell.textLabel.text = term;
    
    //Original Code
    //cell.textLabel.text = [_systematicTerms objectAtIndex:indexPath.row];
    
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
        NSArray *sectionArray = [_systematicDetails objectAtIndex:indexPath.section];
        Word *detail = [sectionArray objectAtIndex:indexPath.row];
    
        SystematicDetailViewController *WordViewController = [segue destinationViewController];
        //WordViewController.currentWord = [_Word objectAtIndex:indexPath.row];
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

- (IBAction)info:(UIBarButtonItem *)sender
{
    
}
@end
