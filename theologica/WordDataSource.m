//
//  WordDataSource.m
//  theologica
//
//  Created by Jonathan Lace on 11/11/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "WordDataSource.h"
#import "Word.h"

@interface WordDataSource ()

@property (nonatomic, strong) NSDictionary *dataDictionay;

@end

@implementation WordDataSource

- (NSDictionary *)dataDictionay
{
    if (!_dataDictionay) {
        _dataDictionay = @{
                           @"sytematic":[NSMutableDictionary dictionary],
                           @"ecclisial":[NSMutableDictionary dictionary],
                           @"moral":[NSMutableDictionary dictionary],
                           @"biblical":[NSMutableDictionary dictionary],
                           @"social":[NSMutableDictionary dictionary],
                           };
        
        [self buildSystematicWords];
        [self buildEcclesialWords];
        [self buildMoralWords];
        [self buildBiblicalWords];
        [self buildSocialWords];
    }
    
    return _dataDictionay;
}

- (void)buildSystematicWords
{
    // A (repeat for all letters/words)
    // create word
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
    
    Word *annointing = [[Word alloc] init];
    annointing.name = @"Annointing of the sick";
    annointing.definition = @"The sacrament of healing...";
    
    Word *apologetics = [[Word alloc] init];
    apologetics.name = @"apologetics";
    apologetics.definition = @"The rational defense of the Christian faith; from the Greek words    (apo) - 'from' and     (logia) - 'reason'.";
    
    Word *apophatic = [[Word alloc] init];
    apophatic.name = @"apophatic";
    apophatic.definition = @"Language that uses negation to describe God.";

    
    Word *aposteriori = [[Word alloc] init];
    aposteriori.name = @"a priori";
    aposteriori.definition = @"A philosophical category which follows human experience. The statement 'Water boils at 0 degrees Celsius' is an a posteriori truth.";
    
    Word *apriori = [[Word alloc] init];
    apriori.name = @"a priori";
    apriori.definition = @"A philosophical category which precedes human experience. The statement 'All bachelors are unmarried' is an a priori truth.";
    
    Word *argument = [[Word alloc] init];
    argument.name = @"argument";
    argument.definition = @"A series of statements that establishes a truth claim; made of two parts - premise and conclusion; the from can be deductive or inductive; deductive arguments can be valid or invalid...";
    
    
    Word *atonement = [[Word alloc] init];
    atonement.name = @"atonement";
    atonement.definition = @"The act of making restitution for inflicted harm";
    
    // A (repeat for all letters/words)
    NSMutableArray *sysArrayA = [NSMutableArray array];
    // add to sysArrayA
    [sysArrayA addObject: accidence];
    [sysArrayA addObject: adoption];
    [sysArrayA addObject: agape];
    [sysArrayA addObject: aggiornomento];
    [sysArrayA addObject: agnostic];
    [sysArrayA addObject: allegory];
    [sysArrayA addObject: analogy];
    [sysArrayA addObject: annointing];
    [sysArrayA addObject: apologetics];
    [sysArrayA addObject: apophatic];
    [sysArrayA addObject: aposteriori];
    [sysArrayA addObject: apriori];
    [sysArrayA addObject: argument];
    [sysArrayA addObject: atonement];

    // set the A key/value in the systematic dict of the dataDictionary
    self.dataDictionay[@"systematic"][@"A"] = sysArrayA;
    
    //B
    NSMutableArray *sysArrayB = [NSMutableArray array];
    
    // create word
    Word *baptism = [[Word alloc] init];
    baptism.name = @"baptism";
    baptism.definition = @"A ritual washing used for initiation into the Christian community";
    
    Word *blasphemy = [[Word alloc] init];
    blasphemy.name = @"blasphemy";
    blasphemy.definition = @"A form of religious slander";
    
    
    // add to sysArrayB
    [sysArrayB addObject: baptism];
    [sysArrayB addObject: blasphemy];

    self.dataDictionay[@"systematic"][@"B"] = sysArrayB;
    
    //C
    NSMutableArray *sysArrayC = [NSMutableArray array];
    
    Word *canon = [[Word alloc] init];
    canon.name = @"canon";
    canon.definition = @"Greek word for 'measuring stick'; used metaphorically to refer to a collection of texts regarded as authoritative for faith and practice within a community";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - 'annointed one'.";
    
    Word *compatiblism = [[Word alloc] init];
    compatiblism.name = @"compatiblism";
    compatiblism.definition = @"The belief that human freedom is compatible with deterministic elements of human experience";
    
    Word *confession = [[Word alloc] init];
    confession.name = @"Confession";
    confession.definition = @"The sacrament of reconciliation..."; 
    
    Word *cosmological = [[Word alloc] init];
    cosmological.name = @"Cosmological Argument";
    cosmological.definition = @"One of the classical arguments for the existence of God...";
    
    Word *creed = [[Word alloc] init];
    creed.name = @"creed";
    creed.definition = @"from the Latin 'credo' (I believe) - a statement of belief; used to refer to the historical creeds of the Church, most notably the Apostle's and Nicene creed.";
    
    [sysArrayC addObject: canon];
    [sysArrayC addObject: Christ];
    [sysArrayC addObject: cosmological];
    [sysArrayC addObject: creed];
    
    self.dataDictionay[@"systematic"][@"C"] = sysArrayC;
    
    //D
    
    NSMutableArray *sysArrayD = [NSMutableArray array];
    
    Word *deism = [[Word alloc] init];
    deism.name = @"deism";
    deism.definition = @"The belief that God created the world but does not intervene in the natural course of the world.";
    
    Word *determinism = [[Word alloc] init];
    determinism.name = @"determinism";
    determinism.definition = @"The belief that all events, including human actions, are determined by physical phenomena, negating the concept of free-will.";
    
    Word *developmentDoc = [[Word alloc] init];
    developmentDoc.name = @"development of doctrine";
    developmentDoc.definition = @"The idea that the teaching of the Church can develop over time; first found in the writings of Vincent of Lerins and later re-emphasized by Cardinal John Henry Newman.";
    
    Word *dualism = [[Word alloc] init];
    dualism.name = @"dualism";
    dualism.definition = @"The belief that humans are composed of two substances, body and soul/mind; also known as substance dualism; found in the Platonic influence on Christianity and later in the writings of Descartes. Associated problems include the problem of causation and the seeming violation of the scientific law of the conservation of energy.";
    
    [sysArrayD addObject: deism];
    [sysArrayD addObject: determinism];
    [sysArrayD addObject: developmentDoc];
    [sysArrayD addObject: dualism];
    
    self.dataDictionay [@"systematic"] [@"D"] = sysArrayD;
    
    //E
    
    NSMutableArray *sysArrayE = [NSMutableArray array];
    
    Word *epistemology = [[Word alloc] init];
    epistemology.name = @"epistemology";
    epistemology.definition = @"The study of the origin, nature, and limits of human knowledge; one of the three traditional subjects of Western philosophy.";
    
    Word *eschatology = [[Word alloc] init];
    eschatology.name = @"eschatology";
    eschatology.definition = @"from the Greek 'eschaton' (last thing) - the belief that history will have an end brought about by Divine intervention.";
    
    Word *essence = [[Word alloc] init];
    essence.name = @"essence";
    essence.definition = @"in Aristotelean philosophy, the property that makes an object what it is.";
    
    Word *exclusivism = [[Word alloc] init];
    exclusivism.name = @"exclusivism";
    exclusivism.definition = @"The soteriological belief that only those people who have a made an explicit Christian confession will experience salvation.";
    
    Word *exNihilo = [[Word alloc] init];
    exNihilo.name = @"ex nihilo";
    exNihilo.definition = @"from the Latin 'out of nothing' - The belief that God created the world out of nothing.";
    
    Word *explanandum = [[Word alloc] init];
    explanandum.name = @"explanandum";
    explanandum.definition = @"That which is explained by something else.";
    
    Word *explanans = [[Word alloc] init];
    explanans.name = @"explanans";
    explanans.definition = @"That which explains something else...";
    
    [sysArrayE addObject: epistemology];
    [sysArrayE addObject: eschatology];
    [sysArrayE addObject: essence];
    [sysArrayE addObject: exclusivism];
    [sysArrayE addObject: exNihilo];
    [sysArrayE addObject: explanandum];
    [sysArrayE addObject: explanans];
    
    self.dataDictionay [@"systematic"] [@"E"] = sysArrayE;
    
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
    
    Word *theoAesthetics = [[Word alloc] init];
    theoAesthetics.name = @"theological aesthetics";
    theoAesthetics.definition = @"The study of God in light of the human experience of the arts.";
    
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

    
}

- (void)buildEcclesialWords
{
    
}

- (void)buildMoralWords
{
    
}

- (void)buildBiblicalWords
{
    
}

- (void)buildSocialWords
{
    
}

@end


/*
#import "WordDataSource.h"

@implementation WordDataSource
{
    
    //Dictionary for categories: keys = category names, values = dictionary of letters as keys with array of words as value
    NSDictionary *dict = @{
                           @"systematic":@{
                                           @"A":@[@""],
                                           @"B":@[@""],
                                           @"C":@[@""]
                                          },
                           @"ecclesial":@{
                                          @"A":@[@""],
                                          @"B":@[@""],
                                          @"C":@[@""]
                                         },
                           @"moral":@{
                                      @"A":@[@""],
                                      @"B":@[@""],
                                      @"C":@[@""]
                                     },
                           @"biblical":@{
                                         @"A":@[@""],
                                         @"B":@[@""],
                                         @"C":@[@""]
                                        },
                           @"social":@{
                                       @"A":@[@""],
                                       @"B":@[@""],
                                       @"C":@[@""]
                                       },
                           };
    
    
    NSDictionary *systematicDict = dict[@"systematic"];
    
    NSArray *categories = [[systematicDict allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    
    
    
    NSDictionary *ecclesialDict = dict[@"ecclesial"];
    
    
    NSDictionary *moralDict = dict[@"moral"];
    
    NSDictionary *biblicalDict = dict["biblical"];
    
    NSDictionary *socialDict = dict[@"social"];
     

    //SYSTEMATIC Word Objects for Detail View----------------------------------------------------------------
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

     
    //ECCLESIAL Word Objects for Detail View---------------------------------------------------------------
    // A
     
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
     protestant.definition = @"The theological objection to the authority of the Pope in the Church; the Protestant Reformation.";
     
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

     
    //MORAL Word objects for detail view--------------------------------------------------------------------
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
     BIBLICAL Word object for details view-------------------------------------------------------------------
     //A
     
     Word *aaronWord = [[Word alloc] init];
     aaronWord.name = @"Aaron";
     aaronWord.definition = @"the brother of Moses and founder of the Israelite priesthood according to the Priestly (P) source. See 'Documentary Hypothesis'";
     
     Word *alexanderWord = [[Word alloc] init];
     alexanderWord.name = @"Alexander the Great";
     alexanderWord.definition = @"Macedonian king (356-323 BCE) who spead Greek culture throughout the eastern Mediterranean world and requested a Greek translation of the Hebrew Bible. See 'Hellenization'";
     
     Word *amosWord = [[Word alloc] init];
     amosWord.name = @"Amos";
     amosWord.definition = @"A prophet from the southern kingdom of Judah who spoke Divine oracles against the economic injustice of the northern kingdom of Israel in the 8th century BCE";
     
    Word *abba = [[Word alloc] init];
    abba.name = @"Abba";
    abba.definition = @"The Aramaic term for 'Daddy'; used by Jesus in prayer to God in the gospels.";
    
    Word *adonai = [[Word alloc] init];
    adonai.name = @"Adonai";
    adonai.definition =@"The Hebrew word for 'Ruler'; used as a synonym for YHWH";
    
    Word *anthropomorphism = [[Word alloc] init];
    anthropomorphism.name = @"anthropomorphism";
    anthropomorphism.definition = @"The attribution of human characteristics to a non-human object. The J Source uses anthropomorphism extensively in its portrayal of YHWH.";
    
     Word *antiochusWord = [[Word alloc]init];
     antiochusWord.name = @"Antiochus IV";
     antiochusWord.definition = @"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
     
    
    Word *apocalypse = [[Word alloc] init];
    apocalypse.name = @"apocalypse";
    apocalypse.definition = @"1. The revelation of something previously hidden, used by Paul to refer to his experience of the risen Jesus. 2. The name of the last book of the New Testament - from the Greek word αποκαλυπσις (apokalypsis) - 'unveiling'.";
    
    Word *apocrypha = [[Word alloc] init];
    apocrypha.name = @"apocrypha";
    apocrypha.definition = @"The 7 books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom - from the Greek word for 'hidden'";
    
    Word *apodictic = [[Word alloc] init];
    apodictic.name = @"apodictic";
    apodictic.definition = @"A type of law which is based on a moral norm or command; see Exodus 20, 'Decalogue'.";
    
    
     Word *apollosWord = [[Word alloc]  init];
     apollosWord.name = @"Apollos";
     apollosWord.definition = @"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
     
    
    Word *apostle = [[Word alloc] init];
    apostle.name = @"apostle";
    apostle.definition = @"The disciples which compirised Jesus' inner cirlce and whom he commissioned to spread the good news of the Kingdom of God; also used by Paul to refer to anyone who had seen the risen Christ - from the Greek word αποστολος (apostolos) - 'delegate'";
    
    Word *aqeda = [[Word alloc] init];
    aqeda.name = @"aqeda";
    aqeda.definition = @"The story of the binding and near-sacrifice of Isaac by Abraham - from Hebrew word for 'binding'.";
    
    Word *aramaic = [[Word alloc] init];
    aramaic.name = @"Aramaic";
    aramaic.definition = @"A variant of Hebrew, likely the native language of the historical Jesus";
    
     Word *artraxercesWord = [[Word alloc] init];
     artraxercesWord.name = @"Artaxerxes";
     artraxercesWord.definition = @"Word meaning 'ruler' applied to the kings of Persia, specifically to Cyrus the Great";
     
     Word *asherWord = [[Word alloc] init];
     asherWord.name = @"Asher";
     asherWord.definition = @"One of the twelve tribes of Israel";
     
    
    Word *asherah = [[Word alloc] init];
    asherah.name = @"Asherah";
    asherah.definition = @"In Canaanite mythology, the wife of El and the goddess of fertility; mentioned numerous times throughout the Old Testament; according to 2 Kings 23:4 a large Asherah idol was housed in the Temple and dressed by her cult's prostitutes before Josiah's Deuteronomic reform.";
    
    Word *assyria = [[Word alloc] init];
    assyria.name = @"Assyria";
    assyria.definition = @"One of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 BCE";
    
    //B
    
    Word *baal = [[Word alloc]  init];
    baal.name = @"Ba'al";
    baal.definition = @"In Canannite mythology, the son of El and most active of the gods; according to to 2 Kings 23:4 an image of Ba'al was housed in the Temple before Josiah's Deuternomic reform.";
    
    Word *babel = [[Word alloc] init];
    babel.name = @"Babel";
    babel.definition = @"The Hebrew word for 'confusion'; named for Tower eitiology in Gen. 11.";
    
    Word *babylon = [[Word alloc] init];
    babylon.name = @"Babylon";
    babylon.definition = @"The empire that conquered the southern kingdom of Judah in 587 BCE.";
    
    Word *ban = [[Word alloc] init];
    ban.name = @"Ban";
    ban.definition = @"The ancient Israelite practice of the wholesale destruction of a people and their environment";
    
     Word *bathshebaWord = [[Word alloc] init];
     bathshebaWord.name = @"Bathsheba";
     bathshebaWord.definition = @"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
     
    
    Word *bible = [[Word alloc] init];
    bible.name = @"Bible";
    bible.definition = @"The collection of the Old and New Testaments regarded as canonical and inspired within Catholicism. From the Greek word βιβλος (biblos) - 'scroll'.";
    
    Word *biblicalCriticism = [[Word alloc] init];
    biblicalCriticism.name = @"biblical criticism";
    biblicalCriticism.definition = @"The process of discovering what can be known about the context of any biblical book or passage in order to understand its original meaning.";
    
    Word *bethel = [[Word alloc] init];
    bethel.name = @"Beth-El";
    bethel.definition = @"A sacred site within the patriarchal story cycles in Genesis - from the Hebrew for 'House of El'.";
    
    //C
    
    Word *callNarrative = [[Word alloc] init];
    callNarrative.name = @"call narrative";
    callNarrative.definition = @"A literary form used throughout the Bible in which a person is called by God for a specific task; consisting of three parts: call, concern, commission. The stories of Moses, Jeremiah, and Isaiah all involve a call narrative.";
    
    Word *canon = [[Word alloc] init];
    canon.name = @"canon";
    canon.definition = @"A collection of texts regarded as authoritative for faith and practice within a community - from the Greek word κανον (kanon) - 'measuring stick'.";
    
    Word *charism = [[Word alloc] init];
    charism.name = @"charism";
    charism.definition = @"According to the Apostle Paul, the spiritual gifts that come with Christian experience of the Holy Spirit - from the Greek word χαρισμα (charisma) - 'gift'. See 1 Corinthians 12.";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - 'annointed one'.";
    
    Word *circumcision = [[Word alloc] init];
    circumcision.name = @"circumcision";
    circumcision.definition = @"The ritual cutting of the male foreskin; the sign of the covenant according to the Priestly author, described in Genesis 17.";
    
    Word *codex = [[Word alloc] init];
    codex.name = @"codex";
    codex.definition = @"A collection of manuscripts.";
    
    Word *covenant = [[Word alloc] init];
    covenant.name = @"covenant";
    covenant.definition = @"A sacred contract or agreement - used to refer to the relationship between YHWH and Israel in the Old Testament and between God and humanity in the New Testament.";
    
    //D
    
    Word *decalogue = [[Word alloc] init];
    decalogue.name = @"Decalogue";
    decalogue.definition = @"The term given to the 10 Commandments in Exodus 20 - from the Greek words δεκα (deka) - 'ten' and λογος (logos) - 'word'";
    
    Word *deiVerbum = [[Word alloc] init];
    deiVerbum.name = @"Dei Verbum";
    deiVerbum.definition = @"One of the four dogmatic constitutions of the Second Vatican Council (1962-1965); it is the most definitive statement on the Church's belief in Divine revelation, the Scriptures and Tradition.";
    
    Word *deuteronomicHistory = [[Word alloc] init];
    deuteronomicHistory.name = @"Deuteronomic History";
    deuteronomicHistory.definition = @"The term given to the seven books, beginning with the book of Deuteronomy and extending through 2 Kings in the Hebrew Bible, which details the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel.";
    
    Word *deuteronomicSource = [[Word alloc] init];
    deuteronomicSource.name = @"Deuteronomic Source";
    deuteronomicSource.definition = @"The 'D' source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See 'Documentary Hypothesis.'";
    
    Word *deuteronomy = [[Word alloc] init];
    deuteronomy.name = @"Deuteronomy";
    deuteronomy.definition = @"from the Greek words 'deuteros' (second) and 'nomos' (law) - the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.";
    
    Word *diachronic = [[Word alloc] init];
    diachronic.name = @"diachronic";
    diachronic.definition = @"The type of truth within a text which transcends time and culture - from the Greek...";
    
    
    Word *documentaryHypothesis = [[Word alloc] init];
    documentaryHypothesis.name = @"Documentary Hypothesis";
    documentaryHypothesis.definition = @"The theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah; 'Yahwist' (J), 'Elohist' (E), 'Priestly' (P), and 'Deuteronomic' (D).";
    
    Word *dynamic = [[Word alloc] init];
    dynamic.name = @"dynamic equivalence";
    dynamic.definition = @"A translation philosophy that seeks to render the text idea for idea.";
    
    //E
    
    Word *eisegesis = [[Word alloc] init];
    eisegesis.name = @"eisegesis";
    eisegesis.definition = @"Interpreting a text by reading into it one’s own ideas and presuppositions; the opposite of exegesis; from the Greek εις (eis) - 'into' and αγω (ago) - 'to go'.";
    
    Word *el = [[Word alloc] init];
    el.name = @"El";
    el.definition = @"In Canaanite mythology, father of all the gods and husband of Asherah; referred to throughout the patriarchal sagas...";
    
    Word *elohim = [[Word alloc] init];
    elohim.name = @"Elohim";
    elohim.definition = @"The Hebrew word for “gods”, “God” or “angels” depending on the context. The plural of “El”, it can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.";
    
    Word *elohistSource = [[Word alloc] init];
    elohistSource.name = @"Elohist Source";
    elohistSource.definition = @"The 'E' source; comprising various texts throughout Genesis, Exodus, and Numbers; uses 'Elohim' as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.";
    
    Word *epistle = [[Word alloc] init];
    epistle.name = @"epistle";
    epistle.definition = @"A letter sent by an apostle.";
    
    Word *evangelist = [[Word alloc] init];
    evangelist.name = @"evangelist";
    evangelist.definition = @"A person who spreads good news; 2. One of the authors of the four gospels.";
    
    Word *exegesis = [[Word alloc] init];
    exegesis.name = @"exegesis";
    exegesis.definition = @"The process of determining the meaning of a text in its original context; a necessary element of hermeneutics; from the Greek εξ (ex) - 'out' and αγω (ago) - 'to go'.";
    
    //F
    
    
    Word *folio = [[Word alloc] init];
    folio.name = @"folio";
    folio.definition = @"A page within a manuscript.";
    
    Word *formalEquivalence = [[Word alloc] init];
    formalEquivalence.name = @"formal eqivalence";
    formalEquivalence.definition = @"A translation philosophy that seeks to render the text word for word.";
    
    Word *formCriticism = [[Word alloc] init];
    formCriticism.name = @"form criticism";
    formCriticism.definition = @"A type of criticism which deciphers and analyzes a text's genre or literary form; mentioned as necessary exegesis in Dei Verbum, 12: “To search out the intention of the sacred writers, attention should be given, among other things, to 'literary forms'. For truth is set forth and expressed differently in texts which are variously historical, prophetic, poetic, or of other forms of discourse.”";
    
    
    Word *fundamentalism = [[Word alloc] init];
    fundamentalism.name = @"fundamentalism";
    fundamentalism.definition = @"1. A hermeneutical method which exclusively uses a literalist criterion for intepretation of a text; 2. An anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith.";
    
    //G
    
    Word *gehenna = [[Word alloc] init];
    gehenna.name = @"Gehenna";
    gehenna.definition = @"A valley near Jerusalem (the Valley of Hinnom) where a non-Israelite shrine to the Canaanite god Moloch once stood where human sacrifice by burning took place. It seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed); used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.";
    
    Word *genre = [[Word alloc] init];
    genre.name = @"genre";
    genre.definition = @"A French word referring to the literary form of a text.";
    
    Word *gospel = [[Word alloc] init];
    gospel.name = @"gospel";
    gospel.definition = @"1. The message of the historical Jesus concerning the Kingdom of God; 2. The message about Jesus concerning the salvation of the world; 3. One of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John); from the Greek word ευαγγελιον (evangelion) - 'good news'.";
    
    //H
    
    Word *hermeneutics = [[Word alloc] init];
    hermeneutics.name = @"hermeneutics";
    hermeneutics.definition = @"The science of interpretation and process of determining meaning, usually of a text - from the name of the Greek god 'Hermes', the messenger of the gods.";
    
    Word *historicalBooks = [[Word alloc] init];
    historicalBooks.name = @"Historical Books";
    historicalBooks.definition = @"The second of four divisions within the Old Testament; contains 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, Nehemiah, Tobit, Judith, Esther, 1 & 2 Maccabees.";
    
    Word *hcm = [[Word alloc] init];
    hcm.name = @"historical-critical method";
    hcm.definition = @"The hermeneutical method which seeks to uncover the intention of the author through exegetical analysis of history, language, literature, sources, and culture; according to the Pontifical Biblical Commission's 'The Interpretation of the Bible in the Church', it is the one essential method for Catholic hermeneutics.";
    
    Word *historicalCriticism = [[Word alloc] init];
    historicalCriticism.name = @"historical criticism";
    historicalCriticism.definition = @"The type of exegetical criticism which deciphers and analyzes the historical context of a text.";
    
    Word *holyOfHolies = [[Word alloc] init];
    holyOfHolies.name = @"Holy of Holies";
    holyOfHolies.definition = @"The innermmost area of the Temple in Jerusalem where the Ark of the Covenant was believed to reside from the monarchy of Solomon until the Exile in 587 BCE.";
    
    //I
    
    Word *inspiration = [[Word alloc] init];
    inspiration.name = @"inspiration";
    inspiration.definition = @"That which provides the “breath of life” or motivation behind a course of action. Divine Inspiration is therefore understood to mean that God has provided the “breath of life” or motivation for a course of action - from the Latin word for both “spirit” and “breath”.";
    
    Word *interpretation = [[Word alloc] init];
    interpretation.name = @"interpretation";
    interpretation.definition = @"The explanation of the meaning, significance, and relevance of a text.";
    
    //J
    
    Word *jerusalem = [[Word alloc] init];
    jerusalem.name = @"Jerusalem";
    jerusalem.definition = @"The capital of the united monarchy established under David; the captial of the southern kingdom of Judah after the death of Solomon; the location of Mount Zion and the Temple.";
    
    Word *jesus = [[Word alloc] init];
    jesus.name = @"Jesus of Nazareth";
    jesus.definition = @"The first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.";
    
    Word *jew = [[Word alloc] init];
    jew.name = @"Jew";
    jew.definition = @"A member of the tribe of Judah; used to refer to any Israelite after the return from the Exile in 515 BCE.";
    
    Word *justification = [[Word alloc] init];
    justification.name = @"justification";
    justification.definition = @"The state of being in a just or right relationship; synonymous with 'righteousness'; used by Paul to refer to the state of believers in Jesus.";
    
    //K
    
    Word *ketuvim = [[Word alloc] init];
    ketuvim.name = @"Ketuv'im";
    ketuvim.definition = @"The Hebrew word for 'writings'; the third of three sections in the Tanak; see 'Tanak'";
    
    Word *kosher = [[Word alloc] init];
    kosher.name = @"kosher";
    kosher.definition = @"Often translated as “clean”, this refers to foods that are “fitting” or “appropriate” to eat or be sacrificed to YHWH according to the Torah.";
    
    //L
    
    Word *law = [[Word alloc] init];
    law.name = @"Law";
    law.definition = @"1. The first five books of the Torah containing a collection of various commandments and legal codes for the Israelites.";
    
    Word *literary = [[Word alloc] init];
    literary.name = @"literary criticism";
    literary.definition = @"The type of exegetical criticism that deciphers and analyzes the literary characteristics of a text, including form, setting, plot, characterization, denouement, theme, and climax.";
    
    Word *lxx = [[Word alloc] init];
    lxx.name = @"LXX";
    lxx.definition = @"The numerical symbol for the Septuagint; named for the supposed 70 translators of the Tanak into Greek at the request of Alexander the Great.";
    
    //M
    
    Word *manuscript = [[Word alloc] init];
    manuscript.name = @"manuscript";
    manuscript.definition = @"A hand-written copy of a text.";
    
    Word *messiah = [[Word alloc] init];
    messiah.name = @"Messiah";
    messiah.definition = @"Equivalent title to 'Christ'; used by the early Christians to refer to the divinely designated status of Jesus of Nazareth - from the Hebrew for 'annointed one'.";
    
    Word *mishnah = [[Word alloc] init];
    mishnah.name = @"Mishnah";
    mishnah.definition = @"An oral commentary on the Torah...";
    
    //N
    
    Word *neviim = [[Word alloc] init];
    neviim.name = @"Nevi'im";
    neviim.definition = @"The Hebrew word for 'Prophets'; the term given the second of the three sections of the Tanak.";
    
    Word *newTestament = [[Word alloc] init];
    newTestament.name = @"New Testament";
    newTestament.definition = @"The second of two major sections of the Bible; 27 books dealing with the life of Jesus of Nazareth and his followers; contains the 4 gospels, the Acts of the Apostles, numerous epistles, and the Apocalypse.";
    
    //O
    
    Word *oldTestament = [[Word alloc] init];
    oldTestament.name = @"Old Testament";
    oldTestament.definition = @"The first of two major sections of the Bible; 46 books dealing with the people of Israel; contains the Pentateuch, Historical Books, Wisdom Books, and Prophetic Books.";
    
    //P
    
    Word *parable = [[Word alloc] init];
    parable.name = @"parable";
    parable.definition = @"A fable-like story that makes a theological claim; used frequently by Jesus in the synoptic gospels.";
    
    Word *papyrus = [[Word alloc] init];
    papyrus.name = @"papyrus";
    papyrus.definition = @"A type of paper used for writing created from a plant...";
    
    Word *passover = [[Word alloc] init];
    passover.name = @"Passover";
    passover.definition = @"The feast that commemorates the exodus of the Israelites from slavery in Egypt...";
    
    Word *pentateuch = [[Word alloc] init];
    pentateuch.name = @"Pentateuch";
    pentateuch.definition = @"Another term for the first five books of the Old Testament, the Torah - from the Greek for 'five scrolls'.";
    
    Word *pericope = [[Word alloc] init];
    pericope.name = @"pericope";
    pericope.definition = @"A given section of a larger text...";
    
    
    Word *priestly = [[Word alloc] init];
    priestly.name = @"Priestly Source";
    priestly.definition = @"The 'P' Source; compirising various texts throughtout the Torah, but especially Leviticus. The Priestly material can be dated to around the time of Hezekiah; shows a major concern for order, numbers, and categories of holiness and cleanliness; the Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or 'profane'; this source, along with E and D, does not accept the revelation of the name YHWH before the Mosaic epiphany in Exodus 3. The Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word 'compassionate' to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author).";
    
    Word *prophet = [[Word alloc] init];
    prophet.name = @"prophet";
    prophet.definition = @"One who speaks in place of God; used in the Old Testament to refer to either a court prophet (such as Nathan) or an independent prophet (such as Amos).";
    
    Word *prophetic = [[Word alloc] init];
    prophetic.name = @"Prophetic Books";
    prophetic.definition = @"The fourth of four sections in the Old Testament...";
    
    //Q
    
    Word *q = [[Word alloc] init];
    q.name = @"Q Source";
    q.definition = @"The hypothetical written source that lies behind the similar passages, exclusive to Matthew and Luke, which contain various teachings of Jesus; from the German word 'quelle' - 'source'.";
    //R
    
    Word *redaction = [[Word alloc] init];
    redaction.name = @"redaction criticism";
    redaction.definition = @"The type of exegetical criticism that seeks to decipher and analyze the various stages of redaction of a text.";
    
    //S
    
    Word *Satan = [[Word alloc] init];
    Satan.name = @"Satan";
    Satan.definition = @"The adversarial being found in post-Exilic Hebrew literature that serves to represent evil events...";
    
    Word *septuagint = [[Word alloc] init];
    septuagint.name = @"Septuagint";
    septuagint.definition = @"The Greek translation of the Old Testament...";
    
    Word *source = [[Word alloc] init];
    source.name = @"source criticism";
    source.definition = @"The exegetical criticism that seeks to decipher and analyze the underlying source of a text.";
    
    Word *synagogue = [[Word alloc] init];
    synagogue.name = @"synagogue";
    synagogue.definition = @"The local place of weekly assembly for Jews during the Exile in Babylon; carried over into post-Exilic Judaism - from the Greek 'to go together'.";
    
    Word *synchronic = [[Word alloc] init];
    synchronic.name = @"synchronic";
    synchronic.definition  = @"The type of truth that is relative to the time of a text's composition, usually relating to the worldview of the author.";
    
    Word *synoptic = [[Word alloc] init];
    synoptic.name = @"synoptic";
    synoptic.definition = @"A term meaning 'to see together'; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity of narrative and Christology contrasted with the gospel of John; from the Greek word συν (syn) - 'together' and οπσις (opsis) - 'appearance'";
    
    
    //T
    
    Word *tanak = [[Word alloc] init];
    tanak.name = @"Tanak";
    tanak.definition = @"Acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im. Since Hebrew has no vowels, those are added.";
    
    Word *taxCollector = [[Word alloc] init];
    taxCollector.name = @"tax collector";
    taxCollector.definition = @"Jews who collected provincial taxes for the Roman Empire; frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. They were reviled as traitors, likely cheats, and possible idolators. Jesus includes one such person (Matthew) in his inner circle of disciples.";
    
    Word *textual = [[Word alloc] init];
    textual.name = @"textual criticism";
    textual.definition = @"The exegetical criticism that deciphers and analyzes the original language of a text.";
    
    Word *theophany = [[Word alloc] init];
    theophany.name = @"theophany";
    theophany.definition = @"An appearance of God to a human being. Numerous theophanies are recorded throughout the Bible with the account of Moses being paradigmatic.";
    
    Word *torah = [[Word alloc] init];
    torah.name = @"Torah";
    torah.definition = @"The first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy";
    
    //U
    
    //V
    
    //W
    
    Word *wisdom = [[Word alloc] init];
    wisdom.name = @"wisdom literature";
    wisdom.definition = @"A type of literature that contains wise sayings and philosophical reflections on life.";
    
    Word *widsomBooks = [[Word alloc] init];
    widsomBooks.name = @"poetic";
    widsomBooks.definition = @"The third of four sections in the Old Testament; it consists mainly of various writings; contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.";
    
    //X
    
    //Y
    
    Word *yahwist = [[Word alloc] init];
    yahwist.name = @"Yahwist Source";
    yahwist.definition = @"The 'J' Source...";
    
    Word *yhwh = [[Word alloc] init];
    yhwh.name = @"YHWH";
    yhwh.definition = @"The four letter personal name of the God of the Israelites, also called the 'Tetragrammaton'; it was likely pronounced 'Yah-way'; according to the E and P sources, this name was not known before it was revealed to Moses in Exodus chapter 3, the J source, however, uses it throughout Genesis, which is one argument for the Documentary Hypothesis.";
    
    Word *yomKippur = [[Word alloc] init];
    yomKippur.name = @"Yom Kippur";
    yomKippur.definition = @"The “Day of Atonement”; a day set aside on the Jewish calendar dedicated to bringing about reconciliation with YHWH; explained in detail in Leviticus 16.";
    
    //Z
    
    Word *zion = [[Word alloc] init];
    zion.name = @"Zion";
    zion.definition = @"A synonym for the Temple mountain in Jerusalem or for the city of Jerusalem itself.";
    
    _biblicalDetails = [[NSMutableArray alloc] init];
    
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
            [array addObject: biblicalCriticism];
            [array addObject: bethel];
            }
        else if ([letter isEqualToString:@"C"])
            {
            [array addObject: callNarrative];
            [array addObject: canon];
            [array addObject: charism];
            [array addObject: Christ];
            [array addObject: circumcision];
            [array addObject: codex];
            [array addObject: covenant];
            }
        else if ([letter isEqualToString: @"D"])
            {
            [array addObject: decalogue];
            [array addObject: deiVerbum];
            [array addObject: deuteronomicHistory];
            [array addObject: deuteronomicSource];
            [array addObject: diachronic];
            [array addObject: documentaryHypothesis];
            [array addObject: dynamic];
            }
        else if ([letter isEqualToString:@"E"])
            {
            [array addObject: eisegesis];
            [array addObject: el];
            [array addObject: elohim];
            [array addObject: elohistSource];
            [array addObject: epistle];
            [array addObject: evangelist];
            [array addObject: exegesis];
            }
        else if ([letter isEqualToString:@"F"])
            {
            [array addObject: folio];
            [array addObject: formalEquivalence];
            [array addObject: formCriticism];
            [array addObject: fundamentalism];
            }
        else if ([letter isEqualToString:@"G"])
            {
            [array addObject: gehenna];
            [array addObject: genre];
            [array addObject: gospel];
            }
        else if ([letter isEqualToString:@"H"])
            {
            [array addObject: hermeneutics];
            [array addObject: historicalBooks];
            [array addObject: hcm];
            [array addObject: historicalCriticism];
            [array addObject: holyOfHolies];
            }
        else if ([letter isEqualToString:@"I"])
            {
            [array addObject: inspiration];
            [array addObject: interpretation];
            }
        else if ([letter isEqualToString:@"J"])
            {
            [array addObject: jerusalem];
            [array addObject: jesus];
            [array addObject: jew];
            [array addObject: justification];
            }
        else if ([letter isEqualToString:@"K"])
            {
            [array addObject: ketuvim];
            [array addObject: kosher];
            }
        else if ([letter isEqualToString:@"L"])
            {
            [array addObject: law];
            [array addObject: literary];
            [array addObject: lxx];
            }
        else if ([letter isEqualToString:@"M"])
            {
            [array addObject: manuscript];
            [array addObject: messiah];
            [array addObject: mishnah];
            }
        else if ([letter isEqualToString:@"N"])
            {
            [array addObject: neviim];
            [array addObject: newTestament];
            }
        else if ([letter isEqualToString:@"O"])
            {
            [array addObject: oldTestament];
            }
        else if ([letter isEqualToString:@"P"])
            {
            [array addObject: papyrus];
            [array addObject: parable];
            [array addObject: passover];
            [array addObject: pentateuch];
            [array addObject: pericope];
            [array addObject: priestly];
            }
        else if ([letter isEqualToString:@"Q"])
            {
            [ array addObject: q];
            }
        else if ([letter isEqualToString:@"R"])
            {
            [array addObject: redaction];
            }
        else if ([letter isEqualToString:@"S"])
            {
            [array addObject: Satan];
            [array addObject: septuagint];
            [array addObject: source];
            [array addObject: synagogue];
            [array addObject: synchronic];
            [array addObject: synoptic];
            }
        else if ([letter isEqualToString:@"T"])
            {
            [array addObject: tanak];
            [array addObject: taxCollector];
            [array addObject: textual];
            [array addObject: theophany];
            [array addObject: torah];
            }
        else if ([letter isEqualToString:@"U"])
            {
            [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"V"])
            {
            [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"W"])
            {
            [array addObject: wisdom];
            [array addObject: widsomBooks];
            }
        else if ([letter isEqualToString:@"X"])
            {
            [array addObject: inspiration];
            }
        else if ([letter isEqualToString:@"Y"])
            {
            [array addObject: yahwist];
            [array addObject: yhwh];
            [array addObject: yomKippur];
            }
        else if ([letter isEqualToString:@"Z"])
            {
            [array addObject: zion];
            }
        
        [_biblicalDetails addObject:array];
        }

    //SOCIAL Word objects for details view-------------------------------------------------------------------
     
     //A
     
     Word *action = [[Word alloc]init];
     action.name = @"action";
     action.definition = @"the third of three steps in achieving justice";
     
     
     Word *analysis = [[Word alloc] init];
     analysis.name = @"analysis";
     analysis.definition = @"the second of the 3 steps in achieving justice";
     
     Word *awareness = [[Word alloc] init];
     awareness.name = @"awareness";
     awareness.definition = @"the first of 3 steps in achieving justice";
     
     //B
     
     //C
     
     Word *catholicsocialteaching = [[Word alloc]init];
     catholicsocialteaching.name = @"Catholic Social Teaching";
     catholicsocialteaching.definition = @"the teaching of the Church which applies principles of social justice to the signs of the times";
     
     Word *commongood = [[Word alloc]init];
     commongood.name = @"common good";
     commongood.definition = @"the social condition in which all people are allowed to reach their full development";
     
     Word *commutativejustice = [[Word alloc]init];
     commutativejustice.name = @"commutative justice";
     commutativejustice.definition = @"one of the three types of justice which emphasizes obligations between individuals";
     
     Word *contributivejustice = [[Word alloc]init];
     contributivejustice.name = @"contributive justice";
     contributivejustice.definition = @"one of the three types of justice which emphasizes the obligation of individuals toward society";
     
     //D
     
     Word *development = [[Word alloc]init];
     development.name = @"development";
     development.definition = @"the process of becoming fully human";
     
     Word *dignity = [[Word alloc]init];
     dignity.name = @"dignity";
     dignity.definition = @"the sacred status of human beings because of the constant love of God";
     
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
     
     _socialDetails = [[NSMutableArray alloc]init];
     
     for (NSString *letter in letters)
     {
     NSMutableArray *array = [NSMutableArray array];
     if ([letter isEqualToString:@"A"])
     {
     [array addObject: action];
     [array addObject: analysis];
     [array addObject: awareness];
     }
     else if ([letter isEqualToString:@"B"])
     {
     [array addObject: @""];
     }
     else if ([letter isEqualToString:@"C"])
     {
     [array addObject: catholicsocialteaching];
     [array addObject: commongood];
     [array addObject: commutativejustice];
     [array addObject: contributivejustice];
     }
     else if ([letter isEqualToString:@"D"])
     {
     [array addObject: development];
     [array addObject: dignity];
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
     [_socialDetails addObject:array];
     }

    */

