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
@property (nonatomic, strong) NSMutableArray *dataArray;
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

// build the array of words
- (NSMutableArray *)dataArray
{
    if (!_dataArray)
        {
        _dataArray = [NSMutableArray array];
        
        [self buildSystematicWords];
        [self buildEcclesialWords];
        [self buildMoralWords];
        [self buildBiblicalWords];
        [self buildSocialWords];
        }
    
    return _dataArray;
}


- (NSArray *)keysForCategory:(NSString *)category
{
    NSArray *keysArray = self.keysArray;
    NSArray *keys = [keysArray arrayByAddingObject:category];
    return keys;
    
   // NSDictionary *categoryDict = self.dataDictionay[category];
    //NSArray *keys = [categoryDict allKeys];
    //return keys;
}

- (NSArray *)sectionArrayForSection:(NSInteger)section category:(NSString *)category
{
    NSArray *dataArray = self.dataArray;
    NSArray *terms = self.dataArray[section];
    //[dataArray arrayByAddingObject:section];
    
    NSArray *sectionArray = [dataArray arrayByAddingObject:terms];
    //[NSArray sectionArrayForSection:section category:category];
    return sectionArray;
    
    //NSDictionary *categoryDict = self.dataDictionay[category];
    //NSString *key = self.keysArray[section];
    //NSArray *sectionArray = categoryDict[key];
    //return sectionArray;
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


- (void)buildSystematicWords
{
    //A
    
    Word *absolution = [[Word alloc] init];
    absolution.name = @"Absolution";
    absolution.definition = @"the act by which a priest declares the forgiveness of sins";
    absolution.category = @"Systematic";
    
    Word *acolyte = [[Word alloc] init];
    acolyte.name = @"Acolyte";
    acolyte.definition = @"an assistant to a deacon";
    acolyte.category = @"Liturgical";
    
    Word *adoptionism = [[Word alloc] init];
    adoptionism.name = @"Adoptionism";
    adoptionism.definition = @"The belief that Jesus was not the Son of God by nature, but rather adopted by God at his baptism; held by the so-called Ebionites of the end of the first century...";
    adoptionism.category = @"Historical";

    
    Word *accident = [[Word alloc] init];
    accident.name = @"Accident";
    accident.definition = @"In Aristotelean philosophy, a nonessential property or quality of an object that is dependent upon the substance of the object for its existence. Thomas Aquinas used this concept to support his theory of “transubstantiation” of the Eucharist.\r\rSee http://en.wikipedia.org/wiki/Accident_(philosophy)";
    accident.category = @"Systematic";
    
    Word *asceticism = [[Word alloc] init];
    asceticism.name = @"Asceticism";
    asceticism.definition = @"Theh practice of self-denial for a higher purpose.";
    asceticism.category = @"Systematic";
    
    Word *adoption = [[Word alloc] init];
    adoption.name = @"Adoption";
    adoption.definition = @"A biblical metaphor used to refer to the process of entering into a new relationship with God through Jesus Christ. \r\rSee Catechism of the Catholic Church, 1. http://www.vatican.va/archive/ccc_css/archive/catechism/prologue.htm#1";
    adoption.category = @"Systematic";
    
    Word *agape = [[Word alloc] init];
    agape.name = @"Agape";
    agape.definition = @"1. The Greek word (αγαπη) meaning “universal and unconditional will for the good of another”. The gospel writers use this word to describe Jesus' teaching on the love of God as well as the love for God, neighbors and enemies (Matthew 5:44, 22:37, 39). 2. The early Christian communal meal after which the Eucharist was celebrated (Jude 1:12). \r\rSee “Deus Caritas Est” by Pope Benedict XVI. http://www.vatican.va/holy_father/benedict_xvi/encyclicals/documents/hf_ben-xvi_enc_20051225_deus-caritas-est_en.html";
    agape.category = @"Systematic";

    Word *aggiornomento = [[Word alloc] init];
    aggiornomento.name = @"Aggiornomento";
    aggiornomento.definition = @"An Italian word meaning 'to bring up to date' which became popular during and synonymous with the reforms of the Second Vatican Council (1962-1965); used by Pope John XXIII to describe the purpose of the Council.\r\rSee http://en.wikipedia.org/wiki/Aggiornamento#cite_note-3";
    aggiornomento.category = @"Systematic";
    
    Word *allegory = [[Word alloc] init];
    allegory.name = @"Allegory";
    allegory.definition = @"From the Greek word for “speaking by way of something else”, a reference to an interpretation of a text that goes beyond the literal meaning to find a deeper connection to a higher order of reality. \r\rSee Catechism of the Catholic Church, 117. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s1c2a3.htm.";
    allegory.category = @"Systematic";

    Word *analogy = [[Word alloc] init];
    analogy.name = @"Analogy";
    analogy.definition = @"A way of probing eternal truths. \r\rSee Catechism of the Catholic Church, 114. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s1c2a3.htm";
    analogy.category = @"Systematic";
    
    Word *anointing = [[Word alloc] init];
    anointing.name = @"Annointing of the Sick";
    anointing.definition = @"The sacrament of healing... \r\rSee Catechism of the Catholic Church, 1499. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c2a5.htm.";
    anointing.category = @"Systematic";
    
    Word *anthropocentrism = [[Word alloc] init];
    anthropocentrism.name = @"Anthropocentrism";
    anthropocentrism.definition = @"A method of theological enquiry from the starting point and within the horizon of the human experience. All theological claims are claims made by human beings in human language. Theology is relevant to human beings in so far as they concern human experience.";
    anthropocentrism.category = @"Systematic";
    
    Word *apocatastasis = [[Word alloc] init];
    apocatastasis.name = @"Apocatastasis";
    apocatastasis.definition = @"A Greek term meaning the restoration of all things; the belief that at the eschaton, God will restore all creation back into full Divine communion; the belief that all persons will be saved.";
    apocatastasis.category = @"Systematic";
    
    Word *apologetics = [[Word alloc] init];
    apologetics.name = @"Apologetics";
    apologetics.definition = @"The rational defense of the Christian faith; from the Greek words (apo) - “from” and (logia) - “reason”.";
    apologetics.category = @"Systematic";
    
    Word *apophatic = [[Word alloc] init];
    apophatic.name = @"Apophatic";
    apophatic.definition = @"Language that uses negation to describe God.";
    apophatic.category = @"Systematic";
    
    Word *apostolicity = [[Word alloc] init];
    apostolicity.name = @"Apostolicity";
    apostolicity.definition = @"The quality of the Church as being based on the Apostolic tradition; one of the four marks of the Church.";
    apostolicity.category = @"Systematic";
    
    Word *assumption = [[Word alloc] init];
    assumption.name = @"Assumption of Mary";
    assumption.definition = @"The dogma, defined by Pope Pius IX, which states that the Virgin Mary was assumed body and soul into heaven at the end of her earthly life.";
    assumption.category = @"Systematic";

    Word *atonement = [[Word alloc] init];
    atonement.name = @"Atonement";
    atonement.definition = @"The act of making restitution for inflicted harm; a theological interpretation of the death of Jesus of Nazrareth. \r\rSee Catechism of the Catholic Church, 616. http://www.vatican.va/archive/ccc_css/archive/catechism/p122a4p2.htm";
    atonement.category = @"Systematic";
    
    Word *adoration = [[Word alloc] init];
    adoration.name = @"Adoration";
    adoration.definition = @"The act of adoring Christ present in the Eucharist...";
    adoration.category = @"Liturgical";
    
    Word *angusDei = [[Word alloc] init];
    angusDei.name = @"Agnus Dei";
    angusDei.definition = @"Part of Mass that begins 'Lamb of God...'.";
    angusDei.category = @"Liturgical";
    
    Word *advent = [[Word alloc] init];
    advent.name = @"Advent";
    advent.definition = @"The first season of the liturgical year in the Church that prepares for the the celebration of the birth of Jesus; consists of 5 Sundays...";
    advent.category = @"Ecclesial";
    
    Word *alleluia = [[Word alloc] init];
    alleluia.name = @"Alleluia";
    alleluia.definition = @"A Latinized form of the phrase 'Praise the LORD'; spoken before the reading of the Gospel during the Mass; not spoken during the season of Lent...";
    alleluia.category = @"Liturgical";
    
    Word *altar = [[Word alloc] init];
    altar.name = @"Altar";
    altar.definition = @"The table upon which the Eucharist is placed during the act of consecration due to the interpretation of the death of Jesus as an atoning sacrifice. See Catechism of the Catholic Church, 1182.";
    altar.category = @"Liturgical";
    
    Word *ambo = [[Word alloc] init];
    ambo.name = @"Ambo";
    ambo.definition = @"The elevated platform behind which the lector, cantor, or homilist stands to sing, read, or speak to the congregation.";
    ambo.category = @"Liturgical";
    
    Word *amen = [[Word alloc] init];
    amen.name = @"Amen";
    amen.definition = @"A Hebrew word meaning 'may it be so'; traditionally said after a prayer as a form of agreement; derived from Jewish use in the synagogue and later in the New Testament where it is used to indicate the truthfulness of what is said.";
    amen.category = @"Liturgical";
    
    Word *anamnesis = [[Word alloc] init];
    anamnesis.name = @"Anamnesis";
    anamnesis.definition = @"Greek Word for 'rememberance', used in the Words of Institution; a performative act used to re-present the salvific death and resurrection of Jesus...";
    anamnesis.category = @"Liturgical";
    
    Word *anaphora = [[Word alloc] init];
    anaphora.name = @"Anaphora";
    anaphora.definition = @"The Greek term for 'offering'; the Eucharistic prayer of the Mass...";
    anaphora.category = @"Liturgical";
    
    Word *anathema = [[Word alloc] init];
    anathema.name = @"Anathema";
    anathema.definition = @"The Greek word for 'accursed'; the state of being out of visible communion with the Church";
    anathema.category = @"Systematic";
    
    Word *anglican = [[Word alloc] init];
    anglican.name = @"Anglican Communion";
    anglican.definition = @"The Church of England...";
    anglican.category = @"Historical";
    
    Word *annulment = [[Word alloc] init];
    annulment.name = @"Annulment";
    annulment.definition = @"An ecclesial declaration that a valid marriage never existed....";
    annulment.definition = @"Systematic";
    
    Word *antiphon = [[Word alloc] init];
    antiphon.name = @"Antiphon";
    antiphon.definition = @"the choral response sung during the entrace processional";
    antiphon.category = @"Liturgical";
    
    Word *apostlesCreed = [[Word alloc] init];
    apostlesCreed.name = @"Apostle's Creed";
    apostlesCreed.definition = @"The earliest form of the Rule of Faith; based on the Roman baptismal creed, dated to the year A.D. 150.";
    apostlesCreed.category = @"Historical";
    
    Word *arianism = [[Word alloc] init];
    arianism.name = @"Arianism";
    arianism.definition = @"The teaching of Arius that the Son was of a different substance than the Father (begotten vs. unbegotten) and thus, not fully divine.";
    arianism.category = @"Historical";
    
    [_dataArray addObjectsFromArray:@[absolution, accident, acolyte, adoption, adoptionism, adoration,advent, agape, aggiornomento, angusDei, allegory, alleluia, altar, ambo, amen, analogy, anamnesis, anaphora, anathema, anglican, annulment, anointing, antiphon, anthropocentrism, apocatastasis, apologetics, apophatic, apostlesCreed, apostolicity, arianism, asceticism, atonement]];
    
    //B
    
    Word *baptism = [[Word alloc] init];
    baptism.name = @"Baptism";
    baptism.definition = @"The sacrament of initiation into the Christian community in which faith is professed and sins are forgiven. \r\rSee Catechism of the Catholic Church, 1213. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c1a1.htm";
    baptism.category = @"Systematic";
    
    Word *blasphemy = [[Word alloc] init];
    blasphemy.name = @"Blasphemy";
    blasphemy.definition = @"A form of religious slander. \r\rSee Catechism of the Catholic Church, 2148. http://www.vatican.va/archive/ccc_css/archive/catechism/p3s2c1a2.htm";
    blasphemy.category = @"Systematic";
    
    Word *baptistry = [[Word alloc] init];
    baptistry.name = @"Baptistry";
    baptistry.definition = @"the place within a church used for baptism; usually referred to as a 'font'.";
    baptism.category = @"Liturgical";
    
    Word *basillica = [[Word alloc] init];
    basillica.name = @"Basillica";
    basillica.definition = @"term used to refer to a church in which the diocescan bishop presides; the Church inherited this architecture from the Roman Imperial administrative system.";
    basillica.category = @"Liturgical";
    
    Word *benedictus = [[Word alloc] init];
    benedictus.name = @"Benedictus";
    benedictus.definition = @"the prayer of Simeon contained within the gospel of Luke 2:29-32.";
    benedictus.category = @"Liturgical";
    
    Word *bishop = [[Word alloc] init];
    bishop.name = @"Bishop";
    bishop.definition = @"from the Greek 'episcopos' (overseer) - the third order of clerics in the Catholic tradition; one who presides over a diocese.";
    bishop.category = @"Systematic";
    
     
     [_dataArray addObjectsFromArray:@[baptism, baptistry, basillica, benedictus, bishop, blasphemy]];
    
    //C
    
    Word *canon = [[Word alloc] init];
    canon.name = @"Canon";
    canon.definition = @"The Greek word (κανον) meaning “measuring stick”; used metaphorically to refer to a standard or criterion regarded as authoritative within a community. The Bible is referred to as the canon of the Scriptures. \r\rSee Catechism of the Catholic Church, 101. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s1c2a3.htm. \r\rAlso see Pontifical Biblical Commission, “The Interpretation of the Bible in the Church, III.B”. http://catholic-resources.org/ChurchDocs/PBC_Interp-FullText.htm ";
    canon.category = @"Systematic";
    
    Word *catholicity = [[Word alloc] init];
    catholicity.name = @"Catholicity";
    catholicity.definition = @"The quality of being universal in scope; one of the four marks of the Church.";
    catholicity.category = @"Systematic";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - “annointed one”. \r\rSee Catechism of the Catholic Church, 436. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2c2a2.htm";
    Christ.category = @"Systematic";
    
    Word *christOfFaith = [[Word alloc] init];
    christOfFaith.name = @"Christ of Faith";
    christOfFaith.definition = @"The term applied to the risen Jesus that emphasized the discontinuity with his earthly form of existence";
    christOfFaith.category = @"Systematic";
    
    Word *Christology = [[Word alloc] init];
    Christology.name = @"Christology";
    Christology.definition = @"The study of the person and nature of Christ.";
    Christology.category = @"Systematic";
    
    Word *church = [[Word alloc] init];
    church.name = @"Church";
    church.definition = @"The community belonging to the Lord; the people of God; the community centered on the belief that Jesus of Nazraeth is the divine Savior of the world.";
    church.category = @"Systematic";
    
    Word *communicatio = [[Word alloc] init];
    communicatio.name = @"Communicatio Idiomatum";
    communicatio.definition = @"A Latin phrase that refers to the inter-communication of the divine and human natures in the person of Jesus.";
    communicatio.category = @"Systematic";
    
    Word *communion = [[Word alloc] init];
    communion.name = @"Communion of Saints";
    communion.definition = @"The unity among believers that exists in Christ...";
    communion.category = @"Systematic";

    Word *confession = [[Word alloc] init];
    confession.name = @"Confession";
    confession.definition = @"The sacrament of reconciliation... \r\rSee Catechism of the Catholic Church, 1424. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c2a4.htm";
    confession.category = @"Systematic";
    
    Word *confirmation = [[Word alloc] init];
    confirmation.name = @"Confirmation";
    confirmation.definition = @"The sacrament of reception of the Holy Spirit in which.... \r\rSee Catechism of the Catholic Church, 1285. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c1a2.htm";
    confirmation.category = @"Systematic";
    
    Word *conversion = [[Word alloc]init];
    conversion.name = @"Conversion";
    conversion.definition = @"The process of changing one's direction in life...";
    conversion.category = @"Systematic";
    
    Word *cosmological = [[Word alloc] init];
    cosmological.name = @"Cosmological Argument";
    cosmological.definition = @"One of the classical arguments for the existence of God, based on the First Cause argument. \r\rSee Stanford Encyclopedia of Philosophy, “Cosmological Argument”. http://plato.stanford.edu/entries/cosmological-argument/. \r\rThomas Aquinas, Summa Theologica, ST, Ia, q. 2 a. 3 co. http://www.fordham.edu/halsall/source/aquinas3.asp";
    cosmological.category = @"Systematic";
    
    Word *creation = [[Word alloc] init];
    creation.name = @"Creation";
    creation.definition = @"The universe...";
    creation.category = @"Systematic";
    
    Word *creationism = [[Word alloc] init];
    creationism.name = @"Creationism";
    creationism.definition = @"The belief that God created the earth and human beings directly, with no biological predecessors as described in the book of Genesis.\r\rSee “evolution” in the Cultural cateogry";
    creationism.category = @"Systematic";
    
    Word *creed = [[Word alloc] init];
    creed.name = @"Creed";
    creed.definition = @"The Latin word (credo) meaning “I believe” - a statement of belief; used to refer to the historical creeds of the Church, most notably the Apostle's and Nicene creed. \r\rSee Catechism of the Catholic Church, 187. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2.htm";
    creed.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[canon, catholicity, christOfFaith, Christology, church, communicatio, confession, confirmation, conversion, cosmological, creation, creationism, creed]];
    
    //D
    
    Word *deposit = [[Word alloc] init];
    deposit.name = @"Deposit of Faith";
    deposit.definition = @"The content of the Christian faith given by God to the Church through the Apostolic...";
    deposit.category = @"Systematic";
    
    Word *developmentDoc = [[Word alloc] init];
    developmentDoc.name = @"Development of Doctrine";
    developmentDoc.definition = @"The idea that the teaching of the Church can develop over time; first found in the writings of Vincent of Lerins and later re-emphasized by Cardinal John Henry Newman. \r\rSee John Henry Newman, “Essay on the Development of Doctrine”. http://www.newmanreader.org/Works/development/index.html.";
    developmentDoc.category = @"Systematic";
    
    Word *devil = [[Word alloc] init];
    devil.name = @"Devil";
    devil.definition = @"The personal malevolent spiritual being who became synonymous with Satan in inter-testamental years leading up to the life of Jesus...";
    devil.category = @"Systematic";
    
    Word *doctrine = [[Word alloc] init];
    doctrine.name = @"Doctrine";
    doctrine.definition = @"The teaching of the Church...";
    doctrine.category = @"Systematic";
    
    Word *dogma = [[Word alloc] init];
    dogma.name = @"Dogma";
    dogma.definition = @"A revealed truth...";
    dogma.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[deposit, developmentDoc, devil, doctrine, dogma]];
    
    //E
    
    Word *ecclesiology = [[Word alloc] init];
    ecclesiology.name = @"Ecclesiology";
    ecclesiology.definition = @"The study of the Church.";
    ecclesiology.category = @"Systematic";
    
    Word *ecumenism = [[Word alloc] init];
    ecumenism.name = @"Ecumenism";
    ecumenism.definition = @"A movement which gained popularity in the 20th century that emphasized shared beliefs among various Christian churches over and against differences.";
    ecumenism.category = @"Systematic";
    
    Word *election = [[Word alloc] init];
    election.name = @"Election";
    election.definition = @"The concept that Israel was chosen by God to be in a covenant relationship.";
    election.category = @"Systematic";
    
    Word *eschatology = [[Word alloc] init];
    eschatology.name = @"Eschatology";
    eschatology.definition = @"from the Greek “eschaton” (last thing) - the belief that history will have an end brought about by Divine intervention. \r\rSee Catechism of the Catholic Church, 673. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2c2a7.htm.";
    eschatology.category = @"Systematic";
    
    Word *essence = [[Word alloc] init];
    essence.name = @"Essence";
    essence.definition = @"A property that makes an object what it is. \r\rSee Standford Encyclopedia of Philosophy “Essential vs. Accidental Properties”. http://plato.stanford.edu/entries/essential-accidental/.";
    essence.category = @"Systematic";
    
    Word *eucharist = [[Word alloc] init];
    eucharist.name = @"Eucharist";
    eucharist.definition = @"The sacred community meal of bread and wine in which Christians believe Jesus is present. The belief that Jesus is present in the Eucharist predates any theory (e.g. transubstantiation) as to how he is present.\r\rSee Catechism of the Catholic Church, 1322. http://www.vatican.va/archive/ccc_css/archive/catechism/p2s2c1a3.htm";
    eucharist.category = @"Systematic";
    
    Word *exclusivism = [[Word alloc] init];
    exclusivism.name = @"Exclusivism";
    exclusivism.definition = @"The soteriological belief that only those people who have a made an explicit Christian confession will experience salvation.";
    exclusivism.category = @"Systematic";
    
    Word *exNihilo = [[Word alloc] init];
    exNihilo.name = @"Ex Nihilo";
    exNihilo.definition = @"from the Latin “out of nothing” - The belief that God created the world out of nothing. \r\rSee Catechism of the Catholic Church, 296. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2c1p4.htm.";
    exNihilo.category = @"Systematic";
    
    Word *exOpere = [[Word alloc] init];
    exOpere.name = @"Ex Opere Operato";
    exOpere.definition = @"Latin phrase for “from the work, worked”.";
    exOpere.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[ecumenism, election, eschatology, essence, eucharist, exclusivism, exNihilo, exOpere]];
    
    //F
    
    Word *faith = [[Word alloc] init];
    faith.name = @"Faith";
    faith.definition = @"1. Trust or confidence; 2. The content of a religious system (“The Christian faith”).";
    faith.category = @"Systematic";
    
    Word *fideism = [[Word alloc] init];
    fideism.name = @"Fideism";
    fideism.definition = @"The belief that....";
    fideism.category = @"Systematic";
    
    Word *fallibilism = [[Word alloc] init];
    fallibilism.name = @"Fallibilism";
    fallibilism.definition = @"The idea that humans can have inaccurate, yet justified beliefs about the world. \r\rSee Internet Ecyclopedia of Philosophy,“Fallibilism. http://www.iep.utm.edu/fallibil/";
    fallibilism.category = @"Systematic";
    
    Word *foreknowledge = [[Word alloc] init];
    foreknowledge.name = @"Foreknowledge";
    foreknowledge.definition = @"The belief that God knows future events; this idea features prominently in post-Exilic Hebrew literature and in the New Testament; associated philosophical problems include constraints on human freedom and the problem of evil. \r\rSee Catechism of the Catholic Church, 600. http://www.vatican.va/archive/ccc_css/archive/catechism/p122a4p2.htm. \r\rAlso see Stanford Encylopedia of Philosophy, “Foreknowledge and Free Will”. http://plato.stanford.edu/entries/free-will-foreknowledge/";
    foreknowledge.category = @"Systematic";
    
    Word *freewill = [[Word alloc] init];
    freewill.name = @"Free Will";
    freewill.definition = @"The ability to choose...";
    freewill.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[faith, fideism, fallibilism, foreknowledge, freewill]];
    
    //G
    
    Word *gospel = [[Word alloc] init];
    gospel.name = @"Gospel";
    gospel.definition = @"1. The message of the historical Jesus concerning the Kingdom of God; 2. The message about Jesus concerning the salvation of the world; 3. One of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John); from the Greek word ευαγγελιον (evangelion) - “good news”.";
    gospel.category = @"Systematic";
    
    Word *grace = [[Word alloc] init];
    grace.name = @"Grace";
    grace.definition = @"unmerited favor... \r\rSee Catechism of the Catholic Church, 1996. http://www.vatican.va/archive/ccc_css/archive/catechism/p3s1c3a2.htm";
    grace.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[gospel, grace]];
    
    //H
    
    Word *heaven = [[Word alloc] init];
    heaven.name = @"Heaven";
    heaven.definition = @"The state of complete union with God...";
    heaven.category = @"Systematic";
    
    Word *hell = [[Word alloc] init];
    hell.name = @"Hell";
    hell.definition = @"The state of complete separation from God...";
    hell.category = @"Systematic";
    
    Word *henotheism = [[Word alloc] init];
    henotheism.name = @"Henotheism";
    henotheism.definition = @"The belief that many gods exist while only one is served.";
    henotheism.category = @"Systematic";
    
    Word *heresy = [[Word alloc] init];
    heresy.name = @"Heresy";
    heresy.definition = @"The formal contradiction of orthodox belief...";
    heresy.category = @"Systematic";
    
    Word *hierarchy = [[Word alloc] init];
    hierarchy.name = @"Hierarchy of Truths";
    hierarchy.definition = @"The idea that some truths are more essential to salvation than others.";
    hierarchy.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[heaven, hell, henotheism, heresy, hierarchy]];
    
    //I
    
    Word *immanence = [[Word alloc] init];
    immanence.name = @"Immanence";
    immanence.definition = @"The quality of being within human experience.";
    immanence.category = @"Systematic";
    
    Word *idolatry = [[Word alloc] init];
    idolatry.name = @"Idolatry";
    idolatry.definition = @"The bestowal of ultimate value on that which is not ultimate.";
    idolatry.category = @"Systematic";
    
    Word *inclusivism = [[Word alloc] init];
    inclusivism.name = @"Inclusivism";
    inclusivism.definition = @"The belief that those who respond to the truth they have receieved will experience salvation; a soteriology developed by Karl Rahner in the mid-twentieth century.";
    inclusivism.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[immanence, idolatry, inclusivism]];
    
    //J
    
    Word *jesus = [[Word alloc] init];
    jesus.name = @"Jesus of Nazareth";
    jesus.definition = @"The first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.";
    jesus.category = @"Systematic";
    
    Word *justification = [[Word alloc] init];
    justification.name = @"Justification";
    justification.definition = @"The act of being put into a just relationship. Paul uses this word to describe those who believe in Jesus as the Christ...";
    justification.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[jesus, justification]];
    
    //K
    
    Word *kataphatic = [[Word alloc] init];
    kataphatic.name = @"Kataphatic";
    kataphatic.definition = @"Language which makes postiive claims about God.";
    kataphatic.category = @"Systematic";
    
    Word *kenosis = [[Word alloc] init];
    kenosis.name = @"Kenosis";
    kenosis.definition = @"The process of emptying; from the Greek word    ; used by Paul in his letter to the Philippians to describe the self-emptying of Jesus.";
    kenosis.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[kataphatic, kenosis]];
    
    //L
    
    Word *liberation = [[Word alloc]init];
    liberation.name = @"Liberation Theology";
    liberation.definition = @"The theological movement associated with the idea that the gospel is only authentic in the face of radical poverty.";
    liberation.category = @"Systematic";

    
    [_dataArray addObjectsFromArray:@[liberation]];
    
    //M
    
    Word *miracle = [[Word alloc] init];
    miracle.name = @"Miracle";
    miracle.definition = @"In common parlance, a supernatural event which defies scientific explanation.";
    miracle.category = @"Systematic";
    
    Word *monotheism = [[Word alloc] init];
    monotheism.name = @"Monotheism";
    monotheism.definition = @"The belief that only one God exists.";
    monotheism.definition = @"Systematic";
    
    Word *mystery = [[Word alloc] init];
    mystery.name = @"Mystery";
    mystery.definition = @"That which transcends human comprehension and explanation.";
    mystery.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[miracle, monotheism, mystery]];
    
    //N
    
    Word *naturalTheo = [[Word alloc] init];
    naturalTheo.name = @"Natural Theology";
    naturalTheo.definition = @"The study of God by inference from the facts of the physical world.";
    naturalTheo.category = @"Systematic";
    
    Word *numinous = [[Word alloc] init];
    numinous.name = @"Numinous";
    numinous.definition = @"The category of religous experience as defined by Rudoph Otto.";
    numinous.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[naturalTheo, numinous]];
    
    //O
    
    Word *omnibenevolence = [[Word alloc] init];
    omnibenevolence.name = @"Omnibenevolence";
    omnibenevolence.definition = @"The quality of being all-loving.";
    omnibenevolence.category = @"Systematic";
    
    Word *omnipotence = [[Word alloc] init];
    omnipotence.name = @"Omnipotence";
    omnipotence.definition = @"The quality of being all-powerful.";
    omnipotence.category = @"Systematic";
    
    Word *omnipresence = [[Word alloc] init];
    omnipresence.name = @"Omnipresence";
    omnipresence.definition = @"The quality of being all-present";
    omnipresence.category = @"Systematic";
    
    Word *omniscience = [[Word alloc] init];
    omniscience.name = @"Omniscience";
    omniscience.definition = @"The quality of being all-knowing";
    omniscience.category = @"Systematic";
    
    Word *ontological = [[Word alloc] init];
    ontological.name = @"Ontological Argument";
    ontological.definition = @"The argument, first formulated by Anselm of Canterburry, that states God, as the greatest possible Being, is a necessary Being.";
    ontological.category = @"Systematic";
    
    Word *openTheism = [[Word alloc] init];
    openTheism.name = @"Open Theism";
    openTheism.definition = @"A theological movement characterized by the belief that there are logical limits on God's power and knowledge.";
    openTheism.category = @"Systematic";
    
    Word *orthodox = [[Word alloc] init];
    orthodox.name = @"Orthodox";
    orthodox.definition = @"A Greek word meaning 'straight belief....";
    orthodox.category = @"Systematic";
    
    Word *orthopraxis = [[Word alloc] init];
    orthopraxis.name = @"Orthopraxis";
    orthopraxis.definition = @"A Greek word meaning 'straight practice...";
    orthopraxis.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[omnibenevolence, omnipotence, omnipresence, omniscience, ontological, openTheism, orthodox, orthopraxis]];
    
    //P
    
    Word *person = [[Word alloc] init];
    person.name = @"Person";
    person.definition = @"A human being capable of self-transcendence";
    person.category = @"Systematic";
    
    Word *pluralism = [[Word alloc] init];
    pluralism.name = @"Pluralism";
    pluralism.definition = @"The belief that all religous claims are equally valid.";
    pluralism.category = @"Systematic";
    
    Word *polytheism = [[Word alloc] init];
    polytheism.name = @"Polytheism";
    polytheism.definition = @"The belief that many gods exist.";
    polytheism.category = @"Systematic";
    
    Word *predestination = [[Word alloc] init];
    predestination.name = @"Predestination";
    predestination.definition = @"The belief that God has fixed the destiny of certain individuals...";
    predestination.category = @"Systematic";
    
    Word *processTheo = [[Word alloc] init];
    processTheo.name = @"Process theology";
    processTheo.definition = @"The theological school of thought based primarily on the thought of Alfred North Whitehead.";
    processTheo.category = @"Systematic";

    [_dataArray addObjectsFromArray:@[person, pluralism, polytheism]];
    
    //Q
    
    Word *quintessence = [[Word alloc] init];
    quintessence.name = @"Quintessence";
    quintessence.definition = @"A term meaning “fifth essence”; used by Aristotle to refer to a substance higher than the four on earth.";
    quintessence.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[quintessence]];
    
    //R
    
    Word *redemption = [[Word alloc] init];
    redemption.name = @"Redemption";
    redemption.definition = @"The process of exchanging the economic value of an object.";
    redemption.category = @"Systematic";
    
    Word *ressourcement = [[Word alloc] init];
    ressourcement.name = @"Ressourcement";
    ressourcement.definition = @"A French term meaning “to return to the sources”; used by some theologians as the preferred interpretation of the purpose of Vatican II...\r\rSee 'aggiornomento'.";
    ressourcement.category = @"Systematic";
    
    Word *resurrection = [[Word alloc] init];
    resurrection.name = @"Resurrection";
    resurrection.definition = @"The belief which developed in post-Exilic Judaism, that God would raise the righteous to eternal life; the belief of the early Christians that Jesus of Nazareth was raised from the dead.";
    resurrection.category = @"Systematic";
    
     [_dataArray addObjectsFromArray:@[redemption, ressourcement, resurrection]];
    
    //S
    
    Word *salvation = [[Word alloc] init];
    salvation.name = @"Salvation";
    salvation.definition = @"The experience of being saved from sin and eventually death.";
    salvation.category = @"Systematic";
    
    Word *soteriology = [[Word alloc] init];
    soteriology.name = @"Soteriology";
    soteriology.definition = @"The study of salvation; a particular framework of salvation.";
    soteriology.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[salvation, soteriology]];

    
    //T
    
    Word *theodicy = [[Word alloc] init];
    theodicy.name = @"Theodicy";
    theodicy.definition = @"The question of God's justice in the face of suffering and evil.";
    theodicy.category = @"Systematic";
    
    Word *theologoumenon = [[Word alloc] init];
    theologoumenon.name = @"Theologoumenon";
    theologoumenon.definition = @"A theological opinion on a disputable matter that has not been defined in Church teaching...";
    theologoumenon.category = @"Systematic";
    
    Word *theology = [[Word alloc] init];
    theology.name = @"Theology";
    theology.definition = @"The study of God.";
    theology.category = @"Systematic";
    
    Word *theosis = [[Word alloc] init];
    theosis.name = @"Theosis";
    theosis.definition = @"The process of becoming like God, emphasized in the Easter Orthodox tradition.";
    theosis.category = @"Systematic";
    
    Word *tradition = [[Word alloc] init];
    tradition.name = @"Tradition";
    tradition.definition = @"The process of handing over beliefs and practices.";
    tradition.category = @"Systematic";
    
    Word *transcendence = [[Word alloc] init];
    transcendence.name = @"Transcendence";
    transcendence.definition = @"The quality of going beyond human experience.";
    transcendence.category = @"Systematic";
    
    Word *transub = [[Word alloc] init];
    transub.name = @"Transubstantiation";
    transub.definition = @"The belief, formulated by Thomas Aquinas, that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist.";
    transub.category = @"Systematic";
    
    Word *trinity = [[Word alloc] init];
    trinity.name = @"Trinity";
    trinity.definition = @"The belief that God exists in three persons...";
    trinity.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[theodicy, theologoumenon, theology, theosis, transcendence, trinity]];
    
    //U
    
    Word *universalism = [[Word alloc] init];
    universalism.name = @"Universalism";
    universalism.definition = @"The belief that all of humanity will ultimately experience salvation.";
    universalism.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[universalism]];
    
    //V
    
    Word *virgin = [[Word alloc] init];
    virgin.name = @"Virginal Conception";
    virgin.definition = @"The belief that Jesus of Nazareth was conceived by the Holy Spirit and born from the virgin Mary.";
    virgin.category = @"Systematic";
    
    Word *vocation = [[Word alloc] init];
    vocation.name = @"Vocation";
    vocation.definition = @"The calling by God of someone to a particular way of life.";
    vocation.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[virgin, vocation]];
    
    //W
    
    Word *word = [[Word alloc] init];
    word.name = @"Word of God";
    word.definition = @"The saving message of God in which humans trust.";
    word.category = @"Systematic";
    
    Word *will = [[Word alloc] init];
    will.name = @"Will of God";
    will.definition = @"The ultimate desire of God for creation....";
    will.category = @"Systematic";
    
    
    [_dataArray addObjectsFromArray:@[word, will]];

    
    //X
    
    
    //Y
    
    
    //Z

}

- (void)buildEcclesialWords
{
    //A
    
    Word *catechism = [[Word alloc] init];
    catechism.name = @"Catechism of the Catholic Church.";
    catechism.category = @"http://www.vatican.va/archive/ENG0015/_INDEX.HTM";
    
    Word *absolution = [[Word alloc] init];
    absolution.name = @"Absolution";
    absolution.definition = @"the act by which a priest declares the forgiveness of sins";
    absolution.category = @"Ecclesial";
    
    Word *acolyte = [[Word alloc] init];
    acolyte.name = @"Acolyte";
    acolyte.definition = @"an assistant to a deacon";
    acolyte.category = @"Ecclesial";
    
    Word *adoptionism = [[Word alloc] init];
    adoptionism.name = @"Adoptionism";
    adoptionism.definition = @"The belief that Jesus was not the Son of God by nature, but rather adopted by God at his baptism; held by the so-called Ebionites of the end of the first century...";
    adoptionism.category = @"Ecclesial";
    
    Word *adoration = [[Word alloc] init];
    adoration.name = @"Adoration";
    adoration.definition = @"The act of adoring Christ present in the Eucharist...";
    adoration.category = @"Ecclesial";
    
    Word *angusDei = [[Word alloc] init];
    angusDei.name = @"Angus Dei";
    angusDei.definition = @"Part of Mass that begins 'Lamb of God...'.";
    angusDei.category = @"Ecclesial";
    
    Word *advent = [[Word alloc] init];
    advent.name = @"Advent";
    advent.definition = @"The first season of the liturgical year in the Church that prepares for the the celebration of the birth of Jesus; consists of 5 Sundays...";
    advent.category = @"Ecclesial";
    
    Word *alleluia = [[Word alloc] init];
    alleluia.name = @"Alleluia";
    alleluia.definition = @"A Latinized form of the phrase 'Praise the LORD'; spoken before the reading of the Gospel during the Mass; not spoken during the season of Lent...";
    alleluia.category = @"Ecclesial";
    
    Word *altar = [[Word alloc] init];
    altar.name = @"Altar";
    altar.definition = @"The table upon which the Eucharist is placed during the act of consecration due to the interpretation of the death of Jesus as an atoning sacrifice. See Catechism of the Catholic Church, 1182.";
    altar.category = @"Ecclesial";
    
    Word *ambo = [[Word alloc] init];
    ambo.name = @"Ambo";
    ambo.definition = @"The elevated platform behind which the lector, cantor, or homilist stands to sing, read, or speak to the congregation.";
    ambo.category = @"Ecclesial";
    
    Word *amen = [[Word alloc] init];
    amen.name = @"Amen";
    amen.definition = @"A Hebrew word meaning 'may it be so'; traditionally said after a prayer as a form of agreement; derived from Jewish use in the synagogue and later in the New Testament where it is used to indicate the truthfulness of what is said.";
    amen.category = @"Ecclesial";
    
    Word *anamnesis = [[Word alloc] init];
    anamnesis.name = @"Anamnesis";
    anamnesis.definition = @"Greek Word for 'rememberance', used in the Words of Institution; a performative act used to re-present the salvific death and resurrection of Jesus...";
    anamnesis.category = @"Ecclesial";
    
    Word *anaphora = [[Word alloc] init];
    anaphora.name = @"Anaphora";
    anaphora.definition = @"The Greek term for 'offering'; the Eucharistic prayer of the Mass...";
    anaphora.category = @"Ecclesial";
    
    Word *anathema = [[Word alloc] init];
    anathema.name = @"Anathema";
    anathema.definition = @"The Greek word for 'accursed'; the state of being out of visible communion with the Church";
    anathema.category = @"Ecclesial";
    
    Word *anglican = [[Word alloc] init];
    anglican.name = @"Anglican Communion";
    anglican.definition = @"The Church of England...";
    anglican.category = @"Ecclesial";
    
    Word *annulment = [[Word alloc] init];
    annulment.name = @"Annulment";
    annulment.definition = @"An ecclesial declaration that a valid marriage never existed....";
    annulment.definition = @"Ecclesial";
    
    Word *antiphon = [[Word alloc] init];
    antiphon.name = @"Antiphon";
    antiphon.definition = @"the choral response sung during the entrace processional";
    antiphon.category = @"Ecclesial";
    
    Word *apostlesCreed = [[Word alloc] init];
    apostlesCreed.name = @"Apostle's Creed";
    apostlesCreed.definition = @"The earliest form of the Rule of Faith; based on the Roman baptismal creed, dated to the year A.D. 150.";
    apostlesCreed.category = @"Ecclesial";
    
    Word *arianism = [[Word alloc] init];
    arianism.name = @"Arianism";
    arianism.definition = @"The teaching of Arius that the Son was of a different substance than the Father (begotten vs. unbegotten) and thus, not fully divine.";
    arianism.category = @"Ecclesial";
    
    [_dataArray addObjectsFromArray:@[absolution, acolyte, adoptionism, adoration, advent, angusDei, altar, alleluia, amen, anaphora, anamnesis, anathema, anglican, annulment, antiphon, apostlesCreed, arianism]];
    
    //B
    
    Word *baptism = [[Word alloc] init];
    baptism.name = @"Baptism";
    baptism.definition = @"the intiation rite into the Church";
    baptism.category = @"Ecclesial";
    
   /*
    Word *baptistry = [[Word alloc] init];
    baptistry.name = @"Baptistry";
    baptistry.definition = @"the place within a church used for baptism; usually referred to as a 'font'.";
    baptism.category = @"Ecclesial";
    */
    
    Word *basillica = [[Word alloc] init];
    basillica.name = @"Basillica";
    basillica.definition = @"term used to refer to a church in which the diocescan bishop presides; the Church inherited this architecture from the Roman Imperial administrative system.";
    basillica.category = @"Ecclesial";
    
    Word *benedictus = [[Word alloc] init];
    benedictus.name = @"Benedictus";
    benedictus.definition = @"the prayer of Simeon contained within the gospel of Luke 2:29-32.";
    benedictus.category = @"Ecclesial";
    
    Word *bishop = [[Word alloc] init];
    bishop.name = @"Bishop";
    bishop.definition = @"from the Greek 'episcopos' (overseer) - the third order of clerics in the Catholic tradition; one who presides over a diocese.";
    bishop.category = @"Ecclesial";
    
    Word *blasphemy = [[Word alloc] init];
    blasphemy.name = @"Blasphemy";
    blasphemy.definition = @"religious slander";
    blasphemy.category = @"Ecclesial";
    
    [_dataArray addObjectsFromArray:@[baptism, basillica, benedictus, bishop, blasphemy]];
    
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
    protestant.category = @"Ecclesial";
    
    [_dataArray addObjectsFromArray:@[protestant]];
    
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
    abortion.category = @"Moral";
    
    Word *abstinence = [[Word alloc] init];
    abstinence.name = @"Abstinence";
    abstinence.definition = @"The restraining of oneself from a given activity; traditionally applied to sexual relations and food...";
    abstinence.category = @"Moral";
    
    Word *act = [[Word alloc] init];
    act.name = @"Act";
    act.definition = @"In moral theology, an truly “human” act refers to actions made with freedom and will.";
    act.category = @"Moral";
    
    Word *adultery = [[Word alloc] init];
    adultery.name = @"Adultery";
    adultery.definition = @"Marital infidelity or sexual relations between two people, one of which being married to another person";
    adultery.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[abortion, abstinence, act, adultery]];
    
    //B
    Word *beneficence = [[Word alloc] init];
    beneficence.name = @"Beneficence";
    beneficence.definition = @"The first principle in medical ethics; do no harm.";
    beneficence.category = @"Moral";
    
    Word *benefit = [[Word alloc] init];
    benefit.name = @"Benefit/Burden Ratio";
    benefit.definition = @"The ratio of benefits over the burdens of particular....";
    benefit.category = @"Moral";
    
    Word *bioethics = [[Word alloc] init];
    bioethics.name = @"Bioethics";
    bioethics.definition = @"The study of ethics related to life issues...";
    bioethics.category = @"Moral";
    
     [_dataArray addObjectsFromArray:@[beneficence, benefit, bioethics]];
    
    //C
    
    Word *casuistry = [[Word alloc] init];
    casuistry.name = @"Casuistry";
    casuistry.definition = @"the study of case law";
    casuistry.category = @"Moral";
    
    Word *catholicsocialteaching = [[Word alloc]init];
    catholicsocialteaching.name = @"Catholic Social Teaching";
    catholicsocialteaching.definition = @"the teaching of the Church which applies principles of social justice to the signs of the times";
    catholicsocialteaching.category = @"Moral";
    
    Word *commutativejustice = [[Word alloc]init];
    commutativejustice.name = @"Commutative Justice";
    commutativejustice.definition = @"one of the three types of justice which emphasizes obligations between individuals";
    commutativejustice.category = @"Moral";
    
    Word *contributivejustice = [[Word alloc]init];
    contributivejustice.name = @"Contributive Justice";
    contributivejustice.definition = @"one of the three types of justice which emphasizes the obligation of individuals toward society";
    contributivejustice.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[casuistry, catholicsocialteaching, commutativejustice, contributivejustice]];

    
    //D
    
    Word *dehumanization = [[Word alloc] init];
    dehumanization.name = @"Dehumanization";
    dehumanization.definition = @"The process of objectifying a human being, removing his or her dignity";
    dehumanization.category = @"Moral";
    
    Word *deontology = [[Word alloc] init];
    deontology.name = @"Deontology";
    deontology.definition = @"from the Greek word for “duty” (deon) - the study of ethics from the framework of moral duties in the form of rules and laws.";
    deontology.category = @"Moral";
    
    Word *dignity = [[Word alloc]init];
    dignity.name = @"Dignity";
    dignity.definition = @"The sacred status of human beings because of the constant love of God; one of the 7 Principles of Catholic Social Teaching.";
    dignity.category = @"Moral";
    
    Word *distributive = [[Word alloc] init];
    distributive.name = @"Distributive Justice";
    distributive.definition = @"The type of justice which emphasizes society's responsibilities to the individual.";
    distributive.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[dehumanization, deontology, dignity, distributive]];

    
    //E
    
    Word *economic = [[Word alloc] init];
    economic.name = @"Economic Justice";
    economic.definition = @"The right relationship between human beings to a given economic system.";
    economic.category = @"Moral";
    
    Word *ethics = [[Word alloc] init];
    ethics.name = @"Ethics";
    ethics.definition = @"the study of moral systems";
    ethics.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[economic, ethics]];

    
    //F
    
    //G
    
    //H
    
    Word *humanRights = [[Word alloc] init];
    humanRights.name = @"Human Rights";
    humanRights.definition = @"rights due to a person by virtue of his or her being a human being; thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights. \r\rSee Compendium of the Social Doctrine of the Church, 152. http://www.vatican.va/roman_curia/pontifical_councils/justpeace/documents/rc_pc_justpeace_doc_20060526_compendio-dott-soc_en.html";
    humanRights.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[humanRights]];

    
    //I
    
    //J
    
    Word *justice = [[Word alloc] init];
    justice.name = @"Justice";
    justice.definition = @"the state of right relationships between individuals and groups in society.";
    justice.category = @"Moral";
    
    Word *jusAdBellum = [[Word alloc] init];
    jusAdBellum.name = @"Jus Ad Bellum";
    jusAdBellum.definition = @"Latin for “justice to war” - a set of criteria used to determine if war is justified in a given situation: just cause, comparative justice, competent authority, right intention, probability of success, last resort, proportionality; see “Just War Theory”.";
    jusAdBellum.category = @"Moral";
    
    Word *jusImBello = [[Word alloc] init];
    jusImBello.name = @"Jus Im Bello";
    jusImBello.definition = @"Latin for “justice in war” - a set of criteria used to determine if the methods of war are justified: distinction, proportionality, military necessity; see “Just War Theory”.";
    jusImBello.category = @"Moral";
    
    Word *justWar = [[Word alloc] init];
    justWar.name = @"Just War Theory";
    justWar.definition = @"The theory first developed by Augustine and later refined by Aquinas which consists of criteria for determining the justice of both the conditions and methods of war; see “jus ad bellum” and “jus im bello”.";
    justWar.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[justice, jusAdBellum, jusImBello, justWar]];

    
    //K
    
    //L
    
    //M
    
    Word *morality = [[Word alloc] init];
    morality.name = @"Morality";
    morality.definition = @"customary norms of behavior considered good or evil, right or wrong in a given system.";
    morality.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[morality]];

    
    //N
    
    //O
    
    //P
    
    //Q
    
    //R
    
    //S
    
    Word *social = [[Word alloc] init];
    social.name = @"Social Justice";
    social.definition = @"The type of justice which prioritizes the common good with a preferential option for the poor and marginalized.";
    social.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[social]];
    
    //T
    
    //U
    
    Word *universal = [[Word alloc] init];
    universal.name = @"Universal Destination of Goods";
    universal.definition = @"The idea that the goods of the earth are intended to be justly distributed among its inhabitants according to the will of the Creator. \r\rSee The Compendium of the Social Doctrine of the Church, 171";
    universal.category = @"Moral";
    
    [_dataArray addObjectsFromArray:@[universal]];

    
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
    abba.category = @"Biblical";
    
    Word *adonai = [[Word alloc] init];
    adonai.name = @"Adonai";
    adonai.definition =@"The Hebrew word for “Ruler”; used as a synonym for YHWH.";
    adonai.category = @"Biblical";
    
    Word *anawim = [[Word alloc] init];
    anawim.name = @"Anawim";
    anawim.definition = @"The Hebrew word for the poor and marginalized in ancient Israel who trust completely in the mercy of God (Is. 10:2, Zeph 2:3)..";
    anawim.category = @"Biblical";
    
    Word *anthropomorphism = [[Word alloc] init];
    anthropomorphism.name = @"Anthropomorphism";
    anthropomorphism.definition = @"The attribution of human characteristics to a non-human object. The J Source uses anthropomorphism extensively in its portrayal of YHWH.";
    anthropomorphism.category = @"Biblical";
    
    /*
     Word *antiochusWord = [[Word alloc]init];
     antiochusWord.name = @"Antiochus IV";
     antiochusWord.definition = @"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
     */
    
    Word *apocalypse = [[Word alloc] init];
    apocalypse.name = @"Apocalypse";
    apocalypse.definition = @"1. The revelation of something previously hidden, used by Paul to refer to his experience of the risen Jesus. 2. The name of the last book of the New Testament - from the Greek word αποκαλυπσις (apokalypsis) - “unveiling”.";
    apocalypse.category = @"Biblical";
    
    Word *apocrypha = [[Word alloc] init];
    apocrypha.name = @"Apocrypha";
    apocrypha.definition = @"The 7 books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom - from the Greek word for “hidden”";
    apocrypha.category = @"Biblical";
    
    Word *apodictic = [[Word alloc] init];
    apodictic.name = @"Apodictic";
    apodictic.definition = @"A type of law which is based on a moral norm or command; see Exodus 20, “Decalogue”.";
    apodictic.category = @"Biblical";
    
    /*
     Word *apollosWord = [[Word alloc]  init];
     apollosWord.name = @"Apollos";
     apollosWord.definition = @"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
     */
    
    Word *apostle = [[Word alloc] init];
    apostle.name = @"Apostle";
    apostle.definition = @"The disciples which compirised Jesus' inner cirlce and whom he commissioned to spread the good news of the Kingdom of God; also used by Paul to refer to anyone who had seen the risen Christ - from the Greek word αποστολος (apostolos) - “delegate”.";
    apostle.category = @"Biblical";
    
    Word *aqeda = [[Word alloc] init];
    aqeda.name = @"Aqeda";
    aqeda.definition = @"The story of the binding and near-sacrifice of Isaac by Abraham - from Hebrew word for “binding”.";
    aqeda.category = @"Biblical";
    
    Word *aramaic = [[Word alloc] init];
    aramaic.name = @"Aramaic";
    aramaic.definition = @"A variant of Hebrew, likely the native language of the historical Jesus.";
    aramaic.category = @"Biblical";
    
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
    asherah.category = @"Biblical";
    
    Word *assyria = [[Word alloc] init];
    assyria.name = @"Assyria";
    assyria.definition = @"One of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 BCE.";
    assyria.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[abba, adonai, anawim, anthropomorphism, apocalypse, apocrypha, apodictic, apostle, aqeda, aramaic, asherah, assyria]];

    
    //B
    
    Word *baal = [[Word alloc]  init];
    baal.name = @"Ba'al";
    baal.definition = @"In Canannite mythology, the son of El and most active of the gods; according to to 2 Kings 23:4 an image of Ba'al was housed in the Temple before Josiah's Deuternomic reform.";
    baal.category = @"Biblical";
    
    Word *babel = [[Word alloc] init];
    babel.name = @"Babel";
    babel.definition = @"The Hebrew word for “confusion”; named for Tower eitiology in Gen. 11.";
    babel.category = @"Biblical";
    
    
    Word *babylon = [[Word alloc] init];
    babylon.name = @"Babylon";
    babylon.definition = @"The empire that conquered the southern kingdom of Judah in 587 BCE.";
    babylon.category = @"Biblical";
    
    Word *ban = [[Word alloc] init];
    ban.name = @"Ban";
    ban.definition = @"The ancient Israelite practice of the wholesale destruction of a people and their environment";
    ban.category = @"Biblical";
    
    /*
     Word *bathshebaWord = [[Word alloc] init];
     bathshebaWord.name = @"Bathsheba";
     bathshebaWord.definition = @"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
     */
    
    Word *bible = [[Word alloc] init];
    bible.name = @"Bible";
    bible.definition = @"The collection of the Old and New Testaments regarded as canonical and inspired within Catholicism. From the Greek word βιβλος (biblos) - “scroll”.";
    bible.category = @"Biblical";
    
    Word *biblicalCriticism = [[Word alloc] init];
    biblicalCriticism.name = @"Biblical Criticism";
    biblicalCriticism.definition = @"The process of discovering what can be known about the context of any biblical book or passage in order to understand its original meaning.";
    biblicalCriticism.category = @"Biblical";
    
    Word *bethel = [[Word alloc] init];
    bethel.name = @"Beth-El";
    bethel.definition = @"A sacred site within the patriarchal story cycles in Genesis - from the Hebrew for “House of El”.";
    bethel.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[baal, babel, babylon, ban, bible, bethel]];
    
    //C
    
    Word *callNarrative = [[Word alloc] init];
    callNarrative.name = @"Call Narrative";
    callNarrative.definition = @"A literary form used throughout the Bible in which a person is called by God for a specific task; consisting of three parts: call, concern, commission. The stories of Moses, Jeremiah, and Isaiah all involve a call narrative.";
    callNarrative.category = @"Biblical";
    
    Word *canon = [[Word alloc] init];
    canon.name = @"Canon";
    canon.definition = @"A collection of texts regarded as authoritative for faith and practice within a community - from the Greek word κανον (kanon) - “measuring stick“.";
    canon.category = @"Biblical";
    
    Word *charism = [[Word alloc] init];
    charism.name = @"Charism";
    charism.definition = @"According to the Apostle Paul, the spiritual gifts that come with Christian experience of the Holy Spirit - from the Greek word χαρισμα (charisma) - “gift”. See 1 Corinthians 12.";
    charism.category = @"Biblical";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians - from the Greek word χριστος (christos) - “annointed one”. \r\rSee Catechism of the Catholic Church, 436. http://www.vatican.va/archive/ccc_css/archive/catechism/p1s2c2a2.htm";
    Christ.category = @"Biblical";
    
    Word *circumcision = [[Word alloc] init];
    circumcision.name = @"Circumcision";
    circumcision.definition = @"The ritual cutting of the male foreskin; the sign of the covenant according to the Priestly author, described in Genesis 17.";
    circumcision.category = @"Biblical";
    
    Word *codex = [[Word alloc] init];
    codex.name = @"Codex";
    codex.definition = @"A collection of manuscripts.";
    codex.category = @"Biblical";
    
    Word *covenant = [[Word alloc] init];
    covenant.name = @"Covenant";
    covenant.definition = @"A sacred contract or agreement - used to refer to the relationship between YHWH and Israel in the Old Testament and between God and humanity in the New Testament.";
    covenant.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[callNarrative, canon, charism, Christ, circumcision, codex, covenant]];
    
    //D
    
    Word *decalogue = [[Word alloc] init];
    decalogue.name = @"Decalogue";
    decalogue.definition = @"The term given to the 10 Commandments in Exodus 20 - from the Greek words δεκα (deka) - “ten” and λογος (logos) - “word”";
    decalogue.category = @"Biblical";
    
    Word *deiVerbum = [[Word alloc] init];
    deiVerbum.name = @"Dei Verbum";
    deiVerbum.definition = @"One of the four dogmatic constitutions of the Second Vatican Council (1962-1965); it is the most definitive statement on the Church's belief in Divine revelation, the Scriptures and Tradition.";
    deiVerbum.category = @"Biblical";
    
    Word *deuteronomicHistory = [[Word alloc] init];
    deuteronomicHistory.name = @"Deuteronomic History";
    deuteronomicHistory.definition = @"The term given to the seven books, beginning with the book of Deuteronomy and extending through 2 Kings in the Hebrew Bible, which details the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel.";
    deuteronomicHistory.category = @"Biblical";
    
    Word *deuteronomicSource = [[Word alloc] init];
    deuteronomicSource.name = @"Deuteronomic Source";
    deuteronomicSource.definition = @"The “D” source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See “Documentary Hypothesis.”";
    deuteronomicSource.category = @"Biblical";
    
    Word *deuteronomy = [[Word alloc] init];
    deuteronomy.name = @"Deuteronomy";
    deuteronomy.definition = @"from the Greek words “deuteros” (second) and “nomos” (law) - the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.";
    deuteronomy.category = @"Biblical";
    
    Word *diachronic = [[Word alloc] init];
    diachronic.name = @"Diachronic";
    diachronic.definition = @"The type of truth within a text which transcends time and culture - from the Greek...";
    diachronic.category = @"Biblical";
    
    
    Word *documentaryHypothesis = [[Word alloc] init];
    documentaryHypothesis.name = @"Documentary Hypothesis";
    documentaryHypothesis.definition = @"The theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah; “Yahwist” (J), “Elohist” (E), “Priestly” (P), and “Deuteronomic” (D).";
    documentaryHypothesis.category = @"Biblical";
    
    Word *dynamic = [[Word alloc] init];
    dynamic.name = @"Dynamic Equivalence";
    dynamic.definition = @"A translation philosophy that seeks to render the text idea for idea.";
    dynamic.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[decalogue, deiVerbum, deuteronomicHistory, deuteronomicSource, diachronic, documentaryHypothesis, dynamic]];

    
    //E
    
    Word *eisegesis = [[Word alloc] init];
    eisegesis.name = @"Eisegesis";
    eisegesis.definition = @"Interpreting a text by reading into it one’s own ideas and presuppositions; the opposite of exegesis; from the Greek εις (eis) - “into” and αγω (ago) - “to go”.";
    eisegesis.category = @"Biblical";
    
    Word *el = [[Word alloc] init];
    el.name = @"El";
    el.definition = @"In Canaanite mythology, father of all the gods and husband of Asherah; referred to throughout the patriarchal sagas...";
    el.category = @"Biblical";
    
    Word *elohim = [[Word alloc] init];
    elohim.name = @"Elohim";
    elohim.definition = @"The Hebrew word for “gods”, “God” or “angels” depending on the context. The plural of “El”, it can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.";
    elohim.category = @"Biblical";
    
    Word *elohistSource = [[Word alloc] init];
    elohistSource.name = @"Elohist Source";
    elohistSource.definition = @"The “E” source; comprising various texts throughout Genesis, Exodus, and Numbers; uses 'Elohim' as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.";
    elohistSource.category = @"Biblical";
    
    Word *epistle = [[Word alloc] init];
    epistle.name = @"Epistle";
    epistle.definition = @"A letter sent by an apostle.";
    epistle.category = @"Biblical";
    
    Word *etiology = [[Word alloc] init];
    etiology.name = @"Etiology";
    etiology.definition = @"A traditional story that explains a contemporary situation.";
    etiology.category = @"Biblical";
    
    Word *evangelist = [[Word alloc] init];
    evangelist.name = @"Evangelist";
    evangelist.definition = @"A person who spreads good news; 2. One of the authors of the four gospels.";
    evangelist.category = @"Biblical";
    
    Word *exegesis = [[Word alloc] init];
    exegesis.name = @"Exegesis";
    exegesis.definition = @"The process of determining the meaning of a text in its original context; a necessary element of hermeneutics; from the Greek εξ (ex) - “out” and αγω (ago) - “to go”.";
    exegesis.category = @"Biblical";
    
    Word *exile = [[Word alloc] init];
    exile.name = @"Exile";
    exile.definition = @"The banishment of the southern kingdom of Judah to Babylon in 587 BCE.";
    exile.category = @"Biblical";
    
    Word *exodus = [[Word alloc] init];
    exodus.name = @"Exodus";
    exodus.definition = @"1. The liberation of the Israelite slaves from Egypt under the leadership of Moses; traditionally dated to ca. 1275 BCE in the reign of Ramases II; the Exodus is the foundational event of the Israelite nation; current biblical research supports the idea of a small group of slaves leaving Egypt, having a Divine revelation in Midian, and traveling to Canaan. 2. The second book of the Torah.";
    exodus.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[eisegesis, el, elohim, elohistSource, epistle, etiology, evangelist, exegesis, exile, exodus]];

    
    //F
    
    
    Word *folio = [[Word alloc] init];
    folio.name = @"Folio";
    folio.definition = @"A page within a manuscript.";
    folio.category = @"Biblical";
    
    Word *formalEquivalence = [[Word alloc] init];
    formalEquivalence.name = @"Formal Eqivalence";
    formalEquivalence.definition = @"A translation philosophy that seeks to render the text word for word.";
    formalEquivalence.category = @"Biblical";
    
    Word *formCriticism = [[Word alloc] init];
    formCriticism.name = @"Form Criticism";
    formCriticism.definition = @"A type of criticism which deciphers and analyzes a text's genre or literary form; mentioned as necessary exegesis in Dei Verbum, 12: “To search out the intention of the sacred writers, attention should be given, among other things, to 'literary forms'. For truth is set forth and expressed differently in texts which are variously historical, prophetic, poetic, or of other forms of discourse.”";
    formCriticism.category = @"Biblical";
    
    Word *fundamentalism = [[Word alloc] init];
    fundamentalism.name = @"Fundamentalism";
    fundamentalism.definition = @"1. A hermeneutical method which exclusively uses a literalist criterion for intepretation of a text; 2. An anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith.";
    fundamentalism.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[folio, formalEquivalence, formCriticism, fundamentalism]];

    
    //G
    
    Word *gehenna = [[Word alloc] init];
    gehenna.name = @"Gehenna";
    gehenna.definition = @"A valley near Jerusalem (the Valley of Hinnom) where a non-Israelite shrine to the Canaanite god Moloch once stood where human sacrifice by burning took place. It seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed); used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.";
    gehenna.category = @"Biblical";
    
    Word *genre = [[Word alloc] init];
    genre.name = @"Genre";
    genre.definition = @"A French word referring to the literary form of a text.";
    genre.category = @"Biblical";
    
    Word *gospel = [[Word alloc] init];
    gospel.name = @"Gospel";
    gospel.definition = @"1. The message of the historical Jesus concerning the Kingdom of God; 2. The message about Jesus concerning the salvation of the world; 3. One of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John); from the Greek word ευαγγελιον (evangelion) - “good news”.";
    gospel.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[gehenna, genre, gospel]];

    
    //H
    
    Word *hermeneutics = [[Word alloc] init];
    hermeneutics.name = @"Hermeneutics";
    hermeneutics.definition = @"The science of interpretation and process of determining meaning, usually of a text - from the name of the Greek god “Hermes”, the messenger of the gods.";
    hermeneutics.category = @"Biblical";
    
    Word *historicalBooks = [[Word alloc] init];
    historicalBooks.name = @"Historical Books";
    historicalBooks.definition = @"The second of four divisions within the Old Testament; contains 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, Nehemiah, Tobit, Judith, Esther, 1 & 2 Maccabees.";
    historicalBooks.category = @"Biblical";
    
    Word *hcm = [[Word alloc] init];
    hcm.name = @"Historical-Critical Method";
    hcm.definition = @"The hermeneutical method which seeks to uncover the intention of the author through exegetical analysis of history, language, literature, sources, and culture; according to the Pontifical Biblical Commission's “The Interpretation of the Bible in the Church”, it is the one essential method for Catholic hermeneutics.";
    hcm.category = @"Biblical";
    
    Word *historicalCriticism = [[Word alloc] init];
    historicalCriticism.name = @"Historical Criticism";
    historicalCriticism.definition = @"The type of exegetical criticism which deciphers and analyzes the historical context of a text.";
    historicalCriticism.category = @"Biblical";
    
    Word *holyOfHolies = [[Word alloc] init];
    holyOfHolies.name = @"Holy of Holies";
    holyOfHolies.definition = @"The innermmost area of the Temple in Jerusalem where the Ark of the Covenant was believed to reside from the monarchy of Solomon until the Exile in 587 BCE.";
    holyOfHolies.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[hermeneutics, historicalBooks, hcm, historicalCriticism, holyOfHolies]];

    
    //I
    
    Word *inspiration = [[Word alloc] init];
    inspiration.name = @"Inspiration";
    inspiration.definition = @"That which provides the “breath of life” or motivation behind a course of action. Divine Inspiration is therefore understood to mean that God has provided the “breath of life” or motivation for a course of action - from the Latin word for both “spirit” and “breath”.";
    inspiration.category = @"Biblical";
    
    Word *interpretation = [[Word alloc] init];
    interpretation.name = @"Interpretation";
    interpretation.definition = @"The explanation of the meaning, significance, and relevance of a text.";
    interpretation.category = @"Biblical";
    
    Word *israel = [[Word alloc] init];
    israel.name = @"Israel";
    israel.definition = @"The name given to Jacob which means “struggles with God”...";
    israel.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[inspiration, interpretation]];

    
    //J
    
    Word *jerusalem = [[Word alloc] init];
    jerusalem.name = @"Jerusalem";
    jerusalem.definition = @"The capital of the united monarchy established under David; the captial of the southern kingdom of Judah after the death of Solomon; the location of Mount Zion and the Temple.";
    jerusalem.category = @"Biblical";
    
    Word *jesus = [[Word alloc] init];
    jesus.name = @"Jesus of Nazareth";
    jesus.definition = @"The first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.";
    jesus.category = @"Biblical";
    
    Word *jew = [[Word alloc] init];
    jew.name = @"Jew";
    jew.definition = @"A member of the tribe of Judah; used to refer to any Israelite after the return from the Exile in 515 BCE.";
    jew.category = @"Biblical";
    
    Word *judah = [[Word alloc] init];
    judah.name = @"Judah";
    judah.definition = @"1. The fourth son of Jacob. 2. The southern kingdom established after the death of Solomon in 922 BCE.";
    judah.category = @"Biblical";
    
    Word *justification = [[Word alloc] init];
    justification.name = @"Justification";
    justification.definition = @"The state of being in a just or right relationship; synonymous with “righteousness”; used by Paul to refer to the state of believers in Jesus.";
    justification.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[jerusalem, jesus, jew, judah, justification]];

    
    //K
    
    Word *ketuvim = [[Word alloc] init];
    ketuvim.name = @"Ketuv'im";
    ketuvim.definition = @"The Hebrew word for “writings”; the third of three sections in the Tanak; see “Tanak”";
    ketuvim.category = @"Biblical";
    
    Word *kosher = [[Word alloc] init];
    kosher.name = @"Kosher";
    kosher.definition = @"Often translated as “clean”, this refers to foods that are “fitting” or “appropriate” to eat or be sacrificed to YHWH according to the Torah.";
    kosher.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[ketuvim, kosher]];

    
    //L
    
    Word *law = [[Word alloc] init];
    law.name = @"Law";
    law.definition = @"1. The first five books of the Torah containing a collection of various commandments and legal codes for the Israelites.";
    law.category = @"Biblical";
    
    Word *literary = [[Word alloc] init];
    literary.name = @"Literary Criticism";
    literary.definition = @"The type of exegetical criticism that deciphers and analyzes the literary characteristics of a text, including form, setting, plot, characterization, denouement, theme, and climax.";
    literary.category = @"Biblical";
    
    Word *lxx = [[Word alloc] init];
    lxx.name = @"LXX";
    lxx.definition = @"The numerical symbol for the Septuagint; named for the supposed 70 translators of the Tanak into Greek at the request of Alexander the Great.";
    lxx.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[law, literary, lxx]];

    
    //M
    
    Word *manuscript = [[Word alloc] init];
    manuscript.name = @"Manuscript";
    manuscript.definition = @"A hand-written copy of a text.";
    manuscript.category = @"Biblical";
   
    Word *messiah = [[Word alloc] init];
    messiah.name = @"Messiah";
    messiah.definition = @"Equivalent title to 'Christ”; used by the early Christians to refer to the divinely designated status of Jesus of Nazareth - from the Hebrew for “annointed one”.";
    messiah.category = @"Biblical";
    
    Word *mishnah = [[Word alloc] init];
    mishnah.name = @"Mishnah";
    mishnah.definition = @"An oral commentary on the Torah...";
    mishnah.category = @"Biblical";
    
    Word *myth = [[Word alloc] init];
    myth.name = @"Myth";
    myth.definition = @"A story that cannot be historically verified.";
    myth.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[manuscript, messiah, mishnah, myth]];

    
    //N
    
    Word *neviim = [[Word alloc] init];
    neviim.name = @"Nevi'im";
    neviim.definition = @"The Hebrew word for “Prophets”; the term given the second of the three sections of the Tanak.";
    neviim.category = @"Biblical";
    
    Word *newTestament = [[Word alloc] init];
    newTestament.name = @"New Testament";
    newTestament.definition = @"The second of two major sections of the Bible; 27 books dealing with the life of Jesus of Nazareth and his followers; contains the 4 gospels, the Acts of the Apostles, numerous epistles, and the Apocalypse.";
    newTestament.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[neviim, newTestament]];

    
    //O
    
    Word *oldTestament = [[Word alloc] init];
    oldTestament.name = @"Old Testament";
    oldTestament.definition = @"The first of two major sections of the Bible; 46 books dealing with the people of Israel; contains the Pentateuch, Historical Books, Wisdom Books, and Prophetic Books.";
    oldTestament.category = @"Biblical";
    
    Word *oracle = [[Word alloc] init];
    oracle.name = @"Oracle";
    oracle.definition = @"A prophetic medium...";
    oracle.category = @"Biblical";
    
    Word *oral = [[Word alloc] init];
    oral.name = @"Oral Rradition";
    oral.definition = @"The transmission of stories and beliefs by word of mouth.";
    oral.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[oldTestament, oracle, oral]];

    
    //P
    
    Word *parable = [[Word alloc] init];
    parable.name = @"Parable";
    parable.definition = @"A fable-like story that makes a theological claim; used frequently by Jesus in the synoptic gospels.";
    parable.category = @"Biblical";
    
    Word *papyrus = [[Word alloc] init];
    papyrus.name = @"Papyrus";
    papyrus.definition = @"A type of paper used for writing created from a plant...";
    papyrus.category = @"Biblical";
    
    Word *passover = [[Word alloc] init];
    passover.name = @"Passover";
    passover.definition = @"The feast that commemorates the exodus of the Israelites from slavery in Egypt...";
    passover.category = @"Biblical";
    
    Word *pentateuch = [[Word alloc] init];
    pentateuch.name = @"Pentateuch";
    pentateuch.definition = @"Another term for the first five books of the Old Testament, the Torah - from the Greek for “five scrolls”.";
    pentateuch.category = @"Biblical";
    
    Word *pericope = [[Word alloc] init];
    pericope.name = @"Pericope";
    pericope.definition = @"A given section of a larger text...";
    pericope.category = @"Biblical";
    
    Word *pharisee = [[Word alloc] init];
    pharisee.name = @"Pharisees";
    pharisee.definition = @"A Jewish group of laymen in the first century...";
    pharisee.category = @"Biblical";
    
    Word *priestly = [[Word alloc] init];
    priestly.name = @"Priestly Source";
    priestly.definition = @"The “P” Source; compirising various texts throughtout the Torah, but especially Leviticus. The Priestly material can be dated to around the time of Hezekiah; shows a major concern for order, numbers, and categories of holiness and cleanliness; the Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or “profane”; this source, along with E and D, does not accept the revelation of the name YHWH before the Mosaic epiphany in Exodus 3. The Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word “compassionate” to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author). \r\rSee http://en.wikipedia.org/wiki/Priestly_source";
    priestly.category = @"Biblical";
    
    Word *primeval = [[Word alloc] init];
    primeval.name = @"Primeval History";
    primeval.definition = @"Genesis chapters 1 - 11";
    primeval.category = @"Biblical";
    
    Word *prophet = [[Word alloc] init];
    prophet.name = @"Prophet";
    prophet.definition = @"One who speaks in place of God; used in the Old Testament to refer to either a court prophet (such as Nathan) or an independent prophet (such as Amos).";
    prophet.category = @"Biblical";
    
    Word *prophetic = [[Word alloc] init];
    prophetic.name = @"Prophetic Books";
    prophetic.definition = @"The fourth of four sections in the Old Testament...";
    prophetic.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[parable, papyrus, passover, pentateuch, pericope, pharisee, priestly, primeval, prophet, prophetic]];

    
    //Q
    
    Word *q = [[Word alloc] init];
    q.name = @"Q Source";
    q.definition = @"The hypothetical written source that lies behind the similar passages, exclusive to Matthew and Luke, which contain various teachings of Jesus; from the German word “quelle' - “source”.";
    q.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[q]];

    //R
    
    Word *redaction = [[Word alloc] init];
    redaction.name = @"Redaction Criticism";
    redaction.definition = @"The type of exegetical criticism that seeks to decipher and analyze the various stages of redaction of a text.";
    redaction.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[redaction]];

    
    //S
    
    Word *sadducees = [[Word alloc] init];
    sadducees.name = @"Sadducees";
    sadducees.definition = @"The elite class of Jerusalem-based Temple scribes....";
    sadducees.category = @"Biblical";
    
    
    Word *Satan = [[Word alloc] init];
    Satan.name = @"Satan";
    Satan.definition = @"The adversarial being found in post-Exilic Hebrew literature that serves to represent evil events...";
    Satan.category = @"Biblical";
    
    Word *septuagint = [[Word alloc] init];
    septuagint.name = @"Septuagint";
    septuagint.definition = @"The Greek translation of the Old Testament...";
    septuagint.category = @"Biblical";
    
    Word *source = [[Word alloc] init];
    source.name = @"Source Criticism";
    source.definition = @"The exegetical criticism that seeks to decipher and analyze the underlying source of a text.";
    source.category = @"Biblical";
    
    Word *synagogue = [[Word alloc] init];
    synagogue.name = @"Synagogue";
    synagogue.definition = @"The local place of weekly assembly for Jews during the Exile in Babylon; carried over into post-Exilic Judaism - from the Greek “to go together“.";
    synagogue.category = @"Biblical";
    
    Word *synchronic = [[Word alloc] init];
    synchronic.name = @"Synchronic";
    synchronic.definition  = @"The type of truth that is relative to the time of a text's composition, usually relating to the worldview of the author.";
    synchronic.category = @"Biblical";
    
    Word *synoptic = [[Word alloc] init];
    synoptic.name = @"Synoptic";
    synoptic.definition = @"A term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity of narrative and Christology contrasted with the gospel of John; from the Greek word συν (syn) - “together” and οπσις (opsis) - “appearance”";
    synoptic.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[Satan, septuagint, source, synagogue, synchronic, synoptic]];
    
    //T
    
    Word *tabernacle = [[Word alloc] init];
    tabernacle.name = @"Tabernacle";
    tabernacle.definition = @"The temporary dwelling place of YHWH.";
    tabernacle.category = @"Biblical";
    
    Word *tanak = [[Word alloc] init];
    tanak.name = @"Tanak";
    tanak.definition = @"Acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im. Since Hebrew has no vowels, those are added.";
    tanak.category = @"Biblical";
    
    Word *taxCollector = [[Word alloc] init];
    taxCollector.name = @"Tax Collectors";
    taxCollector.definition = @"Jews who collected provincial taxes for the Roman Empire; frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. They were reviled as traitors, likely cheats, and possible idolators. Jesus includes one such person (Matthew) in his inner circle of disciples.";
    taxCollector.category = @"Biblical";
    
    Word *temple = [[Word alloc] init];
    temple.name = @"Temple";
    temple.definition = @"The dwelling place of YHWH.";
    temple.category = @"Biblical";
    
    Word *textual = [[Word alloc] init];
    textual.name = @"Textual Criticism";
    textual.definition = @"The exegetical criticism that deciphers and analyzes the original language of a text.";
    textual.category = @"Biblical";
    
    Word *theophany = [[Word alloc] init];
    theophany.name = @"Theophany";
    theophany.definition = @"An appearance of God to a human being. Numerous theophanies are recorded throughout the Bible with the account of Moses being paradigmatic.";
    theophany.category = @"Biblical";
    
    Word *torah = [[Word alloc] init];
    torah.name = @"Torah";
    torah.definition = @"The first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy.";
    torah.category = @"Biblical";
    
    Word *typology = [[Word alloc] init];
    typology.name = @"Typology";
    typology.definition = @"A way of reading the Old Testament...";
    typology.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[tabernacle, tanak, taxCollector, temple, textual, theophany, torah, typology]];

    
    //U
    
    //V
    
    //W
    
    Word *wisdom = [[Word alloc] init];
    wisdom.name = @"Wisdom Literature";
    wisdom.definition = @"A type of literature that contains wise sayings and philosophical reflections on life.";
    wisdom.category = @"Biblical";
    
    Word *wisdomBooks = [[Word alloc] init];
    wisdomBooks.name = @"Poetic";
    wisdomBooks.definition = @"The third of four sections in the Old Testament; it consists mainly of various writings; contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.";
    wisdomBooks.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[wisdom, wisdomBooks]];

    
    //X
    
    //Y
    
    Word *yahwist = [[Word alloc] init];
    yahwist.name = @"Yahwist Source";
    yahwist.definition = @"The “J” Source...";
    yahwist.category = @"Biblical";
    
    Word *yhwh = [[Word alloc] init];
    yhwh.name = @"YHWH";
    yhwh.definition = @"The four letter personal name of the God of the Israelites, also called the 'Tetragrammaton'; it was likely pronounced 'Yah-way”; according to the E and P sources, this name was not known before it was revealed to Moses in Exodus chapter 3, the J source, however, uses it throughout Genesis, which is one argument for the Documentary Hypothesis.";
    yhwh.category = @"Biblical";
    
    Word *yomKippur = [[Word alloc] init];
    yomKippur.name = @"Yom Kippur";
    yomKippur.definition = @"The “Day of Atonement”; a day set aside on the Jewish calendar dedicated to bringing about reconciliation with YHWH; explained in detail in Leviticus 16.";
    yomKippur.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[yahwist, yhwh, yomKippur]];

    
    //Z
    
    Word *zealot = [[Word alloc] init];
    zealot.name = @"Zealots";
    zealot.definition = @"A Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces.";
    zealot.category = @"Biblical";
    
    Word *zion = [[Word alloc] init];
    zion.name = @"Zion";
    zion.definition = @"A synonym for the Temple mountain in Jerusalem or for the city of Jerusalem itself.";
    zion.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[zealot, zion]];

    
    
}

- (void)buildSocialWords //This category will be devoted to a theology of culture terms
{
    //A
    
    Word *aposteriori = [[Word alloc] init];
    aposteriori.name = @"A Posteriori";
    aposteriori.definition = @"A philosophical category which follows human experience. The statement “Water boils at 0 degrees Celsius” is an a posteriori truth. \r\rSee Stanford Encyclopedia of Philosophy, “A Priori Justification and Knowledge”. http://plato.stanford.edu/entries/apriori/.";
    aposteriori.category = @"Cultural";
    
    Word *apriori = [[Word alloc] init];
    apriori.name = @"A Priori";
    apriori.definition = @"A philosophical category which precedes human experience. The statement “All bachelors are unmarried' is an a priori truth. \r\rSee Stanford Encyclopedia of Philosophy, “A Priori Justification and Knowledge”. http://plato.stanford.edu/entries/apriori/.";
    apriori.category = @"Cultural";
    
    Word *action = [[Word alloc]init];
    action.name = @"Action";
    action.definition = @"The third of three steps in achieving justice.";
    action.category = @"Cultural";
    
    Word *agnostic = [[Word alloc] init];
    agnostic.name = @"Agnostic";
    agnostic.definition = @"From the Greek word for “not knowing”, a term used to describe uncertainty about the question of God's existence. \r\rSee Catechism of the Catholic Church, 2127. http://www.vatican.va/archive/ccc_css/archive/catechism/p3s2c1a1.htm.";
    agnostic.category = @"Cultural";
    
    Word *analysis = [[Word alloc] init];
    analysis.name = @"Analysis";
    analysis.definition = @"The second of the 3 steps in achieving justice.";
    analysis.category = @"Cultural";
    
    Word *anthropology = [[Word alloc] init];
    anthropology.name = @"Anthropology";
    anthropology.definition = @"The science that studies human origins, development, and culture.";
    anthropology.category = @"Cultural";
    
    Word *antisemitism = [[Word alloc] init];
    antisemitism.name = @"Anti-Semitism";
    antisemitism.definition = @"Prejudice, hatred, or racial bias against Jews. Some portions of the New Testament bear traces of anti-Semitism due to theological biases against the Jewish people for rejecting Christ. Thus, the Christian tradition has included anti-Semitic currents that have been rejected since the Second Vatican Council.";
    antisemitism.category = @"Cultural";
    
    Word *argument = [[Word alloc] init];
    argument.name = @"Argument";
    argument.definition = @"A series of statements that establishes a truth claim; made of two parts - premise and conclusion; the from can be deductive or inductive; deductive arguments can be valid or invalid. \r\rSee Internet Encylopedia of Philosophy, “Argument”. http://www.iep.utm.edu/argument/";
    argument.category = @"Cultural";
    
    Word *atheism = [[Word alloc] init];
    atheism.name = @"Atheism";
    atheism.definition = @"The belief that no God exists.";
    atheism.category = @"Cultural";
    
    Word *awareness = [[Word alloc] init];
    awareness.name = @"Awareness";
    awareness.definition = @"The first of 3 steps in achieving justice.";
    awareness.category = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[aposteriori, apriori, action, analysis, anthropology, antisemitism, argument, atheism, awareness]];
    
    //B
    
    Word *bigbang = [[Word alloc] init];
    bigbang.name = @"Big Bang Theory";
    bigbang.definition = @"The cosmological theory, first developed by Fr. George Lemaitre, that claims that the Universe began at an infintely small and dense point of matter, energy, space, and time which then expanded over the course of time to become the observable cosmos we see today. See 'Creation' in 'Systematic'.";
    bigbang.category = @"Cultural";
    
    Word *buddhism = [[Word alloc] init];
    buddhism.name = @"Buddhism";
    buddhism.definition = @"The philosophy and religion based on the teachings of Siddartha...";
    buddhism.category  = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[bigbang, buddhism]];

    
    //C
    
    Word *churchstate = [[Word alloc] init];
    churchstate.name = @"Church/State";
    churchstate.definition = @"The dichotomy used to express philosophical, theological, and legal differences in religious and political entities.";
    churchstate.category = @"Cultural";
    
    Word *colonialism = [[Word alloc] init];
    colonialism.name = @"Colonialism";
    colonialism.definition = @"The practice of settling foreign lands...";
    colonialism.category = @"Cultural";
    
    Word *commongood = [[Word alloc]init];
    commongood.name = @"Common Good";
    commongood.definition = @"the social condition in which all people are allowed to reach their full development";
    commongood.category = @"Cultural";
    
    Word *compatibilism = [[Word alloc] init];
    compatibilism.name = @"Compatiblism";
    compatibilism.definition = @"The belief that human freedom is compatible with deterministic elements of human experience. \r\rSee Standford Encyclopedia of Philosophy, “Compatibilism”. http://plato.stanford.edu/entries/compatibilism/.";
    compatibilism.category = @"Cultural";
    

    
    [_dataArray addObjectsFromArray:@[churchstate, colonialism, commongood, compatibilism]];
    
    //D
    
    Word *deism = [[Word alloc] init];
    deism.name = @"Deism";
    deism.definition = @"The belief that God created the world but does not intervene in the natural course of the world.";
    deism.category = @"Cultural";
    
    Word *determinism = [[Word alloc] init];
    determinism.name = @"Determinism";
    determinism.definition = @"The belief that all events, including human actions, are determined by physical phenomena, negating the concept of free-will. \r\rSee Stanford Encyclopedia of Philosophy, “Causal Determinism”. http://plato.stanford.edu/entries/determinism-causal/.";
    determinism.category = @"Cultural";
    
    Word *development = [[Word alloc]init];
    development.name = @"Development";
    development.definition = @"the process of becoming fully human";
    development.category = @"Cultural";
    
    Word *dualism = [[Word alloc] init];
    dualism.name = @"Dualism";
    dualism.definition = @"The belief that humans are composed of two substances, body and soul/mind; also known as substance dualism; found in the Platonic influence on Christianity and later in the writings of Descartes. Associated problems include the problem of causation and the seeming violation of the scientific law of the conservation of energy. \r\rSee Stanford Encyclopedia of Philosophy “Dualism”. http://plato.stanford.edu/entries/dualism/.";
    dualism.category = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[deism, determinism, development, dualism]];
    
    //E
    
    Word *elementary = [[Word alloc] init];
    elementary.name = @"Elementary Experience";
    elementary.definition = @"According to Fr. Luigi Giussani, the complex of needs and evidences that humans have for truth, justice, beauty, and goodness.";
    elementary.category = @"Cultural";
    
    Word *epistemology = [[Word alloc] init];
    epistemology.name = @"Epistemology";
    epistemology.definition = @"The study of the origin, nature, and limits of human knowledge; one of the three traditional subjects of Western philosophy. \r\rSee Stanford Encyclopedia of Philosophy “Epistemology”. http://plato.stanford.edu/entries/epistemology/";
    epistemology.category = @"Cultural";
    
    Word *existential = [[Word alloc] init];
    existential.name = @"Existentialism";
    existential.definition = @"1. Of or relating to existence. 2. A philosophical movement which gained popularity in the late 19th century...";
    existential.category = @"Cultural";
    
    Word *explanandum = [[Word alloc] init];
    explanandum.name = @"Explanandum";
    explanandum.definition = @"That which is explained by something else.";
    explanandum.category = @"Cultural";
    
    Word *explanans = [[Word alloc] init];
    explanans.name = @"Explanans";
    explanans.definition = @"That which explains something else...";
    explanans.category = @"Cultural";
    
     [_dataArray addObjectsFromArray:@[elementary, epistemology, existential]];
    
    //F
    
    Word *feminism = [[Word alloc] init];
    feminism.name = @"Feminism";
    feminism.definition = @"The movement that seeks female liberation from patriarchal structures and norms...";
    feminism.category = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[feminism]];

    
    //G
    
    //H
    
    Word *humanRights = [[Word alloc] init];
    humanRights.name = @"Human Rights";
    humanRights.definition = @"rights due to a person by virtue of his or her being a human being; thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights. \r\rSee Compendium of the Social Doctrine of the Church, 152. http://www.vatican.va/roman_curia/pontifical_councils/justpeace/documents/rc_pc_justpeace_doc_20060526_compendio-dott-soc_en.html";
    humanRights.category = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[humanRights]];
    
    
    //I
    
    //J
    
    //K
    
    //L
    
    Word *lawNC = [[Word alloc] init];
    lawNC.name = @"Law of Non-Contradiction";
    lawNC.definition = @"The logical axiom that states that A and ~A cannot both be true at the same time in the same way.";
    lawNC.category = @"Cultural";
    
    Word *living = [[Word alloc] init];
    living.name = @"living wage";
    living.definition = @"A form of income that is enables a worker to support his or her family. It should be noted that at the time Pope Leo XIII taught this in Rerum Novarum, women did not work.";
    living.category = @"Cultural";
    
    Word *logic = [[Word alloc] init];
    logic.name = @"Logic";
    logic.definition = @"The science of reasoning. \r\rSee “The Logic Web”, University of Oxford. http://logic.philosophy.ox.ac.uk/main.htm. Also see Wikipedia, “Logic”. http://en.wikipedia.org/wiki/Logic.";
    logic.category = @"Cultural";
    
     [_dataArray addObjectsFromArray:@[lawNC, living, logic]];
    
    //M
    
    Word *metaphysics = [[Word alloc] init];
    metaphysics.name = @"Metaphysics";
    metaphysics.definition = @"The study of the fundamental nature of reality; the study of ontology; a highly contested area of inquiry that has including a variation of topics throughout history since the time of Aristotle. \r\rSee Routledge Encyclopedia of Philosophy, “Metaphysics”. http://www.rep.routledge.com/article/N095";
    metaphysics.category = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[metaphysics]];

    
    //N
    
    Word *naturalism = [[Word alloc] init];
    naturalism.name = @"Naturalism";
    naturalism.definition = @"The belief that nature is all that exists and denies a supernatural order.";
    naturalism.category = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[naturalism]];

    
    //O
    
    //P
    
    Word *philosophy = [[Word alloc] init];
    philosophy.name = @"Philosophy";
    philosophy.definition = @"The critical examination of human thought; the love of wisdom.";
    philosophy.category = @"Cultural";
    
    Word *physicalism = [[Word alloc] init];
    physicalism.name = @"Physicalism";
    physicalism.definition = @"The belief that phenemena traditionally attributed to the soul can be more simply explained by the functioning of a brain";
    physicalism.category = @"Cultural";
    
    Word *problem = [[Word alloc] init];
    problem.name = @"Problem of Evil";
    problem.definition = @"The philosophical problem that results from belief in Divine omniscience, omnipotence, and omnibenevolence and the experience of suffering and evil in the world....";
    problem.category = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[philosophy, physicalism, problem]];

    
    //Q
    
    //R
    
    Word *religious = [[Word alloc] init];
    religious.name = @"Religious Naturalism";
    religious.definition = @"A movement within naturalism which emphasizes the scientific history of the universe as a core mythos around which revolve interpretive, spiritual, and moral axes.";
    religious.category = @"Cultural";
    
    Word *rerum = [[Word alloc] init];
    rerum.name = @"Rerum Novarum";
    rerum.definition = @"The encyclical of Pope Leo XIII in 1891 which responded to the after effects of the Industrial Revolution in Europe by teaching that private property is relative to the Common Good and that workers have a right to unionized and to a living wage.";
    rerum.category = @"Cultural";
    
     [_dataArray addObjectsFromArray:@[religious, rerum]];
    
    //S
    
    Word *semiotics = [[Word alloc] init];
    semiotics.name = @"Semiotics";
    semiotics.definition = @"The study of signs and symbols used as elements of communication...";
    semiotics.category = @"Cultural";
    
    Word *sociology = [[Word alloc] init];
    sociology.name = @"Sociology";
    sociology.definition = @"The study of society...";
    sociology.category = @"Cultural";
    
    
    Word *solidarity = [[Word alloc] init];
    solidarity.name = @"Solidarity";
    solidarity.definition = @"The idea that human beings share a fundamental unity which should be a criteria for determining justice.";
    solidarity.category = @"Cultural";
    
    Word *spirituality = [[Word alloc] init];
    spirituality.name = @"Spirituality";
    spirituality.definition = @"The conscious process of integration of one's life toward Ultimate value.";
    spirituality.category = @"Cultural";
    
    Word *structuralism = [[Word alloc] init];
    structuralism.name = @"Structuralism";
    structuralism.definition = @"The anthropological movement based on the work of Levi Strauss...";
    structuralism.category = @"Cultural";
    
    Word *supernormal = [[Word alloc] init];
    supernormal.name = @"Supernormal Allurements";
    supernormal.definition = @"The attraction to concentrated quantities of substances that allowed hu;manity to evolve and flourish, such as sugar, salt, and sex.";
    supernormal.category = @"Cultural";
    
    
    [_dataArray addObjectsFromArray:@[semiotics, sociology, solidarity, spirituality, structuralism, supernormal]];
    
    //T
    
    //U
    
    //V
    
    //W
    
    //X
    
    //Y
    
    //Z
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

