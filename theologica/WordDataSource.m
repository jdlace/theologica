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

@property (nonatomic, strong) NSArray *keysArray;
@property (nonatomic, strong) NSMutableDictionary *dataDictionay;
@end

@implementation WordDataSource

- (NSArray *)keysArray
{
    if (!_keysArray)
        {
        _keysArray = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
            //        NSString *key = [[self.dataDictionay allKeys] firstObject];
            //        _keysArray = [[self.dataDictionay[key] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        }
    return _keysArray;
}

- (NSArray *)keysForCategory:(NSString *)category
{
    NSDictionary *categoryDict = self.dataDictionay[category];
    NSArray *keys = [categoryDict allKeys];
    return keys;
}

- (NSArray *)sectionArrayForSection:(NSInteger)section category:(NSString *)category
{
    NSDictionary *categoryDict = self.dataDictionay[category];
    NSString *key = self.keysArray[section];
    NSArray *sectionArray = categoryDict[key];
    return sectionArray;
}

- (NSInteger)numberOfSectionsInDataSourceCategory:(NSString *)category
{
    return self.keysArray.count;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section forCategory:(NSString *)category
{
    NSArray *sectionArray = [self sectionArrayForSection:section category:category];
    return [sectionArray count];
}

- (Word *)wordForRowAtIndexPath:(NSIndexPath *)indexPath forCategory:(NSString *)category
{
    NSArray *sectionArray = [self sectionArrayForSection:indexPath.section category:category];
    Word *word = sectionArray[indexPath.row];
    return word;
}

- (NSString *)titleForHeaderInSection:(NSInteger)section forCategory:(NSString *)category
{
    return self.keysArray[section];
}

- (NSArray *)sectionIndexTitlesForCategory:(NSString *)category
{
    return self.keysArray;
}

- (NSInteger)sectionForSectionIndexTitle:(NSString *)title forCategory:(NSString *)category
{
    return [self.keysArray indexOfObject:title];
}


// build the dictionary/words
- (NSMutableDictionary *)dataDictionay
{
    if (!_dataDictionay)
    {
        _dataDictionay = [NSMutableDictionary dictionary];
        _dataDictionay[@"systematic"] = [NSMutableDictionary dictionary];
        _dataDictionay[@"ecclesial"] = [NSMutableDictionary dictionary];
        _dataDictionay[@"moral"] = [NSMutableDictionary dictionary];
        _dataDictionay[@"biblical"] = [NSMutableDictionary dictionary];
        _dataDictionay[@"social"] = [NSMutableDictionary dictionary];
        
        for (NSString *key in self.keysArray)
            {
            _dataDictionay[@"systematic"][key] = [NSMutableArray array];
            _dataDictionay[@"ecclesial"][key] = [NSMutableArray array];
            _dataDictionay[@"moral"][key] = [NSMutableArray array];
            _dataDictionay[@"biblical"][key] = [NSMutableArray array];
            _dataDictionay[@"social"][key] = [NSMutableArray array];
            }
        
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
    //A
    
    Word *accidence = [[Word alloc] init];
    accidence.name = @"Accident";
    accidence.definition = @"In Aristotelean philosophy, a nonessential property or quality of an object that is dependent upon the substance of the object for its existence. Thomas Aquinas used this concept to support his theory of “transubstantiation” of the Eucharist.\r\rSee http://en.wikipedia.org/wiki/Accident_(philosophy)";
    
    Word *adoption = [[Word alloc] init];
    adoption.name = @"Adoption";
    adoption.definition = @"A biblical metaphor used to refer to the process of entering into a new relationship with God through Jesus Christ. \r\rSee Catechism of the Catholic Church, 1. http://www.vatican.va/archive/ccc_css/archive/catechism/prologue.htm#1";
    
    Word *agape = [[Word alloc] init];
    agape.name = @"Agape";
    agape.definition = @"1. The Greek word (αγαπη) meaning “universal and unconditional will for the good of another”. The gospel writers use this word to describe Jesus' teaching on the love of God as well as the love for God, neighbors and enemies (Matthew 5:44, 22:37, 39). 2. The early Christian communal meal after which the Eucharist was celebrated (Jude 1:12). \r\rSee “Deus Caritas Est” by Pope Benedict XVI. http://www.vatican.va/holy_father/benedict_xvi/encyclicals/documents/hf_ben-xvi_enc_20051225_deus-caritas-est_en.html";

    Word *aggiornomento = [[Word alloc] init];
    aggiornomento.name = @"Aggiornomento";
    aggiornomento.definition = @"An Italian word meaning 'to bring up to date' which became popular during and synonymous with the reforms of the Second Vatican Council (1962-1965); used by Pope John XXIII to describe the purpose of the Council.\r\rSee http://en.wikipedia.org/wiki/Aggiornamento#cite_note-3";
    
    Word *allegory = [[Word alloc] init];
    allegory.name = @"Allegory";
    allegory.definition = @"From the Greek word for “speaking by way of something else”, a reference to an interpretation of a text that goes beyond the literal meaning to find a deeper connection to a higher order of reality. \r\rSee Catechism of the Catholic Church, 117. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s1c2a3.htm.";

    Word *analogy = [[Word alloc] init];
    analogy.name = @"Analogy";
    analogy.definition = @"A way of probing eternal truths. \r\rSee Catechism of the Catholic Church, 114. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s1c2a3.htm";
    
    Word *anointing = [[Word alloc] init];
    anointing.name = @"Annointing of the Sick";
    anointing.definition = @"The sacrament of healing... \r\rSee Catechism of the Catholic Church, 1499. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c2a5.htm.";
    
    Word *anthropocentrism = [[Word alloc] init];
    anthropocentrism.name = @"Anthropocentrism";
    anthropocentrism.definition = @"A method of theological enquiry from the starting point and within the horizon of the human experience. All theological claims are claims made by human beings in human language. Theology is relevant to human beings in so far as they concern human experience.";
    
    Word *apologetics = [[Word alloc] init];
    apologetics.name = @"Apologetics";
    apologetics.definition = @"The rational defense of the Christian faith; from the Greek words (apo) - “from” and (logia) - “reason”.";
    
    Word *apophatic = [[Word alloc] init];
    apophatic.name = @"Apophatic";
    apophatic.definition = @"Language that uses negation to describe God.";

    
    Word *atonement = [[Word alloc] init];
    atonement.name = @"Atonement";
    atonement.definition = @"The act of making restitution for inflicted harm; a theological interpretation of the death of Jesus of Nazrareth. \r\rSee Catechism of the Catholic Church, 616. http://www.vatican.va/archive/ccc_css/archive/catechism/p122a4p2.htm";
    
    [_dataDictionay[@"systematic"][@"A"] addObjectsFromArray:@[accidence, adoption, agape, aggiornomento, allegory, analogy, anointing, anthropocentrism, apologetics, apophatic, atonement]];
    
    //B
    
    Word *baptism = [[Word alloc] init];
    baptism.name = @"Baptism";
    baptism.definition = @"The sacrament of initiation into the Christian community in which faith is professed and sins are forgiven. \r\rSee Catechism of the Catholic Church, 1213. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c1a1.htm";
    
    Word *blasphemy = [[Word alloc] init];
    blasphemy.name = @"Blasphemy";
    blasphemy.definition = @"A form of religious slander. \r\rSee Catechism of the Catholic Church, 2148. http://www.vatican.va/archive/ccc_css/archive/catechism/p3s2c1a2.htm";
    
    [_dataDictionay[@"systematic"][@"B"] addObjectsFromArray:@[baptism, blasphemy]];
    
    //C
    
    Word *canon = [[Word alloc] init];
    canon.name = @"Canon";
    canon.definition = @"The Greek word (κανον) meaning “measuring stick”; used metaphorically to refer to a standard or criterion regarded as authoritative within a community. The Bible is referred to as the canon of the Scriptures. \r\rSee Catechism of the Catholic Church, 101. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s1c2a3.htm. \r\rAlso see Pontifical Biblical Commission, “The Interpretation of the Bible in the Church, III.B”. http://catholic-resources.org/ChurchDocs/PBC_Interp-FullText.htm ";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - “annointed one”. \r\rSee Catechism of the Catholic Church, 436. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2c2a2.htm";
    
    Word *confession = [[Word alloc] init];
    confession.name = @"Confession";
    confession.definition = @"The sacrament of reconciliation... \r\rSee Catechism of the Catholic Church, 1424. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c2a4.htm";
    
    Word *confirmation = [[Word alloc] init];
    confirmation.name = @"Confirmation";
    confirmation.definition = @"The sacrament of reception of the Holy Spirit in which.... \r\rSee Catechism of the Catholic Church, 1285. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c1a2.htm";
    
    Word *cosmological = [[Word alloc] init];
    cosmological.name = @"Cosmological Argument";
    cosmological.definition = @"One of the classical arguments for the existence of God, based on the First Cause argument. \r\rSee Stanford Encyclopedia of Philosophy, “Cosmological Argument”. http://plato.stanford.edu/entries/cosmological-argument/. \r\rThomas Aquinas, Summa Theologica, ST, Ia, q. 2 a. 3 co. http://www.fordham.edu/halsall/source/aquinas3.asp";
    
    Word *creationism = [[Word alloc] init];
    creationism.name = @"Creationism";
    creationism.definition = @"The belief that God created the earth and human beings directly, with no biological predecessors as described in the book of Genesis.\r\rSee “evolution” in the Cultural cateogry";
    
    Word *creed = [[Word alloc] init];
    creed.name = @"Creed";
    creed.definition = @"The Latin word (credo) meaning “I believe” - a statement of belief; used to refer to the historical creeds of the Church, most notably the Apostle's and Nicene creed. \r\rSee Catechism of the Catholic Church, 187. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2.htm";
    
    [_dataDictionay[@"systematic"][@"C"] addObjectsFromArray:@[canon, Christ, confession, confirmation, cosmological, creationism, creed]];
    
    //D
    
    Word *developmentDoc = [[Word alloc] init];
    developmentDoc.name = @"Development of Doctrine";
    developmentDoc.definition = @"The idea that the teaching of the Church can develop over time; first found in the writings of Vincent of Lerins and later re-emphasized by Cardinal John Henry Newman. \r\rSee John Henry Newman, “Essay on the Development of Doctrine”. http://www.newmanreader.org/Works/development/index.html.";
    
    Word *devil = [[Word alloc] init];
    devil.name = @"Devil";
    devil.definition = @"The personal malevolent spiritual being who became synonymous with Satan in inter-testamental years leading up to the life of Jesus...";
    
    [_dataDictionay[@"systematic"][@"D"] addObjectsFromArray:@[developmentDoc, devil]];
    
    //E
    
    Word *ecumenism = [[Word alloc] init];
    ecumenism.name = @"Ecumenism";
    ecumenism.definition = @"A movement which gained popularity in the 20th century that emphasized shared beliefs among various Christian churches over and against differences.";
    
    
    Word *eschatology = [[Word alloc] init];
    eschatology.name = @"Eschatology";
    eschatology.definition = @"from the Greek “eschaton” (last thing) - the belief that history will have an end brought about by Divine intervention. \r\rSee Catechism of the Catholic Church, 673. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2c2a7.htm.";
    
    Word *essence = [[Word alloc] init];
    essence.name = @"Essence";
    essence.definition = @"A property that makes an object what it is. \r\rSee Standford Encyclopedia of Philosophy “Essential vs. Accidental Properties”. http://plato.stanford.edu/entries/essential-accidental/.";
    
    Word *eucharist = [[Word alloc] init];
    eucharist.name = @"Eucharist";
    eucharist.definition = @"The sacred community meal of bread and wine in which Christians believe Jesus is present. The belief that Jesus is present in the Eucharist predates any theory (e.g. transubstantiation) as to how he is present.\r\rSee Catechism of the Catholic Church, 1322. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c1a3.htm";
    
    Word *exclusivism = [[Word alloc] init];
    exclusivism.name = @"Exclusivism";
    exclusivism.definition = @"The soteriological belief that only those people who have a made an explicit Christian confession will experience salvation.";
    
    Word *exNihilo = [[Word alloc] init];
    exNihilo.name = @"Ex Nihilo";
    exNihilo.definition = @"from the Latin “out of nothing” - The belief that God created the world out of nothing. \r\rSee Catechism of the Catholic Church, 296. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2c1p4.htm.";
    
    Word *exOpere = [[Word alloc] init];
    exOpere.name = @"Ex Opere Operato";
    exOpere.definition = @"Latin phrase for “from the work, worked”.";
    
    
    [_dataDictionay[@"systematic"][@"E"] addObjectsFromArray:@[ecumenism, eschatology, essence, eucharist, exclusivism, exNihilo, exOpere]];
    
    //F
    
    Word *faith = [[Word alloc] init];
    faith.name = @"Faith";
    faith.definition = @"1. Trust or confidence; 2. The content of a religious system (“The Christian faith”).";
    
    Word *fideism = [[Word alloc] init];
    fideism.name = @"Fideism";
    fideism.definition = @"The belief that....";
    
    Word *fallibilism = [[Word alloc] init];
    fallibilism.name = @"Fallibilism";
    fallibilism.definition = @"The idea that humans can have inaccurate, yet justified beliefs about the world. \r\rSee Internet Ecyclopedia of Philosophy,“Fallibilism. http://www.iep.utm.edu/fallibil/";
    
    Word *foreknowledge = [[Word alloc] init];
    foreknowledge.name = @"Foreknowledge";
    foreknowledge.definition = @"The belief that God knows future events; this idea features prominently in post-Exilic Hebrew literature and in the New Testament; associated philosophical problems include constraints on human freedom and the problem of evil. \r\rSee Catechism of the Catholic Church, 600. http://www.vatican.va/archive/ccc_css/archive/catechism/p122a4p2.htm. \r\rAlso see Stanford Encylopedia of Philosophy, “Foreknowledge and Free Will”. http://plato.stanford.edu/entries/free-will-foreknowledge/";
    
    Word *freewill = [[Word alloc] init];
    freewill.name = @"Free Will";
    freewill.definition = @"The ability to choose...";
    
    [_dataDictionay[@"systematic"][@"F"] addObjectsFromArray:@[faith, fideism, foreknowledge, freewill]];
    
    //G
    
    Word *gospel = [[Word alloc] init];
    gospel.name = @"Gospel";
    gospel.definition = @"1. The message of the historical Jesus concerning the Kingdom of God; 2. The message about Jesus concerning the salvation of the world; 3. One of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John); from the Greek word ευαγγελιον (evangelion) - “good news”.";
    
    Word *grace = [[Word alloc] init];
    grace.name = @"Grace";
    grace.definition = @"unmerited favor... \r\rSee Catechism of the Catholic Church, 1996. http://www.vatican.va/archive/ccc_css/archive/catechism/p3s1c3a2.htm";
    
    [_dataDictionay [@"systematic"][@"G"] addObjectsFromArray:@[gospel, grace]];
    
    //H
    
    Word *heaven = [[Word alloc] init];
    heaven.name = @"Heaven";
    heaven.definition = @"The state of complete union with God...";
    
    Word *hell = [[Word alloc] init];
    hell.name = @"Hell";
    hell.definition = @"The state of complete separation from God...";
    
    Word *henotheism = [[Word alloc] init];
    henotheism.name = @"Henotheism";
    henotheism.definition = @"The belief that many gods exist while only one is served.";
    
    Word *heresy = [[Word alloc] init];
    heresy.name = @"Heresy";
    heresy.definition = @"The formal contradiction of orthodox belief...";
    
    Word *hierarchy = [[Word alloc] init];
    hierarchy.name = @"Hierarchy of truths";
    hierarchy.definition = @"The idea that some truths are more essential to salvation than others.";
    
    [_dataDictionay [@"systematic"][@"H"] addObjectsFromArray:@[heaven, hell, henotheism, heresy, hierarchy]];
    
    //I
    
    Word *immanence = [[Word alloc] init];
    immanence.name = @"Immanence";
    immanence.definition = @"The quality of being within human experience.";
    
    Word *idolatry = [[Word alloc] init];
    idolatry.name = @"Idolatry";
    idolatry.definition = @"The bestowal of ultimate value on that which is not ultimate.";
    
    Word *inclusivism = [[Word alloc] init];
    inclusivism.name = @"Inclusivism";
    inclusivism.definition = @"The belief that those who respond to the truth they have receieved will experience salvation; a soteriology developed by Karl Rahner in the mid-twentieth century.";
    
    [_dataDictionay[@"systematic"][@"I"] addObjectsFromArray:@[immanence, idolatry, inclusivism]];
    
    //J
    
    Word *jesus = [[Word alloc] init];
    jesus.name = @"Jesus of Nazareth";
    jesus.definition = @"The first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.";
    
    Word *justification = [[Word alloc] init];
    justification.name = @"Justification";
    justification.definition = @"The act of being put into a just relationship. Paul uses this word to describe those who believe in Jesus as the Christ...";
    
    [_dataDictionay[@"systematic"][@"J"] addObjectsFromArray:@[jesus, justification]];
    
    //K
    
    Word *kataphatic = [[Word alloc] init];
    kataphatic.name = @"Kataphatic";
    kataphatic.definition = @"Language which makes postiive claims about God.";
    
    Word *kenosis = [[Word alloc] init];
    kenosis.name = @"Kenosis";
    kenosis.definition = @"The process of emptying; from the Greek word    ; used by Paul in his letter to the Philippians to describe the self-emptying of Jesus.";
    
    [_dataDictionay [@"systematic"][@"K"] addObjectsFromArray:@[kataphatic, kenosis]];
    
    //L
    
    Word *liberation = [[Word alloc]init];
    liberation.name = @"Liberation Theology";
    liberation.definition = @"The theological movement associated with the idea that the gospel is only authentic in the face of radical poverty.";

    
    [_dataDictionay [@"systematic"][@"L"] addObjectsFromArray:@[liberation]];
    
    //M
    
    Word *miracle = [[Word alloc] init];
    miracle.name = @"Miracle";
    miracle.definition = @"In common parlance, a supernatural event which defies scientific explanation.";
    
    Word *monotheism = [[Word alloc] init];
    monotheism.name = @"Monotheism";
    monotheism.definition = @"The belief that only one God exists.";
    
    Word *mystery = [[Word alloc] init];
    mystery.name = @"Mystery";
    mystery.definition = @"That which transcends human comprehension and explanation.";
    
    [_dataDictionay[@"systematic"][@"M"] addObjectsFromArray:@[miracle, monotheism, mystery]];
    
    //N
    
    Word *naturalTheo = [[Word alloc] init];
    naturalTheo.name = @"Natural Theology";
    naturalTheo.definition = @"The study of God by inference from the facts of the physical world.";
    
    Word *numinous = [[Word alloc] init];
    numinous.name = @"Numinous";
    numinous.definition = @"The category of religous experience as defined by Rudoph Otto.";
    
    [_dataDictionay [@"systematic"][@"N"] addObjectsFromArray:@[naturalTheo, numinous]];
    
    //O
    
    Word *omnibenevolence = [[Word alloc] init];
    omnibenevolence.name = @"Omnibenevolence";
    omnibenevolence.definition = @"The quality of being all-loving.";
    
    Word *omnipotence = [[Word alloc] init];
    omnipotence.name = @"Omnipotence";
    omnipotence.definition = @"The quality of being all-powerful.";
    
    Word *omnipresence = [[Word alloc] init];
    omnipresence.name = @"Omnipresence";
    omnipresence.definition = @"The quality of being all-present";
    
    Word *omniscience = [[Word alloc] init];
    omniscience.name = @"Omniscience";
    omniscience.definition = @"The quality of being all-knowing";
    
    Word *ontological = [[Word alloc] init];
    ontological.name = @"Ontological Argument";
    ontological.definition = @"The argument, first formulated by Anselm of Canterburry, that states God, as the greatest possible Being, is a necessary Being.";
    
    Word *openTheism = [[Word alloc] init];
    openTheism.name = @"Open Theism";
    openTheism.definition = @"A theological movement characterized by the belief that there are logical limits on God's power and knowledge.";
    
    Word *orthodox = [[Word alloc] init];
    orthodox.name = @"Orthodox";
    orthodox.definition = @"A Greek word meaning 'straight belief....";
    
    Word *orthopraxis = [[Word alloc] init];
    orthopraxis.name = @"Orthopraxis";
    orthopraxis.definition = @"A Greek word meaning 'straight practice...";
    
    [_dataDictionay [@"systematic"][@"O"] addObjectsFromArray:@[omnibenevolence, omnipotence, omnipresence, omniscience, ontological, openTheism, orthodox, orthopraxis]];
    
    //P
    
    Word *person = [[Word alloc] init];
    person.name = @"Person";
    person.definition = @"A human being capable of self-transcendence";
    
    Word *pluralism = [[Word alloc] init];
    pluralism.name = @"Pluralism";
    pluralism.definition = @"The belief that all religous claims are equally valid.";
    
    Word *polytheism = [[Word alloc] init];
    polytheism.name = @"Polytheism";
    polytheism.definition = @"The belief that many gods exist.";
    
    Word *predestination = [[Word alloc] init];
    predestination.name = @"Predestination";
    predestination.definition = @"The belief that God has fixed the destiny of certain individuals...";
    
    Word *processTheo = [[Word alloc] init];
    processTheo.name = @"Process theology";
    processTheo.definition = @"The theological school of thought based primarily on the thought of Alfred North Whitehead.";

    [_dataDictionay[@"systematic"][@"P"] addObjectsFromArray:@[person, pluralism, polytheism]];
    
    //Q
    
    Word *quintessence = [[Word alloc] init];
    quintessence.name = @"Quintessence";
    quintessence.definition = @"A term meaning “fifth essence”; used by Aristotle to refer to a substance higher than the four on earth.";
    
    [_dataDictionay[@"systematic"][@"Q"] addObjectsFromArray:@[quintessence]];
    
    //R
    
    Word *redemption = [[Word alloc] init];
    redemption.name = @"Redemption";
    redemption.definition = @"The process of exchanging the economic value of an object.";
    
    Word *ressourcement = [[Word alloc] init];
    ressourcement.name = @"Ressourcement";
    ressourcement.definition = @"A French term meaning “to return to the sources”; used by some theologians as the preferred interpretation of the purpose of Vatican II...\r\rSee 'aggiornomento'.";
    
    Word *resurrection = [[Word alloc] init];
    resurrection.name = @"Resurrection";
    resurrection.definition = @"The belief which developed in post-Exilic Judaism, that God would raise the righteous to eternal life; the belief of the early Christians that Jesus of Nazareth was raised from the dead.";
    
     [_dataDictionay[@"systematic"][@"R"] addObjectsFromArray:@[redemption, ressourcement, resurrection]];
    
    //S
    
    Word *salvation = [[Word alloc] init];
    salvation.name = @"Salvation";
    salvation.definition = @"The experience of being saved from sin and eventually death.";
    
    Word *soteriology = [[Word alloc] init];
    soteriology.name = @"Soteriology";
    soteriology.definition = @"The study of salvation; a particular framework of salvation.";
    
    [_dataDictionay[@"systematic"][@"S"] addObjectsFromArray:@[salvation, soteriology]];

    
    //T
    
    Word *theodicy = [[Word alloc] init];
    theodicy.name = @"Theodicy";
    theodicy.definition = @"The question of God's justice in the face of suffering and evil.";
    
    Word *theologoumenon = [[Word alloc] init];
    theologoumenon.name = @"Theologoumenon";
    theologoumenon.definition = @"A theological opinion on a disputable matter that has not been defined in Church teaching...";
    
    Word *theology = [[Word alloc] init];
    theology.name = @"Theology";
    theology.definition = @"The study of God.";
    
    Word *theosis = [[Word alloc] init];
    theosis.name = @"Theosis";
    theosis.definition = @"The process of becoming like God, emphasized in the Easter Orthodox tradition.";
    
    Word *tradition = [[Word alloc] init];
    tradition.name = @"Tradition";
    tradition.definition = @"The process of handing over beliefs and practices.";
    
    Word *transcendence = [[Word alloc] init];
    transcendence.name = @"Transcendence";
    transcendence.definition = @"The quality of going beyond human experience.";
    
    Word *transub = [[Word alloc] init];
    transub.name = @"Transubstantiation";
    transub.definition = @"The belief, formulated by Thomas Aquinas, that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist.";
    
    Word *trinity = [[Word alloc] init];
    trinity.name = @"Trinity";
    trinity.definition = @"The belief that God exists in three persons...";
    
    [_dataDictionay[@"systematic"][@"T"] addObjectsFromArray:@[theodicy, theologoumenon, theology, theosis, transcendence, trinity]];
    
    //U
    
    Word *universalism = [[Word alloc] init];
    universalism.name = @"Universalism";
    universalism.definition = @"The belief that all of humanity will ultimately experience salvation.";
    
    [_dataDictionay[@"systematic"][@"U"] addObjectsFromArray:@[universalism]];
    
    //V
    
    Word *virgin = [[Word alloc] init];
    virgin.name = @"Virginal Conception";
    virgin.definition = @"The belief that Jesus of Nazareth was conceived by the Holy Spirit and born from the virgin Mary.";
    
    Word *vocation = [[Word alloc] init];
    vocation.name = @"Vocation";
    vocation.definition = @"The calling by God of someone to a particular way of life.";
    
    [_dataDictionay[@"systematic"][@"V"] addObjectsFromArray:@[virgin, vocation]];
    
    //W
    
    Word *word = [[Word alloc] init];
    word.name = @"Word of God";
    word.definition = @"The saving message of God in which humans trust.";
    
    Word *will = [[Word alloc] init];
    will.name = @"Will of God";
    will.definition = @"The ultimate desire of God for creation....";
    
    
    [_dataDictionay[@"systematic"][@"W"] addObjectsFromArray:@[word, will]];

    
    //X
    
    
    //Y
    
    
    //Z

}

- (void)buildEcclesialWords
{
    //A
    
    Word *absolution = [[Word alloc] init];
    absolution.name = @"Absolution";
    absolution.definition = @"the act by which a priest declares the forgiveness of sins";
    
    Word *acolyte = [[Word alloc] init];
    acolyte.name = @"Acolyte";
    acolyte.definition = @"an assistant to a deacon";
    
    Word *adoptionism = [[Word alloc] init];
    adoptionism.name = @"Adoptionism";
    adoptionism.definition = @"The belief that Jesus was not the Son of God by nature, but rather adopted by God at his baptism; held by the so-called Ebionites of the end of the first century...";
    
    Word *adoration = [[Word alloc] init];
    adoration.name = @"Adoration";
    adoration.definition = @"The act of adoring Christ present in the Eucharist...";
    
    Word *angusDei = [[Word alloc] init];
    angusDei.name = @"Angus Dei";
    angusDei.definition = @"Part of Mass that begins 'Lamb of God...'.";
    
    Word *advent = [[Word alloc] init];
    advent.name = @"Advent";
    advent.definition = @"The first season of the liturgical year in the Church that prepares for the the celebration of the birth of Jesus; consists of 5 Sundays...";
    
    Word *alleluia = [[Word alloc] init];
    alleluia.name = @"Alleluia";
    alleluia.definition = @"A Latinized form of the phrase 'Praise the LORD'; spoken before the reading of the Gospel during the Mass; not spoken during the season of Lent...";
    
    Word *altar = [[Word alloc] init];
    altar.name = @"Altar";
    altar.definition = @"The table upon which the Eucharist is placed during the act of consecration due to the interpretation of the death of Jesus as an atoning sacrifice. See Catechism of the Catholic Church, 1182.";
    
    Word *ambo = [[Word alloc] init];
    ambo.name = @"Ambo";
    ambo.definition = @"The elevated platform behind which the lector, cantor, or homilist stands to sing, read, or speak to the congregation.";
    
    Word *amen = [[Word alloc] init];
    amen.name = @"Amen";
    amen.definition = @"A Hebrew word meaning 'may it be so'; traditionally said after a prayer as a form of agreement; derived from Jewish use in the synagogue and later in the New Testament where it is used to indicate the truthfulness of what is said.";
    
    Word *anamnesis = [[Word alloc] init];
    anamnesis.name = @"Anamnesis";
    anamnesis.definition = @"Greek Word for 'rememberance', used in the Words of Institution; a performative act used to re-present the salvific death and resurrection of Jesus...";
    
    Word *anaphora = [[Word alloc] init];
    anaphora.name = @"Anaphora";
    anaphora.definition = @"The Greek term for 'offering'; the Eucharistic prayer of the Mass...";
    
    Word *anathema = [[Word alloc] init];
    anathema.name = @"Anathema";
    anathema.definition = @"The Greek word for 'accursed'; the state of being out of visible communion with the Church";
    
    Word *anglican = [[Word alloc] init];
    anglican.name = @"Anglican Communion";
    anglican.definition = @"The Church of England...";
    
    Word *annulment = [[Word alloc] init];
    annulment.name = @"Annulment";
    annulment.definition = @"An ecclesial declaration that a valid marriage never existed....";
    
    Word *antiphon = [[Word alloc] init];
    antiphon.name = @"Antiphon";
    antiphon.definition = @"the choral response sung during the entrace processional";
    
    Word *apostlesCreed = [[Word alloc] init];
    apostlesCreed.name = @"Apostle's Creed";
    apostlesCreed.definition = @"The earliest form of the Rule of Faith; based on the Roman baptismal creed, dated to the year A.D. 150.";
    
    Word *arianism = [[Word alloc] init];
    arianism.name = @"Arianism";
    arianism.definition = @"The teaching of Arius that the Son was of a different substance than the Father (begotten vs. unbegotten) and thus, not fully divine.";
    
    [_dataDictionay[@"ecclesial"][@"A"] addObjectsFromArray:@[absolution, acolyte, adoptionism, adoration, advent, angusDei, altar, alleluia, amen, anaphora, anamnesis, anathema, anglican, annulment, antiphon, apostlesCreed, arianism]];
    
    //B
    
    Word *baptism = [[Word alloc] init];
    baptism.name = @"Baptism";
    baptism.definition = @"the intiation rite into the Church";
    
    Word *baptistry = [[Word alloc] init];
    baptistry.name = @"Baptistry";
    baptistry.definition = @"the place within a church used for baptism; usually referred to as a 'font'.";
    
    Word *basillica = [[Word alloc] init];
    basillica.name = @"Basillica";
    basillica.definition = @"term used to refer to a church in which the diocescan bishop presides; the Church inherited this architecture from the Roman Imperial administrative system.";
    
    Word *benedictus = [[Word alloc] init];
    benedictus.name = @"Benedictus";
    benedictus.definition = @"the prayer of Simeon contained within the gospel of Luke 2:29-32.";
    
    Word *bishop = [[Word alloc] init];
    bishop.name = @"Bishop";
    bishop.definition = @"from the Greek 'episcopos' (overseer) - the third order of clerics in the Catholic tradition; one who presides over a diocese.";
    
    Word *blasphemy = [[Word alloc] init];
    blasphemy.name = @"Blasphemy";
    blasphemy.definition = @"religious slander";
    
    [_dataDictionay[@"ecclesial"][@"B"] addObjectsFromArray:@[baptism, baptistry, basillica, benedictus, bishop, blasphemy]];
    
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
    
    [_dataDictionay[@"ecclesial"][@"P"] addObjectsFromArray:@[protestant]];
    
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
}

- (void)buildMoralWords
{
    //A
    
    Word *abortion = [[Word alloc] init];
    abortion.name = @"Abortion";
    abortion.definition = @"The intentional killing of an unborn human being, who is regarded as sacred from the moment of conception. The death of an unborn as a consequence of other procedures good in themselves is not considered an abortion per se but rather a consequence of the principle of double-effect (See “Principle of Double-Effect”). The Catholic tradition is consistent in its classification of abortion as a grave sin, with the Code of Canon Law declaring those who procure abortions excommunicate themselves from the Church (CIC, 1323-1324). \r\rSee Catechism of the Catholic Church, 2270. See “Roe vs. Wade” in the Cultural category.";
    
    Word *abstinence = [[Word alloc] init];
    abstinence.name = @"Abstinence";
    abstinence.definition = @"The restraining of oneself from a given activity; traditionally applied to sexual relations and food...";
    
    Word *act = [[Word alloc] init];
    act.name = @"Act";
    act.definition = @"In moral theology, an truly “human” act refers to actions made with freedom and will.";
    
    Word *adultery = [[Word alloc] init];
    adultery.name = @"Adultery";
    adultery.definition = @"Marital infidelity or sexual relations between two people, one of which being married to another person";
    
    [_dataDictionay [@"moral"][@"A"] addObjectsFromArray:@[abortion, abstinence, act, adultery]]; 
    
    //B
    Word *beneficence = [[Word alloc] init];
    beneficence.name = @"Beneficence";
    beneficence.definition = @"The first principle in medical ethics; do no harm.";
    
    Word *benefit = [[Word alloc] init];
    benefit.name = @"Benefit/Burden Ratio";
    benefit.definition = @"The ratio of benefits over the burdens of particular....";
    
    Word *bioethics = [[Word alloc] init];
    bioethics.name = @"Bioethics";
    bioethics.definition = @"The study of ethics related to life issues...";
    
     [_dataDictionay [@"moral"][@"B"] addObjectsFromArray:@[beneficence, benefit, bioethics]];
    
    //C
    
    Word *casuistry = [[Word alloc] init];
    casuistry.name = @"Casuistry";
    casuistry.definition = @"the study of case law";
    [_dataDictionay [@"moral"][@"C"] addObjectsFromArray:@[casuistry]];
    
    Word *catholicsocialteaching = [[Word alloc]init];
    catholicsocialteaching.name = @"Catholic Social Teaching";
    catholicsocialteaching.definition = @"the teaching of the Church which applies principles of social justice to the signs of the times";
    
    Word *commutativejustice = [[Word alloc]init];
    commutativejustice.name = @"Commutative Justice";
    commutativejustice.definition = @"one of the three types of justice which emphasizes obligations between individuals";
    
    Word *contributivejustice = [[Word alloc]init];
    contributivejustice.name = @"Contributive Justice";
    contributivejustice.definition = @"one of the three types of justice which emphasizes the obligation of individuals toward society";
    
    [_dataDictionay[@"moral"][@"C"] addObjectsFromArray:@[casuistry, catholicsocialteaching, commutativejustice, contributivejustice]];

    
    //D
    
    Word *dehumanization = [[Word alloc] init];
    dehumanization.name = @"Dehumanization";
    dehumanization.definition = @"The process of objectifying a human being, removing his or her dignity";
    
    Word *deontology = [[Word alloc] init];
    deontology.name = @"Deontology";
    deontology.definition = @"from the Greek word for “duty” (deon) - the study of ethics from the framework of moral duties in the form of rules and laws.";
    [_dataDictionay [@"moral"][@"D"] addObjectsFromArray:@[deontology]];
    
    Word *dignity = [[Word alloc]init];
    dignity.name = @"Dignity";
    dignity.definition = @"The sacred status of human beings because of the constant love of God; one of the 7 Principles of Catholic Social Teaching.";
    
    Word *distributive = [[Word alloc] init];
    distributive.name = @"Distributive Justice";
    distributive.definition = @"The type of justice which emphasizes society's responsibilities to the individual.";
    
    [_dataDictionay[@"moral"][@"D"] addObjectsFromArray:@[dehumanization, deontology, dignity, distributive]];

    
    //E
    
    Word *economic = [[Word alloc] init];
    economic.name = @"Economic Justice";
    economic.definition = @"The right relationship between human beings to a given economic system.";
    
    Word *ethics = [[Word alloc] init];
    ethics.name = @"Ethics";
    ethics.definition = @"the study of moral systems";
    [_dataDictionay [@"moral"][@"E"] addObjectsFromArray:@[epistemology, ethics]];
    
    [_dataDictionay[@"moral"][@"E"] addObjectsFromArray:@[economic, ethics]];

    
    //F
    
    //G
    
    //H
    
    Word *humanRights = [[Word alloc] init];
    humanRights.name = @"Human Rights";
    humanRights.definition = @"rights due to a person by virtue of his or her being a human being; thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights. \r\rSee Compendium of the Social Doctrine of the Church, 152. http://www.vatican.va/roman_curia/pontifical_councils/justpeace/documents/rc_pc_justpeace_doc_20060526_compendio-dott-soc_en.html";
    
    [_dataDictionay[@"moral"][@"H"] addObjectsFromArray:@[humanRights]];

    
    //I
    
    //J
    
    Word *justice = [[Word alloc] init];
    justice.name = @"Justice";
    justice.definition = @"the state of right relationships between individuals and groups in society.";
    
    Word *jusAdBellum = [[Word alloc] init];
    jusAdBellum.name = @"Jus Ad Bellum";
    jusAdBellum.definition = @"Latin for “justice to war” - a set of criteria used to determine if war is justified in a given situation: just cause, comparative justice, competent authority, right intention, probability of success, last resort, proportionality; see “Just War Theory”.";
    
    Word *jusImBello = [[Word alloc] init];
    jusImBello.name = @"Jus Im Bello";
    jusImBello.definition = @"Latin for “justice in war” - a set of criteria used to determine if the methods of war are justified: distinction, proportionality, military necessity; see “Just War Theory”.";
    
    Word *justWar = [[Word alloc] init];
    justWar.name = @"Just War Theory";
    justWar.definition = @"The theory first developed by Augustine and later refined by Aquinas which consists of criteria for determining the justice of both the conditions and methods of war; see “jus ad bellum” and “jus im bello”.";
    [_dataDictionay [@"moral"][@"J"] addObjectsFromArray:@[justice, jusAdBellum, jusImBello, justWar]];
    
    [_dataDictionay[@"moral"][@"J"] addObjectsFromArray:@[justice, jusAdBellum, jusImBello, justWar]];

    
    //K
    
    //L
    
    //M
    
    Word *morality = [[Word alloc] init];
    morality.name = @"Morality";
    morality.definition = @"customary norms of behavior considered good or evil, right or wrong in a given system.";
    [_dataDictionay [@"moral"][@"M"] addObjectsFromArray:@[morality]];
    
    [_dataDictionay[@"moral"][@"M"] addObjectsFromArray:@[morality]];

    
    //N
    
    //O
    
    //P
    
    //Q
    
    //R
    
    //S
    
    Word *social = [[Word alloc] init];
    social.name = @"Social Justice";
    social.definition = @"The type of justice which prioritizes the common good with a preferential option for the poor and marginalized.";
    
    [_dataDictionay[@"moral"][@"S"] addObjectsFromArray:@[social]];
    
    //T
    
    //U
    
    //V
    
    //W
    
    //X
    
    //Y
    
    //Z

    
    
}

- (void)buildBiblicalWords
{
    
    //A
    Word *abba = [[Word alloc] init];
    abba.name = @"Abba";
    abba.definition = @"The Aramaic term for “Daddy”; used by Jesus in prayer to God in the gospels.";
    
    Word *adonai = [[Word alloc] init];
    adonai.name = @"Adonai";
    adonai.definition =@"The Hebrew word for “Ruler”; used as a synonym for YHWH.";
    
    Word *anawim = [[Word alloc] init];
    anawim.name = @"Anawim";
    anawim.definition = @"The Hebrew word for the poor and marginalized in ancient Israel who trust completely in the mercy of God (Is. 10:2, Zeph 2:3)..";
    
    Word *anthropomorphism = [[Word alloc] init];
    anthropomorphism.name = @"Anthropomorphism";
    anthropomorphism.definition = @"The attribution of human characteristics to a non-human object. The J Source uses anthropomorphism extensively in its portrayal of YHWH.";
    /*
     Word *antiochusWord = [[Word alloc]init];
     antiochusWord.name = @"Antiochus IV";
     antiochusWord.definition = @"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
     */
    
    Word *apocalypse = [[Word alloc] init];
    apocalypse.name = @"Apocalypse";
    apocalypse.definition = @"1. The revelation of something previously hidden, used by Paul to refer to his experience of the risen Jesus. 2. The name of the last book of the New Testament - from the Greek word αποκαλυπσις (apokalypsis) - “unveiling”.";
    
    Word *apocrypha = [[Word alloc] init];
    apocrypha.name = @"Apocrypha";
    apocrypha.definition = @"The 7 books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom - from the Greek word for “hidden”";
    
    Word *apodictic = [[Word alloc] init];
    apodictic.name = @"Apodictic";
    apodictic.definition = @"A type of law which is based on a moral norm or command; see Exodus 20, “Decalogue”.";
    
    /*
     Word *apollosWord = [[Word alloc]  init];
     apollosWord.name = @"Apollos";
     apollosWord.definition = @"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
     */
    
    Word *apostle = [[Word alloc] init];
    apostle.name = @"Apostle";
    apostle.definition = @"The disciples which compirised Jesus' inner cirlce and whom he commissioned to spread the good news of the Kingdom of God; also used by Paul to refer to anyone who had seen the risen Christ - from the Greek word αποστολος (apostolos) - “delegate”.";
    
    Word *aqeda = [[Word alloc] init];
    aqeda.name = @"Aqeda";
    aqeda.definition = @"The story of the binding and near-sacrifice of Isaac by Abraham - from Hebrew word for “binding”.";
    
    Word *aramaic = [[Word alloc] init];
    aramaic.name = @"Aramaic";
    aramaic.definition = @"A variant of Hebrew, likely the native language of the historical Jesus.";
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
    asherah.definition = @"In Canaanite mythology, the wife of El and the goddess of fertility; mentioned numerous times throughout the Old Testament; according to 2 Kings 23:4 a large Asherah idol was housed in the Temple and dressed by her cult's prostitutes before Josiah's Deuteronomic reform.";
    
    Word *assyria = [[Word alloc] init];
    assyria.name = @"Assyria";
    assyria.definition = @"One of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 BCE.";
    
    [_dataDictionay[@"biblical"][@"A"] addObjectsFromArray:@[abba, adonai, anawim, anthropomorphism, apocalypse, apocrypha, apodictic, apostle, aqeda, aramaic, asherah, assyria]];

    
    //B
    
    Word *baal = [[Word alloc]  init];
    baal.name = @"Ba'al";
    baal.definition = @"In Canannite mythology, the son of El and most active of the gods; according to to 2 Kings 23:4 an image of Ba'al was housed in the Temple before Josiah's Deuternomic reform.";
    
    Word *babel = [[Word alloc] init];
    babel.name = @"Babel";
    babel.definition = @"The Hebrew word for “confusion”; named for Tower eitiology in Gen. 11.";
    
    Word *babylon = [[Word alloc] init];
    babylon.name = @"Babylon";
    babylon.definition = @"The empire that conquered the southern kingdom of Judah in 587 BCE.";
    
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
    bible.definition = @"The collection of the Old and New Testaments regarded as canonical and inspired within Catholicism. From the Greek word βιβλος (biblos) - “scroll”.";
    
    Word *biblicalCriticism = [[Word alloc] init];
    biblicalCriticism.name = @"Biblical Criticism";
    biblicalCriticism.definition = @"The process of discovering what can be known about the context of any biblical book or passage in order to understand its original meaning.";
    
    Word *bethel = [[Word alloc] init];
    bethel.name = @"Beth-El";
    bethel.definition = @"A sacred site within the patriarchal story cycles in Genesis - from the Hebrew for “House of El”.";
    
    [_dataDictionay[@"biblical"][@"B"] addObjectsFromArray:@[baal, babel, babylon, ban, bible, bethel]];
    
    //C
    
    Word *callNarrative = [[Word alloc] init];
    callNarrative.name = @"Call Narrative";
    callNarrative.definition = @"A literary form used throughout the Bible in which a person is called by God for a specific task; consisting of three parts: call, concern, commission. The stories of Moses, Jeremiah, and Isaiah all involve a call narrative.";
    
    Word *canon = [[Word alloc] init];
    canon.name = @"Canon";
    canon.definition = @"A collection of texts regarded as authoritative for faith and practice within a community - from the Greek word κανον (kanon) - “measuring stick“.";
    
    Word *charism = [[Word alloc] init];
    charism.name = @"Charism";
    charism.definition = @"According to the Apostle Paul, the spiritual gifts that come with Christian experience of the Holy Spirit - from the Greek word χαρισμα (charisma) - “gift”. See 1 Corinthians 12.";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - “annointed one”.";
    
    Word *circumcision = [[Word alloc] init];
    circumcision.name = @"Circumcision";
    circumcision.definition = @"The ritual cutting of the male foreskin; the sign of the covenant according to the Priestly author, described in Genesis 17.";
    
    Word *codex = [[Word alloc] init];
    codex.name = @"Codex";
    codex.definition = @"A collection of manuscripts.";
    
    Word *covenant = [[Word alloc] init];
    covenant.name = @"Covenant";
    covenant.definition = @"A sacred contract or agreement - used to refer to the relationship between YHWH and Israel in the Old Testament and between God and humanity in the New Testament.";
    
    [_dataDictionay[@"biblical"][@"C"] addObjectsFromArray:@[callNarrative, canon, charism, Christ, circumcision, codex, covenant]];
    
    //D
    
    Word *decalogue = [[Word alloc] init];
    decalogue.name = @"Decalogue";
    decalogue.definition = @"The term given to the 10 Commandments in Exodus 20 - from the Greek words δεκα (deka) - “ten” and λογος (logos) - “word”";
    
    Word *deiVerbum = [[Word alloc] init];
    deiVerbum.name = @"Dei Verbum";
    deiVerbum.definition = @"One of the four dogmatic constitutions of the Second Vatican Council (1962-1965); it is the most definitive statement on the Church's belief in Divine revelation, the Scriptures and Tradition.";
    
    Word *deuteronomicHistory = [[Word alloc] init];
    deuteronomicHistory.name = @"Deuteronomic History";
    deuteronomicHistory.definition = @"The term given to the seven books, beginning with the book of Deuteronomy and extending through 2 Kings in the Hebrew Bible, which details the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel.";
    
    Word *deuteronomicSource = [[Word alloc] init];
    deuteronomicSource.name = @"Deuteronomic Source";
    deuteronomicSource.definition = @"The “D” source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See “Documentary Hypothesis.”";
    
    Word *deuteronomy = [[Word alloc] init];
    deuteronomy.name = @"Deuteronomy";
    deuteronomy.definition = @"from the Greek words “deuteros” (second) and “nomos” (law) - the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.";
    
    Word *diachronic = [[Word alloc] init];
    diachronic.name = @"Diachronic";
    diachronic.definition = @"The type of truth within a text which transcends time and culture - from the Greek...";
    
    
    Word *documentaryHypothesis = [[Word alloc] init];
    documentaryHypothesis.name = @"Documentary Hypothesis";
    documentaryHypothesis.definition = @"The theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah; “Yahwist” (J), “Elohist” (E), “Priestly” (P), and “Deuteronomic” (D).";
    
    Word *dynamic = [[Word alloc] init];
    dynamic.name = @"Dynamic Equivalence";
    dynamic.definition = @"A translation philosophy that seeks to render the text idea for idea.";
    
    [_dataDictionay[@"biblical"][@"D"] addObjectsFromArray:@[decalogue, deiVerbum, deuteronomicHistory, deuteronomicSource, diachronic, documentaryHypothesis, dynamic]];

    
    //E
    
    Word *eisegesis = [[Word alloc] init];
    eisegesis.name = @"Eisegesis";
    eisegesis.definition = @"Interpreting a text by reading into it one’s own ideas and presuppositions; the opposite of exegesis; from the Greek εις (eis) - “into” and αγω (ago) - “to go”.";
    
    Word *el = [[Word alloc] init];
    el.name = @"El";
    el.definition = @"In Canaanite mythology, father of all the gods and husband of Asherah; referred to throughout the patriarchal sagas...";
    
    Word *elohim = [[Word alloc] init];
    elohim.name = @"Elohim";
    elohim.definition = @"The Hebrew word for “gods”, “God” or “angels” depending on the context. The plural of “El”, it can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.";
    
    Word *elohistSource = [[Word alloc] init];
    elohistSource.name = @"Elohist Source";
    elohistSource.definition = @"The “E” source; comprising various texts throughout Genesis, Exodus, and Numbers; uses 'Elohim' as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.";
    
    Word *epistle = [[Word alloc] init];
    epistle.name = @"Epistle";
    epistle.definition = @"A letter sent by an apostle.";
    
    Word *etiology = [[Word alloc] init];
    etiology.name = @"Etiology";
    etiology.definition = @"A traditional story that explains a contemporary situation.";
    
    Word *evangelist = [[Word alloc] init];
    evangelist.name = @"Evangelist";
    evangelist.definition = @"A person who spreads good news; 2. One of the authors of the four gospels.";
    
    Word *exegesis = [[Word alloc] init];
    exegesis.name = @"Exegesis";
    exegesis.definition = @"The process of determining the meaning of a text in its original context; a necessary element of hermeneutics; from the Greek εξ (ex) - “out” and αγω (ago) - “to go”.";
    
    Word *exile = [[Word alloc] init];
    exile.name = @"Exile";
    exile.definition = @"The banishment of the southern kingdom of Judah to Babylon in 587 BCE.";
    
    [_dataDictionay[@"biblical"][@"E"] addObjectsFromArray:@[eisegesis, el, elohim, elohistSource, epistle, etiology, evangelist, exegesis, exile]];

    
    //F
    
    
    Word *folio = [[Word alloc] init];
    folio.name = @"Folio";
    folio.definition = @"A page within a manuscript.";
    
    Word *formalEquivalence = [[Word alloc] init];
    formalEquivalence.name = @"Formal Eqivalence";
    formalEquivalence.definition = @"A translation philosophy that seeks to render the text word for word.";
    
    Word *formCriticism = [[Word alloc] init];
    formCriticism.name = @"Form Criticism";
    formCriticism.definition = @"A type of criticism which deciphers and analyzes a text's genre or literary form; mentioned as necessary exegesis in Dei Verbum, 12: “To search out the intention of the sacred writers, attention should be given, among other things, to 'literary forms'. For truth is set forth and expressed differently in texts which are variously historical, prophetic, poetic, or of other forms of discourse.”";
    
    Word *fundamentalism = [[Word alloc] init];
    fundamentalism.name = @"Fundamentalism";
    fundamentalism.definition = @"1. A hermeneutical method which exclusively uses a literalist criterion for intepretation of a text; 2. An anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith.";
    
    [_dataDictionay[@"biblical"][@"F"] addObjectsFromArray:@[folio, formalEquivalence, formCriticism, fundamentalism]];

    
    //G
    
    Word *gehenna = [[Word alloc] init];
    gehenna.name = @"Gehenna";
    gehenna.definition = @"A valley near Jerusalem (the Valley of Hinnom) where a non-Israelite shrine to the Canaanite god Moloch once stood where human sacrifice by burning took place. It seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed); used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.";
    
    Word *genre = [[Word alloc] init];
    genre.name = @"Genre";
    genre.definition = @"A French word referring to the literary form of a text.";
    
    Word *gospel = [[Word alloc] init];
    gospel.name = @"Gospel";
    gospel.definition = @"1. The message of the historical Jesus concerning the Kingdom of God; 2. The message about Jesus concerning the salvation of the world; 3. One of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John); from the Greek word ευαγγελιον (evangelion) - “good news”.";
    
    [_dataDictionay[@"biblical"][@"G"] addObjectsFromArray:@[gehenna, genre, gospel]];

    
    //H
    
    Word *hermeneutics = [[Word alloc] init];
    hermeneutics.name = @"Hermeneutics";
    hermeneutics.definition = @"The science of interpretation and process of determining meaning, usually of a text - from the name of the Greek god “Hermes”, the messenger of the gods.";
    
    Word *historicalBooks = [[Word alloc] init];
    historicalBooks.name = @"Historical Books";
    historicalBooks.definition = @"The second of four divisions within the Old Testament; contains 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, Nehemiah, Tobit, Judith, Esther, 1 & 2 Maccabees.";
    
    Word *hcm = [[Word alloc] init];
    hcm.name = @"Historical-Critical Method";
    hcm.definition = @"The hermeneutical method which seeks to uncover the intention of the author through exegetical analysis of history, language, literature, sources, and culture; according to the Pontifical Biblical Commission's “The Interpretation of the Bible in the Church”, it is the one essential method for Catholic hermeneutics.";
    
    Word *historicalCriticism = [[Word alloc] init];
    historicalCriticism.name = @"Historical Criticism";
    historicalCriticism.definition = @"The type of exegetical criticism which deciphers and analyzes the historical context of a text.";
    
    Word *holyOfHolies = [[Word alloc] init];
    holyOfHolies.name = @"Holy of Holies";
    holyOfHolies.definition = @"The innermmost area of the Temple in Jerusalem where the Ark of the Covenant was believed to reside from the monarchy of Solomon until the Exile in 587 BCE.";
    
    [_dataDictionay[@"biblical"][@"H"] addObjectsFromArray:@[hermeneutics, historicalBooks, hcm, historicalCriticism, holyOfHolies]];

    
    //I
    
    Word *inspiration = [[Word alloc] init];
    inspiration.name = @"Inspiration";
    inspiration.definition = @"That which provides the “breath of life” or motivation behind a course of action. Divine Inspiration is therefore understood to mean that God has provided the “breath of life” or motivation for a course of action - from the Latin word for both “spirit” and “breath”.";
    
    Word *interpretation = [[Word alloc] init];
    interpretation.name = @"Interpretation";
    interpretation.definition = @"The explanation of the meaning, significance, and relevance of a text.";
    
    Word *israel = [[Word alloc] init];
    israel.name = @"Israel";
    israel.definition = @"The name given to Jacob which means “struggles with God”...";
    
    [_dataDictionay[@"biblical"][@"I"] addObjectsFromArray:@[inspiration, interpretation]];

    
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
    
    Word *judah = [[Word alloc] init];
    judah.name = @"Judah";
    judah.definition = @"1. The fourth son of Jacob. 2. The southern kingdom established after the death of Solomon in 922 BCE.";
    
    Word *justification = [[Word alloc] init];
    justification.name = @"Justification";
    justification.definition = @"The state of being in a just or right relationship; synonymous with “righteousness”; used by Paul to refer to the state of believers in Jesus.";
    
    [_dataDictionay[@"biblical"][@"J"] addObjectsFromArray:@[jerusalem, jesus, jew, judah, justification]];

    
    //K
    
    Word *ketuvim = [[Word alloc] init];
    ketuvim.name = @"Ketuv'im";
    ketuvim.definition = @"The Hebrew word for “writings”; the third of three sections in the Tanak; see “Tanak”";
    
    Word *kosher = [[Word alloc] init];
    kosher.name = @"Kosher";
    kosher.definition = @"Often translated as “clean”, this refers to foods that are “fitting” or “appropriate” to eat or be sacrificed to YHWH according to the Torah.";
    
    [_dataDictionay[@"biblical"][@"K"] addObjectsFromArray:@[ketuvim, kosher]];

    
    //L
    
    Word *law = [[Word alloc] init];
    law.name = @"Law";
    law.definition = @"1. The first five books of the Torah containing a collection of various commandments and legal codes for the Israelites.";
    
    Word *literary = [[Word alloc] init];
    literary.name = @"Literary Criticism";
    literary.definition = @"The type of exegetical criticism that deciphers and analyzes the literary characteristics of a text, including form, setting, plot, characterization, denouement, theme, and climax.";
    
    Word *lxx = [[Word alloc] init];
    lxx.name = @"LXX";
    lxx.definition = @"The numerical symbol for the Septuagint; named for the supposed 70 translators of the Tanak into Greek at the request of Alexander the Great.";
    
    [_dataDictionay[@"biblical"][@"L"] addObjectsFromArray:@[law, literary, lxx]];

    
    //M
    
    Word *manuscript = [[Word alloc] init];
    manuscript.name = @"Manuscript";
    manuscript.definition = @"A hand-written copy of a text.";
   
                        
    
    Word *messiah = [[Word alloc] init];
    messiah.name = @"Messiah";
    messiah.definition = @"Equivalent title to 'Christ”; used by the early Christians to refer to the divinely designated status of Jesus of Nazareth - from the Hebrew for “annointed one”.";
    
    Word *mishnah = [[Word alloc] init];
    mishnah.name = @"Mishnah";
    mishnah.definition = @"An oral commentary on the Torah...";
    
    Word *myth = [[Word alloc] init];
    myth.name = @"Myth";
    myth.definition = @"A story that cannot be historically verified.";
    
    [_dataDictionay[@"biblical"][@"M"] addObjectsFromArray:@[manuscript, messiah, mishnah, myth]];

    
    //N
    
    Word *neviim = [[Word alloc] init];
    neviim.name = @"Nevi'im";
    neviim.definition = @"The Hebrew word for “Prophets”; the term given the second of the three sections of the Tanak.";
    
    Word *newTestament = [[Word alloc] init];
    newTestament.name = @"New Testament";
    newTestament.definition = @"The second of two major sections of the Bible; 27 books dealing with the life of Jesus of Nazareth and his followers; contains the 4 gospels, the Acts of the Apostles, numerous epistles, and the Apocalypse.";
    
    [_dataDictionay[@"biblical"][@"N"] addObjectsFromArray:@[neviim, newTestament]];

    
    //O
    
    Word *oldTestament = [[Word alloc] init];
    oldTestament.name = @"Old Testament";
    oldTestament.definition = @"The first of two major sections of the Bible; 46 books dealing with the people of Israel; contains the Pentateuch, Historical Books, Wisdom Books, and Prophetic Books.";
    
    Word *oracle = [[Word alloc] init];
    oracle.name = @"Oracle";
    oracle.definition = @"A prophetic medium...";
    
    Word *oral = [[Word alloc] init];
    oral.name = @"Oral Rradition";
    oral.definition = @"The transmission of stories and beliefs by word of mouth.";
    
    [_dataDictionay[@"biblical"][@"O"] addObjectsFromArray:@[oldTestament, oracle, oral]];

    
    //P
    
    Word *parable = [[Word alloc] init];
    parable.name = @"Parable";
    parable.definition = @"A fable-like story that makes a theological claim; used frequently by Jesus in the synoptic gospels.";
    
    Word *papyrus = [[Word alloc] init];
    papyrus.name = @"Papyrus";
    papyrus.definition = @"A type of paper used for writing created from a plant...";
    
    Word *passover = [[Word alloc] init];
    passover.name = @"Passover";
    passover.definition = @"The feast that commemorates the exodus of the Israelites from slavery in Egypt...";
    
    Word *pentateuch = [[Word alloc] init];
    pentateuch.name = @"Pentateuch";
    pentateuch.definition = @"Another term for the first five books of the Old Testament, the Torah - from the Greek for “five scrolls”.";
    
    Word *pericope = [[Word alloc] init];
    pericope.name = @"Pericope";
    pericope.definition = @"A given section of a larger text...";
    
    Word *pharisee = [[Word alloc] init];
    pharisee.name = @"Pharisees";
    pharisee.definition = @"A Jewish group of laymen in the first century...";
    
    Word *priestly = [[Word alloc] init];
    priestly.name = @"Priestly Source";
    priestly.definition = @"The “P” Source; compirising various texts throughtout the Torah, but especially Leviticus. The Priestly material can be dated to around the time of Hezekiah; shows a major concern for order, numbers, and categories of holiness and cleanliness; the Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or “profane”; this source, along with E and D, does not accept the revelation of the name YHWH before the Mosaic epiphany in Exodus 3. The Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word “compassionate” to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author). \r\rSee http://en.wikipedia.org/wiki/Priestly_source";
    
    Word *primeval = [[Word alloc] init];
    primeval.name = @"Primeval History";
    primeval.definition = @"Genesis chapters 1 - 11";
    
    Word *prophet = [[Word alloc] init];
    prophet.name = @"Prophet";
    prophet.definition = @"One who speaks in place of God; used in the Old Testament to refer to either a court prophet (such as Nathan) or an independent prophet (such as Amos).";
    
    Word *prophetic = [[Word alloc] init];
    prophetic.name = @"Prophetic Books";
    prophetic.definition = @"The fourth of four sections in the Old Testament...";
    
    [_dataDictionay[@"biblical"][@"P"] addObjectsFromArray:@[parable, papyrus, passover, pentateuch, pericope, pharisee, priestly, primeval, prophet, prophetic]];

    
    //Q
    
    Word *q = [[Word alloc] init];
    q.name = @"Q Source";
    q.definition = @"The hypothetical written source that lies behind the similar passages, exclusive to Matthew and Luke, which contain various teachings of Jesus; from the German word “quelle' - “source”.";
    
    [_dataDictionay[@"biblical"][@"Q"] addObjectsFromArray:@[q]];

    //R
    
    Word *redaction = [[Word alloc] init];
    redaction.name = @"Redaction Criticism";
    redaction.definition = @"The type of exegetical criticism that seeks to decipher and analyze the various stages of redaction of a text.";
    
    [_dataDictionay[@"biblical"][@"R"] addObjectsFromArray:@[redaction]];

    
    //S
    
    Word *sadducees = [[Word alloc] init];
    sadducees.name = @"Sadducees";
    sadducees.definition = @"The elite class of Jerusalem-based Temple scribes....";
    
    
    Word *Satan = [[Word alloc] init];
    Satan.name = @"Satan";
    Satan.definition = @"The adversarial being found in post-Exilic Hebrew literature that serves to represent evil events...";
    
    Word *septuagint = [[Word alloc] init];
    septuagint.name = @"Septuagint";
    septuagint.definition = @"The Greek translation of the Old Testament...";
    
    Word *source = [[Word alloc] init];
    source.name = @"Source Criticism";
    source.definition = @"The exegetical criticism that seeks to decipher and analyze the underlying source of a text.";
    
    Word *synagogue = [[Word alloc] init];
    synagogue.name = @"Synagogue";
    synagogue.definition = @"The local place of weekly assembly for Jews during the Exile in Babylon; carried over into post-Exilic Judaism - from the Greek “to go together“.";
    
    Word *synchronic = [[Word alloc] init];
    synchronic.name = @"Synchronic";
    synchronic.definition  = @"The type of truth that is relative to the time of a text's composition, usually relating to the worldview of the author.";
    
    Word *synoptic = [[Word alloc] init];
    synoptic.name = @"Synoptic";
    synoptic.definition = @"A term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity of narrative and Christology contrasted with the gospel of John; from the Greek word συν (syn) - “together” and οπσις (opsis) - “appearance”";
    
    [_dataDictionay[@"biblical"][@"S"] addObjectsFromArray:@[Satan, septuagint, source, synagogue, synchronic, synoptic]];

    
    
    //T
    
    Word *tabernacle = [[Word alloc] init];
    tabernacle.name = @"Tabernacle";
    tabernacle.definition = @"The temporary dwelling place of YHWH.";
    
    Word *tanak = [[Word alloc] init];
    tanak.name = @"Tanak";
    tanak.definition = @"Acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im. Since Hebrew has no vowels, those are added.";
    
    Word *taxCollector = [[Word alloc] init];
    taxCollector.name = @"Tax Collectors";
    taxCollector.definition = @"Jews who collected provincial taxes for the Roman Empire; frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. They were reviled as traitors, likely cheats, and possible idolators. Jesus includes one such person (Matthew) in his inner circle of disciples.";
    
    Word *temple = [[Word alloc] init];
    temple.name = @"Temple";
    temple.definition = @"The dwelling place of YHWH.";
    
    Word *textual = [[Word alloc] init];
    textual.name = @"Textual Criticism";
    textual.definition = @"The exegetical criticism that deciphers and analyzes the original language of a text.";
    
    Word *theophany = [[Word alloc] init];
    theophany.name = @"Theophany";
    theophany.definition = @"An appearance of God to a human being. Numerous theophanies are recorded throughout the Bible with the account of Moses being paradigmatic.";
    
    Word *torah = [[Word alloc] init];
    torah.name = @"Torah";
    torah.definition = @"The first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy.";
    
    Word *typology = [[Word alloc] init];
    typology.name = @"Typology";
    typology.definition = @"A way of reading the Old Testament...";
    
    [_dataDictionay[@"biblical"][@"T"] addObjectsFromArray:@[tabernacle, tanak, taxCollector, temple, textual, theophany, torah, typology]];

    
    //U
    
    //V
    
    //W
    
    Word *wisdom = [[Word alloc] init];
    wisdom.name = @"Wisdom Literature";
    wisdom.definition = @"A type of literature that contains wise sayings and philosophical reflections on life.";
    
    Word *wisdomBooks = [[Word alloc] init];
    wisdomBooks.name = @"Poetic";
    wisdomBooks.definition = @"The third of four sections in the Old Testament; it consists mainly of various writings; contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.";
    
    [_dataDictionay[@"biblical"][@"W"] addObjectsFromArray:@[wisdom, wisdomBooks]];

    
    //X
    
    //Y
    
    Word *yahwist = [[Word alloc] init];
    yahwist.name = @"Yahwist Source";
    yahwist.definition = @"The “J” Source...";
    
    Word *yhwh = [[Word alloc] init];
    yhwh.name = @"YHWH";
    yhwh.definition = @"The four letter personal name of the God of the Israelites, also called the 'Tetragrammaton'; it was likely pronounced 'Yah-way”; according to the E and P sources, this name was not known before it was revealed to Moses in Exodus chapter 3, the J source, however, uses it throughout Genesis, which is one argument for the Documentary Hypothesis.";
    
    Word *yomKippur = [[Word alloc] init];
    yomKippur.name = @"Yom Kippur";
    yomKippur.definition = @"The “Day of Atonement”; a day set aside on the Jewish calendar dedicated to bringing about reconciliation with YHWH; explained in detail in Leviticus 16.";
    
    [_dataDictionay[@"biblical"][@"Y"] addObjectsFromArray:@[yahwist, yhwh, yomKippur]];

    
    //Z
    
    Word *zealot = [[Word alloc] init];
    zealot.name = @"Zealots";
    zealot.definition = @"A Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces.";
    
    Word *zion = [[Word alloc] init];
    zion.name = @"Zion";
    zion.definition = @"A synonym for the Temple mountain in Jerusalem or for the city of Jerusalem itself.";
    
    [_dataDictionay[@"biblical"][@"Z"] addObjectsFromArray:@[zealot, zion]];

    
    
}

- (void)buildSocialWords //This category will be devoted to a theology of culture terms
{
    //A
    
    Word *aposteriori = [[Word alloc] init];
    aposteriori.name = @"A Posteriori";
    aposteriori.definition = @"A philosophical category which follows human experience. The statement “Water boils at 0 degrees Celsius” is an a posteriori truth. \r\rSee Stanford Encyclopedia of Philosophy, “A Priori Justification and Knowledge”. http://plato.stanford.edu/entries/apriori/.";
    
    Word *apriori = [[Word alloc] init];
    apriori.name = @"A Priori";
    apriori.definition = @"A philosophical category which precedes human experience. The statement “All bachelors are unmarried' is an a priori truth. \r\rSee Stanford Encyclopedia of Philosophy, “A Priori Justification and Knowledge”. http://plato.stanford.edu/entries/apriori/.";
    
    Word *action = [[Word alloc]init];
    action.name = @"Action";
    action.definition = @"The third of three steps in achieving justice.";
    
    Word *agnostic = [[Word alloc] init];
    agnostic.name = @"Agnostic";
    agnostic.definition = @"From the Greek word for “not knowing”, a term used to describe uncertainty about the question of God's existence. \r\rSee Catechism of the Catholic Church, 2127. http://www.vatican.va/archive/ccc_css/archive/catechism/p3s2c1a1.htm.";
    
    Word *analysis = [[Word alloc] init];
    analysis.name = @"Analysis";
    analysis.definition = @"The second of the 3 steps in achieving justice.";
    
    Word *anthropology = [[Word alloc] init];
    anthropology.name = @"Anthropology";
    anthropology.definition = @"The science that studies human origins, development, and culture.";
    
    Word *antisemitism = [[Word alloc] init];
    antisemitism.name = @"Anti-Semitism";
    antisemitism.definition = @"Prejudice, hatred, or racial bias against Jews. Some portions of the New Testament bear traces of anti-Semitism due to theological biases against the Jewish people for rejecting Christ. Thus, the Christian tradition has included anti-Semitic currents that have been rejected since the Second Vatican Council.";
    
    Word *argument = [[Word alloc] init];
    argument.name = @"Argument";
    argument.definition = @"A series of statements that establishes a truth claim; made of two parts - premise and conclusion; the from can be deductive or inductive; deductive arguments can be valid or invalid. \r\rSee Internet Encylopedia of Philosophy, “Argument”. http://www.iep.utm.edu/argument/";
    
    Word *atheism = [[Word alloc] init];
    atheism.name = @"Atheism";
    atheism.definition = @"The belief that no God exists.";
    
    Word *awareness = [[Word alloc] init];
    awareness.name = @"Awareness";
    awareness.definition = @"The first of 3 steps in achieving justice.";
    
    [_dataDictionay[@"social"][@"A"] addObjectsFromArray:@[aposteriori, apriori, action, analysis, anthropology, antisemitism, argument, atheism, awareness]];
    
    //B
    
    Word *bigbang = [[Word alloc] init];
    bigbang.name = @"Big Bang Theory";
    bigbang.definition = @"The cosmological theory, first developed by Fr. George Lemaitre, that claims that the Universe began at an infintely small and dense point of matter, energy, space, and time which then expanded over the course of time to become the observable cosmos we see today. See 'Creation' in 'Systematic'.";
    
    Word *buddhism = [[Word alloc] init];
    buddhism.name = @"Buddhism";
    buddhism.definition = @"The philosophy and religion based on the teachings of Siddartha...";
    
    [_dataDictionay[@"social"][@"B"] addObjectsFromArray:@[bigbang, buddhism]];

    
    //C
    
    Word *churchstate = [[Word alloc] init];
    churchstate.name = @"Church/State";
    churchstate.definition = @"The dichotomy used to express philosophical, theological, and legal differences in religious and political entities.";
    
    Word *colonialism = [[Word alloc] init];
    colonialism.name = @"Colonialism";
    colonialism.definition = @"The practice of settling foreign lands...";
    
    Word *commongood = [[Word alloc]init];
    commongood.name = @"Common Good";
    commongood.definition = @"the social condition in which all people are allowed to reach their full development";
    
    Word *compatibilism = [[Word alloc] init];
    compatibilism.name = @"Compatiblism";
    compatibilism.definition = @"The belief that human freedom is compatible with deterministic elements of human experience. \r\rSee Standford Encyclopedia of Philosophy, “Compatibilism”. http://plato.stanford.edu/entries/compatibilism/.";
    

    
    [_dataDictionay[@"social"][@"C"] addObjectsFromArray:@[churchstate, colonialism, commongood, compatibilism]];
    
    //D
    
    Word *deism = [[Word alloc] init];
    deism.name = @"Deism";
    deism.definition = @"The belief that God created the world but does not intervene in the natural course of the world.";
    
    Word *determinism = [[Word alloc] init];
    determinism.name = @"Determinism";
    determinism.definition = @"The belief that all events, including human actions, are determined by physical phenomena, negating the concept of free-will. \r\rSee Stanford Encyclopedia of Philosophy, “Causal Determinism”. http://plato.stanford.edu/entries/determinism-causal/.";
    
    Word *development = [[Word alloc]init];
    development.name = @"Development";
    development.definition = @"the process of becoming fully human";
    
    Word *dualism = [[Word alloc] init];
    dualism.name = @"Dualism";
    dualism.definition = @"The belief that humans are composed of two substances, body and soul/mind; also known as substance dualism; found in the Platonic influence on Christianity and later in the writings of Descartes. Associated problems include the problem of causation and the seeming violation of the scientific law of the conservation of energy. \r\rSee Stanford Encyclopedia of Philosophy “Dualism”. http://plato.stanford.edu/entries/dualism/.";
    
    [_dataDictionay[@"social"][@"D"] addObjectsFromArray:@[deism, determinism, development, dualism]];
    
    //E
    
    Word *elementary = [[Word alloc] init];
    elementary.name = @"Elementary Experience";
    elementary.definition = @"According to Fr. Luigi Giussani, the complex of needs and evidences that humans have for truth, justice, beauty, and goodness.";
    
    Word *epistemology = [[Word alloc] init];
    epistemology.name = @"Epistemology";
    epistemology.definition = @"The study of the origin, nature, and limits of human knowledge; one of the three traditional subjects of Western philosophy. \r\rSee Stanford Encyclopedia of Philosophy “Epistemology”. http://plato.stanford.edu/entries/epistemology/";
    
    Word *existential = [[Word alloc] init];
    existential.name = @"Existentialism";
    existential.definition = @"1. Of or relating to existence. 2. A philosophical movement which gained popularity in the late 19th century...";
    
    Word *explanandum = [[Word alloc] init];
    explanandum.name = @"Explanandum";
    explanandum.definition = @"That which is explained by something else.";
    
    Word *explanans = [[Word alloc] init];
    explanans.name = @"Explanans";
    explanans.definition = @"That which explains something else...";
    
     [_dataDictionay[@"social"][@"E"] addObjectsFromArray:@[elementary, epistemology, existential]];
    
    //F
    
    Word *feminism = [[Word alloc] init];
    feminism.name = @"Feminism";
    feminism.definition = @"The movement that seeks female liberation from patriarchal structures and norms...";
    
    [_dataDictionay[@"social"][@"F"] addObjectsFromArray:@[feminism]];

    
    //G
    
    //H
    
    Word *humanRights = [[Word alloc] init];
    humanRights.name = @"Human Rights";
    humanRights.definition = @"rights due to a person by virtue of his or her being a human being; thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights. \r\rSee Compendium of the Social Doctrine of the Church, 152. http://www.vatican.va/roman_curia/pontifical_councils/justpeace/documents/rc_pc_justpeace_doc_20060526_compendio-dott-soc_en.html";
    
    [_dataDictionay[@"social"][@"H"] addObjectsFromArray:@[humanRights]];
    
    
    //I
    
    //J
    
    //K
    
    //L
    
    Word *lawNC = [[Word alloc] init];
    lawNC.name = @"Law of Non-Contradiction";
    lawNC.definition = @"The logical axiom that states that A and ~A cannot both be true at the same time in the same way.";
    
    Word *living = [[Word alloc] init];
    living.name = @"living wage";
    living.definition = @"A form of income that is enables a worker to support his or her family. It should be noted that at the time Pope Leo XIII taught this in Rerum Novarum, women did not work.";
    
    Word *logic = [[Word alloc] init];
    logic.name = @"Logic";
    logic.definition = @"The science of reasoning. \r\rSee “The Logic Web”, University of Oxford. http://logic.philosophy.ox.ac.uk/main.htm. Also see Wikipedia, “Logic”. http://en.wikipedia.org/wiki/Logic.";
    
     [_dataDictionay[@"social"][@"L"] addObjectsFromArray:@[lawNC, living, logic]];
    
    //M
    
    Word *metaphysics = [[Word alloc] init];
    metaphysics.name = @"Metaphysics";
    metaphysics.definition = @"The study of the fundamental nature of reality; the study of ontology; a highly contested area of inquiry that has including a variation of topics throughout history since the time of Aristotle. \r\rSee Routledge Encyclopedia of Philosophy, “Metaphysics”. http://www.rep.routledge.com/article/N095";
    
    [_dataDictionay[@"social"][@"M"] addObjectsFromArray:@[metaphysics]];

    
    //N
    
    Word *naturalism = [[Word alloc] init];
    naturalism.name = @"Naturalism";
    naturalism.definition = @"The belief that nature is all that exists and denies a supernatural order.";
    
    [_dataDictionay[@"social"][@"N"] addObjectsFromArray:@[naturalism]];

    
    //O
    
    //P
    
    Word *philosophy = [[Word alloc] init];
    philosophy.name = @"Philosophy";
    philosophy.definition = @"The critical examination of human thought; the love of wisdom.";
    
    Word *physicalism = [[Word alloc] init];
    physicalism.name = @"Physicalism";
    physicalism.definition = @"The belief that phenemena traditionally attributed to the soul can be more simply explained by the functioning of a brain";
    
    Word *problem = [[Word alloc] init];
    problem.name = @"Problem of Evil";
    problem.definition = @"The philosophical problem that results from belief in Divine omniscience, omnipotence, and omnibenevolence and the experience of suffering and evil in the world....";
    
    [_dataDictionay[@"social"][@"P"] addObjectsFromArray:@[philosophy, physicalism, problem]];

    
    //Q
    
    //R
    
    Word *religious = [[Word alloc] init];
    religious.name = @"Religious Naturalism";
    religious.definition = @"A movement within naturalism which emphasizes the scientific history of the universe as a core mythos around which revolve interpretive, spiritual, and moral axes.";
    
    Word *rerum = [[Word alloc] init];
    rerum.name = @"Rerum Novarum";
    rerum.definition = @"The encyclical of Pope Leo XIII in 1891 which responded to the after effects of the Industrial Revolution in Europe by teaching that private property is relative to the Common Good and that workers have a right to unionized and to a living wage.";
    
     [_dataDictionay[@"social"][@"R"] addObjectsFromArray:@[religious, rerum]];
    
    //S
    
    Word *semiotics = [[Word alloc] init];
    semiotics.name = @"Semiotics";
    semiotics.definition = @"The study of signs and symbols used as elements of communication...";
    
    Word *sociology = [[Word alloc] init];
    sociology.name = @"Sociology";
    sociology.definition = @"The study of society...";
    
    
    Word *solidarity = [[Word alloc] init];
    solidarity.name = @"Solidarity";
    solidarity.definition = @"The idea that human beings share a fundamental unity which should be a criteria for determining justice.";
    
    Word *spirituality = [[Word alloc] init];
    spirituality.name = @"Spirituality";
    spirituality.definition = @"The conscious process of integration of one's life toward Ultimate value.";
    
    Word *structuralism = [[Word alloc] init];
    structuralism.name = @"Structuralism";
    structuralism.definition = @"The anthropological movement based on the work of Levi Strauss...";
    
    Word *supernormal = [[Word alloc] init];
    supernormal.name = @"Supernormal Allurements";
    supernormal.definition = @"The attraction to concentrated quantities of substances that allowed hu;manity to evolve and flourish, such as sugar, salt, and sex.";
    
    
    [_dataDictionay [@"social"][@"S"] addObjectsFromArray:@[semiotics, sociology, solidarity, spirituality, structuralism, supernormal]];
    
    //T
    
    //U
    
    Word *universal = [[Word alloc] init];
    universal.name = @"Universal Destination of Goods";
    universal.definition = @"The idea that the goods of the earth are intended to be justly distributed among its inhabitants according to the will of the Creator. \r\rSee The Compendium of the Social Doctrine of the Church, 171";
    
    //V
    
    //W
    
    //X
    
    //Y
    
    //Z
}

@end
