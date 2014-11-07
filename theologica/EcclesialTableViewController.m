//
//  EcclesialTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "EcclesialTableViewController.h"
#import "EcclesialDetailViewController.h"
#import "Word.h"

@interface EcclesialTableViewController ()
{
    NSDictionary *terms;
    NSArray *letters;
}
@end

@implementation EcclesialTableViewController

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
    
    //data for the table view controller
    terms = @{
              @"A" : @[@"absolution", @"acolyte", @"Agnus Dei", @"altar", @"anamnesis", @"anathema", @"antiphon", @"Apostle's Creed", @"Arianism", @"asceticism", @"Ash Wednesday"],
              @"B" : @[@"baptism", @"baptistry", @"basillica", @"Benedictus", @"bishop", @"blasphemy", @"Byzantine"],
              @"C" : @[@"Calvinism", @"canon", @"cantor", @"catechumen", @"cathedral", @"chalice", @"Chalcedon", @"chi rho", @"church", @"clergy", @"Confession", @"Confirmation", @"consubstantial", @"contrition", @"council"],
              @"D" : @[@"Daily Office", @"deacon", @"docetism", @"Donatism"],
              @"E" : @[@"Easter", @"ecclesia", @"ecclesiology", @"epiclesis", @"Epiphany", @"Eucharist"],
              @"F" : @[@"Filioque"],
              @"G" : @[@"Gloria Patri", @"gnosticism", @"Good Friday"],
              @"H" : @[@"Hail Mary", @"Holy Orders", @"Holy Saturday", @"Holy Week", @"homily", @"homoosious", @"hymn"],
              @"I" : @[@"icon", @"intinction"],
              @"J" : @[@"Jubilate Deo"],
              @"K" : @[@"Kiss of Peace", @"koinonia", @"Kyrie Eleison"],
              @"L" : @[@"laity", @"Last Rites", @"Lectio Divina", @"lectionary", @"lector", @"liturgy"],
              @"M" : @[@"Magnificat", @"Marcion", @"martyr", @"mass", @"Memorial Acclamation", @"missal", @"monestary", @"monogenism", @"monophysitism", @"monothelism", @"monstrance", @"Montanism"],
              @"N" : @[@"narthex", @"Nestorianism", @"Nicene Creed", @"Nunc Dimittis"],
              @"O" : @[@"Offeratory", @"Ordinary Time", @"Ordination"],
              @"P" : @[@"Palm Sunday", @"Paschal Candle", @"Passion Sunday", @"Pater Noster", @"patristic", @"Pelagianism", @"penance", @"Pentecost", @"Pope", @"priest", @"Protestantism"],
              @"Q" : @[@"Quadradecimial Controversy"],
              @"R" : @[@"rosary", @"Reconciliation", @"rule of faith"],
              @"S" : @[@"sacramentary", @"Scholasticism", @"synod"],
              @"T" : @[@"tabernacle", @"thurible", @"transubstantiation", @"Triduum"],
              @"U" : @[@"Unction"],
              @"V" : @[@"vespers", @"Viaticum"],
              @"W" : @[@"Way of the Cross"],
              @"X" : @[@"XC"],
              @"Y" : @[@"young"],
              @"Z" : @[@"zebra"],
              };
    
    letters = [[terms allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    //A
    
    Word *absolution = [[Word alloc] init];
    absolution.name = @"absolution";
    absolution.definition = @"the act by which a priest declares the forgiveness of sins"; 
    
    Word *acolyte = [[Word alloc] init];
    acolyte.name = @"acolyte";
    acolyte.definition = @"an assistant to a deacon";
    
    Word *angusDei = [[Word alloc] init];
    angusDei.name = @"Angus Dei";
    angusDei.definition = @"Part of Mass that begins 'Lamb of God...'.";
    
    Word *altar = [[Word alloc] init];
    altar.name = @"altar";
    altar.definition = @"the object upon which the Eucharist is placed during the act of consecration";
    
    Word *anamnesis = [[Word alloc] init];
    anamnesis.name = @"anamnesis";
    anamnesis.definition = @"Greek Word for 'rememberance', used in the Words of Institution.";
    
    Word *anathema = [[Word alloc] init];
    anathema.name = @"anathema";
    anathema.definition = @"the state of being out of visible communion with the Church";
    
    Word *antiphon = [[Word alloc] init];
    antiphon.name = @"antiphon";
    antiphon.definition = @"the choral response sung during the entrace processional";
    
    Word *apostlesCreed = [[Word alloc] init];
    apostlesCreed.name = @"Apostle's Creed";
    apostlesCreed.definition = @"The earliest form of the Rule of Faith; based on the Roman baptismal creed, dated to the year A.D. 150.";
    
    Word *arianism = [[Word alloc] init];
    arianism.name = @"Arianism";
    arianism.definition = @"The teaching of Arius that the Son was of a different substance than the Father (begotten vs. unbegotten) and thus, not fully divine.";
    
    //B
    
    Word *baptism = [[Word alloc] init];
    baptism.name = @"baptism";
    baptism.definition = @"the intiation rite into the Church";
    
    Word *baptistry = [[Word alloc] init];
    baptistry.name = @"baptistry";
    baptistry.definition = @"the place within a church used for baptism; usually referred to as a 'font'.";
    
    Word *basillica = [[Word alloc] init];
    basillica.name = @"basillica";
    basillica.definition = @"term used to refer to a church in which the diocescan bishop presides; the Church inherited this architecture from the Roman Imperial administrative system.";
    
    Word *benedictus = [[Word alloc] init];
    benedictus.name = @"Benedictus";
    benedictus.definition = @"the prayer of Simeon contained within the gospel of Luke 2:29-32.";
    
    Word *bishop = [[Word alloc] init];
    bishop.name = @"bishop";
    bishop.definition = @"from the Greek 'episcopos' (overseer) - the third order of clerics in the Catholic tradition; one who presides over a diocese.";

    Word *blasphemy = [[Word alloc] init];
    blasphemy.name = @"blasphemy";
    blasphemy.definition = @"religious slander";
    

    
    //C
    
    //D
    
    //E
    
    //F
    
    //G
    
    //H
    
    //I
    
    //J
    
    //K
    
    //L
    
    //M
    
    //N
    
    //O
    
    //P
    
    Word *protestant = [[Word alloc] init];
    protestant.name = @"Protestant";
    protestant.definition = @"term used to describe the theological objection to the authority of the Pope in the Church; the Protestant Reformation.";
    
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
    
    _ecclesialDetails = [[NSMutableArray alloc] init];
    
    for (NSString *letter in letters)
        {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
                [array addObject: absolution];
                [array addObject: acolyte];
                [array addObject: angusDei];
                [array addObject: altar];
                [array addObject: anamnesis];
                [array addObject: anathema];
                [array addObject: antiphon];
                [array addObject: apostlesCreed];
                [array addObject: arianism];
            }
        else if ([letter isEqualToString:@"B"])
            {
                [array addObject: baptism];
                [array addObject: baptistry];
                [array addObject: basillica];
                [array addObject: benedictus];
                [array addObject: bishop]; 
                [array addObject: blasphemy];
            }
        else if ([letter isEqualToString:@"C"])
            {
            
            }
        else if ([letter isEqualToString:@"D"])
            {
            
            }
        else if ([letter isEqualToString:@"E"])
            {
            
            }
        else if ([letter isEqualToString:@"F"])
            {
            
            }
        else if ([letter isEqualToString:@"G"])
            {
            
            }
        else if ([letter isEqualToString:@"H"])
            {
            
            }
        else if ([letter isEqualToString:@"I"])
            {
            
            }
        else if ([letter isEqualToString:@"J"])
            {
            
            }
        else if ([letter isEqualToString:@"K"])
            {
            
            }
        else if ([letter isEqualToString:@"L"])
            {
            
            }
        else if ([letter isEqualToString:@"M"])
            {
            
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
        
        [_ecclesialDetails addObject:array];
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
    static NSString *CellIdentifier = @"ecclesialCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *sectionTitle = [letters objectAtIndex:indexPath.section];
    NSArray *sectionTerms = [terms objectForKey:sectionTitle];
    NSString *term = [sectionTerms objectAtIndex:indexPath.row];
    cell.textLabel.text = term;
    
    // Configure the cell...
    //cell.textLabel.text = [_ecclesialTerms objectAtIndex:indexPath.row];
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
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibWord:@"<#Nib Word#>" bundle:nil];
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
        NSArray *sectionArray = [_ecclesialDetails objectAtIndex:indexPath.section];
        Word *detail = [sectionArray objectAtIndex:indexPath.row];
    
    EcclesialDetailViewController  *WordViewController = [segue destinationViewController]; 
        //WordViewController.currentWord = [_Words objectAtIndex:indexPath.row];
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
