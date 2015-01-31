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

@property (nonatomic, strong) NSArray *lettersArray;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation WordDataSource

- (NSArray *)lettersArray
{
    if (!_lettersArray)
        {
        _lettersArray = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
        }
    return _lettersArray;
}

// build the array of words
- (NSMutableArray *)dataArray
{
    if (!_dataArray)
    {
        _dataArray = [NSMutableArray array];
    
        [self buildDictionaryWords];
    
    //this method sorts the arrray into alphabetical order!! - read up!!
    
        [_dataArray sortUsingComparator: ^NSComparisonResult(id obj1, id obj2)
        {
            Word *word1 = (Word *) obj1;
            Word *word2 = (Word *) obj2;
        
            return [word1.name compare:word2.name options:NSCaseInsensitiveSearch];
        }];
    }

    return _dataArray;
}

- (NSArray *)sectionArrayForSection:(NSInteger)section category:(NSString *)category
{
    // convert section into Letter
    NSString *letter = self.lettersArray[section];
    
    // get words that match the section and category - read up!!
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings)
    {
        
        BOOL match = NO;
        if ([evaluatedObject isKindOfClass:[Word class]])
            {
                Word *word = (Word *)evaluatedObject;
            
            if (category)
                {
                    match = [[word.category uppercaseString] isEqualToString:[category uppercaseString]] && [[word.name uppercaseString] hasPrefix:[letter uppercaseString]];
                }
            else
                {
                    match = [[word.name uppercaseString] hasPrefix:[letter uppercaseString]];
                }
            }
        return match;
    }];
    return [self.dataArray filteredArrayUsingPredicate:predicate];
}

- (NSInteger)numberOfSectionsInDataSourceCategory:(NSString *)category
{
    return self.lettersArray.count;
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
    return self.lettersArray[section];
}

- (NSArray *)sectionIndexTitlesForCategory:(NSString *)category
{
    return self.lettersArray;
}

- (NSInteger)sectionForSectionIndexTitle:(NSString *)title forCategory:(NSString *)category
{
    return [self.lettersArray indexOfObject:title];
}


- (void)buildDictionaryWords
{
    //A
    Word *abba = [[Word alloc] init];
    abba.name = @"Abba";
    abba.twitterDef = @"the Aramaic word meaning\r“Daddy”";
    abba.definition = @"This term was by Jesus in prayer to God according to the gospels. Paul claims that Christians also use the term because of their filial adoption; “Because you are sons, God has sent the Spirit of his Son into our hearts, crying, “Abba! Father!” See “Adoption”. (Gal 4:6)\r\rFurther Reference:\rCatechism of the Catholic Church, 683\rhttp://tinyurl.com/pqxxm8l";
    abba.category = @"Biblical";
    
    Word *adonai = [[Word alloc] init];
    adonai.name = @"Adonai";
    adonai.twitterDef = @"the Hebrew word meaning\r“Ruler” or “Master”";
    adonai.definition = @"This term is used as a synonym for YHWH in the Bible and in contemporary Judaism. See “YHWH”.\r\rFurther Reference:\rCatechism of the Catholic Church, 209\rhttp://tinyurl.com/bruqt9r";
    adonai.category = @"Biblical";
    
    Word *anawim = [[Word alloc] init];
    anawim.name = @"Anawim";
    anawim.twitterDef = @"the Hebrew word meaning\r“the poor”";
    anawim.definition = @"This term is used in the Hebrew Bible to refer to those who are poor, destitue, and marginalized who trust completely in the mercy of God (Is. 10:2, Zeph 2:3); frequently used in the Psalms.\r\rFurther Reference:\rJohn Paul II, General Audience, 5/23/2001\rhttp://tinyurl.com/lyfphvo";
    anawim.category = @"Biblical";
    
    Word *anthropomorphism = [[Word alloc] init];
    anthropomorphism.name = @"Anthropomorphism";
    anthropomorphism.twitterDef = @"the process of attributing human characteristics to God";
    anthropomorphism.definition = @"God is described in human terms throughout the Christian tradition, and especially within the Scriptures. The Yahwist Source uses anthropomorphism extensively in its portrayal of YHWH in the Torah. Such language is, however, ultimately, only analogous to God. See “Analogy”, “Yahwist Source”, “YHWH”.\r\rFurther Reference:\rWikipedia, “Anthropomorphism”\rhttp://tinyurl.com/ffpra";
    anthropomorphism.category = @"Biblical";
    
    /*
     Word *antiochusWord = [[Word alloc]init];
     antiochusWord.name = @"Antiochus IV";
     antiochusWord.definition = @"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
     */
    
    Word *apocalypse = [[Word alloc] init];
    apocalypse.name = @"Apocalypse";
    apocalypse.twitterDef = @"the Greek word meaning\r“unveiling”";
    apocalypse.definition = @"1. The revelation of something previously hidden, used by Paul to refer to his experience of the risen Jesus. 2. The name of the last book of the New Testament; from the Greek word αποκαλυπσις (apokalypsis) “unveiling”.\r\rFurther Reference:\rCatechism of the Catholic Church, 120\rhttp://tinyurl.com/kvc3tvq";
    apocalypse.category = @"Biblical";
    
    Word *apocrypha = [[Word alloc] init];
    apocrypha.name = @"Apocrypha";
    apocrypha.twitterDef = @"the Greek word meaning\r“hidden things”";
    apocrypha.definition = @"Apocrypha is the Protestant term for the 7 Old Testament books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom - from the Greek word αποκρυφα “hidden”.\r\rWikipedia, “Apocrypha”\rhttp://tinyurl.com/bddlr";
    apocrypha.category = @"Biblical";
    
    Word *apodictic = [[Word alloc] init];
    apodictic.name = @"Apodictic";
    apodictic.twitterDef = @"1. beyond dispute\r2. a type of law based on universal norms";
    apodictic.definition = @"Apodictic law are those such as the 10 Commandments. It is universally binding at all times and places. See Exodus 20, “Decalogue”\r\rFurther Reference:\rWikipedia, “Apodicticity”\rhttp://tinyurl.com/k7u8mkr";
    apodictic.category = @"Biblical";
    
    /*
     Word *apollosWord = [[Word alloc]  init];
     apollosWord.name = @"Apollos";
     apollosWord.definition = @"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
     */
    
    Word *apostle = [[Word alloc] init];
    apostle.name = @"Apostle";
    apostle.twitterDef = @"a disciple personally commissioned by Jesus";
    apostle.definition = @"The term Apostle is normally used to refer to the Twelve appointed from a larger group of disciples. It is also used by Paul to refer to anyone who had seen the risen Christ; from the Greek word αποστολος (apostolos) “delegate”.\r\rFurther Reference:\r“Disciples and Apostles in the New Testament” by Felix Just, S.J.\rhttp://tinyurl.com/mzcbt37";
    apostle.category = @"Biblical";
    
    Word *aqeda = [[Word alloc] init];
    aqeda.name = @"Aqeda";
    aqeda.twitterDef = @"the Hebrew word meaning\r“the binding of Isaac”";
    aqeda.definition = @"The story of the binding and near-sacrifice of Isaac by Abraham - from Hebrew word for “binding”. According to Richard Elliot Freidman, the Aqedah is mostly an Elohist Source story with a very different original ending that was amended by the Redactor of the Torah.\r\rFurther Reference:\rWikipedia, “Aqeda”\rhttp://tinyurl.com/56dxyl";
    aqeda.category = @"Biblical";
    
    Word *aramaic = [[Word alloc] init];
    aramaic.name = @"Aramaic";
    aramaic.twitterDef = @"a Semitic language similar to Hebrew";
    aramaic.definition = @"Aramaic was the native language of the historical Jesus.\r\rFurther Reference:\rWikipedia, “Aramaic”\rhttp://tinyurl.com/y2okx9";
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
    asherah.twitterDef = @"the Canaanite mother goddess & wife of El";
    asherah.definition = @"In Canaanite mythology, the wife of El and the goddess of fertility; mentioned numerous times throughout the Old Testament; according to 2 Kings 23:4 a large Asherah statue was housed in the Temple and dressed by her cult's prostitutes before Josiah's Deuteronomic reform.\r\rFurther Reference:\rWikipedia, “Asherah”\rhttp://tinyurl.com/6qf2tt";
    asherah.category = @"Biblical";

    
    Word *assyria = [[Word alloc] init];
    assyria.name = @"Assyria";
    assyria.twitterDef = @"the Empire that conquered the northen kingdom of Israel in 722 B.C.";
    assyria.definition = @"One of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 B.C.\r\rFurther Reference:\rWikipedia, “Assyria”\rhttp://tinyurl.com/2allao";
    assyria.category = @"Biblical";
    
    Word *abortion = [[Word alloc] init];
    abortion.name = @"Abortion";
    abortion.twitterDef = @"the willful killing of a human being in utero";
    abortion.definition = @"In the Catholic tradition, human beings are regarded as sacred from the moment of conception. The death of an unborn child as a consequence of other procedures deemed good in themselves is not considered an abortion per se but rather a consequence of the principle of double-effect. The Catholic tradition is consistent in its classification of abortion as a grave sin, the willful commision of which incurs an automatic excommunication. Abortion was legalized in the United States in 1973 by the Supreme Court in Roe v. Wade. See “Principle of Double-Effect”, “Roe v. Wade”\r\rFurther Reference:\rCatechism of the Catholic Church, 2270\rhttp://tinyurl.com/dh7r\r\rWikipedia, “Roe v. Wade”\rhttp://tinyurl.com/aqq5j";
    abortion.category = @"Moral";
    
    Word *abstinence = [[Word alloc] init];
    abstinence.name = @"Abstinence";
    abstinence.twitterDef = @"to purposely refrain from a given activity";
    abstinence.definition = @"The restraining of oneself from a given activity for the purpose of spiritual edification; traditionally applied to food and sexual activity.\r\rFurther Reference:\rCatechism of the Catholic Church, 2043\rhttp://tinyurl.com/l56b6h4";
    abstinence.category = @"Moral";
    
    Word *act = [[Word alloc] init];
    act.name = @"Act";
    act.twitterDef = @"a free act of the will";
    act.definition = @"In moral theology, an truly “human” act refers to actions made with freedom and will.\r\rFurther Reference:\rCatholic Moral Theology blog\rhttp://tinyurl.com/pyfcn3n";
    act.category = @"Moral";
    
    Word *adultery = [[Word alloc] init];
    adultery.name = @"Adultery";
    adultery.twitterDef = @"sexual relations with another person's spouse";
    adultery.definition = @"Marital infidelity or sexual relations between two people, one of which being married to another person.\r\rFurther Reference:\rCatechism of the Catholic Church, 2380\rhttp://tinyurl.com/cz1w ";
    adultery.category = @"Moral";

    Word *absolution = [[Word alloc] init];
    absolution.name = @"Absolution";
    absolution.twitterDef = @"the declaration that sins are forgiven";
    absolution.definition = @"The act by which a priest declares the forgiveness of sins.\r\rFurther Reference:\rCatechism of the Catholic Church, 1424\rhttp://tinyurl.com/l7xon9e";
    absolution.category = @"Systematic";
    
    Word *adoptionism = [[Word alloc] init];
    adoptionism.name = @"Adoptionism";
    adoptionism.twitterDef = @"the belief that Jesus was not divine by nature";
    adoptionism.definition = @"Adoptionism is the belief that Jesus was not the Son of God by nature, but rather adopted by God at his baptism. It was held by the so-called Ebionites of the end of the first century.\r\rFurther Reference:\rWikipedia, “Adoptionism”\rhttp://tinyurl.com/25fgze";
    adoptionism.category = @"Historical";
    
    Word *accident = [[Word alloc] init];
    accident.name = @"Accident";
    accident.twitterDef = @"a nonessential property of an object";
    accident.definition = @"In Aristotelean philosophy, a nonessential property or quality of an object that is dependent upon the substance of the object for its existence. Thomas Aquinas used this concept to support his theory of “transubstantiation” of the Eucharist.\r\rFurther Reference:\rWikipedia, “Accident”\rhttp://tinyurl.com/88ojytv";
    accident.category = @"Systematic";
    
    Word *asceticism = [[Word alloc] init];
    asceticism.name = @"Asceticism";
    asceticism.twitterDef = @"the practice of self-discipline";
    asceticism.definition = @"The practice of self-discipline for a higher purpose, often involving abstinence - from the Greek word ασκησις (askesis) - “training”. See “abstinence”.\r\rFurther Reference:\rWikipedia, “Asceticism”\rhttp://tinyurl.com/29eqh2";
    asceticism.category = @"Systematic";
    
    Word *adoption = [[Word alloc] init];
    adoption.name = @"Adoption";
    adoption.twitterDef = @"a biblical metaphor used to refer to the process of becoming a child of God";
    adoption.definition = @"In the New Testament, Paul uses this term to describe God's process of extending His family through Jesus Christ.\r\rFurther Reference:\rCatechism of the Catholic Church, 1\rhttp://tinyurl.com/o7udb4d";
    adoption.category = @"Systematic";
    
    Word *agape = [[Word alloc] init];
    agape.name = @"Agape";
    agape.twitterDef = @"the Greek word meaning\r“universal and unconditional love”";
    agape.definition = @"The gospel writers use agape to describe Jesus' teaching on the love for God, neighbors and enemies (Matthew 5:44, 22:37, 39). It is used by later New Testament writers to describe the love of God towards humanity as seen in the sacrificial death of Jesus and even the very nature of God. The early Christians also used “agape” to refer to their communal meal after which the Eucharist was celebrated (Jude 1:12); from the Greek αγαπη.\r\rFurther Reference:\rPope Benedict XVI, “Deus Caritas Est”\rhttp://tinyurl.com/p8ueefs";
    agape.category = @"Moral";

    Word *aggiornomento = [[Word alloc] init];
    aggiornomento.name = @"Aggiornomento";
    aggiornomento.twitterDef = @"an Italian word meaning\r“to bring up to date”";
    aggiornomento.definition = @"As a way to describe one of its emphases, it became popular during and synonymous with the reforms of the Second Vatican Council (1962-1965). It was used by Pope John XXIII to describe the agenda of Vatican II. John XXIII claimed:\r\r“The greatest concern of the Ecumenical Council is this: that he sacred deposit of Christian doctrine should be guarded and taught more efficaciously...In order, however, that this doctrine may influence the numerous fields of human activity, with reference to individuals, to families, and to socia life, it is necessary first of all that the Church should never depart from the sacred patrimony of truth received from the Fathers. But at the same time she must ever look to the present, to the new conditions and new forms of life introduced into the modern world, which have opened new avenues to the Catholic apostolate...which, however, should be studied and expounded through the methods of research and through the literary forms of modern thought. The substance of the ancient doctrine of the deposit of faith is one thing, and the way in which it is presented is another. And it is the latter that must be taken into great consideration with patience if necessary,everything being measured in the forms and proportions of a magisterium which is predominantly pastoral in character.”\r\rFurther Reference:\rWikipedia, “Aggiornomento”\rhttp://tinyurl.com/k6y4ylh";
    aggiornomento.category = @"Systematic";
    
    Word *allegory = [[Word alloc] init];
    allegory.name = @"Allegory";
    allegory.twitterDef = @"an interpretation that seeks higher orders of meanining";
    allegory.definition = @"From the Greek word for “speaking by way of something else”, a reference to an interpretation of a text that goes beyond the literal meaning to find a deeper connection to a higher order of reality.\r\rFurther Reference:\rCatechism of the Catholic Church, 117\rhttp://tinyurl.com/kvc3tvq";
    allegory.category = @"Systematic";

    Word *analogy = [[Word alloc] init];
    analogy.name = @"Analogy";
    analogy.twitterDef = @"a way of comparing two kinds of things";
    analogy.definition = @"A way of probing eternal truths.\r\rFurther Reference:\rCatechism of the Catholic Church, 114\rhttp://tinyurl.com/kvc3tvq";
    analogy.category = @"Systematic";
    
    Word *anointing = [[Word alloc] init];
    anointing.name = @"Annointing of the Sick";
    anointing.twitterDef = @"the Sacrament of Healing by anointing with oil";
    anointing.definition = @"The sacrament of healing in which sacramental oil is applied to an infirm human body.\r\rFurther Reference:\rCatechism of the Catholic Church, 1499\rhttp://tinyurl.com/n3lyve9";
    anointing.category = @"Systematic";
    
    Word *anthropocentrism = [[Word alloc] init];
    anthropocentrism.name = @"Anthropocentrism";
    anthropocentrism.twitterDef = @"centered on humanity";
    anthropocentrism.definition = @"A method of theological enquiry from the starting point and within the horizon of the human experience. All theological claims are claims made by human beings in human language. Theology is relevant to human beings in so far as they concern human experience.\r\rFurther Reference:\rWikipedia, “Anthropocentrism”\rhttp://tinyurl.com/8hj52d";
    anthropocentrism.category = @"Systematic";
    
    Word *apocatastasis = [[Word alloc] init];
    apocatastasis.name = @"Apocatastasis";
    apocatastasis.twitterDef = @"the Greek word meaning\r“the restoration of all things”";
    apocatastasis.definition = @"This term only occurs in the New Testament in Acts 3:21, wherein Peter refers to the state of creation in the Messianic Age. Later in the Patristic era, Origen used it to the belief that, at the eschaton, God will restore all creation back into full Divine communion; from the Greek αποκαταστασις.\r\rFurther Reference:\rWikipedia, “Apocatastasis”\rhttp://tinyurl.com/n8txupj";
    apocatastasis.category = @"Systematic";
    
    Word *apologetics = [[Word alloc] init];
    apologetics.name = @"Apologetics";
    apologetics.twitterDef = @"the rational defense of the Christian faith";
    apologetics.definition = @"The early Christians were compelled to defend authentic Christian faith and practice from ; from the Greek word απολογια (apologia) “defense”.\r\rFurther Reference:\rWikipedia, “Apologetics”\rhttp://tinyurl.com/cxswly";
    apologetics.category = @"Systematic";
    
    Word *apophatic = [[Word alloc] init];
    apophatic.name = @"Apophatic";
    apophatic.twitterDef = @"language that uses negation to describe God";
    apophatic.definition = @"Apophatic language was popular with the early Greek fathers.";
    apophatic.category = @"Systematic";
    
    Word *apostolicity = [[Word alloc] init];
    apostolicity.name = @"Apostolicity";
    apostolicity.twitterDef = @"the quality of the Church as being based on the Apostolic tradition";
    apostolicity.definition = @"One of the four marks of the Church - One, Holy, Catholic, Apostolic.\r\rFurther Reference:\rCatechism of the Catholic Church, 857\rhttp://tinyurl.com/oupb5";
    apostolicity.category = @"Systematic";
    
    Word *assumption = [[Word alloc] init];
    assumption.name = @"Assumption of Mary";
    assumption.twitterDef = @"The dogma that the Virgin Mary was assumed into heaven";
    assumption.definition = @"The dogma, defined by Pope Pius IX, which states that the Virgin Mary was assumed body and soul into heaven at the end of her earthly life.\r\rFurther Reference:\rCatechism of the Catholic Church, 966\rhttp://tinyurl.com/mtfzewa";
    assumption.category = @"Systematic";

    Word *atonement = [[Word alloc] init];
    atonement.name = @"Atonement";
    atonement.twitterDef = @"the act of making restitution for inflicted harm";
    atonement.definition = @"The act of making restitution for inflicted harm; a theological interpretation of the death of Jesus of Nazrareth.\r\rFurther Reference:\rCatechism of the Catholic Church, 616\rhttp://tinyurl.com/p3dfabj";
    atonement.category = @"Systematic";
    
    Word *adoration = [[Word alloc] init];
    adoration.name = @"Adoration";
    adoration.twitterDef = @"the act of adoring Christ present in the Eucharist";
    adoration.definition = @"The act of adoring Christ present in the Eucharist.\r\rFurther Reference:\rCatechism of the Catholic Church, 1378\rhttp://tinyurl.com/q6gyoc7";
    adoration.category = @"Liturgical";
    
    Word *angusDei = [[Word alloc] init];
    angusDei.name = @"Agnus Dei";
    angusDei.twitterDef = @"the sequence of Mass that begins\rwith the phrase “Lamb of God”";
    angusDei.definition = @"The Agnus Dei is chanted 3 times before the distribution of the Eucharist.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Liturgy of the Eucharist”\rhttp://tinyurl.com/lleofmh";
    angusDei.category = @"Liturgical";
    
    Word *advent = [[Word alloc] init];
    advent.name = @"Advent";
    advent.twitterDef = @"the first season of the liturgical year in the Church";
    advent.definition = @"Advent prepares the Church for the the celebration of the birth of Jesus; consists of 4 Sundays.\r\rFurther Reference:\rCatechism of the Catholic Church, 524\rhttp://tinyurl.com/mou9egj";
    advent.category = @"Ecclesial";
    
    Word *alleluia = [[Word alloc] init];
    alleluia.name = @"Alleluia";
    alleluia.twitterDef = @"a Latinized form of the phrase meaning\r“Praise the LORD”";
    alleluia.definition = @"The Alleluia is spoken before the reading of the Gospel during the Mass. It is not spoken during the season of Lent.\r\rFurther Reference:\rCatechism of the Catholic Church, 2589\rhttp://tinyurl.com/pynlg6a";
    alleluia.category = @"Liturgical";
    
    Word *altar = [[Word alloc] init];
    altar.name = @"Altar";
    altar.twitterDef = @"the table upon which the Eucharist is placed";
    altar.definition = @"The table upon which the Eucharist is placed during the act of consecration due to the interpretation of the death of Jesus as an atoning sacrifice.\r\rFurther Reference:\rCatechism of the Catholic Church, 1182\rhttp://tinyurl.com/p9382z5";
    altar.category = @"Liturgical";
    
    Word *ambo = [[Word alloc] init];
    ambo.name = @"Ambo";
    ambo.twitterDef = @"the elevated platform (lecturn) behind which the lector, cantor, or homilist stands";
    ambo.definition = @"The elevated platform behind which the lector, cantor, or homilist stands to sing, read, or speak to the congregation.\r\rFurther Reference:\rCatechism of the Catholic Church, 1184\rhttp://tinyurl.com/p9382z5";
    ambo.category = @"Liturgical";
    
    Word *amen = [[Word alloc] init];
    amen.name = @"Amen";
    amen.twitterDef = @"a Hebrew word meaning\r“may it be so”";
    amen.definition = @"The Amen is traditionally said after a prayer as a form of agreement. It derives from Jewish use in the synagogue and later in the New Testament where it is used to indicate the truthfulness of what is said.\r\rFurther Reference:\rCatechism of the Catholic Church, 1061\rhttp://tinyurl.com/k3f2f8p";
    amen.category = @"Liturgical";
    
    Word *anamnesis = [[Word alloc] init];
    anamnesis.name = @"Anamnesis";
    anamnesis.twitterDef = @"the Greek word meaning\r“lived rememberance”";
    anamnesis.definition = @"The Anamnesis is used in the Words of Institution. It is a performative act used to re-present the salvific death and resurrection of Jesus. from the Greek αναμνησις.\r\rFurther Reference:\rCatechism of the Catholic Church, 1103\rhttp://tinyurl.com/oqbzkx3";
    anamnesis.category = @"Liturgical";
    
    Word *anaphora = [[Word alloc] init];
    anaphora.name = @"Anaphora";
    anaphora.twitterDef = @"the Greek word meaning\r“offering”";
    anaphora.definition = @"The Eucharistic prayer of the Mass was referred to as the “Anaphora” at an early stage of liturgical development; from the Greek αναφορα.\r\rFurther Reference:\rCatechism of the Catholic Church, 1352\rhttp://tinyurl.com/m88dbjl";
    anaphora.category = @"Liturgical";
    
    Word *anathema = [[Word alloc] init];
    anathema.name = @"Anathema";
    anathema.twitterDef = @"the state of being out of communion with the Church";
    anathema.definition = @"Anathema comes from the Greek word for “set up high”. Over time it came to refer to those who were accursed or banished from the community.\r\rFurther Reference:\rNew Advent, Anathema\rhttp://tinyurl.com/o5fl88l";
    anathema.category = @"Systematic";
    
    Word *annulment = [[Word alloc] init];
    annulment.name = @"Annulment";
    annulment.twitterDef = @"an ecclesial declaration that a valid marriage never exixted";
    annulment.definition = @"An ecclesial declaration that a valid marriage never existed.\r\rFurther Reference:\rCatechism of the Catholic Church, 1629\rhttp://tinyurl.com/ykptlg";
    annulment.category = @"Systematic";
    
    Word *antiphon = [[Word alloc] init];
    antiphon.name = @"Antiphon";
    antiphon.twitterDef = @"the choral response sung during\rthe entrace processional during Mass";
    antiphon.definition = @"the choral response sung during the entrace processional.\r\rFurther Reference:\rGeneral Instruction on the Liturgy of the Hours, III.II\rhttp://tinyurl.com/ku23eyw";
    antiphon.category = @"Liturgical";
    
    Word *apostlesCreed = [[Word alloc] init];
    apostlesCreed.name = @"Apostle's Creed";
    apostlesCreed.twitterDef = @"the Creed used in Rome around the year A.D. 150";
    apostlesCreed.definition = @"The Apostle's Creed is based on the Roman baptismal creed, dated to the year A.D. 150.\r\r“I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, his only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; he descended into hell; on the third day he rose again from the dead; he ascended into heaven, and is seated at the right hand of God the Father almighty; from there he will come to judge the living and the dead. I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.”\r\rFurther Reference:\rCatechism of the Catholic Church, 194\rhttp://tinyurl.com/mo3f24x";
    apostlesCreed.category = @"Historical";
    
    Word *arianism = [[Word alloc] init];
    arianism.name = @"Arianism";
    arianism.twitterDef = @"the teaching of a third century presbyter, Arius, that the Son was not of the same substance as the Father";
    arianism.definition = @"The teaching of Arius that the Son was of a different substance than the Father (begotten vs. unbegotten) and thus, not fully divine.\r\rFurther Reference:\rCatechism of the Catholic Church, 465\rhttp://tinyurl.com/37wuaux";
    arianism.category = @"Historical";
    
    Word *aposteriori = [[Word alloc] init];
    aposteriori.name = @"A Posteriori";
    aposteriori.twitterDef = @"a phrase meaning\r“after experience”";
    aposteriori.definition = @"A philosophical category which follows human experience. The statement “Water boils at 0 degrees Celsius” is an a posteriori truth.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“A Priori Justification and Knowledge”\rhttp://tinyurl.com/6tp7oyz";
    aposteriori.category = @"Cultural";
    
    Word *apriori = [[Word alloc] init];
    apriori.name = @"A Priori";
    apriori.twitterDef = @"a phrase meaning\r“before experience”";
    apriori.definition = @"A philosophical category which precedes human experience. The statement “All bachelors are unmarried' is an a priori truth.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“A Priori Justification and Knowledge”\rhttp://tinyurl.com/6tp7oyz";
    apriori.category = @"Cultural";
    
    Word *action = [[Word alloc]init];
    action.name = @"Action";
    action.twitterDef = @"direct or indirect action taken to achieve justice";
    action.definition = @"The third of three steps in achieving justice.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 419\rhttp://tinyurl.com/qfo6bd7";
    action.category = @"Cultural";
    
    Word *agnostic = [[Word alloc] init];
    agnostic.name = @"Agnostic";
    agnostic.twitterDef = @"the word used to describe uncertainty about the existence of God";
    agnostic.definition = @"From the Greek word for “not knowing”, a term used to describe uncertainty about the question of God's existence.\r\rFurther Reference:\rCatechism of the Catholic Church, 2127\rhttp://tinyurl.com/lu75a9k.";
    agnostic.category = @"Cultural";
    
    Word *analysis = [[Word alloc] init];
    analysis.name = @"Analysis";
    analysis.twitterDef = @"the process of discerning appropriate steps to achieving justice"; 
    analysis.definition = @"The second of the 3 steps in achieving justice.";
    analysis.category = @"Cultural";
    
    Word *anthropology = [[Word alloc] init];
    anthropology.name = @"Anthropology";
    anthropology.twitterDef = @"the science that studies human origins, development, and culture";
    anthropology.definition = @"The science that studies human origins, development, and culture.\r\rFurther Reference:\rAmerican Anthropological Association\rhttp://tinyurl.com/28tcvt";
    anthropology.category = @"Cultural";
    
    Word *antisemitism = [[Word alloc] init];
    antisemitism.name = @"Anti-Semitism";
    antisemitism.twitterDef = @"prejudice, hatred, or racial bias against Jewish persons";
    antisemitism.definition = @"Prejudice, hatred, or racial bias against Jews. Some portions of the New Testament bear traces of anti-Semitism due to theological biases against the Jewish people for rejecting Christ. Thus, the Christian tradition has included anti-Semitic currents that have been rejected since the Second Vatican Council.\r\rFurther Reference:\rVatican II, Nostra Aetate\rhttp://tinyurl.com/k4dj";
    antisemitism.category = @"Cultural";
    
    Word *argument = [[Word alloc] init];
    argument.name = @"Argument";
    argument.twitterDef = @"a series of statements that establishes a truth claim";
    argument.definition = @"A series of statements that establishes a truth claim; made of two parts - premise and conclusion; the from can be deductive or inductive; deductive arguments can be valid or invalid.\r\rFurther Reference:\rInternet Encylopedia of Philosophy, “Argument”\r http://tinyurl.com/aruqml5";
    argument.category = @"Cultural";
    
    Word *atheism = [[Word alloc] init];
    atheism.name = @"Atheism";
    atheism.twitterDef = @"the belief that no God exists";
    atheism.definition = @"The belief that no God exists.\r\rFurther Reference:\rCatechism of the Catholic Church, 2113\rhttp://tinyurl.com/lu75a9k";
    atheism.category = @"Cultural";
    
    Word *awareness = [[Word alloc] init];
    awareness.name = @"Awareness";
    awareness.twitterDef = @"the gathering of information about a given injustice";
    awareness.definition = @"The first of 3 steps in achieving justice.";
    awareness.category = @"Cultural";
    
    Word *acolyte = [[Word alloc] init];
    acolyte.name = @"Acolyte";
    acolyte.twitterDef = @"a liturgical assistant to the celebrant of Mass";
    acolyte.definition = @"Acolytes occur as early as the   century.\r\rFurther Reference:\rCatechism of the Catholic Church, 903\rhttp://tinyurl.com/m65ttaf";
    acolyte.category = @"Liturgical";
    
    Word *actOfContrition = [[Word alloc] init];
    actOfContrition.name = @"Act of Contrition";
    actOfContrition.twitterDef = @"a prayer said before the Sacrament of Reonciliation";
    actOfContrition.definition = @"While the Church does not canonize any one prayer for forgiveness, a popular one in current usage reads:\r\r“My God, I am sorry for my sins with all my heart. In choosing to do wrong and failing to do good, I have sinned against You whom I should love above all things. I firmly intend, with Your help, to do penance, to sin no more, and to avoid whatever leads me to sin. Our Saviour Jesus Christ, suffered and died for us. In His name, my God, have mercy.”\r\rFurther Reference:\rCatholic Online, Act of Contrition\rhttp://tinyurl.com/kcosvkv";
    actOfContrition.category = @"Liturgical";

    Word *apostolicFathers = [[Word alloc] init];
    apostolicFathers.name = @"Apostolic Fathers"; 
    apostolicFathers.twitterDef = @"the collection of Christian texts from the late first and early second centuries.";
    apostolicFathers.definition = @"The Aposotolic Fathers are the earliest extra-biblical texts outside the Bible.\r\rFurther Reference:\rWikipedia, “Apostolic Fathers”\rhttp://tinyurl.com/56xymr";
    apostolicFathers.category = @"Historical";
    
    [_dataArray addObjectsFromArray:@[aposteriori, apriori, abortion, absolution, abstinence, accident, act, adonai, adoption, adoptionism, adoration, adultery, advent, agape, aggiornomento, agnostic, angusDei, allegory, alleluia, altar, ambo, amen, analogy, analysis, anamnesis, anaphora, anathema, anawim, annulment, anointing, anthropology, antiphon, antisemitism, anthropocentrism, anthropomorphism, apocatastasis, apocalypse, apocrypha, apodictic, apologetics, apophatic, apostle, apostlesCreed, apostolicity, aqeda, aramaic, argument, arianism, asceticism, asherah, assumption, assyria, atheism, atonement, awareness, abba, acolyte, actOfContrition, apostolicFathers]];
    
    //B
    
    Word *beneficence = [[Word alloc] init];
    beneficence.name = @"Beneficence";
    beneficence.twitterDef = @"the first principle in medical ethics; do no harm.";
    beneficence.definition = @"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht";
    beneficence.category = @"Moral";
    
    Word *benefit = [[Word alloc] init];
    benefit.name = @"Benefit/Burden Ratio";
    benefit.twitterDef = @"the ratio of benefits over the burdens of a particular medical treatment";
    benefit.definition = @"The Benefit/Burden Ratio is a variable in morality of certain medical procedures. It's use extends outside theology to the broader study of ethics.\r\rFurther Reference:\r";
    benefit.category = @"Moral";
    
    Word *bioethics = [[Word alloc] init];
    bioethics.name = @"Bioethics";
    bioethics.twitterDef = @"the study of ethics related to medical and life issues";
    bioethics.definition = @"Bioethics has become a specialization in the field of ethics due, in part, to the tremendous technological advances that enable new forms of treatment but that also raise new ethical questions in the practice of medicine.\r\rFurther Reference:\rAmerican Bioethics Advisory Commission, “What is Bioethics?”\rhttp://tinyurl.com/k8sppee";
    bioethics.category = @"Moral";
    
    Word *baptism = [[Word alloc] init];
    baptism.name = @"Baptism";
    baptism.twitterDef = @"the Sacrament of Initiation into the Church\rby ritual cleansing with water";
    baptism.definition = @"Baptism is a practice which Christianity inherited from the Jewish practice of the Mikvah, or ceremonial washing in Second Temple Period. John the Baptist practiced a derivation of this in his ministry, of which Jesus of Nazareth was a follower for some period of time. According to the book of Acts, John's baptism was still being practiced concurrently with Christian baptism. Baptism, along with Eucharist, is a Christian practice dating back to the earliest days of the Church. According to the consistent tradition of the Church, Baptism removes the stain of Original Sin, forgives actual sins, and brings about a spiritual rebirth.\r\rFurther Reference:\rCatechism of the Catholic Church, 1213\rhttp://tinyurl.com/ykqqof";
    baptism.category = @"Systematic";
    
    Word *blasphemy = [[Word alloc] init];
    blasphemy.name = @"Blasphemy";
    blasphemy.twitterDef = @"a form of religious slander";
    blasphemy.definition = @" form of religious slander.\r\rFurther Reference:\rCatechism of the Catholic Church, 2148\rhttp://tinyurl.com/bczm8h7";
    blasphemy.category = @"Systematic";
    
    Word *baptistry = [[Word alloc] init];
    baptistry.name = @"Baptistry";
    baptistry.twitterDef = @"the place within a church used for baptism,\rusually referred to as a “font”";
    baptistry.definition = @"Baptistries are a later development in the Christian tradition. They are connected to the growth of the Church after its more definitive separation from Judaism after A.D. 70.\r\rFurther Reference:\rCatechism of the Catholic Church, 1185\rhttp://tinyurl.com/p9382z5";
    baptistry.category = @"Liturgical";
    
    Word *basillica = [[Word alloc] init];
    basillica.name = @"Basilica";
    basillica.twitterDef = @"a church in which the diocescan bishop presides";
    basillica.definition = @"The Church inherited basilicas from the Roman Imperial administrative system. Literally meaning “house of the king”, these buildings were essentially courthouses in which Roman administrators would hear cases.\r\rFurther Reference:\rWikipedia, “Basilica”";
    basillica.category = @"Liturgical";
    
    Word *benedictus = [[Word alloc] init];
    benedictus.name = @"Benedictus";
    benedictus.twitterDef = @"the Canticle (Song) of Zechariah contained within the Gospel of Luke 1:68-79";
    benedictus.definition = @"This song is recorded as the extemporaneous prayer of Zechariah on the occassion of the birth of his son, John the Baptist. The Benedictus is a part of Morning Prayer in the Liturgy of the Hours.\r\rFurther Reference:\rWikipedia, “Benedictus”\rhttp://tinyurl.com/nvdk23a";
    benedictus.category = @"Liturgical";
    
    Word *bishop = [[Word alloc] init];
    bishop.name = @"Bishop";
    bishop.twitterDef = @"a successor to the Apostles who oversees a particular diocese";
    bishop.definition = @"The office of Bishop - from the Greek επισκοπος (episcopos) “overseer” - is the third order of clerics in the Catholic tradition. In the New Testament, Paul speaks of bishops in the church at Philippi together with deacons. In the second century there seems to have been a further development of the office. Local presbyters elected one of their own to a leadership position. This is reflected in the letters of Ignatius of Antioch (ca. A.D. 110). This form of having one bishop presiding over a local church, (known as “monoepiscopacy”) became the norm in every church by the end of the third century. Bishops were later attached to larger areas of churches known as dioceses, which were Roman Imperial adminstrative distrcts set up by the Emperor Diocletian. After the legalization of Christianity, the Church inherited these districts in its own administration. See “Monoepiscopacy”.\r\rFurther Reference:\rCatechism of the Catholic Church\rhttp://tinyurl.com/m65ttaf";
    bishop.category = @"Systematic";
    
    Word *baal = [[Word alloc]  init];
    baal.name = @"Ba'al";
    baal.twitterDef = @"the son of El and most active of the gods in Canannite mythology";
    baal.definition = @"Ba'al is a Semitic word for “Ruler”, “Husband”, or “Lord”. It became synonymous with a very popular Canaanite deity who was worshipped by ancient Israelites. According to to 2 Kings 23:4 an image of Ba'al was housed in the Temple before Josiah's Deuternomic reform.\r\rFurther Reference:\rWikipedia, Ba'al\rhttp://tinyurl.com/ljhlb";
    baal.category = @"Biblical";
    
    Word *babel = [[Word alloc] init];
    babel.name = @"Babel";
    babel.twitterDef = @"the Hebrew word for “confusion”";
    babel.definition = @"This word is given to the mythical Tower in the eitiology of Gen. 11. That story explains both how human language became divided as well as the geographic distribution of human populations.\r\rFurther Reference:\rCatechism of the Catholic Church, 57\rhttp://tinyurl.com/k6ljesq";
    babel.category = @"Biblical";
    
    Word *babylon = [[Word alloc] init];
    babylon.name = @"Babylon";
    babylon.twitterDef = @"the empire that conquered the southern kingdom of Judah in 587 B.C.";
    babylon.definition = @"The Babylonians destroyed the Temple and took most of the residents of Jerusalem captive to Babylon, where they remained for 50 years.\r\rFurther Reference:\rOxford Biblical Studies, “Babylon” \rhttp://tinyurl.com/q7fujw5";
    babylon.category = @"Biblical";
    
    Word *ban = [[Word alloc] init];
    ban.name = @"Ban";
    ban.twitterDef = @"the ancient Israelite practice of dedicating certain possessions to YHWH by destruction";
    ban.definition = @"When victorious over its enemies, Israel was to place certain possessions under the Ban and completely destroy them in order to devote them anew to YHWH. Such is the case in Joshua 6 and 1 Samuel 15. Modern critics see this practice as tantamount to an ancient form of theologically-justified genocide. See “YHWH”.\r\rFurther Reference:\rOxford Biblical Studies, “Ban”\rhttp://tinyurl.com/lhwe4mo";
    ban.category = @"Biblical";
    
    Word *bigbang = [[Word alloc] init];
    bigbang.name = @"Big Bang Theory";
    bigbang.twitterDef = @"the theory that the Universe expanded from an infinite singularity of space, time, matter, and energy";
    bigbang.definition = @"The cosmological theory, first developed by Fr. George Lemaitre, that claims that the Universe began at an infintely small and dense point of matter, energy, space, and time which then expanded over the course of time to become the observable cosmos we see today. See “Creation”\r\rFurther Reference:\rWikipedia, “Big Bang”\rhttp://tinyurl.com/9nq4k";
    bigbang.category = @"Cultural";
    
    Word *buddhism = [[Word alloc] init];
    buddhism.name = @"Buddhism";
    buddhism.twitterDef = @"the philosophy and religion based on the teachings of Siddartha Gotama (ca. 500 B.C.)";
    buddhism.definition = @"Buddhism is based on the teachings after Siddartha's awakening. He taught the Four Noble Truths:\r\r1. Life is Suffering.\r2. Attachement is the root of suffering.\r3. Suffering can be overcome.\r4. The Eightfold Path.\r\rBuddhism has had increasing contact with Christianity over the last 100 years. Perhaps the most famous point of intersection was between the Trappist monk, Thomas Merton and the Dalai Lama in 1968. Buddhism claims to be offer a lifestyle that can be adapted to anu religion, although this is contested due to some of its claims.\r\rFurther Reference:\rBuddhnet, “Basic Buddhism”\rhttp://tinyurl.com/69cl";
    buddhism.category  = @"Cultural";

    
    /*
     Word *bathshebaWord = [[Word alloc] init];
     bathshebaWord.name = @"Bathsheba";
     bathshebaWord.definition = @"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
     */
    
    Word *bible = [[Word alloc] init];
    bible.name = @"Bible";
    bible.twitterDef = @"the collection of the Old and New Testaments";
    bible.definition = @"The collection of the Old and New Testaments regarded as canonical and inspired within Catholicism. From the Greek word βιβλος (biblos) - “scroll”. Historically, the Catholic canon of Scripture has included the Deuterocanonical books while Protestant bibles have excluded them. See ”Sacred Scripture” in the Overview tab.\r\rFurther Reference:\rWikipedia, “Catholic Bible”\r";
    bible.category = @"Biblical";
    
    //Word *biblicalCriticism = [[Word alloc] init];
    //biblicalCriticism.name = @"Biblical Criticism";
    //biblicalCriticism.definition = @"The process of discovering what can be known about the context of any biblical book or passage in order to understand its original meaning.";
    //biblicalCriticism.category = @"Biblical";
    
    //Word *bethel = [[Word alloc] init];
    //bethel.name = @"Beth-El";
    //bethel.twitterDef = @"a sacred site within the patriarchal story cycles in Genesis";
    //bethel.definition = @"Bethel is a Hebrew word meaning “House of El”. It is a prominent site in the Old Testament in both the periods of the Patriarchs and the Monarchy.";
    //bethel.category = @"Biblical";
    
     
     [_dataArray addObjectsFromArray:@[baal, babel, babylon, ban, baptism, baptistry, basillica, benedictus, beneficence, benefit, bible, bigbang, bioethics, bishop, blasphemy, buddhism]];
    
    //C
    
    Word *casuistry = [[Word alloc] init];
    casuistry.name = @"Casuistic";
    casuistry.twitterDef = @"a type of law derived from individual cases rather than universal norms";
    casuistry.definition = @"Casuistic law is contrasted with apodictic law. The latter is exemplified by the 10 Commandments, while the former is found in the Covenant Code of Exodus 21-23.\r\rFurther Reference:\rWikipedia, “Casuistry”\rhttp://tinyurl.com/2pntmh";
    casuistry.category = @"Moral";
    
    Word *catholicsocialteaching = [[Word alloc]init];
    catholicsocialteaching.name = @"Catholic Social Teaching";
    catholicsocialteaching.twitterDef = @"the teaching of the Church which applies the principles of social justice to society";
    catholicsocialteaching.definition = @"According to Pope Paul VI's encyclical, Populorum Progressio, social teaching is essential to authentic evangelization. It consists of principles of reflection, criteria of judgment, and directives for action. See “Social Justice”, “Signs of the Times”.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 85 http://tinyurl.com/kn6q5wm ";
    catholicsocialteaching.category = @"Moral";
    
    Word *commutativejustice = [[Word alloc]init];
    commutativejustice.name = @"Commutative Justice";
    commutativejustice.twitterDef = @"one of the three aspects of justice which emphasizes obligations between individuals";
    commutativejustice.definition = @"the type of justice which emphasizes obligations between individuals\r\rFurther Reference:\rCatechism of the Catholic Church, 2411\rhttp://tinyurl.com/6y3q4";
    commutativejustice.category = @"Moral";
    
    Word *contributivejustice = [[Word alloc]init];
    contributivejustice.name = @"Contributive Justice";
    contributivejustice.twitterDef = @"the aspect of justice that emphasizes the obligation of individuals toward society";
    contributivejustice.definition = @"Contributive justice is met when the individual fulfills his responsbilities to the larger society.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Economic Justice For All”, II.b.1.b http://tinyurl.com/75hnlx3";
    contributivejustice.category = @"Moral";
    
    Word *canon = [[Word alloc] init];
    canon.name = @"Canon";
    canon.twitterDef = @"the Greek word meaning\r“measuring stick”";
    canon.definition = @"Canon is used metaphorically to refer to a standard or criterion regarded as authoritative within a community. Saints are canonized by the Church as standards by which Catholics may judge their lives. The Bible is referred to as the canon of the Scriptures that provide criteria for faith and practice; from the Greek κανον. See “Sacred Scripture” in the Overview tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 120. http://tinyurl.com/kvc3tvq\r\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, III.B” http://tinyurl.com/2gb5dm ";
    canon.category = @"Systematic";
    
    Word *catholicity = [[Word alloc] init];
    catholicity.name = @"Catholicity";
    catholicity.twitterDef = @"the quality of being universal in scope";
    catholicity.definition = @"The quality of being universal in scope; one of the four marks of the Church.\r\rFurther Reference:\rCatechism of the Catholic Church, 830\rhttp://tinyurl.com/c5m8w5j";
    catholicity.category = @"Systematic";
    
    Word *Christ = [[Word alloc] init];
    Christ.name = @"Christ";
    Christ.twitterDef = @"a title of Jesus meaning “annointed one”";
    Christ.definition = @"The title given to Jesus of Nazareth by early Christians; from the Greek χριστος (christos) “annointed one”.\r\rFurther Reference:\rCatechism of the Catholic Church, 436\rhttp://tinyurl.com/neqlbg7";
    Christ.category = @"Systematic";
    
    Word *christOfFaith = [[Word alloc] init];
    christOfFaith.name = @"Christ of Faith";
    christOfFaith.twitterDef = @"the term for the risen Jesus that emphasizes his glorified existence";
    christOfFaith.definition = @"The term Christ of Faith is often contrasted with the Jesus of History...";
    christOfFaith.category = @"Systematic";
    
    Word *Christology = [[Word alloc] init];
    Christology.name = @"Christology";
    Christology.twitterDef = @"the study of the person and nature of Christ";
    Christology.definition = @"Christology is a subset of Systematics and takes as its point of departure the Chalcedonian definition of the two natures and hypostatic union in Jesus.\r\rFurther Reference:\rWikipedia, “Christology”\rhttp://tinyurl.com/2b79fj";
    Christology.category = @"Systematic";
    
    Word *church = [[Word alloc] init];
    church.name = @"Church";
    church.twitterDef = @"the community that believes that Jesus of Nazraeth\ris the divine Savior of the world";
    church.definition = @"The community belonging to the Lord; the people of God; the community centered on the belief that Jesus of Nazraeth is the divine Savior of the world.\r\rFurther Reference:\rCatechism of the Catholic Church, 751\rhttp://tinyurl.com/ojrdr53";
    church.category = @"Systematic";
    
    Word *communicatio = [[Word alloc] init];
    communicatio.name = @"Communicatio Idiomatum";
    communicatio.twitterDef = @"a Latin phrase describing the interexchange of Christ's divine and human natures";
    communicatio.definition = @"The idea of the Communicatio Idiomatum means that the properties of the human Jesus can also be predicated of the Logos and vice versa.\r\rFurther Reference:\rNew Advent, “Communicatio Idiomatum”\rhttp://tinyurl.com/nqusf6m";
    communicatio.category = @"Systematic";
    
    Word *communion = [[Word alloc] init];
    communion.name = @"Communion of Saints";
    communion.twitterDef = @"the unity among believers that exists in Christ...";
    communion.definition = @"The unity among believers that exists in Christ.\r\rFurther Reference:\rCatechism of the Catholic Church, 946\rhttp://tinyurl.com/pkxuudx";
    communion.category = @"Systematic";

    Word *confession = [[Word alloc] init];
    confession.name = @"Confession";
    confession.twitterDef = @"the sacrament of reconciliation...";
    confession.definition = @"The sacrament of reconciliation...\r\rFurther Reference:\rCatechism of the Catholic Church, 1424\r http://tinyurl.com/l7xon9e";
    confession.category = @"Systematic";
    
    Word *confirmation = [[Word alloc] init];
    confirmation.name = @"Confirmation";
    confirmation.twitterDef = @"the sacrament of reception of the Holy Spirit in which....";
    confirmation.definition = @"The sacrament of reception of the Holy Spirit in which.... \r\rFurther Reference:\rCatechism of the Catholic Church, 1285\rhttp://tinyurl.com/lcgw5p7";
    confirmation.category = @"Systematic";
    
    Word *conversion = [[Word alloc]init];
    conversion.name = @"Conversion";
    conversion.twitterDef = @"the process of spiritual transformation";
    conversion.definition = @"The process of changing one's direction in life.\r\rFurther Reference:\rCatechism of the Catholic Church, 1989\rhttp://tinyurl.com/yaua7cc";
    conversion.category = @"Systematic";
    
    Word *cosmological = [[Word alloc] init];
    cosmological.name = @"Cosmological Argument";
    cosmological.twitterDef = @"an argument for God's existence, based on Aristotle's First Cause argument";
    cosmological.definition = @"One of the classical arguments for the existence of God, based on the First Cause argument.\r\rFurther Reference:\rSee Stanford Encyclopedia of Philosophy, “Cosmological Argument” http://tinyurl.com/8xkm72n\r\rThomas Aquinas, Summa Theologica, ST, Ia, q. 2 a. 3 co. http://tinyurl.com/my5bedq";
    cosmological.category = @"Systematic";
    
    Word *creation = [[Word alloc] init];
    creation.name = @"Creation";
    creation.twitterDef = @"the Universe...";
    creation.definition = @"The universe.\r\rFurther Reference:\rCatechism of the Catholic Church, 280\rhttp://tinyurl.com/6kvj6";
    creation.category = @"Systematic";
    
    Word *creationism = [[Word alloc] init];
    creationism.name = @"Creationism";
    creationism.twitterDef = @"the belief that God created the earth & humanity as described in the book of Genesis";
    creationism.definition = @"The belief that God created the earth and human beings directly, with no biological predecessors as described in the book of Genesis.\r\rFurther Reference:\rSee “evolution” in the Cultural cateogry";
    creationism.category = @"Systematic";
    
    Word *creed = [[Word alloc] init];
    creed.name = @"Creed";
    creed.twitterDef = @"a statement of faith or belief";
    creed.definition = @"The Latin word (credo) meaning “I believe” - a statement of belief; used to refer to the historical creeds of the Church, most notably the Apostle's and Nicene creed.\r\rFurther Reference:\rCatechism of the Catholic Church, 187\rhttp://tinyurl.com/mo3f24x";
    creed.category = @"Systematic";
    
    Word *callNarrative = [[Word alloc] init];
    callNarrative.name = @"Call Narrative";
    callNarrative.twitterDef = @"a literary form used throughout the Bible in which a person is called by God for a specific task";
    callNarrative.definition = @"Call Narratives consist of three parts: call, concern, commission. The stories of Moses, Jeremiah, and Isaiah all involve a call narrative.\r\rFurther Reference:\r";
    callNarrative.category = @"Biblical";
    
    Word *charism = [[Word alloc] init];
    charism.name = @"Charism";
    charism.twitterDef = @"the spiritual gifts that result from the experience of the Holy Spirit";
    charism.definition = @"According to the Apostle Paul, the spiritual gifts that come with Christian experience of the Holy Spirit - from the Greek word χαρισμα (charisma) - “gift”. See 1 Corinthians 12.\r\rFurther Reference:\r";
    charism.category = @"Biblical";
    
    Word *circumcision = [[Word alloc] init];
    circumcision.name = @"Circumcision";
    circumcision.twitterDef = @"the ritual cutting of the male foreskin";
    circumcision.definition = @"The ritual cutting of the male foreskin; the sign of the covenant according to the Priestly author, described in Genesis 17.\r\rFurther Reference:\r";
    circumcision.category = @"Biblical";
    
    Word *codex = [[Word alloc] init];
    codex.name = @"Codex";
    codex.twitterDef = @"a collection of manuscripts";
    codex.definition = @"A collection of manuscripts.\r\rFurther Reference:\r";
    codex.category = @"Biblical";
    
    Word *covenant = [[Word alloc] init];
    covenant.name = @"Covenant";
    covenant.twitterDef = @"a sacred contract or agreement";
    covenant.definition = @"Covenants are used throughout the Bible. They refer to the relationship between YHWH and Noah and all living creatures in Genesis 9; between God and Abraham in Genesis 15 and 17; between YHWH and all Israel in Exodus 25; and between God and humanity in the Gospels.\r\rFurther Reference:\rCatechism of the Catholic Church, 56, 59, 62, 73 http://tinyurl.com/pesbbq3";
    covenant.category = @"Biblical";
    
    Word *churchstate = [[Word alloc] init];
    churchstate.name = @"Church/State";
    churchstate.twitterDef = @"a philosophical, theological, and legal dichotomy of religious and political entities";
    churchstate.definition = @"The dichotomy used to express philosophical, theological, and legal differences in religious and political entities.\r\rFurther Reference:\r";
    churchstate.category = @"Cultural";
    
    Word *colonialism = [[Word alloc] init];
    colonialism.name = @"Colonialism";
    colonialism.twitterDef = @"the practice of settling foreign lands...";
    colonialism.definition = @"The practice of settling foreign lands.\r\rFurther Reference:\r";
    colonialism.category = @"Cultural";
    
    Word *commongood = [[Word alloc]init];
    commongood.name = @"Common Good";
    commongood.twitterDef = @"the social condition in which all people are allowed to reach their full development";
    commongood.definition = @"the social condition in which all people are allowed to reach their full development.\r\rFurther Reference:\r";
    commongood.category = @"Moral";
    
    Word *compatibilism = [[Word alloc] init];
    compatibilism.name = @"Compatiblism";
    compatibilism.twitterDef = @"the belief that human freedom is compatible with determinism";
    compatibilism.definition = @"The belief that human freedom is compatible with deterministic elements of human experience.\r\rFurther Reference:\rStandford Encyclopedia of Philosophy, “Compatibilism”\rhttp://tinyurl.com/l3aj5j.";
    compatibilism.category = @"Cultural";
    
    Word *council = [[Word alloc] init];
    council.name = @"Council";
    council.twitterDef = @"a gathering of the Church to settle disputed matters of Christian teaching";
    council.definition = @"A gathering of the Church to settle disputed matters of Christian teaching; the prototypical council is depicted in Acts 15 in which the Church determines the requirements for Gentile membership. Later councils were local or regional; ecumenical councils, or councils of the whole Church, began in A.D. 325 at the behest of the Emperor Constantine in the city of Nicea. Seven such ecumenical councils are recognized by both the Eastern and Western Church.\r\rFurther Reference:\r";
    council.category = @"Historical";
    
    Word *cybertheology = [[Word alloc] init];
    cybertheology.name = @"Cybertheology";
    cybertheology.twitterDef = @"the intelligence of faith in the era of the Internet and World Wide Web";
    cybertheology.definition = @"According to Fr. Antonio Spadaro, S.J., the term “cybertheology” refers to the intelligence of faith in the era of the Internet and World Wide Web, which arises from the recognition that, as technology changes ways of thinking, theology necessarily changes as well.\r\rFurther Reference:\r";
    cybertheology.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[callNarrative, canon, casuistry, catholicity, catholicsocialteaching, circumcision, charism, christOfFaith, Christology, church, churchstate, codex, colonialism, commongood, communicatio, commutativejustice, compatibilism, confession, confirmation, contributivejustice, conversion, cosmological, council, covenant, creation, creationism, creed, cybertheology]];
    
    //D
    
    Word *dehumanization = [[Word alloc] init];
    dehumanization.name = @"Dehumanization";
    dehumanization.twitterDef = @"the process of objectifying a human being, violating his or her dignity";
    dehumanization.definition = @"One theory of dehumanization claims that it can take one of two forms: animalistic or mechanistic. The former denies uniqely human characteristics (such as civility, morality, rationality). The latter denies characteristics of human nature that are fundamental but not unique to humans (such as emotional responsiveness, individuality, interpersonalism).\r\rFurther Reference:\r“Dehumanization: An Integrative Review”\rhttp://tinyurl.com/okhuczt";
    dehumanization.category = @"Moral";
    
    Word *deontology = [[Word alloc] init];
    deontology.name = @"Deontology";
    deontology.twitterDef = @"the study of ethics from the framework of moral duties in the form of rules and laws";
    deontology.definition = @"Deontology - from the Greek word δεον (deon) “duty” - is a deontic theory of morality based on what we ought to do in contrast to virtue theories, which based on the kinds of persons we should be.\r\rFurther Reference:\rStanford Encyclopedia of Philospohy, “Deontological Ethics”\rhttp://tinyurl.com/ya6dgay";
    deontology.category = @"Moral";
    
    Word *dignity = [[Word alloc]init];
    dignity.name = @"Dignity of the Human Person";
    dignity.twitterDef = @"the sacred status of human beings derived from their creation in the Image of God";
    dignity.definition = @"Human dignity is based on the understanding that, being made in God's Image, humans are loved unconditionally and universally and called to be in loving relationship with the Creator. Human dignity is fulfilled in this vocation and is essential to human development. It is the first principle of Catholic Social Teaching in which all others are based. See “Catholic Social Teaching”, “Human Person”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1700\rhttp://tinyurl.com/kaz99um";
    dignity.category = @"Moral";
    
    Word *distributive = [[Word alloc] init];
    distributive.name = @"Distributive Justice";
    distributive.twitterDef = @"the type of justice which emphasizes society's responsibilities to the individual";
    distributive.definition = @"Distributive justice is an essential aspect of social justice. It is fulfilled when society meets its obligations to the individual based on his or her contribution and need.\r\rFurther Reference:\rUSCCB, “Economic Justice For All”, II.b.1.b http://tinyurl.com/75hnlx3";
    distributive.category = @"Moral";
    
    Word *deposit = [[Word alloc] init];
    deposit.name = @"Deposit of Faith";
    deposit.twitterDef = @"the content of the Christian faith given by God to the Church through the Apostolic tradition";
    deposit.definition = @"The Depsit of Faith (Latin: Depositum Fidei) is the gift of salvific truth given to the Church by Christ through the Apostolic tradition.\r\rFurther Reference:\rCatechism of the Catholic Church, 84\rhttp://tinyurl.com/bx8mnlu";
    
    Word *developmentDoc = [[Word alloc] init];
    developmentDoc.name = @"Development of Doctrine";
    developmentDoc.twitterDef = @"the idea that the teaching of the Church can faithfully develop over time";
    developmentDoc.definition = @"The concept of the Development of Doctrine is first found in the writings of Vincent of Lerins and later re-emphasized by Cardinal John Henry Newman. The former was cited explicitly by the council fathers at Vatican I. Recently, Thomas Guarino has argued that his lack of representation at Vatican II was the result of a misinterpretation of Vincent's famous claim:\r\r“We hold that which has been believed everywhere, always, and by everyone.”\r\rPope Francis has recently quoted Vincent's ideas in his discussions on abortion and gay marriage.\r\rFurther Reference:\rJohn Henry Newman, “Essay on the Development of Doctrine”\rhttp://tinyurl.com/n8kpzcc\r\rThomas Guarino, “Pope Francis Looks To Vincent of Lerins”\rhttp://tinyurl.com/ogtb5ej";
    developmentDoc.category = @"Systematic";
    
    Word *devil = [[Word alloc] init];
    devil.name = @"Devil";
    devil.twitterDef = @"a personal, malevolent spiritual being derived from “Satan” in the Tanak";
    devil.definition = @"The personal malevolent spiritual being who became synonymous with Satan in inter-testamental years leading up to the life of Jesus.\r\rFurther Reference:\rCatechism of the Catholic Church, 391\rhttp://tinyurl.com/llux3he";
    devil.category = @"Systematic";
    
    Word *doctrine = [[Word alloc] init];
    doctrine.name = @"Doctrine";
    doctrine.twitterDef = @"a systemized body of teaching";
    doctrine.definition = @"The word doctrine (from the Latin doctrina - teaching) is used in Catholicism to refer to the teaching of Church in a general sense.\r\rFurther Reference:\r";
    doctrine.category = @"Systematic";
    
    Word *dogma = [[Word alloc] init];
    dogma.name = @"Dogma";
    dogma.twitterDef = @"a Greek word meaning “opinion or belief”\rused to refer to infallible teaching";
    dogma.definition = @"A dogma in the Catholic tradition is a subset of Church doctrine. It refers to a divinely revealed truth that has been defined infallibly.\r\rFurther Reference:\rCatechism of the Catholic Church, 88\rhttp://tinyurl.com/bx8mnlu";
    dogma.category = @"Systematic";
    
    Word *decalogue = [[Word alloc] init];
    decalogue.name = @"Decalogue";
    decalogue.twitterDef = @"the Greek word referring to the 10 Commandments";
    decalogue.definition = @"The Decalogue - from the Greek words δεκα (deka) “ten” and λογος (logos) “word” - is found in both Exodus 20 and Deuteronomy 5. In Exodus, they are part of the Mosaic theophany.\r\rFurther Reference:\rCatechism of the Catholic Church, 2056\rhttp://tinyurl.com/nc86ead";
    decalogue.category = @"Biblical";
    
    Word *deiVerbum = [[Word alloc] init];
    deiVerbum.name = @"Dei Verbum";
    deiVerbum.twitterDef = @"a Latin phrase meaning “Word of God”; one of the four dogmatic constitutions from Vatican II";
    deiVerbum.definition = @"Dei Verbum is the most definitive statement on the Church's belief in Divine revelation, the Scriptures and Tradition.\r\rFurther Reference:\rDogmatic Constitution on Divine Revelation\rhttp://tinyurl.com/3ecxu";
    deiVerbum.category = @"Biblical";
    
    Word *deuteronomicHistory = [[Word alloc] init];
    deuteronomicHistory.name = @"Deuteronomic History";
    deuteronomicHistory.twitterDef = @"the theologized history of Israel in Joshua, Judges, 1 & 2 Samuel, and 1 & 2 Kings";
    deuteronomicHistory.definition = @"The term given to the books Joshua, Judges, 1 & 2 Samuel, and 1 & 2 Kings, based on the theology of the book of Deuteronomy, which detail the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel.\r\rFurther Reference:\rOxford Biblical Studies, “Deuteronomic History”\rhttp://tinyurl.com/poqwjxo";
    deuteronomicHistory.category = @"Biblical";
    
    Word *deuteronomicSource = [[Word alloc] init];
    deuteronomicSource.name = @"Deuteronomic Source";
    deuteronomicSource.twitterDef = @"the “D” source; comprising primarily of the book of Deuteronomy";
    deuteronomicSource.definition = @"The “D” source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See “Documentary Hypothesis.”\r\rFurther Reference:\rWikipedia, Deuteronomic Source\rhttp://tinyurl.com/myayczm";
    deuteronomicSource.category = @"Biblical";
    
    Word *deuteronomy = [[Word alloc] init];
    deuteronomy.name = @"Deuteronomy";
    deuteronomy.twitterDef = @"the fifth and last book of the Pentateuch";
    deuteronomy.definition = @"from the Greek words “deuteros” (second) and “nomos” (law) - the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.\r\rFurther Reference:\r";
    deuteronomy.category = @"Biblical";
    
    Word *diachronic = [[Word alloc] init];
    diachronic.name = @"Diachronic";
    diachronic.twitterDef = @"the quality of transcending time";
    diachronic.definition = @"The type of truth within a text which transcends time and culture - from the Greek....\r\rFurther Reference:\r“The Interpretation of the Bible in the Church, A” http://tinyurl.com/ymsltv";
    diachronic.category = @"Biblical";
    
    Word *documentaryHypothesis = [[Word alloc] init];
    documentaryHypothesis.name = @"Documentary Hypothesis";
    documentaryHypothesis.twitterDef = @"the theory that there are 4 sources which comprise the Torah: J, E, P, and D";
    documentaryHypothesis.definition = @"The theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah that have been edited together into its current canonical form; “Yahwist” (J), “Elohist” (E), “Priestly” (P), and “Deuteronomic” (D).\r\rAccording to Dr. Richard Elliot Freidman, there are seven arguments for its validity:\r\r1. Language\r2. Terminology\r3. Consistent Content\r4. Narrative Flow\r5. Other Biblical Connections\r6. Inter-Source Relationships\r7. Convergence of Arguments \r\rFurther Reference:\rPBS, “Who Wrote The Flood Story?”\rhttp://tinyurl.com/5leorc";
    documentaryHypothesis.category = @"Biblical";
    
    Word *dynamic = [[Word alloc] init];
    dynamic.name = @"Dynamic Equivalence";
    dynamic.twitterDef = @"a translation philosophy that seeks to render the text idea for idea";
    dynamic.definition = @"The pre-2011 translation of the Mass and New American Bible were both based on a dynamic equivalence philosophy.\r\rFurther Reference:\r";
    dynamic.category = @"Biblical";
    
    Word *deism = [[Word alloc] init];
    deism.name = @"Deism";
    deism.twitterDef = @"the belief that God created the world but does not intervene in it";
    deism.definition = @"The belief that God created the world but does not intervene in the natural course of the world.\r\rFurther Reference:\rWikipedia, Deism\rhttp://tinyurl.com/oc6xh";
    deism.category = @"Cultural";
    
    Word *determinism = [[Word alloc] init];
    determinism.name = @"Determinism";
    determinism.twitterDef = @"the belief that all events are determined by physical phenomena";
    determinism.definition = @"The belief that all events, including human actions, are determined by physical phenomena, negating the concept of free-will.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Causal Determinism”\rhttp://tinyurl.com/ew8c.";
    determinism.category = @"Cultural";
    
    Word *development = [[Word alloc]init];
    development.name = @"Development";
    development.twitterDef = @"the process of enhancing the freedom and opportunity of all people to improve their lives";
    development.definition = @"Human development is a central theme in Catholic Social Teaching as it applies to the Life and Dignity of the Human Person. It has been measured by the United Nations since 1990 with the first Human Development Report.\r\rFurther Reference:\rUnited Nations Development Programme\rhttp://tinyurl.com/khsqbzk";
    development.category = @"Cultural";
    
    Word *dualism = [[Word alloc] init];
    dualism.name = @"Dualism";
    dualism.twitterDef = @"the belief that humans are composed of two substances, body and soul/mind";
    dualism.definition = @"Also known as substance dualism; found in the Platonic influence on Christianity and later in the writings of Descartes. Associated problems include the problem of causation and the seeming violation of the scientific law of the conservation of energy.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Dualism” http://tinyurl.com/85cdhc3";
    dualism.category = @"Cultural";


    
    [_dataArray addObjectsFromArray:@[decalogue, dehumanization, deism, deiVerbum, determinism, deontology, deposit, development, deuteronomicHistory, deuteronomicSource, developmentDoc, devil, diachronic, dignity, distributive, doctrine, documentaryHypothesis, dogma, dualism, dynamic]];
    
    //E
    
    Word *economic = [[Word alloc] init];
    economic.name = @"Economic Justice";
    economic.twitterDef = @"the right relationship between human beings to a given economic system.";
    economic.definition = @"Economic justice is based on the idea that the economy of any society should serve people, not vice versa.\r\rFurther Reference:\rUSCCB, “Economic Justice”\rhttp://tinyurl.com/l7a4kwo";
    economic.category = @"Moral";
    
    Word *ethics = [[Word alloc] init];
    ethics.name = @"Ethics";
    ethics.twitterDef = @"the study of moral systems";
    ethics.definition = @"Ethics - from the Greek word ηθικος (ethikos) “custom” - is the traditional third branch of Philosophy.\r\rFurther Reference:\rWikipedia, “Ethics”\rhttp://tinyurl.com/oqptk";
    ethics.category = @"Moral";
    
    Word *ecclesiology = [[Word alloc] init];
    ecclesiology.name = @"Ecclesiology";
    ecclesiology.twitterDef = @"the study of the Church.";
    ecclesiology.definition = @"Ecclesiology is a subset of Systematic Theology. It examines various aspects of the Church (authority, structure, sacraments, worship, etc.). While the pre-Conciliar model of the Church was that of the Communitas Perfecta (perfect community), Vatican II, in the Dogmatic Constitution on the Church “Lumen Gentium”, chose to define the Church as the People of God and as a Mystical Communion. See “Lumen Gentium”.\r\rFurther Reference:\rWikipedia, “Ecclesiology”\rhttp://tinyurl.com/5e4obj";
    ecclesiology.category = @"Systematic";
    
    Word *ecumenism = [[Word alloc] init];
    ecumenism.name = @"Ecumenism";
    ecumenism.twitterDef = @"a movement that emphasizes similarities over differences";
    ecumenism.definition = @"A movement which gained popularity in the 20th century that emphasized shared beliefs among various Christian churches over and against differences.\r\rFurther Reference:\rVatican II, “Decree on Ecumenism”\rhttp://tinyurl.com/3xnyh";
    ecumenism.category = @"Systematic";
    
    Word *election = [[Word alloc] init];
    election.name = @"Election";
    election.twitterDef = @"the concept that Israel and the Church were chosen by God to be in a covenant";
    election.definition = @"Election is a concept that runs throughout both the Old and New Testaments. In the Old Testament, Israel is a nation chosen by YHWH from among other nations to be in covenant relationship. In the New Testament, Christ is referred to as the “Chosen One” and believers in him are referred to as being chosen in him.\r\rFurther Reference:\rCatechism of the Catholic Church, 762, 769 http://tinyurl.com/oy6txqx";
    election.category = @"Systematic";
    
    Word *eschatology = [[Word alloc] init];
    eschatology.name = @"Eschatology";
    eschatology.twitterDef = @"the belief that evil and injustice will have an end brought about by Divine intervention";
    eschatology.definition = @"Eschatology - from the Greek εσχατον (eschaton) “last thing” - is a subject examined by Systematic Theology. It examines the Church doctrine on the destiny of the human race.\r\rFurther Reference:\rCatechism of the Catholic Church, 673\rhttp://tinyurl.com/n85jnew.";
    eschatology.category = @"Systematic";
    
    Word *essence = [[Word alloc] init];
    essence.name = @"Essence";
    essence.twitterDef = @"a property that makes an object what it is";
    essence.definition = @"A property that makes an object what it is.\r\rFurther Reference:\rStandford Encyclopedia of Philosophy, “Essential vs. Accidental Properties”\rhttp://tinyurl.com/olc9dv8.";
    essence.category = @"Systematic";
    
    Word *eucharist = [[Word alloc] init];
    eucharist.name = @"Eucharist";
    eucharist.twitterDef = @"the word meaning\r“good thanksgiving”";
    eucharist.definition = @"The word Eucharist came to be associated with the bread and wine of the Eucharist which early Christians believed to be directly related to the body and blood of Jesus. The belief that Jesus is present in the Eucharist predates to the earliest years of the Church. Paul claims that bread and wine of the Eucharist are a participation in the body and blood of Christ. This belief predates any theory (e.g. transubstantiation) as to how he is present; from the Greek ευχαριστος (eucharistos) “good thanksgiving”. See “Anamnesis”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1322\rhttp://tinyurl.com/q6gyoc7";
    eucharist.category = @"Systematic";
    
    Word *exclusivism = [[Word alloc] init];
    exclusivism.name = @"Exclusivism";
    exclusivism.twitterDef = @"the belief that only those who have explicit Christian faith will be saved";
    exclusivism.definition = @"The soteriological belief that only those people who have a made an explicit Christian confession will experience salvation.\r\rFurther Reference:\r";
    exclusivism.category = @"Systematic";
    
    Word *exNihilo = [[Word alloc] init];
    exNihilo.name = @"Ex Nihilo";
    exNihilo.twitterDef = @"a Latin phrase meaning\r“out of nothing”";
    exNihilo.definition = @"The phrase Ex Nihilo is used to express the belief that God created the Universe out of nothing.\r\rFurther Reference:\rCatechism of the Catholic Church, 296\rhttp://tinyurl.com/6kvj6.";
    exNihilo.category = @"Systematic";
    
    Word *exOpere = [[Word alloc] init];
    exOpere.name = @"Ex Opere Operato";
    exOpere.twitterDef = @"a Latin phrase meaning\r“from the work, worked”";
    exOpere.definition = @"The idea that a Sacrament's efficacy is not related to a celebrant's personal holiness.\r\rFurther Reference:\rCatechism of the Catholic Church, 1128\rhttp://tinyurl.com/cmes38";
    exOpere.category = @"Systematic";
    
    Word *eisegesis = [[Word alloc] init];
    eisegesis.name = @"Eisegesis";
    eisegesis.twitterDef = @"intepreting a text by importing one's own presuppositions";
    eisegesis.definition = @"Eisegesis is the opposite of exegesis; from the Greek εις (eis) - “into” and αγω (ago) - “to go”.\r\rFurther Reference:\rFelix Just S.J., “Biblical Exegeis”\rhttp://tinyurl.com/k3u6rma";
    eisegesis.category = @"Biblical";
    
    Word *el = [[Word alloc] init];
    el.name = @"El";
    el.twitterDef = @"the father of all the gods and husband of Asherah in Canaanite mythology";
    el.definition = @"In the Old Testament, El is referred to throughout the patriarchal sagas. See “Beth-El” in the Old Testament category of Pins in the Map tab.\r\rFurther Reference:\rWikipedia, “El”\rhttp://tinyurl.com/3r98q89";
    el.category = @"Biblical";
    
    Word *elohim = [[Word alloc] init];
    elohim.name = @"Elohim";
    elohim.twitterDef = @"the Hebrew word for “gods”, “God”, or “angels”";
    elohim.definition = @"The plural of “El”, “Elohim” can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.\r\rFurther Reference:\rWikipedia, “Elohim”\rhttp://tinyurl.com/yv38ap";
    elohim.category = @"Biblical";
    
    Word *elohistSource = [[Word alloc] init];
    elohistSource.name = @"Elohist Source";
    elohistSource.twitterDef = @"The literary “E” Source in the Torah\rthat favors the northern traditions of Israel";
    elohistSource.definition = @"The “E” source uses “Elohim” as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.\r\rFurther Reference:\rWikipedia, “Elohist Source”\rhttp://tinyurl.com/2axcpau";
    elohistSource.category = @"Biblical";
    
    Word *epistle = [[Word alloc] init];
    epistle.name = @"Epistle";
    epistle.twitterDef = @"a word meaning\r“letter”";
    epistle.definition = @"The New Testament contains 21 letters written from apostles or apostolic associates, but mostly from Paul. The Apostolic Fathers contain various epistles as well from Ignatius of Antioch, Polycarp, Barnabas, and Diognetus.\r\rFurther Reference:\rWikipedia, “Epistle”\rhttp://tinyurl.com/6h68vhn";
    epistle.category = @"Biblical";
    
    Word *eros = [[Word alloc] init];
    eros.name = @"Eros";
    eros.twitterDef = @"the Greek word meaning\r“physical love”";
    eros.definition = @"Eros - ερος (eros) -  is used to refer especially to physical love, or the love that passionately desires to possess.\r\rFurther Reference:\rWikipedia, “Eros”\rhttp://tinyurl.com/mw6ea3v";
    eros.category = @"Moral";
    
    Word *etiology = [[Word alloc] init];
    etiology.name = @"Etiology";
    etiology.twitterDef = @"a traditional story that explains a contemporary situation";
    etiology.definition = @"The Old Testament contains numerous etiologies\r\rFurther Reference:\rWikipedia, “Etiology“\rhttp://tinyurl.com/yg6hn9";
    etiology.category = @"Biblical";
    
    Word *evangelist = [[Word alloc] init];
    evangelist.name = @"Evangelist";
    evangelist.twitterDef = @"a person who spreads good news";
    evangelist.definition = @"The word Evangelist can be applied to any person who spreads good news. In Theology, it is usually reserved for one of the authors of the four gospels.\r\rFurther Reference:\r";
    evangelist.category = @"Biblical";
    
    Word *exegesis = [[Word alloc] init];
    exegesis.name = @"Exegesis";
    exegesis.twitterDef = @"the process of determining the meaning of a text in its original context";
    exegesis.definition = @"Exegesis is a necessary element of hermeneutics. It is an essential component of the Historical-Critical Method; from the Greek εξ (ex) “out” and αγω (ago) “to go”. See “Hermeneutics”, “Historical-Critical Method”\r\rFurther Reference:\rFelix Just S.J., “Biblical Exegeis”\rhttp://tinyurl.com/k3u6rma";
    exegesis.category = @"Biblical";
    
    Word *exile = [[Word alloc] init];
    exile.name = @"Exile";
    exile.twitterDef = @"the banishment of the southern kingdom of Judah to Babylon in 587 B.C.";
    exile.definition = @"The Exile was the most traumatic experience in the life of ancient Israel.\r\rFurther Reference:\r";
    exile.category = @"Biblical";
    
    Word *exodus = [[Word alloc] init];
    exodus.name = @"Exodus";
    exodus.twitterDef = @"the liberation of the Israelite slaves from Egypt through the obedience of Moses";
    exodus.definition = @"The Exodus is traditionally dated to ca. 1275 BCE in the reign of Ramases II. It is the foundational event of the Israelite nation; current biblical research supports the idea of a small group of slaves leaving Egypt, having a Divine revelation in Midian, and traveling to Canaan. 2. The second book of the Torah.\r\rFurther Reference:\r";
    exodus.category = @"Biblical";
    
    Word *elementary = [[Word alloc] init];
    elementary.name = @"Elementary Experience";
    elementary.twitterDef = @"the complex of needs and evidences that humans have for truth, justice, beauty, and goodness";
    elementary.definition = @"According to Fr. Luigi Giussani, the complex of needs and evidences that humans have for truth, justice, beauty, and goodness.\r\rFurther Reference:\r";
    elementary.category = @"Cultural";
    
    Word *epistemology = [[Word alloc] init];
    epistemology.name = @"Epistemology";
    epistemology.twitterDef = @"the study of the origin, nature, and limits of human knowledge";
    epistemology.definition = @"Epistemology is one of the three traditional subjects of Western philosophy.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Epistemology” http://tinyurl.com/pj7qp";
    epistemology.category = @"Cultural";
    
    Word *existential = [[Word alloc] init];
    existential.name = @"Existentialism";
    existential.twitterDef = @"a philosophical movement centered upon the nature of human existence";
    existential.definition = @"1. Of or relating to existence. 2. A philosophical movement which gained popularity in the late 19th century.\r\rFurther Reference:\r";
    existential.category = @"Cultural";
    
    Word *explanandum = [[Word alloc] init];
    explanandum.name = @"Explanandum";
    explanandum.twitterDef = @"a Latin word meaning\r“that which is explained by something else”";
    explanandum.definition = @"In the study of Logic, the explanandum is always explained by something else.\r\rFurther Reference:\r";
    explanandum.category = @"Cultural";
    
    Word *explanans = [[Word alloc] init];
    explanans.name = @"Explanans";
    explanans.twitterDef = @"a Latin word meaning\r“that which explains something else”";
    explanans.definition = @"In the study of Logic, the explanans always explains something else...";
    explanans.category = @"Cultural";
    
    Word *environmentalism = [[Word alloc] init];
    environmentalism.name = @"Environmentalism";
    environmentalism.twitterDef = @"the concern for the environment as a matter of social justice";
    environmentalism.definition = @"The movement, which gained popularity in the 1960s in the United States, that emphasizes concern for the environment as a matter of public policy and social justice.\r\rFurther Reference:\r";
    environmentalism.category = @"Cultural";

    
    [_dataArray addObjectsFromArray:@[ecumenism, economic, el, election, elementary, elohim, elohistSource, epistemology, epistle, eros, eschatology, essence, ethics, etiology, eucharist, evangelist, exclusivism,eisegesis, exegesis, exile, existential, exNihilo, explanandum, explanans, exodus, exOpere, environmentalism]];
    
    //F
    
    Word *faith = [[Word alloc] init];
    faith.name = @"Faith";
    faith.twitterDef = @"1. trust or confidence\r2. the content of a religious tradition";
    faith.definition = @"In Catholicism, both uses of faith are very common.\r\rFurther Reference:\rCatechism of the Catholic Church, 1814\rhttp://tinyurl.com/pd2yc32";
    faith.category = @"Systematic";
    
    Word *fideism = [[Word alloc] init];
    fideism.name = @"Fideism";
    fideism.twitterDef = @"the belief that....";
    fideism.definition = @"The belief that..";
    fideism.category = @"Systematic";
    
    Word *fallibilism = [[Word alloc] init];
    fallibilism.name = @"Fallibilism";
    fallibilism.twitterDef = @"the idea that humans can have inaccurate, yet justified beliefs about the world";
    fallibilism.definition = @"The idea that humans can have inaccurate, yet justified beliefs about the world. \r\rFurther Reference:\rInternet Ecyclopedia of Philosophy,“Fallibilism\rhttp://tinyurl.com/q6we5fk";
    fallibilism.category = @"Systematic";
    
    Word *foreknowledge = [[Word alloc] init];
    foreknowledge.name = @"Foreknowledge";
    foreknowledge.twitterDef = @"the belief that God knows future events";
    foreknowledge.definition = @"The belief that God knows future events; this idea features prominently in post-Exilic Hebrew literature and in the New Testament; associated philosophical problems include constraints on human freedom and the problem of evil. \r\rFurther Reference:\rCatechism of the Catholic Church, 600\rhttp://tinyurl.com/p3dfabj\r\rStanford Encylopedia of Philosophy, “Foreknowledge and Free Will”\r http://tinyurl.com/g8eze";
    foreknowledge.category = @"Systematic";
    
    Word *freewill = [[Word alloc] init];
    freewill.name = @"Free Will";
    freewill.twitterDef = @"the ability to freely make a rational choice";
    freewill.definition = @"The ability to choose.\r\rFurther Reference:\rCatechism of the Catholic Church, 1731\rhttp://tinyurl.com/qzj6nl9";
    freewill.category = @"Systematic";
    
    Word *folio = [[Word alloc] init];
    folio.name = @"Folio";
    folio.twitterDef = @"a page within a manuscript";
    folio.definition = @"In textual criticism, folios are sometimes all that remains of a larger manuscript.\r\rFurther Reference:\rWikipedia, “Folio”\rhttp://tinyurl.com/37amz3t";
    folio.category = @"Biblical";
    
    Word *formalEquivalence = [[Word alloc] init];
    formalEquivalence.name = @"Formal Eqivalence";
    formalEquivalence.twitterDef = @"a translation philosophy that seeks to render the text word for word";
    formalEquivalence.definition = @"The 2011 English translation of the Mass is based on formal equivalence, sometimes resulting in odd sentence structure as Latin syntax works differently than that of English.";
    formalEquivalence.category = @"Biblical";
    
    Word *formCriticism = [[Word alloc] init];
    formCriticism.name = @"Form Criticism";
    formCriticism.twitterDef = @"a type of criticism which deciphers and analyzes a text's genre or literary form";
    formCriticism.definition = @"Form Criticism is mentioned as necessary to proper exegesis in Vatican II's Dogmatic Constitution on Divine Revelation, “Dei Verbum”:\r\r“To search out the intention of the sacred writers, attention should be given, among other things, to 'literary forms'. For truth is set forth and expressed differently in texts which are variously historical, prophetic, poetic, or of other forms of discourse.”\r\rForm Criticism is one of the criticisms used by the Historical-Critical Method. See “Exegesis”, “Historical-Critical Method”.\r\rFurther Reference:\rVatican II, “Dei Verbum”, III.12\rhttp://tinyurl.com/3ecxu";
    formCriticism.category = @"Biblical";
    
    Word *fundamentalism = [[Word alloc] init];
    fundamentalism.name = @"Fundamentalism";
    fundamentalism.twitterDef = @"a fundamenalist method that exclusively uses a literalist criteron for interpretation";
    fundamentalism.definition = @"In addition to describing a particular hermeneutical method, fundamentalism also refers to an anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith. This approach to a sacred text also extends to Judaism, Islam, and other religions. The term can also refer to a strict adherence to a given viewpoint.\r\rFurther Reference:\rWikipedia, “Fundamentalism”\rhttp://tinyurl.com/2xvbkc";
    fundamentalism.category = @"Biblical";
    
    Word *fundamentalOption = [[Word alloc] init];
    fundamentalOption.name = @"Fundamental Option";
    fundamentalOption.twitterDef = @"a person's basic, spiritual orientation";
    fundamentalOption.definition = @"Karl Rahner was the first to develop this concept.\r\rFurther Reference:\rCatechism of the Catholic Church, 847\rhttp://tinyurl.com/oupb5";
    
    Word *feminism = [[Word alloc] init];
    feminism.name = @"Feminism";
    feminism.twitterDef = @"the movement that seeks female liberation from patriarchal structures and norms";
    feminism.definition = @"Feminism was widely influential in the twentieth century.\r\rFurther Reference:\rWikipedia, Feminism\rhttp://tinyurl.com/mdu3o";
    feminism.category = @"Cultural";


    
    [_dataArray addObjectsFromArray:@[faith, fideism, fallibilism, feminism, folio, foreknowledge, formalEquivalence, formCriticism, freewill, fundamentalism, fundamentalOption]];
    
    //G
    
    Word *grace = [[Word alloc] init];
    grace.name = @"Grace";
    grace.twitterDef = @"unmerited favor";
    grace.definition = @"unmerited favor.\r\rFurther Reference:\rCatechism of the Catholic Church, 1996\rhttp://tinyurl.com/yaua7cc";
    grace.category = @"Systematic";
    
    Word *gehenna = [[Word alloc] init];
    gehenna.name = @"Gehenna";
    gehenna.twitterDef = @"a valley near Jerusalem in which devotees would sacrifice children in fire";
    gehenna.definition = @"A valley near Jerusalem (the Valley of Hinnom) where a non-Israelite shrine to the Canaanite god Moloch once stood and where human sacrifice of babies by burning took place. It seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed); used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1034\rhttp://tinyurl.com/l9ha57h\r\rWikipedia, Gehenna\rhttp://tinyurl.com/ymbj2d";
    gehenna.category = @"Biblical";
    
    Word *genre = [[Word alloc] init];
    genre.name = @"Genre";
    genre.twitterDef = @"a french word meaning\r“the literary form of a text”";
    genre.definition = @"A French word referring to the literary form of a text.\r\rFurther Reference:\rWikipedia, Genre http://tinyurl.com/gsh83";
    genre.category = @"Biblical";
    
    Word *gospel = [[Word alloc] init];
    gospel.name = @"Gospel";
    gospel.twitterDef = @"the message of and about Jesus of Narareth\rconcerning God, Israel, and the world";
    gospel.definition = @"1. The message of the historical Jesus concerning the Kingdom of God; 2. The message about Jesus concerning the salvation of the world; 3. One of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John); from the Greek word ευαγγελιον (evangelion) - “good news”.\r\rFurther Reference:\rCatechism of the Catholic Church, 75\rhttp://tinyurl.com/bx8mnlu";
    gospel.category = @"Biblical";

    
    [_dataArray addObjectsFromArray:@[gehenna, genre, gospel, grace]];
    
    //H
    
    Word *heaven = [[Word alloc] init];
    heaven.name = @"Heaven";
    heaven.twitterDef = @"the state of complete union with God";
    heaven.definition = @"Heaven is the state of those who enter eternal life in God's grace and friendship.\r\rFurther Reference:\rCatechism of the Catholic Church, 1021\rhttp://tinyurl.com/k3f2f8p";
    heaven.category = @"Systematic";
    
    Word *hell = [[Word alloc] init];
    hell.name = @"Hell";
    hell.twitterDef = @"the state of complete separation from God";
    hell.definition = @"Hell is the state of those who willingly refuse God's love and enter eternal life with the inablity to repent.\r\rFurther Reference:\rCatechism of the Catholic Church, 1033\rhttp://tinyurl.com/k3f2f8p";
    hell.category = @"Systematic";
    
    Word *henotheism = [[Word alloc] init];
    henotheism.name = @"Henotheism";
    henotheism.twitterDef = @"the belief that many gods exist while only one is served";
    henotheism.definition = @"The pre-exilic Israelites believed that foreign gods were real, but they only had a covenant with YHWH.\r\rFurther Reference:\rWikipedia, “Henotheism”\rhttp://tinyurl.com/chgvyn";
    henotheism.category = @"Systematic";
    
    Word *heresy = [[Word alloc] init];
    heresy.name = @"Heresy";
    heresy.twitterDef = @"the formal denial of revealed truth";
    heresy.definition = @"The formal contradiction of orthodox belief.\r\rFurther Reference:\rCatechism of the Catholic Church, 2089\rhttp://tinyurl.com/lu75a9k";
    heresy.category = @"Systematic";
    
    Word *hierarchy = [[Word alloc] init];
    hierarchy.name = @"Hierarchy of Truths";
    hierarchy.twitterDef = @"the idea that some truths are more essential to salvation than others";
    hierarchy.definition = @"The idea that some truths are more essential to salvation than others.\r\rFurther Reference:\rCatechism of the Catholic Church, 873\rhttp://tinyurl.com/m65ttaf";
    hierarchy.category = @"Systematic";
    
    Word *humanRights = [[Word alloc] init];
    humanRights.name = @"Human Rights";
    humanRights.twitterDef = @"the rights due to a person by virtue of his or her being a human being";
    humanRights.definition = @"A list of thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 152 http://tinyurl.com/qfo6bd7";
    humanRights.category = @"Moral";
    
    Word *hermeneutics = [[Word alloc] init];
    hermeneutics.name = @"Hermeneutics";
    hermeneutics.twitterDef = @"the science of interpretation and process of determining meaning";
    hermeneutics.definition = @"The science of interpretation and process of determining meaning, usually of a text - from the name of the Greek god “Hermes”, the messenger of the gods.\r\rFurther Reference:\r";
    hermeneutics.category = @"Biblical";
    
    Word *historicalBooks = [[Word alloc] init];
    historicalBooks.name = @"Historical Books";
    historicalBooks.twitterDef = @"the second of four divisions within the Old Testament";
    historicalBooks.definition = @"The second of four divisions within the Old Testament; contains 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, Nehemiah, Tobit, Judith, Esther, 1 & 2 Maccabees.\r\rFurther Reference:\r";
    historicalBooks.category = @"Biblical";
    
    Word *hcm = [[Word alloc] init];
    hcm.name = @"Historical-Critical Method";
    hcm.twitterDef = @"the hermeneutical method which examines the author's intent through exegetical analysis";
    hcm.definition = @"The hermeneutical method which seeks to uncover the intention of the author through exegetical analysis of history, language, literature, sources, and culture. According to the Pontifical Biblical Commission, it is the one essential method for Catholic hermeneutics.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, I.A”, http://tinyurl.com/2gb5dm";
    hcm.category = @"Biblical";
    
    Word *historicalCriticism = [[Word alloc] init];
    historicalCriticism.name = @"Historical Criticism";
    historicalCriticism.twitterDef = @"the type of criticism which deciphers and analyzes the historical context of a text.";
    historicalCriticism.definition = @"The type of exegetical criticism which deciphers and analyzes the historical context of a text.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, I.A.2”, http://tinyurl.com/2gb5dm";
    historicalCriticism.category = @"Biblical";
    
    Word *holyOfHolies = [[Word alloc] init];
    holyOfHolies.name = @"Holy of Holies";
    holyOfHolies.twitterDef = @"the innermmost chamber in the Temple\rthat housed the Ark of the Covenant";
    holyOfHolies.definition = @"The innermmost area of the Temple in Jerusalem where the Ark of the Covenant was believed to reside from the monarchy of Solomon until the Exile in 587 BCE.\r\rFurther Reference:\rEncyclopedia Britannica, “Holy of Holies”\rhttp://tinyurl.com/lcagxrw";
    holyOfHolies.category = @"Biblical";

    Word *humanEcology = [[Word alloc] init];
    humanEcology.name = @"Human Ecology";
    humanEcology.twitterDef = @"the environmental context of the human person in light of the truths of Creation";
    humanEcology.definition = @"The environmental context of the human person in light of the truths of Creation and the challenges posed by climate change and other developmental factors in which justice is neglected. Pope Francis has made the subject of human ecology a theme of his latest encyclical.\r\rFurther Reference:\rwww.vatican.va/....";
    humanEcology.category = @"Moral";
    
    Word *humanPerson = [[Word alloc] init];
    humanPerson.name = @"Human Person";
    humanPerson.twitterDef = @"a human being with the capacity\rfor self-transcendence.";
    humanPerson.definition = @"According to the teaching of the Church, human beings are also human persons from the moment of conception. Disputed questions include the pheneomenon of twinning and the problems associated with dualism.\r\rFurther Reference:\rCatechism of the Catholic Church, 2270\rhttp://tinyurl.com/dh7r";
    humanPerson.category = @"Systematic";

    
    [_dataArray addObjectsFromArray:@[heaven, hell, henotheism, heresy, hermeneutics, hierarchy, historicalBooks, hcm, historicalCriticism, holyOfHolies, humanRights, humanEcology, humanPerson]];
    
    //I
    
    Word *immanence = [[Word alloc] init];
    immanence.name = @"Immanence";
    immanence.twitterDef =  @"the quality of being within human experience";
    immanence.definition = @"The quality of being within human experience.\r\rFurther Reference:\r\rCatechism of the Catholic Church, 239\rhttp://tinyurl.com/4tymjt";
    immanence.category = @"Systematic";
    
    Word *idolatry = [[Word alloc] init];
    idolatry.name = @"Idolatry";
    idolatry.twitterDef = @"the bestowal of ultimate value on that which is not ultimate";
    idolatry.definition = @"The bestowal of ultimate value on that which is not ultimate.\r\rFurther Reference:\rCatechism of the Catholic Church, 2113\rhttp://tinyurl.com/lu75a9k";
    idolatry.category = @"Systematic";
    
    Word *inclusivism = [[Word alloc] init];
    inclusivism.name = @"Inclusivism";
    inclusivism.twitterDef = @"the belief that those who respond to the truth they have receieved will experience salvation";
    inclusivism.definition = @"Inclusivism is a soteriology developed by Karl Rahner in the mid-twentieth century. He claimed that all people possess a fundamental option for or against God.\r\rFurther Reference:\rCatechism of the Catholic Church, 847\rhttp://tinyurl.com/oupb5";
    inclusivism.category = @"Systematic";
    
    Word *inspiration = [[Word alloc] init];
    inspiration.name = @"Inspiration";
    inspiration.twitterDef = @"that which provides the “breath of life”\ror motivation behind a course of action";
    inspiration.definition = @"Divine Inspiration is understood to mean that God has provided the “breath of life” or motivation for a course of action - from the Latin word for both “spirit” and “breath”.\r\rFurther Reference:\rVatican II, Dei Verbum, 11\rhttp://tinyurl.com/3ecxu";
    inspiration.category = @"Biblical";
    
    Word *interpretation = [[Word alloc] init];
    interpretation.name = @"Interpretation";
    interpretation.twitterDef = @"the explanation of the meaning, significance, and relevance of a text.";
    interpretation.definition = @"The explanation of the meaning, significance, and relevance of a text.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/2gb5dm";
    interpretation.category = @"Biblical";
    
    Word *israel = [[Word alloc] init];
    israel.name = @"Israel";
    israel.twitterDef = @"the name given to Jacob meaning\r“struggles with God”";
    israel.definition = @"The name given to Jacob which means “struggles with God”.\r\rFurther Reference:\rCatechism of the Catholic Church, 62\rhttp://tinyurl.com/pesbbq3";
    israel.category = @"Biblical";

    
    [_dataArray addObjectsFromArray:@[idolatry, immanence, inclusivism, inspiration, interpretation, israel]];
    
    //J
    
    Word *jesus = [[Word alloc] init];
    jesus.name = @"Jesus of Nazareth";
    jesus.twitterDef = @"the first-century Jewish prophet who proclaimed the Kingdom of God";
    jesus.definition = @"The first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.\r\rFurther Reference:\r";
    jesus.category = @"Biblical";
    
    Word *justification = [[Word alloc] init];
    justification.name = @"Justification";
    justification.twitterDef = @"the act of being put into a just relationship";
    justification.definition = @"The act of being put into a just relationship. Paul uses this word to describe those who believe in Jesus as the Christ.\r\rFurther Reference:\r";
    justification.category = @"Systematic";
    
    Word *justice = [[Word alloc] init];
    justice.name = @"Justice";
    justice.twitterDef = @"the state of right relationships between individuals and groups in society.";
    justice.definition = @"the state of right relationships between individuals and groups in society.\r\rFurther Reference:\r";
    justice.category = @"Moral";
    
    Word *jusAdBellum = [[Word alloc] init];
    jusAdBellum.name = @"Jus Ad Bellum";
    jusAdBellum.twitterDef = @"a set of criteria used to determine if war is justified in a given situation"; 
    jusAdBellum.definition = @"Latin for “justice to war” - a set of criteria used to determine if war is justified in a given situation: just cause, comparative justice, competent authority, right intention, probability of success, last resort, proportionality; see “Just War Theory”.\r\rFurther Reference:\r";
    jusAdBellum.category = @"Moral";
    
    Word *jusImBello = [[Word alloc] init];
    jusImBello.name = @"Jus Im Bello";
    jusImBello.twitterDef = @"a set of criteria used to determine if the methods of war are justified";
    jusImBello.definition = @"Latin for “justice in war” - a set of criteria used to determine if the methods of war are justified: distinction, proportionality, military necessity; see “Just War Theory”.\r\rFurther Reference:\r";
    jusImBello.category = @"Moral";
    
    Word *justWar = [[Word alloc] init];
    justWar.name = @"Just War Theory";
    justWar.twitterDef = @"the set of criteria for determining the justice of both the conditions and methods of war";
    justWar.definition = @"The theory first developed by Augustine and later refined by Aquinas which consists of criteria for determining the justice of both the conditions and methods of war; see “Jus Ad Bellum” and “Jus Im Bello”.\r\rFurther Reference:\r";
    justWar.category = @"Moral";
    
    /*
    Word *jerusalem = [[Word alloc] init];
    jerusalem.name = @"Jerusalem";
    jerusalem.twitterDef = @"The capital of the united monarchy established under David";
    jerusalem.definition = @"The capital of the united monarchy established under David; the captial of the southern kingdom of Judah after the death of Solomon; the location of Mount Zion and the Temple.";
    jerusalem.category = @"Biblical";
     */
    
    Word *jew = [[Word alloc] init];
    jew.name = @"Jew";
    jew.twitterDef = @"a member of the tribe of Judah used to refer to any Israelite after the return from the Exile in 515 B.C.";
    jew.definition = @"a member of the tribe of Judah used to refer to any Israelite after the return from the Exile in 515 B.C.\r\rFurther Reference:\r";
    jew.category = @"Biblical";
    
    Word *judah = [[Word alloc] init];
    judah.name = @"Judah";
    judah.twitterDef = @"1. the fourth son of Jacob. 2. the southern kingdom established after the death of Solomon in 922 B.C.";
    judah.definition = @"The tribe of Judah enjoyed a priviledged status during the monarchy.\r\rFurther Reference:\r";
    judah.category = @"Biblical";

    
    [_dataArray addObjectsFromArray:@[jesus, jew, judah, justice, jusAdBellum, jusImBello, justification, justWar]];
    
    //K
    
    Word *kataphatic = [[Word alloc] init];
    kataphatic.name = @"Kataphatic";
    kataphatic.twitterDef = @"language which makes postiive claims about God";
    kataphatic.definition = @"language which makes postiive claims about God";
    kataphatic.category = @"Systematic";
    
    Word *kenosis = [[Word alloc] init];
    kenosis.name = @"Kenosis";
    kenosis.twitterDef = @"a Greek word meaning\r“the process of emptying”";
    kenosis.definition = @"Kenosis is used by Paul in his letter to the Philippians to describe the self-emptying of Jesus.\r\rFurther Reference:\r";
    kenosis.category = @"Systematic";
    
    Word *ketuvim = [[Word alloc] init];
    ketuvim.name = @"Ketuv'im";
    ketuvim.definition = @"the Hebrew word meaning\r“writings”; the third of three sections in the Tanak; see “Tanak”\r\rFurther Reference:\r";
    ketuvim.category = @"Biblical";
    
    Word *kosher = [[Word alloc] init];
    kosher.name = @"Kosher";
    kosher.twitterDef = @"foods that are “fitting” or “appropriate” to eat or be sacrificed to YHWH";
    kosher.definition = @"often translated as “clean”, this refers to foods that are “fitting” or “appropriate” to eat or be sacrificed to YHWH according to the Torah.\r\rFurther Reference:\r";
    kosher.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[kataphatic, kenosis, ketuvim, kosher]];
    
    //L
    
    Word *law = [[Word alloc] init];
    law.name = @"Law";
    law.twitterDef = @"the first five books of the Pentateuch containing a collection of various commandments and legal codes for the Israelites.";
    law.definition = @"the first five books of the Pentateuch containing a collection of various commandments and legal codes for the Israelites.\r\rFurther Reference:\r";
    law.category = @"Biblical";
    
    Word *levite = [[Word alloc] init];
    levite.name = @"Levite";
    levite.twitterDef = @"one of the 12 tribes of Israel; according to the Elohist source, the Levites were all designated as priests of YHWH after rallying with Moses in Exodus 32.";
    levite.definition = @"one of the 12 tribes of Israel; according to the Elohist source, the Levites were all designated as priests of YHWH after rallying with Moses in Exodus 32.\r\rFurther Reference:\r";
    levite.category = @"Biblical";
    
    Word *literary = [[Word alloc] init];
    literary.name = @"Literary Criticism";
    literary.twitterDef = @"the type of criticism that deciphers and analyzes the literary characteristics of a text";
    literary.definition = @"the type of exegetical criticism that deciphers and analyzes the literary characteristics of a text, including form, setting, plot, characterization, denouement, theme, and climax.\r\rFurther Reference:\r";
    literary.category = @"Biblical";
    
    Word *lxx = [[Word alloc] init];
    lxx.name = @"LXX";
    lxx.twitterDef = @"the numerical symbol for the Septuagint";
    lxx.definition = @"the numerical symbol for the Septuagint; named for the supposed 70 translators of the Tanak into Greek at the request of Alexander the Great.\r\rFurther Reference:\r";
    lxx.category = @"Biblical";

    Word *liberation = [[Word alloc]init];
    liberation.name = @"Liberation Theology";
    liberation.definition = @"the theological movement associated with the idea that the gospel is only authentic in the face of radical poverty.\r\rFurther Reference:\r";
    liberation.category = @"Systematic";
    
    Word *liturgyH = [[Word alloc] init];
    liturgyH.name = @"Liturgy of the Hours";
    liturgyH.twitterDef = @"the cycle of daily prayer offered by the Church throughout the liturgical year;\ralso called “The Divine Office”";
    liturgyH.definition = @"The Liturgy of the Hours is an ancient practice that dates back to the earliest days of the Church, which inhereited from Judaism the custom of praying at set times during the day. The Divine Office is the public prayer of the Church, which is offered continuously by both clergy and laity.\r\rCatechism of the Catholic Church, 1174\rhttp://tinyurl.com/p9382z5";
    liturgyH.category = @"Liturgical";
    
    Word *lawNC = [[Word alloc] init];
    lawNC.name = @"Law of Non-Contradiction";
    lawNC.twitterDef = @"A and ~A cannot both be true at the same time in the same way";
    lawNC.definition = @"This principle is first found in the writings of Aristotle, in his fourth book on Metaphysics. There he claims that without this principle, no learning could be possible.\r\rStanford Encyclopedia of Philosophy, “Aristotle on Non-Contradiction”\rhttp://tinyurl.com/yvzfdk";
    lawNC.category = @"Cultural";
    
    Word *living = [[Word alloc] init];
    living.name = @"Living Wage";
    living.twitterDef = @"A form of income that is enables a worker to support his or her family";
    living.definition = @"A form of income that is enables a worker to support his or her family. It should be noted that at the time Pope Leo XIII taught this in Rerum Novarum, women did not work.\r\rFurther Reference:\r";
    living.category = @"Cultural";
    
    Word *logic = [[Word alloc] init];
    logic.name = @"Logic";
    logic.twitterDef = @"the science of reasoning";
    logic.definition = @"the science of reasoning.\r\rFurther Reference:\rUniversity of Oxford, “The Logic Web”\rhttp://tinyurl.com/y8lr2lh.\r\rWikipedia, “Logic”\rhttp://tinyurl.com/q2uqv3x";
    logic.category = @"Cultural";

    [_dataArray addObjectsFromArray:@[law, lawNC, levite, liberation, literary, living, logic, lxx, liturgyH]];
    
    //M
    
    Word *miracle = [[Word alloc] init];
    miracle.name = @"Miracle";
    miracle.twitterDef = @"a supernatural event which defies scientific explanation";
    miracle.definition = @"In common parlance, miracles are events which violate the laws of nature.\r\rFurther Reference:\r";
    miracle.category = @"Systematic";
    
    Word *monotheism = [[Word alloc] init];
    monotheism.name = @"Monotheism";
    monotheism.twitterDef = @"the belief in only one God";
    monotheism.definition = @"the belief in only one God.";
    monotheism.category = @"Systematic";
    
    Word *morality = [[Word alloc] init];
    morality.name = @"Morality";
    morality.twitterDef = @"customary norms of behavior considered good or evil";
    morality.definition = @"customary norms of behavior considered good or evil, right or wrong in a given system.";
    morality.category = @"Moral";
    
    Word *mystery = [[Word alloc] init];
    mystery.name = @"Mystery";
    mystery.twitterDef = @"that which transcends human comprehension and explanation";
    mystery.definition = @"that which transcends human comprehension and explanation.\r\rFurther Reference:\r";
    mystery.category = @"Systematic";
    
    Word *manuscript = [[Word alloc] init];
    manuscript.name = @"Manuscript";
    manuscript.twitterDef = @"a hand-written copy of a text";
    manuscript.definition = @"a hand-written copy of a text.\r\rFurther Reference:\r";
    manuscript.category = @"Biblical";
    
    Word *messiah = [[Word alloc] init];
    messiah.name = @"Messiah";
    messiah.twitterDef = @"the Hebrew equivalent title to “Christ”";
    messiah.definition = @"Christ was used by the early Christians to refer to the divinely designated status of Jesus of Nazareth - from the Hebrew for “annointed one”.\r\rFurther Reference:\r";
    messiah.category = @"Biblical";
    
    Word *mishnah = [[Word alloc] init];
    mishnah.name = @"Mishnah";
    mishnah.twitterDef = @"the traditional oral commentary on the Torah";
    mishnah.definition = @"an oral commentary on the Torah.\r\rFurther Reference:\r";
    mishnah.category = @"Biblical";
    
    Word *myth = [[Word alloc] init];
    myth.name = @"Myth";
    myth.twitterDef = @"a story that cannot be historically verified";
    myth.definition = @"a story that cannot be historically verified.\r\rFurther Reference:\r";
    myth.category = @"Biblical";
    
    Word *metaphysics = [[Word alloc] init];
    metaphysics.name = @"Metaphysics";
    metaphysics.twitterDef = @"the study of the fundamental nature of reality";
    metaphysics.definition = @"The study of ontology; a highly contested area of inquiry that has including a variation of topics throughout history since the time of Aristotle.\r\rFurther Reference:\rRoutledge Encyclopedia of Philosophy, “Metaphysics”\rhttp://tinyurl.com/mydu3hx";
    metaphysics.category = @"Cultural";

    
    [_dataArray addObjectsFromArray:@[manuscript, messiah, metaphysics, miracle, mishnah, monotheism, morality, mystery, myth]];
    
    //N
    
    Word *natural  = [[Word alloc] init];
    natural.name = @"Natural Law";
    natural.twitterDef = @"the universal moral norm, accessible by human reason";
    natural.definition = @"the universal moral norm, accessible by human reason.\r\rFurther Reference:\r";
    natural.category = @"Moral";
    
    Word *naturalTheo = [[Word alloc] init];
    naturalTheo.name = @"Natural Theology";
    naturalTheo.twitterDef = @"the study of God by inference from the facts of the physical world";
    naturalTheo.definition = @"the study of God by inference from the facts of the physical world.\r\rFurther Reference:\r";
    naturalTheo.category = @"Systematic";
    
    Word *neviim = [[Word alloc] init];
    neviim.name = @"Nevi'im";
    neviim.twitterDef = @"the Hebrew word meaning\r“prophets”";
    neviim.definition = @"The Hebrew word for “Prophets”; the term given the second of the three sections of the Tanak.\r\rFurther Reference:\r";
    neviim.category = @"Biblical";
    
    Word *newTestament = [[Word alloc] init];
    newTestament.name = @"New Testament";
    newTestament.twitterDef = @"the 27 books dealing with the life of Jesus of Nazareth and his followers";
    newTestament.definition = @"The New Testament contains the 4 gospels, the Acts of the Apostles, numerous epistles, and the Apocalypse.\r\rFurther Reference:\r";
    newTestament.category = @"Biblical";
    
    Word *niceneCo = [[Word alloc] init];
    niceneCo.name = @"Nicene-Constantiopolitan Creed";
    niceneCo.twitterDef = @"the creed initially formulated at the Council of Constantinople in A.D. 381 and based on the prior Nicene Creed in A.D. 325";
    niceneCo.definition = @"“We believe in one God, the Father, the Almighty, maker of heaven and earth, of all that is, seen and unseen. \r\rWe believe one Lord, Jesus Christ, the only Son of God, eternally begotten of the Father, God from God, Light from Light, true God from true God, begotten, not made, one in Being with the Father. Through Him all things were made. For us men and for our salvation, He came down from heaven: by the power of the Holy Spirit He was born of the Virgin Mary, and became Man. For our sake He was crucified under Pontius Pilate. He suffered, died, and was buried. On the third day He rose again in fulfillment of the Scriptures; He ascended into heaven, and is seated at the right hand of the Father. He will come again in glory to judge the living and the dead, and His kingdom will have no end. \r\rWe believe in the Holy Spirit, the Lord, the Giver of life, Who proceeds from the Father and the Son. With the Father and the Son He is worshiped and glorified. He has spoken through the prophets.\r\rWe believe in one, holy, catholic, and apostolic Church. We acknowledge one Baptism for the forgiveness of sins. We look for the resurrection of the dead, and the life of the world to come. Amen.”\r\rFurther Reference:\r";
    niceneCo.category = @"Historical"; 
    
    Word *numinous = [[Word alloc] init];
    numinous.name = @"Numinous";
    numinous.twitterDef = @"the category of religous experience as defined by Rudoph Otto";
    numinous.definition = @"The category of religous experience as defined by Rudoph Otto.\r\rFurther Reference:\r";
    numinous.category = @"Systematic";
    
    Word *naturalism = [[Word alloc] init];
    naturalism.name = @"Naturalism";
    naturalism.twitterDef = @"the belief that nature is all that exists and denies a supernatural order";
    naturalism.definition = @"The belief that nature is all that exists and denies a supernatural order.\r\rFurther Reference:\r";
    naturalism.category = @"Cultural";

    
    [_dataArray addObjectsFromArray:@[natural, naturalism, naturalTheo, neviim, newTestament, numinous, niceneCo]];
    
    //O
    
    Word *omnibenevolence = [[Word alloc] init];
    omnibenevolence.name = @"Omnibenevolence";
    omnibenevolence.twitterDef = @"the quality of being all-loving";
    omnibenevolence.definition = @"The quality of being all-loving.\r\rFurther Reference:\r";
    omnibenevolence.category = @"Systematic";
    
    Word *omnipotence = [[Word alloc] init];
    omnipotence.name = @"Omnipotence";
    omnipotence.twitterDef = @"the quality of being all-powerful";
    omnipotence.definition = @"The quality of being all-powerful.\r\rFurther Reference:\r";
    omnipotence.category = @"Systematic";
    
    Word *omnipresence = [[Word alloc] init];
    omnipresence.name = @"Omnipresence";
    omnipresence.twitterDef = @"the quality of being all-present";
    omnipresence.definition = @"The quality of being all-present.\r\rFurther Reference:\r";
    omnipresence.category = @"Systematic";
    
    Word *omniscience = [[Word alloc] init];
    omniscience.name = @"Omniscience";
    omniscience.twitterDef = @"the quality of being all-knowing";
    omniscience.definition = @"The quality of being all-knowing.\r\rFurther Reference:\r";
    omniscience.category = @"Systematic";
    
    Word *ontological = [[Word alloc] init];
    ontological.name = @"Ontological Argument";
    ontological.twitterDef = @"the argument that states God, as the greatest possible Being, is a necessary Being";
    ontological.definition = @"The argument, first formulated by Anselm of Canterburry, that states God, as the greatest possible Being, is a necessary Being.\r\rFurther Reference:\r";
    ontological.category = @"Systematic";
    
    Word *openTheism = [[Word alloc] init];
    openTheism.name = @"Open Theism";
    openTheism.twitterDef = @"a theological movement characterized by the belief that there are logical limits on God's power and knowledge";
    openTheism.definition = @"a theological movement characterized by the belief that there are logical limits on God's power and knowledge.\r\rFurther Reference:\r";
    openTheism.category = @"Systematic";
    
    Word *orthodox = [[Word alloc] init];
    orthodox.name = @"Orthodox";
    orthodox.twitterDef = @"a Greek word meaning “straight belief”";
    orthodox.definition = @"A Greek word meaning 'straight belief.\r\rFurther Reference:\r";
    orthodox.category = @"Systematic";
    
    Word *orthopraxis = [[Word alloc] init];
    orthopraxis.name = @"Orthopraxis";
    orthopraxis.twitterDef = @"a Greek word meaning “straight practice”";
    orthopraxis.definition = @"a Greek word meaning 'straight practice.\r\rFurther Reference:\r";
    orthopraxis.category = @"Systematic";
    
    Word *oldTestament = [[Word alloc] init];
    oldTestament.name = @"Old Testament";
    oldTestament.twitterDef = @"the 46 books dealing with the people of Israel";
    oldTestament.definition = @"the 46 books dealing with the people of Israel; contains the Pentateuch, Historical Books, Wisdom Books, and Prophetic Books.\r\rFurther Reference:\r";
    oldTestament.category = @"Biblical";
    
    Word *oracle = [[Word alloc] init];
    oracle.name = @"Oracle";
    oracle.definition = @"a prophetic medium...";
    oracle.twitterDef = @"a prophetic medium.\r\rFurther Reference:\r";
    oracle.category = @"Biblical";
    
    Word *oral = [[Word alloc] init];
    oral.name = @"Oral Tradition";
    oral.twitterDef = @"the transmission of stories and beliefs by word of mouth";
    oral.definition = @"the transmission of stories and beliefs by word of mouth.\r\rFurther Reference:\r";
    oral.category = @"Biblical";

    
    [_dataArray addObjectsFromArray:@[oldTestament, omnibenevolence, omnipotence, omnipresence, omniscience, ontological, openTheism, oracle, oral, orthodox, orthopraxis]];
    
    //P
    
    Word *person = [[Word alloc] init];
    person.name = @"Person";
    person.twitterDef = @"a human being capable of self-transcendence";
    person.definition = @"a human being capable of self-transcendence.\r\rFurther Reference:\r";
    person.category = @"Systematic";
    
    Word *pluralism = [[Word alloc] init];
    pluralism.name = @"Pluralism";
    pluralism.twitterDef = @"the belief that all religous claims are equally valid";
    pluralism.definition = @"the belief that all religous claims are equally valid.\r\rFurther Reference:\r";
    pluralism.category = @"Systematic";
    
    Word *polytheism = [[Word alloc] init];
    polytheism.name = @"Polytheism";
    polytheism.twitterDef = @"the belief that many gods exist";
    polytheism.definition = @"the belief that many gods exist.\r\rFurther Reference:\r";
    polytheism.category = @"Systematic";
    
    Word *predestination = [[Word alloc] init];
    predestination.name = @"Predestination";
    predestination.twitterDef = @"the belief that God has fixed the destiny of certain nations or peoples";
    predestination.definition = @"the belief that God has fixed the destiny of certain individuals.\r\rFurther Reference:\r";
    predestination.category = @"Systematic";
    
    Word *principle = [[Word alloc] init];
    principle.name = @"Principle of Double Effect";
    principle.twitterDef = @"the principle which states...";
    principle.definition = @"the principle which states.\r\rFurther Reference:\r";
    principle.category = @"Moral";
    
    Word *processTheo = [[Word alloc] init];
    processTheo.name = @"Process Theology";
    processTheo.twitterDef = @"the theological school of thought that views the basic structure of the Universe as process instead of substance";
    processTheo.definition = @"Process theology is named after the thought of Alfred North Whitehead.\r\rFurther Reference:\r";
    processTheo.category = @"Systematic";
    
    Word *protestant = [[Word alloc] init];
    protestant.name = @"Protestant";
    protestant.twitterDef = @"the theological objection to the authority of the Pope in the Church; the Protestant Reformation";
    protestant.definition = @"the theological objection to the authority of the Pope in the Church; the Protestant Reformation.";
    protestant.category = @"Ecclesial";
    
    Word *parable = [[Word alloc] init];
    parable.name = @"Parable";
    parable.twitterDef = @"a fable-like story that makes a theological claim";
    parable.definition = @"a fable-like story that makes a theological claim; used frequently by Jesus in the synoptic gospels.\r\rFurther Reference:\r";
    parable.category = @"Biblical";
    
    Word *papyrus = [[Word alloc] init];
    papyrus.name = @"Papyrus";
    papyrus.twitterDef = @"a type of paper in the ancient world used for writing created from a plant";
    papyrus.definition = @"a type of paper used for writing created from a plant.\r\rFurther Reference:\r";
    papyrus.category = @"Biblical";
    
    Word *passover = [[Word alloc] init];
    passover.name = @"Passover";
    passover.twitterDef = @"the feast that commemorates the Exodus of the Israelites from slavery in Egypt";
    passover.definition = @"the feast that commemorates the exodus of the Israelites from slavery in Egypt.\r\rFurther Reference:\r";
    passover.category = @"Biblical";
    
    Word *pentateuch = [[Word alloc] init];
    pentateuch.name = @"Pentateuch";
    pentateuch.twitterDef = @"another term for the first five books of the Old Testament, the Torah";
    pentateuch.definition = @"another term for the first five books of the Old Testament, the Torah - from the Greek for “five scrolls”.\r\rFurther Reference:\r";
    pentateuch.category = @"Biblical";
    
    Word *pericope = [[Word alloc] init];
    pericope.name = @"Pericope";
    pericope.twitterDef = @"a given section of a larger text...";
    pericope.definition = @"a given section of a larger text.\r\rFurther Reference:\r";
    pericope.category = @"Biblical";
    
    Word *pharisee = [[Word alloc] init];
    pharisee.name = @"Pharisees";
    pharisee.twitterDef = @"a Jewish group of laymen in the first century devoted to Torah-observance";
    pharisee.definition = @"A Jewish group of laymen in the first century.\r\rFurther Reference:\r";
    pharisee.category = @"Biblical";
    
    Word *priestly = [[Word alloc] init];
    priestly.name = @"Priestly Source";
    priestly.twitterDef = @"The Torah literary tradition that is concerned with priestly categories of meaning";
    priestly.definition = @"   The Priestly, or “P” tradition in the Torah can be dated to the time of Hezekiah (ca. 700 B.C.) and shows a major concern for order, numbers, and categories of holiness and cleanliness, especially in the book of Leviticus. The Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or “profane”; this source, along with the Elohist and Deuteronomic Sources, does not accept the revelation of the name YHWH before the Mosaic epiphany in Exodus 3. The Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word “compassionate” to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author).\r\rFurther Reference:\rWikipeida, Priestly Source\rhttp://tinyurl.com/yq83pf";
    priestly.category = @"Biblical";
    
    Word *primeval = [[Word alloc] init];
    primeval.name = @"Primeval History";
    primeval.twitterDef = @"The mythological stories of Genesis 1 - 11"; 
    primeval.definition = @"Genesis chapters 1 - 11.\r\rFurther Reference:\r";
    primeval.category = @"Biblical";
    
    Word *prophet = [[Word alloc] init];
    prophet.name = @"Prophet";
    prophet.twitterDef = @"one who speaks in the place of God";
    prophet.definition = @"This term is used in the Old Testament to refer to either a court prophet (such as Nathan) or an independent prophet (such as Amos).\r\rFurther Reference:\r";
    prophet.category = @"Biblical";
    
    Word *prophetic = [[Word alloc] init];
    prophetic.name = @"Prophetic Books";
    prophetic.twitterDef = @"the fourth of four sections in the Old Testament";
    prophetic.definition = @"The fourth of four sections in the Old Testament.\r\rFurther Reference:\r";
    prophetic.category = @"Biblical";
    
    Word *philosophy = [[Word alloc] init];
    philosophy.name = @"Philosophy";
    philosophy.twitterDef = @"the critical examination of human thought;\rthe love of wisdom";
    philosophy.definition = @"the critical examination of human thought; the love of wisdom.\r\rFurther Reference:\r";
    philosophy.category = @"Cultural";
    
    Word *physicalism = [[Word alloc] init];
    physicalism.name = @"Physicalism";
    physicalism.twitterDef = @"The belief that phenemena traditionally attributed to the soul can be more simply explained by the functioning of a brain";
    physicalism.definition = @"Physicalism has received from support from modern neuroscience. Various Christian philosophers, such as Nancy Murphy, are advocates of a non-reductive, physicalist anthropology.\r\rFurther Reference:\r";
    physicalism.category = @"Cultural";
    
    Word *problem = [[Word alloc] init];
    problem.name = @"Problem of Evil";
    problem.twitterDef = @"the philosophical problem of belief in God and the experience of evil";
    problem.definition = @"The philosophical problem that results from belief in Divine omniscience, omnipotence, and omnibenevolence and the experience of suffering and evil in the world.\r\rFurther Reference:\r";
    problem.category = @"Cultural";

    [_dataArray addObjectsFromArray:@[parable, papyrus, passover, pentateuch, pericope, person, pharisee, philosophy, physicalism, pluralism, polytheism, predestination, priestly, primeval, problem, processTheo, prophet, prophetic, protestant, principle]];
    
    //Q
    
    Word *q = [[Word alloc] init];
    q.name = @"Q Source";
    q.twitterDef = @"the hypothetical written source that lies behind similar passages in Matthew and Luke";
    q.definition = @"The hypothetical written source that lies behind the similar passages, exclusive to Matthew and Luke, which contain various teachings of Jesus; from the German word “quelle' - “source”.\r\rFurther Reference:\r";
    q.category = @"Biblical";
    
    Word *quintessence = [[Word alloc] init];
    quintessence.name = @"Quintessence";
    quintessence.twitterDef = @"a term meaning “fifth essence”; used by Aristotle to refer to a substance higher than the four of earth, wind, water, and fire";
    quintessence.definition = @"A term meaning “fifth essence”; used by Aristotle to refer to a substance higher than the four on earth.\r\rFurther Reference:\r";
    quintessence.category = @"Cultural";
    
    [_dataArray addObjectsFromArray:@[q, quintessence]];
    
    //R
    
    Word *redaction = [[Word alloc] init];
    redaction.name = @"Redaction Criticism";
    redaction.definition = @"the type of exegetical criticism that seeks to decipher and analyze the various stages of redaction of a text.\r\rFurther Reference:\r";
    redaction.category = @"Biblical";
    
    Word *redemption = [[Word alloc] init];
    redemption.name = @"Redemption";
    redemption.definition = @"the process of exchanging the economic value of an object.\r\rFurther Reference:\r";
    redemption.category = @"Systematic";
    
    Word *ressourcement = [[Word alloc] init];
    ressourcement.name = @"Ressourcement";
    ressourcement.twitterDef = @"a French term meaning “to return to the sources”";
    ressourcement.definition = @"a French term meaning “to return to the sources”; used by some theologians as the preferred interpretation of the purpose of Vatican II...\r\rSee “Aggiornomento”.";
    ressourcement.category = @"Systematic";
    
    Word *resurrection = [[Word alloc] init];
    resurrection.name = @"Resurrection";
    resurrection.twitterDef = @"the belief that God will raise the righteous dead to eternal life";
    resurrection.definition = @"the belief which developed in post-Exilic Judaism, that God would raise the righteous to eternal life; the belief of the early Christians that Jesus of Nazareth was raised from the dead.\r\rFurther Reference:\r";
    resurrection.category = @"Systematic";
    
    Word *religious = [[Word alloc] init];
    religious.name = @"Religious Naturalism";
    religious.twitterDef = @"a movement within naturalism that emphasizes scientific knowledge as a foundational mythos";
    religious.definition = @"A movement within naturalism which emphasizes the scientific history of the universe as a core mythos around which revolve interpretive, spiritual, and moral axes.\r\rFurther Reference:\r";
    religious.category = @"Cultural";
    
    Word *rerum = [[Word alloc] init];
    rerum.name = @"Rerum Novarum";
    rerum.twitterDef = @"the encyclical of Pope Leo XIII that laid the foundations of modern Catholic Social Teaching";
    rerum.definition = @"The encyclical of Pope Leo XIII in 1891 which responded to the after effects of the Industrial Revolution in Europe by teaching that private property is relative to the Common Good and that workers have a right to unionized and to a living wage.\r\rFurther Reference:\r";
    rerum.category = @"Moral";

    
     [_dataArray addObjectsFromArray:@[redaction, redemption, religious, rerum, ressourcement, resurrection]];
    
    //S
    
    Word *salvation = [[Word alloc] init];
    salvation.name = @"Salvation";
    salvation.twitterDef = @"the experience of being saved from sin and eventually death";
    salvation.definition = @"The experience of being saved from sin and eventually death.\r\rFurther Reference:\r";
    salvation.category = @"Systematic";
    
    Word *selucid = [[Word alloc] init];
    selucid.name = @"Selucid";
    selucid.twitterDef = @"the descendants of Alexander the Great that ruled in Syria";
    selucid.definition = @"the descendants of Alexander the Great.\r\rFurther Reference:\r";
    selucid.category = @"Biblical"; 
    
    Word *social = [[Word alloc] init];
    social.name = @"Social Justice";
    social.twitterDef = @"the type of justice which prioritizes the common good with a preferential option for the poor and marginalized";
    social.definition = @"According to Pope Paul VI, social justice is an essential aspect to the proclamation of the gospel.\r\rFurther Reference:\r";
    social.category = @"Moral";
    
    Word *soteriology = [[Word alloc] init];
    soteriology.name = @"Soteriology";
    soteriology.twitterDef = @"the study of salvation; a particular framework of salvation";
    soteriology.definition = @"the study of salvation; a particular framework of salvation.\r\rFurther Reference:\r";
    soteriology.category = @"Systematic";
    
    Word *sadducees = [[Word alloc] init];
    sadducees.name = @"Sadducees";
    sadducees.twitterDef = @"the elite class of Jerusalem-based Temple scribes that mediated with the Roman occupation";
    sadducees.definition = @"the elite class of Jerusalem-based Temple scribes.\r\rFurther Reference:\r";
    sadducees.category = @"Biblical";
    
    Word *Satan = [[Word alloc] init];
    Satan.name = @"Satan";
    Satan.twitterDef = @"the adversarial being found in post-Exilic Hebrew literature that serves to represent evil events...";
    Satan.definition = @"the adversarial being found in post-Exilic Hebrew literature that serves to represent evil events.\r\rFurther Reference:\r";
    Satan.category = @"Biblical";
    
    Word *septuagint = [[Word alloc] init];
    septuagint.name = @"Septuagint";
    septuagint.twitterDef = @"the Greek translation of the Old Testament made at the request of Alexander the Great";
    septuagint.definition = @"the Greek translation of the Old Testament made at the request of Alexander the Great.\r\rFurther Reference:\r";
    septuagint.category = @"Biblical";
    
    Word *source = [[Word alloc] init];
    source.name = @"Source Criticism";
    source.twitterDef = @"the type of criticism that seeks to decipher and analyze the underlying source of a text";
    source.definition = @"the exegetical criticism that seeks to decipher and analyze the underlying source of a text.\r\rFurther Reference:\r";
    source.category = @"Biblical";
    
    Word *synagogue = [[Word alloc] init];
    synagogue.name = @"Synagogue";
    synagogue.twitterDef = @"The local place of weekly assembly for Jews during the Exile in Babylon";
    synagogue.definition = @"The local place of weekly assembly for Jews during the Exile in Babylon; carried over into post-Exilic Judaism - from the Greek “to go together“.\r\rFurther Reference:\r";
    synagogue.category = @"Biblical";
    
    Word *synchronic = [[Word alloc] init];
    synchronic.name = @"Synchronic";
    synchronic.twitterDef = @"the type of truth that is relative to the time of a text's composition";
    synchronic.definition  = @"the type of truth that is relative to the time of a text's composition, usually relating to the worldview of the author.\r\rFurther Reference:\r";
    synchronic.category = @"Biblical";
    
    Word *synoptic = [[Word alloc] init];
    synoptic.name = @"Synoptic";
    synoptic.twitterDef = @"a Greek term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity";
    synoptic.definition = @"a term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity of narrative and Christology contrasted with the gospel of John; from the Greek word συν (syn) - “together” and οπσις (opsis) - “appearance”.\r\rFurther Reference:\r";
    synoptic.category = @"Biblical";
    
    Word *semiotics = [[Word alloc] init];
    semiotics.name = @"Semiotics";
    semiotics.twitterDef = @"the study of signs and symbols used as elements of communication";
    semiotics.definition = @"the study of signs and symbols used as elements of communication.\r\rFurther Reference:\r";
    semiotics.category = @"Cultural";
    
    Word *sociology = [[Word alloc] init];
    sociology.name = @"Sociology";
    sociology.twitterDef = @"The study of society";
    sociology.definition = @"The study of society.\r\rFurther Reference:\r";
    sociology.category = @"Cultural";
    
    
    Word *solidarity = [[Word alloc] init];
    solidarity.name = @"Solidarity";
    solidarity.twitterDef = @"the idea that human beings share a fundamental unity which should be a criteria for determining justice";
    solidarity.definition = @"Solidarity is a basic principle of Catholic Social Teaching.\r\rFurther Reference:\r";
    solidarity.category = @"Cultural";
    
    Word *spirituality = [[Word alloc] init];
    spirituality.name = @"Spirituality";
    spirituality.twitterDef = @"the conscious process of integration of one's life toward Ultimate value";
    spirituality.definition = @"the conscious process of integration of one's life toward Ultimate value.\r\rFurther Reference:\r";
    spirituality.category = @"Cultural";
    
    Word *structuralism = [[Word alloc] init];
    structuralism.name = @"Structuralism";
    structuralism.definition = @"the anthropological movement based on the work of Levi Strauss.\r\rFurther Reference:\r";
    structuralism.category = @"Cultural";
    
    Word *supernormal = [[Word alloc] init];
    supernormal.name = @"Supernormal Allurements";
    supernormal.twitterDef = @"the attraction to concentrated quantities of substances that allowed hu;manity to evolve and flourish, such as sugar, salt, and sex";
    supernormal.definition = @"the attraction to concentrated quantities of substances that allowed hu;manity to evolve and flourish, such as sugar, salt, and sex.\r\rFurther Reference:\r";
    supernormal.category = @"Cultural";


    
    [_dataArray addObjectsFromArray:@[sadducees, salvation, Satan, semiotics, septuagint, social, sociology, solidarity, soteriology, source, spirituality, structuralism, supernormal, synagogue, synchronic, synoptic]];

    
    //T
    
    Word *theodicy = [[Word alloc] init];
    theodicy.name = @"Theodicy";
    theodicy.twitterDef = @"the question of God's justice in the face of suffering and evil";
    theodicy.definition = @"The question of God's justice in the face of suffering and evil.\r\rFurther Reference:\r";
    theodicy.category = @"Systematic";
    
    Word *theologoumenon = [[Word alloc] init];
    theologoumenon.name = @"Theologoumenon";
    theologoumenon.twitterDef = @"a theological opinion on a disputable matter that has not been defined in Church teaching";
    theologoumenon.definition = @"A theological opinion on a disputable matter that has not been defined in Church teaching.\r\rFurther Reference:\r";
    theologoumenon.category = @"Systematic";
    
    Word *theology = [[Word alloc] init];
    theology.name = @"Theology";
    theology.twitterDef = @"the study of God";
    theology.definition = @"The study of God.\r\rFurther Reference:\r";
    theology.category = @"Systematic";
    
    Word *theosis = [[Word alloc] init];
    theosis.name = @"Theosis";
    theosis.twitterDef = @"the process of becoming like God, emphasized in the Easter Orthodox tradition";
    theosis.definition = @"The process of becoming like God, emphasized in the Easter Orthodox tradition.\r\rFurther Reference:\r";
    theosis.category = @"Systematic";
    
    Word *tradition = [[Word alloc] init];
    tradition.name = @"Tradition";
    tradition.twitterDef = @"the process of handing over beliefs and practices";
    tradition.definition = @"the process of handing over beliefs and practices.\r\rFurther Reference:\r\r\rFurther Reference:\r";
    tradition.category = @"Systematic";
    
    Word *transcendence = [[Word alloc] init];
    transcendence.name = @"Transcendence";
    transcendence.twitterDef = @"the quality of going beyond human experience";
    transcendence.definition = @"the quality of going beyond human experience.";
    transcendence.category = @"Systematic";
    
    Word *transub = [[Word alloc] init];
    transub.name = @"Transubstantiation";
    transub.twitterDef = @"the Thomistic concept that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist";
    transub.definition = @"the belief, formulated by Thomas Aquinas, that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist.\r\rFurther Reference:\r";
    transub.category = @"Systematic";
    
    Word *trinity = [[Word alloc] init];
    trinity.name = @"Trinity";
    trinity.twitterDef = @"the existence of God in three persons; Father, Son, and Holy Spirit";
    trinity.definition = @"The belief that God exists in three persons.\r\rFurther Reference:\r";
    trinity.category = @"Systematic";
    
    Word *tabernacle = [[Word alloc] init];
    tabernacle.name = @"Tabernacle";
    tabernacle.twitterDef = @"the pre-Solomonic temporary dwelling place of YHWH in Israel";
    tabernacle.definition = @"The Tabernacle was initially housed at Shiloh.\r\rFurther Reference:\r";
    tabernacle.category = @"Biblical";
    
    Word *tanak = [[Word alloc] init];
    tanak.name = @"Tanak";
    tanak.twitterDef = @"an acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im";
    tanak.definition = @"Acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im. Since Hebrew has no vowels, those are added.\r\rFurther Reference:\r";
    tanak.category = @"Biblical";
    
    Word *taxCollector = [[Word alloc] init];
    taxCollector.name = @"Tax Collectors";
    taxCollector.twitterDef = @"a class of Jews who collected provincial taxes for the Roman Empire";
    taxCollector.definition = @"Jews who collected provincial taxes for the Roman Empire; frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. They were reviled as traitors, likely cheats, and possible idolators. Jesus includes one such person (Matthew) in his inner circle of disciples.\r\rFurther Reference:\r";
    taxCollector.category = @"Biblical";
    
    Word *temple = [[Word alloc] init];
    temple.name = @"Temple";
    temple.twitterDef = @"the permanent dwelling place of YHWH in Israel";
    temple.definition = @"The dwelling place of YHWH.\r\rFurther Reference:\r";
    temple.category = @"Biblical";
    
    Word *textual = [[Word alloc] init];
    textual.name = @"Textual Criticism";
    textual.twitterDef = @"the criticism that deciphers and analyzes the original language of a text";
    textual.definition = @"The exegetical criticism that deciphers and analyzes the original language of a text.\r\rFurther Reference:\r";
    textual.category = @"Biblical";
    
    Word *theophany = [[Word alloc] init];
    theophany.name = @"Theophany";
    theophany.twitterDef = @"an appearance of God to a human being in which Divine communication occurs";
    theophany.definition = @"An appearance of God to a human being. Numerous theophanies are recorded throughout the Bible with the account of Moses being paradigmatic.\r\rFurther Reference:\r";
    theophany.category = @"Biblical";
    
    Word *torah = [[Word alloc] init];
    torah.name = @"Torah";
    torah.twitterDef = @"the first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy";
    torah.definition = @"The first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy.\r\rFurther Reference:\r";
    torah.category = @"Biblical";
    
    Word *typology = [[Word alloc] init];
    typology.name = @"Typology";
    typology.twitterDef = @"a way of interpreting the Old Testament through a Christological hermeneutic";
    typology.definition = @"A way of reading the Old Testament.\r\rFurther Reference:\r";
    typology.category = @"Biblical";

    
    [_dataArray addObjectsFromArray:@[tabernacle, tanak, taxCollector, temple, textual, theodicy, theologoumenon, theology, theophany, theosis, torah, transcendence, trinity, typology]];
    
    //U
    Word *universal = [[Word alloc] init];
    universal.name = @"Universal Destination of Goods";
    universal.twitterDef = @"the idea that the goods of the earth are intended to be justly distributed";
    universal.definition = @"The idea that the goods of the earth are intended to be justly distributed among its inhabitants according to the will of the Creator.\r\rFurther Reference:\rThe Compendium of the Social Doctrine of the Church, 171";
    universal.category = @"Moral";
    
    Word *universalism = [[Word alloc] init];
    universalism.name = @"Universalism";
    universalism.twitterDef = @"the belief that all of humanity will ultimately experience salvation";
    universalism.definition = @"The belief that all of humanity will ultimately experience salvation.\r\rFurther Reference:\r";
    universalism.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[universal, universalism]];
    
    //V
    
    Word *virgin = [[Word alloc] init];
    virgin.name = @"Virginal Conception";
    virgin.twitterDef = @"the belief that Jesus of Nazareth was conceived by the Holy Spirit";
    virgin.definition = @"Both the gospels of Matthew and Luke claim that Jesus was concieved by a virgin mother. Later tradition would develop the idea of Mary's perpetual viriginity although this idea was not univerally accepted.\r\rFurther Reference:\r";
    virgin.category = @"Systematic";
    
    Word *vocation = [[Word alloc] init];
    vocation.name = @"Vocation";
    vocation.twitterDef = @"the calling by God of someone to a particular way of life";
    vocation.definition = @"The calling by God of someone to a particular way of life.\r\rFurther Reference:\r";
    vocation.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[virgin, vocation]];
    
    //W
    
    Word *wisdom = [[Word alloc] init];
    wisdom.name = @"Wisdom Literature";
    wisdom.twitterDef = @"a genre of literature in the Old Testament that contains wise sayings and philosophical reflections on life";
    wisdom.definition = @"a type of literature that contains wise sayings and philosophical reflections on life.\r\rFurther Reference:\r";
    wisdom.category = @"Biblical";
    
    Word *wisdomBooks = [[Word alloc] init];
    wisdomBooks.name = @"Poetic";
    wisdomBooks.twitterDef = @"the third of four sections in the Old Testament, it contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach";
    wisdomBooks.definition = @"The third of four sections in the Old Testament; it consists mainly of various writings; contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.\r\rFurther Reference:\r";
    wisdomBooks.category = @"Biblical";

    
    Word *word = [[Word alloc] init];
    word.name = @"Word of God";
    word.twitterDef = @"the saving message of God in which humans trust for salvation";
    word.definition = @"The saving message of God in which humans trust.\r\rFurther Reference:\r";
    word.category = @"Systematic";
    
    Word *will = [[Word alloc] init];
    will.name = @"Will of God";
    will.twitterDef = @"The ultimate desire of God for creation";
    will.definition = @"The ultimate desire of God for creation.\r\rFurther Reference:\r";
    will.category = @"Systematic";
    
    [_dataArray addObjectsFromArray:@[will, wisdom, wisdomBooks, word]];

    
    //X
    
    Word *xeno = [[Word alloc] init];
    xeno.name = @"Xenophobia";
    xeno.twitterDef = @"the fear of foreigners";
    xeno.definition = @"The fear of foreigners. The ministry of the historical Jesus can be seen, partly, as a movement against the xenophobic nationalism of the religious elite in Second Temple Judaism.\r\rFurther Reference:\r";
    xeno.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[xeno]];
    
    
    //Y
    
    Word *yahwist = [[Word alloc] init];
    yahwist.name = @"Yahwist Source";
    yahwist.twitterDef = @"the “J” Source...";
    yahwist.definition = @"The “J” Source...";
    yahwist.category = @"Biblical";
    
    Word *yhwh = [[Word alloc] init];
    yhwh.name = @"YHWH";
    yhwh.twitterDef = @"the four letter personal name of the God of the Israelites, also called the “Tetragrammaton”";
    yhwh.definition = @"The four letter personal name of the God of the Israelites, also called the 'Tetragrammaton'; it was likely pronounced 'Yah-way”; according to the E and P sources, this name was not known before it was revealed to Moses in Exodus chapter 3, the J source, however, uses it throughout Genesis, which is one argument for the Documentary Hypothesis.\r\rFurther Reference:\r";
    yhwh.category = @"Biblical";
    
    Word *yomKippur = [[Word alloc] init];
    yomKippur.name = @"Yom Kippur";
    yomKippur.twitterDef = @"a Hebrew phrase meaning “Day of Atonement”";
    yomKippur.definition = @"According to Leviticus 16, Yom Kippur is a day set aside on the Jewish calendar dedicated to bringing about personal and national reconciliation with YHWH.\r\rFurther Reference:\r";
    yomKippur.category = @"Biblical";
    
    [_dataArray addObjectsFromArray:@[yahwist, yhwh, yomKippur]];

    
    //Z
    
    Word *zealot = [[Word alloc] init];
    zealot.name = @"Zealots";
    zealot.twitterDef = @"a Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces";
    zealot.definition = @"A Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces.\r\rFurther Reference:\r";
    zealot.category = @"Biblical";
    
    Word *zion = [[Word alloc] init];
    zion.name = @"Zion";
    zion.twitterDef = @"a synonym for the Temple Mount in Jerusalem or for the city of Jerusalem itself";
    zion.definition = @"A synonym for the Temple mountain in Jerusalem or for the city of Jerusalem itself.\r\rFurther Reference:\r";
    zion.category = @"Biblical";
    
      [_dataArray addObjectsFromArray:@[zealot, zion]];

}

@end
