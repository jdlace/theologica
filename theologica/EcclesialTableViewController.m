//
//  EcclesialTableViewController.m
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import "EcclesialTableViewController.h"
#import "EcclesialDetailViewController.h"
#import "EcclesialDetail.h"

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
    
    terms = @{
              @"A" : @[@"absolution", @"acolyte", @"Agnus Dei", @"altar", @"anamnesis", @"anathema", @"antiphon", @"Apostle's Creed", @"Arianism", @"asceticism", @"Ash Wednesday"],
              @"B" : @[@"baptistry", @"blasphemy", @"basillica", @"Benedictus", @"bishop", @"Byzantine"],
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
    
    //_ecclesialTerms = [[NSArray alloc] initWithObjects:@"absolution", @"acolyte", @"altar", @"antiphon", nil];
    
    EcclesialDetail *absolutionEcclesialDetail = [[EcclesialDetail alloc] init];
    absolutionEcclesialDetail.ecclesialName = @"absolution";
    absolutionEcclesialDetail.ecclesialDescription = @"the act by which a priest declares the forgiveness of sins"; 
    
    EcclesialDetail *acolyteEcclesialDetail = [[EcclesialDetail alloc] init];
    acolyteEcclesialDetail.ecclesialName = @"acolyte";
    acolyteEcclesialDetail.ecclesialDescription = @"an assistant to a deacon";
    
    EcclesialDetail *altarEcclesialDetail = [[EcclesialDetail alloc] init];
    altarEcclesialDetail.ecclesialName = @"altar";
    altarEcclesialDetail.ecclesialDescription = @"the object upon which the Eucharist is placed during the act of consecration";
    
    EcclesialDetail *antiphonEcclesialDetail = [[EcclesialDetail alloc] init];
    antiphonEcclesialDetail.ecclesialName = @"antiphon";
    antiphonEcclesialDetail.ecclesialDescription = @"the choral response sung during the entrace processional";
    
    EcclesialDetail *baptismEcclesialDetail = [[EcclesialDetail alloc] init];
    baptismEcclesialDetail.ecclesialName = @"baptism";
    baptismEcclesialDetail.ecclesialDescription = @"the intiation rite into the Church";
    
    EcclesialDetail *blasphemyEcclesialDetail = [[EcclesialDetail alloc] init];
    blasphemyEcclesialDetail.ecclesialName = @"blasphemy";
    blasphemyEcclesialDetail.ecclesialDescription = @"religious slander";
   
    _ecclesialDetails = [[NSMutableArray alloc] init];
    /*
    [_ecclesialDetails addObject: absolutionEcclesialDetail]; 
    [_ecclesialDetails addObject: acolyteEcclesialDetail];
    [_ecclesialDetails addObject: altarEcclesialDetail];
    [_ecclesialDetails addObject: antiphonEcclesialDetail];
    */
    
    for (NSString *letter in letters)
        {
        NSMutableArray *array = [NSMutableArray array];
        if ([letter isEqualToString:@"A"])
            {
            [array addObject: absolutionEcclesialDetail];
            [array addObject: acolyteEcclesialDetail];
            [array addObject: altarEcclesialDetail];
            [array addObject: antiphonEcclesialDetail];
            }
        else if ([letter isEqualToString:@"B"])
            {
            [array addObject: baptismEcclesialDetail];
            [array addObject: blasphemyEcclesialDetail];
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
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showEcclesialDetail"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSArray *sectionArray = [_ecclesialDetails objectAtIndex:indexPath.section];
        EcclesialDetailViewController *ecclesialDetailViewController = [segue destinationViewController];
        EcclesialDetail *detail = [sectionArray objectAtIndex:indexPath.row];
        //ecclesialDetailViewController.currentEcclesialDetail = [_ecclesialDetails objectAtIndex:indexPath.row];
        ecclesialDetailViewController.currentEcclesialDetail = detail;
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
