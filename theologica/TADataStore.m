//
//  TADataStore.m
//  theologica
//
//  Created by Jim Schultz on 2/4/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "TADataStore.h"
#import "TAWord.h"

@implementation TADataStore

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (TADataStore *)sharedStore {
    static TADataStore *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[TADataStore alloc] init];
    });
    
    return _sharedClient;
}

- (BOOL)hasWords
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"TAWord" inManagedObjectContext:self.managedObjectContext];
    NSError *error;
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:&error];
    return count > 0;
}

- (TAWord *)findWordWithName:(NSString *)name
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = [NSEntityDescription entityForName:@"TAWord" inManagedObjectContext:self.managedObjectContext];
    request.sortDescriptors = [NSArray arrayWithObject:[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES]];
    request.predicate = [NSPredicate predicateWithFormat:@"name MATCHES %@", name];
    
    NSError *error = nil;
    NSArray *array = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (array.count > 0) {
        return [array firstObject];
    }
    return nil;
}


#pragma mark - CORE DATA STACK
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
        {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
            {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
#ifdef DEBUG
            abort();
#endif
            }
        }
}

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"theologica" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"theologica.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES};
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        #ifdef DEBUG
        abort();
        #endif
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)buildDictionaryWords
{
    if ([TADataStore sharedStore].hasWords)
    {
        return;
    }
    
    
    //A
    [TAWord wordWithDict:@{@"name":@"Abba",
                           @"twitterDef":@"the Aramaic word meaning\r“Father” or “Daddy”",
                           @"definition":@"\rAccording to all four Gospels, this term was by Jesus to refer to God in prayer. Paul claims that Christians also use the term because of their filial adoption; “Because you are sons, God has sent the Spirit of his Son into our hearts, crying, “Abba! Father!” (Gal 4:6). See “Adoption”.\r\rAramaic, אַבָּא (abba)\r\rFurther Reference:\rCatechism of the Catholic Church, 683\rhttp://tinyurl.com/pqxxm8l",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ablution",
                           @"twitterDef":@"the cleansing of the paten and chalice\rafter the Eucharist",
                           @"definition":@"\rAblution can be traced as a distinct liturgical practice back to the mikvah in Judaism, which was a ceremonial washing required for ritual cleanliness.\r\rFurther Reference:\rWikipedia, “Ablution in Christianity”\rhttp://tinyurl.com/mhg6d57",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Adonai",
                           @"twitterDef":@"the Hebrew word meaning\r“Master” or “Ruler”",
                           @"definition":@"\rThis term is used as a substitute reference to YHWH in the Tanak and in contemporary Judaism out of respect for the Tetragrammaton. See “Tanak”, “YHWH”, “Tetragrammaton”.\r\rHebrew, אֲדֹנָי (adonai)\r\rFurther Reference:\rCatechism of the Catholic Church, 209\rhttp://tinyurl.com/bruqt9r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Aseity",
                           @"twitterDef":@"the necessary character of\rGod's existence",
                           @"definition":@"\rAesity is a term using in so called Perfect-Being theology in which God is described as being the most perfect Being in regard to several qualities.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Divine Simplicity”\rhttp://tinyurl.com/3ttzn3g",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Angelus",
                           @"twitterDef":@"an antiphonal prayer inspired\rby the story of the Annunciation",
                           @"definition":@"\rThe Angelus is prayed every Sunday at noon by the Pope in St. Peter's Square.\r\rV. The angel of the Lord declared unto Mary,\rR. And she conceived of the Holy Spirit.\rV. Behold the handmaid of the Lord.\r\rR. Let it be unto me according to thy word.\rV. And the Word was made flesh.\rR. And dwelt among us.\rV. Hail Mary, full of grace; the Lord is with Thee: blessed art thou amongst women, and blessed is the fruit of thy womb, Jesus.\rR. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.\rV. Pray for us, O Holy Mother of God.\rR. That we might be made worthy of the promises of Christ.\rV. Let us pray: Pour forth, we beseech Thee, Lord, Thy grace into our hearts; that, we, to whom the Incarnation of Christ, Thy Son, was known by the message of an angel, may, by His Passion and Cross, be brought to the glory of His Resurrection, through the same Christ our Lord,\rR. Amen.\r\rSee “Incarnation”, “Annunciation”.\r\rFurther Reference:\rWikipedia, “Angelus”\rhttp://tinyurl.com/nxzg53",
                           @"category":@"Moral"}];

    
    [TAWord wordWithDict:@{@"name":@"Anawim",
                           @"twitterDef":@"the Hebrew word meaning\r“the oppressed”",
                           @"definition":@"\rThis term is used in the Hebrew Bible to refer to those who are poor, destitue, and marginalized who trust completely in the mercy of God (Is. 10:2, Zeph 2:3); frequently used in the Psalms.\r\rHebrew, עֲנָוִים (anawim)\r\rFurther Reference:\rJohn Paul II, General Audience, 5/23/2001\rhttp://tinyurl.com/lyfphvo",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anthropomorphism",
                           @"twitterDef":@"the process of attributing human characteristics to an object",
                           @"definition":@"\rGod is described in human terms throughout the Christian tradition, and especially within the Scriptures. The Yahwist Source uses anthropomorphism extensively in its portrayal of YHWH in the Torah. Such language is, however, ultimately, only analogous to God. See “Analogy”, “Yahwist Source”, “YHWH”.\r\rFurther Reference:\rWikipedia, “Anthropomorphism”\rhttp://tinyurl.com/ffpra",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Annunciation",
                           @"twitterDef":@"the angelic declaration to Mary\rthat she would bear the Son of God",
                           @"definition":@"\rThe Annunciation is found in the Gospel of Luke 1:26-38.\r\rFurther Reference:\rCatechism of the Catholic Church, 484\rhttp://tinyurl.com/3w9q9aw",
                           @"category":@"Biblical"}];

    
    /*
     Word *antiochusWord = [[Word alloc]init];
     antiochusWord.@"name":@"Antiochus IV";
     antiochusWord.@"definition":@"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
     */
    
    [TAWord wordWithDict:@{@"name":@"Apocalypse",
                           @"twitterDef":@"1. the revelation of something hidden\r2. the last book of the New Testament",
                           @"definition":@"\rPaul uses this word to refer to his experience of the risen Jesus. The Apocalypse (or Revelation) of John describes a vision of Jesus Christ about the end of the word, previously hidden from the Church's knowledge.\r\rGreek, ἀποκάλυψις (apokalypsis) “unveiling”\r\rFurther Reference:\rCatechism of the Catholic Church, 120\rhttp://tinyurl.com/kvc3tvq",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apocrypha",
                           @"twitterDef":@"the 7 books excluded from\rthe Protestant Bible",
                           @"definition":@"\rApocrypha is the Protestant term for the 7 Old Testament books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom. See “Canon”, “Old Testament”.\r\rGreek, ἀπόκρυφος (apokryphos) “hidden”\r\rFurther Reference:\rWikipedia, “Apocrypha”\rhttp://tinyurl.com/bddlr",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apodictic",
                           @"twitterDef":@"a type of law based on universal norms",
                           @"definition":@"\rApodictic law is that such as found in the 10 Commandments;universally binding at all times and places. It is contrasted with Casuistic law. See Exodus 20, “Decalogue”, “Casusitic”.\r\rFurther Reference:\rWikipedia, “Apodicticity”\rhttp://tinyurl.com/k7u8mkr",
                           @"category":@"Biblical"}];
    
    /*
     Word *apollosWord = [[Word alloc]  init];
     apollosWord.@"name":@"Apollos";
     apollosWord.@"definition":@"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
     */
    
    [TAWord wordWithDict:@{@"name":@"Apostle",
                           @"twitterDef":@"a disciple personally commissioned\rby Jesus",
                           @"definition":@"\rThis term is normally used to refer to the Twelve appointed from a larger group of disciples. It is also used by Paul to refer to anyone who had seen the risen Christ.\r\rGreek, αποστολος (apostolos) “delegate”\r\rFurther Reference:\r“Disciples and Apostles in the New Testament” by Felix Just, S.J.\rhttp://tinyurl.com/mzcbt37",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Aqeda",
                           @"twitterDef":@"the Hebrew word meaning the “binding”\rof Isaac by Abraham",
                           @"definition":@"\rThe story of the binding and near-sacrifice of Isaac by Abraham. According to Richard Elliot Freidman, the Aqedah is mostly an Elohist Source story with a very different original ending that was amended by the Redactor of the Torah.\r\rHebrew, עֲקֵידָה (aqeda)\r\rFurther Reference:\rWikipedia, “Aqeda”\rhttp://tinyurl.com/56dxyl",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Aramaic",
                           @"twitterDef":@"a Semitic language similar to Hebrew",
                           @"definition":@"\rAramaic was the native language of the historical Jesus.\r\rFurther Reference:\rWikipedia, “Aramaic”\rhttp://tinyurl.com/y2okx9",
                           @"category":@"Biblical"}];
    
    /*
     Word *artraxercesWord = 
     artraxercesWord.@"name":@"Artaxerxes";
     artraxercesWord.@"definition":@"Word meaning 'ruler' applied to the kings of Persia, specifically to Cyrus the Great";
     
     Word *asherWord = 
     asherWord.@"name":@"Asher";
     asherWord.@"definition":@"One of the twelve tribes of Israel";
     */
    
    [TAWord wordWithDict:@{@"name":@"Asherah",
                           @"twitterDef":@"the Canaanite mother goddess\r& wife of El",
                           @"definition":@"\rIn Canaanite mythology, Asherah is the wife of El and the goddess of fertility. She is mentioned numerous times throughout the Old Testament. According to 2 Kings 23:4 a large Asherah statue was housed in the Temple and dressed by her cult's prostitutes before Josiah's Deuteronomic reform.\r\rFurther Reference:\rWikipedia, “Asherah”\rhttp://tinyurl.com/6qf2tt",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Assyria",
                           @"twitterDef":@"the empire that conquered the northen kingdom\rof Israel in 722 B.C.",
                           @"definition":@"\rOne of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 B.C.\r\rFurther Reference:\rWikipedia, “Assyria”\rhttp://tinyurl.com/2allao",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Abortion",
                           @"twitterDef":@"the willful killing of a human being in utero",
                           @"definition":@"\rIn the Catholic tradition, human beings are regarded as sacred from the moment of conception. The death of an unborn child as a consequence of other procedures deemed good in themselves is not considered an abortion per se but rather a consequence of the principle of double-effect.\r\rThe Catholic tradition is consistent in its classification of abortion as a grave sin, the willful commision of which incurs an automatic excommunication. Abortion was legalized in the United States in 1973 by the Supreme Court in Roe v. Wade. See “Principle of Double-Effect”, “Roe v. Wade”\r\rFurther Reference:\rCatechism of the Catholic Church, 2270\rhttp://tinyurl.com/dh7r\r\rWikipedia, “Roe v. Wade”\rhttp://tinyurl.com/aqq5j",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Abstinence",
                           @"twitterDef":@"to purposely refrain from a given activity",
                           @"definition":@"\rAbstinence is ultimately aimed at the higher purpose of spiritual edification. In the Catholic tradition, it is usually applied to food and sexual activity. Ash Wednesday and Good Friday are two Days of Abstinence in the Western Church.\r\rFurther Reference:\rCatechism of the Catholic Church, 2043\rhttp://tinyurl.com/l56b6h4",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Act",
                           @"twitterDef":@"a free act of the will",
                           @"definition":@"\rIn moral theology, an truly “human” act refers to actions made with freedom and will.\r\rFurther Reference:\rCatholic Moral Theology blog\rhttp://tinyurl.com/pyfcn3n",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Adultery",
                           @"twitterDef":@"sexual relations with another person's spouse",
                           @"definition":@"\rAdultery is prohibited by the sixth Commandment of the Decalogue. In Matthew 5:28, Jesus teaches that one should even avoid those actions that ultimately lead to adultery. See “Decalogue”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2380\rhttp://tinyurl.com/cz1w ",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Absolution",
                           @"twitterDef":@"the declaration that sins are forgiven",
                           @"definition":@"\rThe act by which a priest declares the forgiveness of sins. General absolution is not considered a Sacrament like that which is given in the Sacrament of Reconciliation.\r\rFurther Reference:\rCatechism of the Catholic Church, 1424\rhttp://tinyurl.com/l7xon9e",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Adoptionism",
                           @"twitterDef":@"the belief that Jesus was a mere man\radopted as God's Son at his baptism ",
                           @"definition":@"Adoptionism was held by the so-called Ebionites of the end of the first century.\r\rFurther Reference:\rWikipedia, “Adoptionism”\rhttp://tinyurl.com/25fgze",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Accident",
                           @"twitterDef":@"a nonessential property of an object",
                           @"definition":@"\rIn Aristotelean philosophy, a nonessential property or quality of an object that is dependent upon the substance of the object for its existence. Thomas Aquinas used this concept to support his explanation of the Real Presence in the Eucharist, called “transubstantiation”. See “Eucharist”, “Real Presence”, “Transubstantiation”.\r\rFurther Reference:\rWikipedia, “Accident”\rhttp://tinyurl.com/88ojytv",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Asceticism",
                           @"twitterDef":@"the practice of self-discipline",
                           @"definition":@"\rThe practice of self-discipline for a higher purpose, often involving abstinence. See “Abstinence”.\r\rGreek, ασκησις (askesis) “training”\r\rFurther Reference:\rWikipedia, “Asceticism”\rhttp://tinyurl.com/29eqh2",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Adoption",
                           @"twitterDef":@"a biblical metaphor used to refer to the process of becoming a child of God",
                           @"definition":@"\rIn the New Testament, Paul uses this metaphor to describe God's process of extending His family through Jesus Christ.\r\rFurther Reference:\rCatechism of the Catholic Church, 1\rhttp://tinyurl.com/o7udb4d",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Agape",
                           @"twitterDef":@"the Greek word meaning\r“universal & unconditional love”",
                           @"definition":@"\rThe Gospel writers use this word to describe Jesus' teaching on the love for God, neighbors and enemies (Matthew 5:44, 22:37, 39). It is used by later New Testament writers to describe the love of God towards humanity as seen in the sacrificial death of Jesus and even the very nature of God. The early Christians also used “agape” to refer to their weekly communal meal (Jude 1:12).\r\rGreek, ἀγάπη (agape)\r\rFurther Reference:\rPope Benedict XVI, “Deus Caritas Est”\rhttp://tinyurl.com/o6ucrd6\r\rWikipedia, “Agape”\rhttp://tinyurl.com/dbyn5s",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Aggiornomento",
                           @"twitterDef":@"the Italian word meaning “to update”\r used to describe a theme of Vatican II",
                           @"definition":@"\rAs a way to describe one of its emphases, it became popular during and synonymous with the reforms of the Second Vatican Council (1962-1965). The concept was used by Pope John XXIII to describe the agenda of Vatican II. John XXIII claimed:\r\r“The greatest concern of the Ecumenical Council is this: that he sacred deposit of Christian doctrine should be guarded and taught more efficaciously...In order, however, that this doctrine may influence the numerous fields of human activity, with reference to individuals, to families, and to socia life, it is necessary first of all that the Church should never depart from the sacred patrimony of truth received from the Fathers. But at the same time she must ever look to the present, to the new conditions and new forms of life introduced into the modern world, which have opened new avenues to the Catholic apostolate...which, however, should be studied and expounded through the methods of research and through the literary forms of modern thought. The substance of the ancient doctrine of the deposit of faith is one thing, and the way in which it is presented is another. And it is the latter that must be taken into great consideration with patience if necessary,everything being measured in the forms and proportions of a magisterium which is predominantly pastoral in character.”\r\rFurther Reference:\rWikipedia, “Aggiornomento”\rhttp://tinyurl.com/k6y4ylh",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Allegory",
                           @"twitterDef":@"an interpretation that seeks\rhigher orders of meanining",
                           @"definition":@"\rAn allegory is an interpretation of a text that goes beyond the literal meaning to find a deeper connection to a higher order of reality. In the New Testament, Paul claims that the story of Sarah and Hagar in Genesis is an allegory of those in Christ and those under the Law (Gal. 4:24).\r\rGreek, ἀλληγορία (allegoria)\r“speaking by way of something else”\r\rFurther Reference:\rCatechism of the Catholic Church, 117\rhttp://tinyurl.com/kvc3tvq",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Analogy of Faith",
                           @"twitterDef":@"the coherence of the truths of faith\ramong themselves and whole plan of Revelation",
                           @"definition":@"\rThe Analogy of Faith is a phrase that occurs in Romans 12:6. It later becomes a way to refer to the consistency and interrelationship of Church teaching.\r\rGreek, ἀναλογία (analogia) “proportion”\r\rFurther Reference:\rCatechism of the Catholic Church, 114\rhttp://tinyurl.com/kvc3tvq",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Annointing of the Sick",
                           @"twitterDef":@"the Sacrament of Healing\rby anointing with oil",
                           @"definition":@"The sacrament of healing in which sacramental oil is applied to an infirm human body.\r\rFurther Reference:\rCatechism of the Catholic Church, 1499\rhttp://tinyurl.com/n3lyve9",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Anthropocentrism",
                           @"twitterDef":@"centered on humanity",
                           @"definition":@"\rA method of theological enquiry from the starting point and within the horizon of the human experience. All theological claims are claims made by human beings in human language. Theology is relevant to human beings in so far as they concern human experience.\r\rFurther Reference:\rWikipedia, “Anthropocentrism”\rhttp://tinyurl.com/8hj52d",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apocatastasis",
                           @"twitterDef":@"the Greek word meaning\r“the restoration of all things”",
                           @"definition":@"\rThis term only occurs in the New Testament in Acts 3:21, wherein Peter refers to the state of creation in the Messianic Age. Later in the Patristic era, Origen used it to the belief that, at the eschaton, God will restore all creation back into full Divine communion.\r\rGreek, ἀποκατάστασις (apocatastasis)\r\rFurther Reference:\rWikipedia, “Apocatastasis”\rhttp://tinyurl.com/n8txupj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apologetics",
                           @"twitterDef":@"the rational defense of the Christian faith",
                           @"definition":@"\rThe early Christians were compelled to defend authentic Christian faith and practice against false accusations and various suspicions. Notable Apologies include that of Justin Martyr and Tertullain.\r\rGreek, ἀπολογία (apologia)“defense”.\r\rFurther Reference:\rWikipedia, “Apologetics”\rhttp://tinyurl.com/cxswly",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apophatic",
                           @"twitterDef":@"language that uses negation\rto describe God",
                           @"definition":@"\rApophatic language emphasizes the discontinuity of God with anything created. It was popular with the early Greek fathers.\r\rFurther Reference\rWikipedia, “Apophatic Theology”\rhttp://tinyurl.com/22pm86z",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apostolic",
                           @"twitterDef":@"the quality of the Church as being based on the Apostolic tradition",
                           @"definition":@"\rOne of the four marks of the Church - One, Holy, Catholic, Apostolic.\r\rFurther Reference:\rCatechism of the Catholic Church, 857\rhttp://tinyurl.com/oupb5",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Assumption of Mary",
                           @"twitterDef":@"the dogma that the Virgin Mary was assumed into heaven",
                           @"definition":@"\rThe dogma, defined by Pope Pius IX, which states that the Virgin Mary was assumed body and soul into heaven at the end of her earthly life.\r\rFurther Reference:\rCatechism of the Catholic Church, 966\rhttp://tinyurl.com/mtfzewa",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Atonement",
                           @"twitterDef":@"the act of making restitution\rfor inflicted harm",
                           @"definition":@"\rLiterally translated “at-one-ment”, mandated in requisite to forgiveness in the Priestly tradition of the Torah in Leviticus. Atonement became a dominant theological interpretation of the death of Jesus of Nazrareth in the early Church.\r\rFurther Reference:\rCatechism of the Catholic Church, 616\rhttp://tinyurl.com/p3dfabj",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Agnus Dei",
                           @"twitterDef":@"the invocation during the Fraction of the Eucharist\rthat begins, “Lamb of God”",
                           @"definition":@"\rThe Agnus Dei is chanted 3 times before the distribution of the Eucharist.\r\r“Lamb of God, you who take away the sins of the world, have mercy upon us.\rLamb of God, you who take away the sins of the world, have mercy upon us.\rLamb of God, you who take away the sins of the world, grant us peace.\r\rSee “Eucharist”, “Fraction”.\r\rLatin, (agnus dei) “Lamb of God”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Liturgy of the Eucharist”\rhttp://tinyurl.com/lleofmh",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Advent",
                           @"twitterDef":@"the first season of the liturgical year\rthat prepares for the coming of Christ",
                           @"definition":@"\rAdvent prepares the Church for the the celebration of the birth of Jesus. It is observed over the course of four Sundays.\r\rFurther Reference:\rCatechism of the Catholic Church, 524\rhttp://tinyurl.com/mou9egj",
                           @"category":@"Ecclesial"}];
    
    [TAWord wordWithDict:@{@"name":@"Alleluia",
                           @"twitterDef":@"a Latinized form of the phrase meaning\r“Praise the LORD”",
                           @"definition":@"\rThe Alleluia is spoken before the reading of the Gospel during the Mass. It is not spoken during the season of Lent.\r\rFurther Reference:\rCatechism of the Catholic Church, 2589\rhttp://tinyurl.com/pynlg6a",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Altar",
                           @"twitterDef":@"the table upon which\rthe Eucharist is placed",
                           @"definition":@"\rThe development of dedicated altars in churches was a later development in early Christianity that coincided with its gradual acceptance into Roman society. The New Testament only speaks of the altar of Christ's body due to the interpretation of the death of Jesus as an atoning sacrifice (Heb. 13:10).\r\rFurther Reference:\rCatechism of the Catholic Church, 1182\rhttp://tinyurl.com/p9382z5",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ambo",
                           @"twitterDef":@"the elevated platform behind which the lector, cantor, or homilist stands",
                           @"definition":@"\rThe Ambo (also called a “lecturn”) is usually placed beside the altar.\r\rFurther Reference:\rCatechism of the Catholic Church, 1184\rhttp://tinyurl.com/p9382z5",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Amen",
                           @"twitterDef":@"the Hebrew word meaning\r“may it be so”",
                           @"definition":@"\rThe Amen is traditionally said after a prayer as a form of agreement. It derives from Jewish use in the synagogue and later in the New Testament where it is used to indicate the truthfulness of what is said; “Amen, Amen, I say to you...”\r\rHebrew, אָמֵן (amen)\r\rFurther Reference:\rCatechism of the Catholic Church, 1061\rhttp://tinyurl.com/k3f2f8p",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anamnesis",
                           @"twitterDef":@"the Greek word meaning\r“lived rememberance” used for the Liturgy",
                           @"definition":@"\rThe Anamnesis is used in the Words of Institution, in which Jesus asks his disciples to “remember” him when they eat the bread and drink the cup. It is a performative act used to re-present the salvific death and resurrection of Jesus.  See “Real Presence”.\r\rGreek, ἀνάμνησις (anamnesis)\r\rFurther Reference:\rCatechism of the Catholic Church, 1103\rhttp://tinyurl.com/oqbzkx3",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anaphora",
                           @"twitterDef":@"the offering of the Eucharistic Prayer\rin structured sequences",
                           @"definition":@"\rThe Eucharistic prayer of the Mass was celebrated in structured sequences as early as possibly the first century (in the Didache) and certainly by third century, in the Apostolic Tradtion of Hippolytus of Rome. The term is based on the Septuagint reading of Leviticus 2:14 and other passages, in which the Israelite priest offers up the sacrifice.\r\rGreek, ἀναφορά (anaphora) “to lift up”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1352\rhttp://tinyurl.com/m88dbjl",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anathema",
                           @"twitterDef":@"the Greek word meaning “placed off limits”;\rthe state of being excommunicated",
                           @"definition":@"\rOver time, Anathema came to refer to those who were accursed or banished from the community.\r\rGreek, ἀνάθεμα (anathema)\r\rFurther Reference:\rNew Advent, “Anathema”\rhttp://tinyurl.com/o5fl88l",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Annulment",
                           @"twitterDef":@"an ecclesial declaration that a valid marriage never exixted",
                           @"definition":@"\rAn ecclesial declaration that a valid marriage never existed.\r\rFurther Reference:\rCatechism of the Catholic Church, 1629\rhttp://tinyurl.com/ykptlg",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Antiphon",
                           @"twitterDef":@"the choral response sung during\rthe entrace processional during Mass",
                           @"definition":@"\rThe choral response sung during the entrace processional.\r\rFurther Reference:\rGeneral Instruction on the Liturgy of the Hours, III.II http://tinyurl.com/ku23eyw",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apostle's Creed",
                           @"twitterDef":@"the creed used in Rome circa A.D. 150",
                           @"definition":@"\rThe Apostle's Creed is the earliest known liturgical creed associated specifically with the Church of Rome.\r\r“I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, his only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; he descended into hell; on the third day he rose again from the dead; he ascended into heaven, and is seated at the right hand of God the Father almighty; from there he will come to judge the living and the dead. I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.”\r\rFurther Reference:\rCatechism of the Catholic Church, 194\rhttp://tinyurl.com/mo3f24x",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Arianism",
                           @"twitterDef":@"the teaching of Arius, that the Son\rwas not of the same substance as the Father",
                           @"definition":@"\rThe teaching of Arius that the Son was of a different substance than the Father (begotten vs. unbegotten) and thus, not fully divine. See “Homoiousios”.\r\rFurther Reference:\rCatechism of the Catholic Church, 465\rhttp://tinyurl.com/37wuaux",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"A Posteriori",
                           @"twitterDef":@"a philosophical category which follows human experience",
                           @"definition":@"\rA posteriori truth claims are those that are not self-evident, but depend upon empirical data. The statement “Water boils at 0 degrees Celsius” is an a posteriori truth; Latin, “after experience”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“A Priori Justification and Knowledge”\rhttp://tinyurl.com/6tp7oyz",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"A Priori",
                           @"twitterDef":@"a philosophical category which precedes human experience",
                           @"definition":@"\rA priori truth claims are those that are self-evident, without requiring empirical data. The statement “All bachelors are unmarried' is an a priori truth; Latin, “before experience”\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“A Priori Justification and Knowledge”\rhttp://tinyurl.com/6tp7oyz",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Action",
                           @"twitterDef":@"direct or indirect nonviolent action\r taken to achieve justice",
                           @"definition":@"\rIn the context of social justice, both direct an indirect nonviolent action are appropriate responses to injustice.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 419 http://tinyurl.com/qfo6bd7",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Agnostic",
                           @"twitterDef":@"the word used to describe uncertainty about the existence of God",
                           @"definition":@"\rAgnostics are sometimes mistakenly confused with atheists.\r\rFurther Reference:\rCatechism of the Catholic Church, 2127\rhttp://tinyurl.com/lu75a9k.",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Analysis",
                           @"twitterDef":@"the process of discerning appropriate steps to achieving justice",
                           @"definition":@"\rAnalysis is the second of the 3 steps in achieving justice. It begins with discernment of the partiuclar situation and how the princples of social justice would be prudently and appropriately applied.\r\rFurther Reference\rPaul VI, A Call To Action, 48\rhttp://tinyurl.com/llup47a",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Anthropology",
                           @"twitterDef":@"the science that studies human origins, development, and culture",
                           @"definition":@"\rThe science that studies human origins, development, and culture.\r\rFurther Reference:\rAmerican Anthropological Association\rhttp://tinyurl.com/28tcvt",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Anti-Semitism",
                           @"twitterDef":@"prejudice, hatred, or racial bias against Jewish persons",
                           @"definition":@"\rPrejudice, hatred, or racial bias against Jews. Some portions of the New Testament bear traces of anti-Semitism due to theological biases against the Jewish people for rejecting Christ. Thus, the Christian tradition has included anti-Semitic currents that have been rejected since the Second Vatican Council.\r\rFurther Reference:\rVatican II, Nostra Aetate\rhttp://tinyurl.com/k4dj",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Argument",
                           @"twitterDef":@"a series of statements that establishes a truth claim",
                           @"definition":@"\rA series of statements that establishes a truth claim; made of two parts - premise and conclusion; the from can be deductive or inductive; deductive arguments can be valid or invalid.\r\rFurther Reference:\rInternet Encylopedia of Philosophy, “Argument” http://tinyurl.com/aruqml5",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Atheism",
                           @"twitterDef":@"the belief that no God exists",
                           @"definition":@"\rAtheism is not a necessary worldview consequent to science.\r\rFurther Reference:\rCatechism of the Catholic Church, 2113\rhttp://tinyurl.com/lu75a9k",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Awareness",
                           @"twitterDef":@"the gathering of information about a given injustice",
                           @"definition":@"\rAwareness is first step in acheiving social justice. Without awareness of conditions in society, no change can be affected.\r\rFurther Reference\rPaul VI, A Call To Action, 48\rhttp://tinyurl.com/llup47a",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Acolyte",
                           @"twitterDef":@"a liturgical assistant to the\rcelebrant of Mass",
                           @"definition":@"\rAcolytes are mentioned as early as the 4th century. Until 1972, it was one of the minor orders, which Pope Paul VI renamed as “ministries”. \r\rFurther Reference:\rCatechism of the Catholic Church, 903\rhttp://tinyurl.com/m65ttaf",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Act of Contrition",
                           @"twitterDef":@"a prayer said before the\rSacrament of Reonciliation",
                           @"definition":@"\rWhile the Church does not canonize any one prayer for forgiveness, a popular one in current usage reads:\r\r“My God, I am sorry for my sins with all my heart. In choosing to do wrong and failing to do good, I have sinned against You whom I should love above all things. I firmly intend, with Your help, to do penance, to sin no more, and to avoid whatever leads me to sin. Our Saviour Jesus Christ, suffered and died for us. In His name, my God, have mercy.”\r\rSee “Reconcilation”.\r\rFurther Reference:\riBreviary, Act of Contrition\rhttp://tinyurl.com/m5vwvhc",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apostolic Fathers",
                           @"twitterDef":@"the collection of Christian texts from the late first and early second centuries",
                           @"definition":@"\rThe Aposotolic Fathers are the earliest extra-biblical texts outside the Bible.\r\rFurther Reference:\rWikipedia, “Apostolic Fathers”\rhttp://tinyurl.com/56xymr",
                           @"category":@"Historical"}];
    
    ///////////////////////B
    
    [TAWord wordWithDict:@{@"name":@"Beatific Vision",
                           @"twitterDef":@"the traditional destiny of those who are\rpure of heart",
                           @"definition":@"\rThe first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia,...\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Beatitudes",
                           @"twitterDef":@"a series of sayings in Matthew that begin\rwith the word “Blessed”",
                           @"definition":@"\rThe Beatitudes are likely the most famous of Jesus' sayings from the Sermon on the Mount",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Baldachino",
                           @"twitterDef":@"a canopy use to cover a bishop's chair, the altar, or Eucharistic processions",
                           @"definition":@"\rBaldachinos are regularly seen in St. Peter's Square...",
                           @"category":@"Liturgical"}];


    [TAWord wordWithDict:@{@"name":@"Beneficence",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"\rThe first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Benediction",
                           @"twitterDef":@"a final blessing at the end of Mass",
                           @"definition":@"\rThe Benediction...;from the Latin    (good word).",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Benefit/Burden Ratio",
                           @"twitterDef":@"the ratio of benefits over the burdens of a particular medical treatment",
                           @"definition":@"\rThe Benefit/Burden Ratio is a variable in morality of certain medical procedures. It's use extends outside theology to the broader study of ethics.\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Bioethics",
                           @"twitterDef":@"the study of ethics related to medical and life issues",
                           @"definition":@"\rBioethics has become a specialization in the field of ethics due, in part, to the tremendous technological advances that enable new forms of treatment but that also raise new ethical questions in the practice of medicine.\r\rFurther Reference:\rAmerican Bioethics Advisory Commission, “What is Bioethics?”\rhttp://tinyurl.com/k8sppee",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Baptism",
                           @"twitterDef":@"the Sacrament of Initiation into the Church\rby ritual cleansing with water",
                           @"definition":@"\rBaptism is a practice which Christianity inherited from the Jewish practice of the Mikvah, or ceremonial washing in Second Temple Period. John the Baptist practiced a derivation of this in his ministry, of which Jesus of Nazareth was a follower for some period of time. According to the book of Acts, John's baptism was still being practiced concurrently with Christian baptism.\r\rBaptism, along with Eucharist, is a Christian practice dating back to the earliest days of the Church. According to the consistent tradition of the Church, Baptism removes the stain of Original Sin, forgives actual sins, and brings about a spiritual rebirth.\r\rFurther Reference:\rCatechism of the Catholic Church, 1213\rhttp://tinyurl.com/ykqqof",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Blasphemy",
                           @"twitterDef":@"a form of religious slander",
                           @"definition":@"\rform of religious slander.\r\rFurther Reference:\rCatechism of the Catholic Church, 2148\rhttp://tinyurl.com/bczm8h7",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessing",
                           @"twitterDef":@"a pronouncement of Divine favor",
                           @"definition":@"\rThe concept of blessing has its origins in the Old Testament",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Baptistry",
                           @"twitterDef":@"the place within a church used for baptism,\rusually referred to as a “font”",
                           @"definition":@"\rBaptistries are a later development in the Christian tradition. They are connected to the growth of the Church after its more definitive separation from Judaism after A.D. 70.\r\rFurther Reference:\rCatechism of the Catholic Church, 1185\rhttp://tinyurl.com/p9382z5",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Basilica",
                           @"twitterDef":@"a church in which the diocescan bishop presides",
                           @"definition":@"\rThe Church inherited basilicas from the Roman Imperial administrative system. Literally meaning “house of the king”, these buildings were essentially courthouses in which Roman administrators would hear cases.\r\rFurther Reference:\rWikipedia, “Basilica”",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Benedictus",
                           @"twitterDef":@"the Canticle of Zechariah contained within the Gospel of Luke 1:68-79",
                           @"definition":@"\rThis song is recorded as the extemporaneous prayer of Zechariah on the occassion of the birth of his son, John the Baptist. The Benedictus is a part of Morning Prayer in the Liturgy of the Hours.\r\rFurther Reference:\rWikipedia, “Benedictus”\rhttp://tinyurl.com/nvdk23a",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Biretta",
                           @"twitterDef":@"a cap worn by clergy for special celebrations",
                           @"definition":@"\rThe Biretta....",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Bishop",
                           @"twitterDef":@"a successor to the Apostles who oversees a particular diocese",
                           @"definition":@"\rThe office of Bishop is the third order of clerics in the Catholic tradition. In the New Testament, Paul speaks of bishops in the church at Philippi together with deacons. In the second century there seems to have been a further development of the office. Local presbyters elected one of their own to a leadership position. This is reflected in the letters of Ignatius of Antioch (ca. A.D. 110). This form of having one bishop presiding over a local church, (known as “monoepiscopacy”) became the norm in every church by the end of the third century.\r\rBishops were later attached to larger areas of churches known as dioceses, which were Roman Imperial adminstrative distrcts set up by the Emperor Diocletian. After the legalization of Christianity, the Church inherited these districts in its own administration; from the Greek επισκοπος (episcopos) “overseer”. See “Monoepiscopacy”.\r\rFurther Reference:\rCatechism of the Catholic Church\rhttp://tinyurl.com/m65ttaf",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ba'al",
                           @"twitterDef":@"the son of El and most active of the gods in Canannite mythology",
                           @"definition":@"\rBa'al is a Semitic word for “Ruler”, “Husband”, or “Lord”. It became synonymous with a very popular Canaanite deity who was worshipped by ancient Israelites. According to to 2 Kings 23:4 an image of Ba'al was housed in the Temple before Josiah's Deuternomic reform.\r\rFurther Reference:\rWikipedia, Ba'al\rhttp://tinyurl.com/ljhlb",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Babel",
                           @"twitterDef":@"the Hebrew word meaning “confusion”;\rthe name of the tower in Genesis 11:1-9",
                           @"definition":@"\rAs an etiology, this story explains both how human language became divided as well as the geographic distribution of human populations.\r\rHebrew, בָּבֶל (babel)\r\rFurther Reference:\rCatechism of the Catholic Church, 57\rhttp://tinyurl.com/k6ljesq",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Babylon",
                           @"twitterDef":@"the empire that conquered the southern kingdom of Judah in 587 B.C.",
                           @"definition":@"\rThe Babylonians destroyed the Temple and took most of the residents of Jerusalem captive to Babylon, where they remained for 50 years.\r\rFurther Reference:\rOxford Biblical Studies, “Babylon” \rhttp://tinyurl.com/q7fujw5",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ban",
                           @"twitterDef":@"the ancient Israelite practice of destroying possessions dedicated to YHWH",
                           @"definition":@"\rWhen victorious over its enemies, Israel was to place certain possessions, including people, under the Ban and completely destroy them in order to devote them anew to YHWH. Such is the case in Joshua 6 and 1 Samuel 15, which explicity command the death of women and children. See “YHWH”.\r\rHebrew, חֵֽרֶם׃ (herem) “cursed”\r\rFurther Reference:\rWikipedia, “Ban”\rhttp://tinyurl.com/p7phypo",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Big Bang Theory",
                           @"twitterDef":@"the theory that the Universe expanded\rfrom an infinite singularity",
                           @"definition":@"\rThe cosmological theory, first developed by Fr. George Lemaitre, that claims that the Universe began at an infintely small and dense point of matter, energy, space, and time which then expanded over the course of time to become the observable cosmos we see today. See “Creation”\r\rFurther Reference:\rWikipedia, “Big Bang”\rhttp://tinyurl.com/9nq4k",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessed Sacrament",
                           @"twitterDef":@"a reference to the Eucharist as Christ's\rbody and blood, soul and divinity",
                           @"definition":@"\rThe Blessed Sacrament is...\r\rFurther Reference:\rCatechism of Catholic Church, 1374\rhttp://tinyurl.com/q6gyoc7",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Buddhism",
                           @"twitterDef":@"the philosophy and religion based on the teachings of Siddartha Gotama",
                           @"definition":@"\rBuddhism is based on the teachings after Siddartha's claim to enlightenmnet, (ca. 500 B.C.). He taught the Four Noble Truths:\r\r1. Life is Suffering.\r2. Attachement is the root of suffering.\r3. Suffering can be overcome.\r4. The Eightfold Path.\r\rBuddhism has had increasing contact with Christianity over the last 100 years. Perhaps the most famous point of intersection was between the Trappist monk, Thomas Merton and the Dalai Lama in 1968. Buddhism claims to be offer a lifestyle that can be adapted to anu religion, although this is contested due to some of its claims.\r\rFurther Reference:\rBuddhnet, “Basic Buddhism”\rhttp://tinyurl.com/69cl",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Byzantine Rite",
                           @"twitterDef":@"the liturgical rite of the Eastern Orthodox church",
                           @"definition":@"\rThe Byzantine Rite can be traced back as early as the ... century.\r\rFurther Reference:\rCatechism of the Catholic Church, 1203\rhttp://tinyurl.com/ndllues",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Breaking of the Bread",
                           @"twitterDef":@"a biblical phrase used to\rdescribe the Agape-Eucharist meal",
                           @"definition":@"\rThis phrase first occurs in the Acts of the Apostles...\r\rFurther Reference:\rCatechism of Catholic Church, 1329\rhttp://tinyurl.com/q6gyoc7",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessed Virgin Mary",
                           @"twitterDef":@"a liturgical title of the Virgin Mary",
                           @"definition":@"\rThe title Blessed Virgin Mary is based, in part, on the prediction of Mary in the Gospel of Luke: from now on, all generations will call me blessed.....\r\rFurther Reference:\rCatechism of the Catholic Church, 971\rhttp://tinyurl.com/mtfzewa",
                           @"category":@"Systematic"}];


    
    
    /*
     Word *bathshebaWord = 
     bathshebaWord.@"name":@"Bathsheba";
     bathshebaWord.@"definition":@"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
     */
    
    [TAWord wordWithDict:@{@"name":@"Bible",
                           @"twitterDef":@"the collection of the\rOld and New Testaments",
                           @"definition":@"\rThe collection of the Old and New Testaments regarded as canonical and inspired within Catholicism. From the Greek, βιβλος (biblos) “scroll”. Historically, the Catholic canon of Scripture has included the Deuterocanonical books while Protestant bibles have excluded them. See ”Sacred Scripture” in the Overview tab.\r\rFurther Reference:\rWikipedia, “Catholic Bible”\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Breviary",
                           @"twitterDef":@"a book of the Liturgy of the Hours",
                           @"definition":@"\rBreviaries were books. See “Liturgy of the Hours”.\r\rFurther Reference:\rWikipedia, “Breviary”\rhttp://tinyurl.com/yj4ycnd",
                           @"category":@"Liturgical"}];
    
    //Word *biblicalCriticism = 
    //biblicalCriticism.@"name":@"Biblical Criticism";
    //biblicalCriticism.@"definition":@"The process of discovering what can be known about the context of any biblical book or passage in order to understand its original meaning.";
    //biblicalCriticism.@"category":@"Biblical"}];
    
    //Word *bethel = 
    //bethel.@"name":@"Beth-El";
    //bethel.@"twitterDef":@"a sacred site within the patriarchal story cycles in Genesis";
    //bethel.@"definition":@"Bethel is a Hebrew word meaning “House of El”. It is a prominent site in the Old Testament in both the periods of the Patriarchs and the Monarchy.";
    //bethel.@"category":@"Biblical"}];
    
    //C
    
    [TAWord wordWithDict:@{@"name":@"Catechumen",
                           @"twitterDef":@"a person training for Baptism",
                           @"definition":@"\rCatechumens have been recognized as a distinct group since the earliest days of the Church...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Candidates",
                           @"twitterDef":@"those who have received Baptism\rin preparation for Confirmation and Eucharist",
                           @"definition":@"\rCandidates are generally composes of those who convert to Catholicism from another Christian tradition...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cantor",
                           @"twitterDef":@"the leader of liturgical singing during the Mass",
                           @"definition":@"\rCantors are an inheritance of the Church from Judaism..\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cardinal Virtues",
                           @"twitterDef":@"justice, prudence, temperance, and fortitude",
                           @"definition":@"\rThe four Cardinal Virtues are first mentioned by Plato...Thomas Aquinas..\r\rFurther Reference:\r.",
                           @"category":@"Moral"}];


    [TAWord wordWithDict:@{@"name":@"Cassock",
                           @"twitterDef":@"a long garment work by clergy",
                           @"definition":@"\rThe cassock, like the Biretta, is usually reserved for special liturgical celebrations...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Catechism",
                           @"twitterDef":@"a systematized body of teaching",
                           @"definition":@"\rThe Catechism of the Catholic Church...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Catechist",
                           @"twitterDef":@"a certified teacher of the faith",
                           @"definition":@"\rCatechist are usually those who teach in religious education programs...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Censer",
                           @"twitterDef":@"see Thurible",
                           @"definition":@"\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Casuistic Law",
                           @"twitterDef":@"a type of law derived from individual cases rather than universal norms",
                           @"definition":@"\rCasuistic law is contrasted with apodictic law. The latter is exemplified by the 10 Commandments, while the former is found in the Covenant Code of Exodus 21-23.\r\rFurther Reference:\rWikipedia, “Casuistry”\rhttp://tinyurl.com/2pntmh",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Cappadocian Fathers",
                           @"twitterDef":@"Basil the Great, Gregory of Nyssa,\rand Gregory of Nazianzus",
                           @"definition":@"\rThese three fathers occupy a special place in the Eastern Orthodox tradition...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Catholic Social Teaching",
                           @"twitterDef":@"the teaching of the Church which applies the\r principles of justice to society",
                           @"definition":@"\rAccording to Pope Paul VI's encyclical, Populorum Progressio, social teaching is essential to authentic evangelization. It consists of principles of reflection, criteria of judgment, and directives for action. See “Social Justice”, “Signs of the Times”.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 85 http://tinyurl.com/kn6q5wm ",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Commutative Justice",
                           @"twitterDef":@"the aspect of justice which emphasizes\r obligations between individuals",
                           @"definition":@"\rThe type of justice which emphasizes obligations between individuals\r\rFurther Reference:\rCatechism of the Catholic Church, 2411\rhttp://tinyurl.com/6y3q4",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Contributive Justice",
                           @"twitterDef":@"the aspect of justice that emphasizes\rthe obligation of individuals toward society",
                           @"definition":@"\rContributive justice is met when the individual fulfills his responsbilities to the larger society.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Economic Justice For All”, II.b.1.b http://tinyurl.com/75hnlx3",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Canon",
                           @"twitterDef":@"the Greek word for “measuring stick”\rused to refer to a criterion or standard",
                           @"definition":@"\rSaints are canonized by the Church as standards by which Catholics may judge their lives. The Bible is referred to as the canon of the Scriptures that provide criteria for faith and practice; from the Greek, κανον. See “Sacred Scripture” in the Overview tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 120. http://tinyurl.com/kvc3tvq\r\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, III.B” http://tinyurl.com/2gb5dm ",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Catholic",
                           @"twitterDef":@"the quality of being universal in nature",
                           @"definition":@"\rThe quality of being universal in scope; one of the four marks of the Church. “according to the whole”\r\rFurther Reference:\rCatechism of the Catholic Church, 830\rhttp://tinyurl.com/c5m8w5j",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Celibacy",
                           @"twitterDef":@"a lifestyle of sexual abstinence",
                           @"definition":@"\rCelibacy is a vocation that dates...\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Chastity",
                           @"twitterDef":@"appropriate experience",
                           @"definition":@"\rChastity is a term that has to do with more than simply sexual purity.\r\rFurther Reference:\r",
                           @"definition":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Christ",
                           @"twitterDef":@"a title of Jesus meaning “annointed one”",
                           @"definition":@"\rThe title given to Jesus of Nazareth by early Christians; from the Greek, χριστος (christos) “annointed one”.\r\rFurther Reference:\rCatechism of the Catholic Church, 436\rhttp://tinyurl.com/neqlbg7",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Christ of Faith",
                           @"twitterDef":@"the term for the risen Jesus that emphasizes his glorified existence",
                           @"definition":@"\rThe term Christ of Faith is often contrasted with the Jesus of History...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Christology",
                           @"twitterDef":@"the study of the person and nature of Christ",
                           @"definition":@"\rChristology is a subset of Systematics and takes as its point of departure the Chalcedonian definition of the two natures and hypostatic union in Jesus.\r\rFurther Reference:\rWikipedia, “Christology”\rhttp://tinyurl.com/2b79fj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Church",
                           @"twitterDef":@"the community that believes that Jesus of Nazraeth\ris the divine Savior of the world",
                           @"definition":@"\rThe community belonging to the Lord; the people of God; the community centered on the belief that Jesus of Nazraeth is the divine Savior of the world.\r\rFurther Reference:\rCatechism of the Catholic Church, 751\rhttp://tinyurl.com/ojrdr53",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"College of Bishops",
                           @"twitterDef":@"the aspect of bishops as a group of equals",
                           @"definition":@"\rThe College of Bishops is a concept emphasized by Vatican II...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Compline",
                           @"twitterDef":@"the traditional word for Night Prayer",
                           @"definition":@"\rCompline...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];


    
    [TAWord wordWithDict:@{@"name":@"Communicatio Idiomatum",
                           @"twitterDef":@"the interexchange of Christ's\rdivine and human natures",
                           @"definition":@"\rThe idea of the Communicatio Idiomatum means that the properties of the human Jesus can also be predicated of the Logos and vice versa.\r\rFurther Reference:\rNew Advent, “Communicatio Idiomatum”\rhttp://tinyurl.com/nqusf6m",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Communion of Saints",
                           @"twitterDef":@"the unity among believers that exists in Christ",
                           @"definition":@"\rThe unity among believers that exists in Christ.\r\rFurther Reference:\rCatechism of the Catholic Church, 946\rhttp://tinyurl.com/pkxuudx",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Confession",
                           @"twitterDef":@"the Sacrament of Reconciliation with God through the Church",
                           @"definition":@"\rThe sacrament of reconciliation\r\rFurther Reference:\rCatechism of the Catholic Church, 1424\r http://tinyurl.com/l7xon9e",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Confirmation",
                           @"twitterDef":@"the sacrament of reception of the Holy Spirit in which..",
                           @"definition":@"\rThe sacrament of reception of the Holy Spirit in which.... \r\rFurther Reference:\rCatechism of the Catholic Church, 1285\rhttp://tinyurl.com/lcgw5p7",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Conversion",
                           @"twitterDef":@"the process of spiritual transformation",
                           @"definition":@"\rThe process of changing one's direction in life.\r\rFurther Reference:\rCatechism of the Catholic Church, 1989\rhttp://tinyurl.com/yaua7cc",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Cosmological Argument",
                           @"twitterDef":@"an argument for God's existence, based on Aristotle's First Cause argument",
                           @"definition":@"\rOne of the classical arguments for the existence of God, based on the First Cause argument.\r\rFurther Reference:\rSee Stanford Encyclopedia of Philosophy, “Cosmological Argument” http://tinyurl.com/8xkm72n\r\rThomas Aquinas, Summa Theologica, ST, Ia, q. 2 a. 3 co. http://tinyurl.com/my5bedq",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Contemplation",
                           @"twitterDef":@"a form of silent and meditative prayer",
                           @"definition":@"\rThis form of prayer....\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Chalice",
                           @"twitterDef":@"the litugical name for a cup/used during the Eucharist",
                           @"definition":@"\rThe 2011 new translation of the Mass refers to the cup (still called such in the Memorial Acclamation) as a chalice...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cherubim",
                           @"twitterDef":@"a class of angelic figures\rdepicted in the Bible",
                           @"definition":@"\rCherubim are found from as early as Genesis 3....; the plural form of the Hebrew     cherub...\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Conscience",
                           @"twitterDef":@"that which prompts us to\rdo good and avoid evil",
                           @"definition":@"\rThe conscience is inner-most place of the soul which determines....\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Consecration",
                           @"twitterDef":@"the act of setting someone or something\rapart for special service",
                           @"definition":@"\rConsecration usually takes the form of the consecration of the Eucharistic elements of bread and wine. It is also used to describe....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Consubstantial",
                           @"twitterDef":@"having the same substance",
                           @"definition":@"\rThis term is derived from the Latin translation of homoousious...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Contrition",
                           @"twitterDef":@"repentance from sin and intention for conversion",
                           @"definition":@"\rContrition is the natural result of sin. Psalm ...says A contrite heart, you will not despise....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Concelebration",
                           @"twitterDef":@"the celebration of the Mass\rby two or more priests",
                           @"definition":@"\rConcelebration is....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Corpus Christi",
                           @"twitterDef":@"the liturgical feast that celebrates\rthe Eucharist",
                           @"definition":@"\rCorpus Christi is a feast day for the Church....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Crucifixion",
                           @"twitterDef":@"a form of death by hanging\that induces asphyxiation",
                           @"definition":@"\rThe Romans aquired the practice of crucifixion from the Carthaginians. It was reserved for Roman non-citizens...\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Creation",
                           @"twitterDef":@"the Universe...",
                           @"definition":@"\rThe universe.\r\rFurther Reference:\rCatechism of the Catholic Church, 280\rhttp://tinyurl.com/6kvj6",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Creationism",
                           @"twitterDef":@"the belief that God created the earth & humanity as described in the book of Genesis",
                           @"definition":@"\rThe belief that God created the earth and human beings directly, with no biological predecessors as described in the book of Genesis.\r\rFurther Reference:\rSee “evolution” in the Cultural cateogry",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Creed",
                           @"twitterDef":@"a statement of faith or belief",
                           @"definition":@"\rThe Latin word (credo) meaning “I believe” - a statement of belief; used to refer to the historical creeds of the Church, most notably the Apostle's and Nicene creed.\r\rFurther Reference:\rCatechism of the Catholic Church, 187\rhttp://tinyurl.com/mo3f24x",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Call Narrative",
                           @"twitterDef":@"a literary form used throughout the Bible in which a person is called by God for a specific task",
                           @"definition":@"\rCall Narratives consist of three parts: call, concern, commission. The stories of Moses, Jeremiah, and Isaiah all involve a call narrative.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Charism",
                           @"twitterDef":@"the spiritual gifts that result from the experience of the Holy Spirit",
                           @"definition":@"\rAccording to the Apostle Paul, the spiritual gifts that come with Christian experience of the Holy Spirit. See 1 Corinthians 12.\r\rGreek, χαρισμα (charisma) “gift”.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Circumcision",
                           @"twitterDef":@"the ritual cutting of the male foreskin",
                           @"definition":@"\rCircumcision is the essential sign of the covenant according to the Priestly Source in Genesis 17.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Codex",
                           @"twitterDef":@"a collection of manuscripts",
                           @"definition":@"A collection of manuscripts.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Covenant",
                           @"twitterDef":@"a sacred contract or agreement",
                           @"definition":@"\rCovenants are used throughout the Bible. They refer to the relationship between YHWH and Noah and all living creatures in Genesis 9; between God and Abraham in Genesis 15 and 17; between YHWH and all Israel in Exodus 25; and between God and humanity in the Gospels.\r\rFurther Reference:\rCatechism of the Catholic Church, 56, 59, 62, 73 http://tinyurl.com/pesbbq3",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Church/State",
                           @"twitterDef":@"a philosophical, theological, and legal dichotomy of religious and political entities",
                           @"definition":@"\rThe dichotomy used to express philosophical, theological, and legal differences in religious and political entities.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Colonialism",
                           @"twitterDef":@"the practice of a country claiming foreign lands\ras its own",
                           @"definition":@"\rThe practice of settling foreign lands.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Common Good",
                           @"twitterDef":@"the social condition in which all people\r are allowed to reach their full development",
                           @"definition":@"\rthe social condition in which all people are allowed to reach their full development.\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Compatiblism",
                           @"twitterDef":@"the belief that human freedom is compatible with determinism",
                           @"definition":@"\rThe belief that human freedom is compatible with deterministic elements of human experience.\r\rFurther Reference:\rStandford Encyclopedia of Philosophy, “Compatibilism”\rhttp://tinyurl.com/l3aj5j.",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Council",
                           @"twitterDef":@"a gathering of the Church to settle disputed matters of Christian teaching",
                           @"definition":@"\rA gathering of the Church to settle disputed matters of Christian teaching; the prototypical council is depicted in Acts 15 in which the Church determines the requirements for Gentile membership. Later councils were local or regional; ecumenical councils, or councils of the whole Church, began in A.D. 325 at the behest of the Emperor Constantine in the city of Nicea. Seven such ecumenical councils are recognized by both the Eastern and Western Church.\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cybertheology",
                           @"twitterDef":@"the intelligence of faith in the era of the Internet and World Wide Web",
                           @"definition":@"\rAccording to Fr. Antonio Spadaro, S.J., the term “cybertheology” refers to the intelligence of faith in the era of the Internet and World Wide Web, which arises from the recognition that, as technology changes ways of thinking, theology necessarily changes as well.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    //D
    
    [TAWord wordWithDict:@{@"name":@"Day of Atonement",
                           @"twitterDef":@"the holiest day in the Jewish calendar/ron which sin is atoned and forgiven",
                           @"definition":@"...see Yom Kippur.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Deanery",
                           @"twitterDef":@"a smaller geographical area within a diocese",
                           @"definition":@"Deaneries are made up of both clergy and lay representatives from various parishes....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Dehumanization",
                           @"twitterDef":@"the process of objectifying a human being, violating his or her dignity",
                           @"definition":@"One theory of dehumanization claims that it can take one of two forms: animalistic or mechanistic. The former denies uniqely human characteristics (such as civility, morality, rationality). The latter denies characteristics of human nature that are fundamental but not unique to humans (such as emotional responsiveness, individuality, interpersonalism).\r\rFurther Reference:\r“Dehumanization: An Integrative Review”\rhttp://tinyurl.com/okhuczt",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Deontology",
                           @"twitterDef":@"the study of ethics from the framework of moral duties in the form of rules and laws",
                           @"definition":@"Deontology - from the Greek word δεον (deon) “duty” - is a deontic theory of morality based on what we ought to do in contrast to virtue theories, which based on the kinds of persons we should be.\r\rFurther Reference:\rStanford Encyclopedia of Philospohy, “Deontological Ethics”\rhttp://tinyurl.com/ya6dgay",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Dignity of the Human Person",
                           @"twitterDef":@"the sacred status of human beings derived from their creation in the Image of God",
                           @"definition":@"Human dignity is based on the understanding that, being made in God's Image, humans are loved unconditionally and universally and called to be in loving relationship with the Creator. Human dignity is fulfilled in this vocation and is essential to human development. It is the first principle of Catholic Social Teaching in which all others are based. See “Catholic Social Teaching”, “Human Person”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1700\rhttp://tinyurl.com/kaz99um",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Disciple",
                           @"twitterDef":@"a follower of Jesus",
                           @"definition":@"According to the Gospels, Jesus had numerous disciples; from the Latin  , student.\r\rFurther Reference:\r ",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Distributive Justice",
                           @"twitterDef":@"the type of justice which emphasizes society's responsibilities to the individual",
                           @"definition":@"Distributive justice is an essential aspect of social justice. It is fulfilled when society meets its obligations to the individual based on his or her contribution and need.\r\rFurther Reference:\rUSCCB, “Economic Justice For All”, II.b.1.b http://tinyurl.com/75hnlx3",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Divine Liturgy",
                           @"twitterDef":@"the name of the Eastern Orthodox Eucharistic liturgy",
                           @"definition":@"The Divine Liturgy can be traced back to the time of John of Damascus...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Decaon",
                           @"twitterDef":@"an ordained servant of the Church",
                           @"definition":@"Decaons are referred to throughout the New Testament...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Deposit of Faith",
                           @"twitterDef":@"the content of the Christian faith given by God to the Church through the Apostolic tradition",
                           @"definition":@"The Depsit of Faith (Latin: Depositum Fidei) is the gift of salvific truth given to the Church by Christ through the Apostolic tradition.\r\rFurther Reference:\rCatechism of the Catholic Church, 84\rhttp://tinyurl.com/bx8mnlu"}];
    
    [TAWord wordWithDict:@{@"name":@"Development of Doctrine",
                           @"twitterDef":@"the idea that the teaching of the Church can faithfully develop over time",
                           @"definition":@"The concept of the Development of Doctrine is first found in the writings of Vincent of Lerins and later re-emphasized by Cardinal John Henry Newman. The former was cited explicitly by the council fathers at Vatican I. Recently, Thomas Guarino has argued that his lack of representation at Vatican II was the result of a misinterpretation of Vincent's famous claim:\r\r“We hold that which has been believed everywhere, always, and by everyone.”\r\rPope Francis has recently quoted Vincent's ideas in his discussions on abortion and gay marriage.\r\rFurther Reference:\rJohn Henry Newman, “Essay on the Development of Doctrine”\rhttp://tinyurl.com/n8kpzcc\r\rThomas Guarino, “Pope Francis Looks To Vincent of Lerins”\rhttp://tinyurl.com/ogtb5ej",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Devil",
                           @"twitterDef":@"a personal, malevolent spiritual being derived from “Satan” in the Tanak",
                           @"definition":@"The personal malevolent spiritual being who became synonymous with Satan in inter-testamental years leading up to the life of Jesus.\r\rFurther Reference:\rCatechism of the Catholic Church, 391\rhttp://tinyurl.com/llux3he",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Doctrine",
                           @"twitterDef":@"a systemized body of teaching",
                           @"definition":@"The word doctrine (from the Latin doctrina - teaching) is used in Catholicism to refer to the teaching of Church in a general sense.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Dogma",
                           @"twitterDef":@"the Greek word for “opinion” used for\ra doctrine that has been infallibly defined",
                           @"definition":@"A dogma in the Catholic tradition is a subset of Church doctrine. It refers to a divinely revealed truth that has been defined infallibly; from the Greek, δογμα.\r\rFurther Reference:\rCatechism of the Catholic Church, 88\rhttp://tinyurl.com/bx8mnlu",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Decalogue",
                           @"twitterDef":@"the 10 Commandments",
                           @"definition":@"The Decalogue is found in both Exodus 20 and Deuteronomy 5. In Exodus, they are part of the Mosaic theophany; from the Greek words δεκα (deka) “ten” and λογος (logos) “word”\r\rFurther Reference:\rCatechism of the Catholic Church, 2056\rhttp://tinyurl.com/nc86ead",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dei Verbum",
                           @"twitterDef":@"the dogmatic constitution of Vatican II\rdescribing the Church's belief in Divine revelation ; ",
                           @"definition":@"Dei Verbum is the most definitive statement on the Church's belief in Divine revelation, the Scriptures and Tradition. “Word of God”\\r\rFurther Reference:\rDogmatic Constitution on Divine Revelation\rhttp://tinyurl.com/3ecxu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Demythologization",
                           @"twitterDef":@"the process of separating time-conditioned myths\rfrom their underlying truths",
                           @"definition":@"Rudolph Bultmann coined this term to refer to way of interpreting the New Testament in a way that....\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Didache",
                           @"twitterDef":@"the name of the earliest extra-biblical Christian document",
                           @"definition":@"The Teaching of the Twelve Apostles...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Diocese",
                           @"twitterDef":@"the administrative area of a bishop",
                           @"definition":@"The concept of a diocese dates to the time of the Emperor Diocletian...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];



    [TAWord wordWithDict:@{@"name":@"Deuteronomic History",
                           @"twitterDef":@"the theologized history of Israel in Joshua, Judges, 1 & 2 Samuel, and 1 & 2 Kings",
                           @"definition":@"The term given to the books Joshua, Judges, 1 & 2 Samuel, and 1 & 2 Kings, based on the theology of the book of Deuteronomy, which detail the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel.\r\rFurther Reference:\rOxford Biblical Studies, “Deuteronomic History”\rhttp://tinyurl.com/poqwjxo",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deuteronomic Source",
                           @"twitterDef":@"the “D” source; comprising primarily of the book of Deuteronomy",
                           @"definition":@"The “D” source; comprising primarily of the book of Deuteronomy; one of the four sources which compose the Torah. See “Documentary Hypothesis.”\r\rFurther Reference:\rWikipedia, Deuteronomic Source\rhttp://tinyurl.com/myayczm",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deuteronomy",
                           @"twitterDef":@"the fifth and last book of the Pentateuch",
                           @"definition":@"from the Greek words “deuteros” (second) and “nomos” (law) - the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Diachronic",
                           @"twitterDef":@"the quality of transcending time",
                           @"definition":@"The type of truth within a text which transcends time and culture - from the Greek....\r\rFurther Reference:\r“The Interpretation of the Bible in the Church, A” http://tinyurl.com/ymsltv",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Divine Office",
                           @"twitterDef":@"the traditional word for the\rLiturgy of the Hours",
                           @"definition":@"The meaning of the phrase Divine Office (Service of God) stems from its Latin roots...",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Documentary Hypothesis",
                           @"twitterDef":@"the theory that there are 4 sources which comprise the Torah: J, E, P, and D",
                           @"definition":@"The theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah that have been edited together into its current canonical form; “Yahwist” (J), “Elohist” (E), “Priestly” (P), and “Deuteronomic” (D).\r\rAccording to Dr. Richard Elliot Freidman, there are seven arguments for its validity:\r\r1. Language\r2. Terminology\r3. Consistent Content\r4. Narrative Flow\r5. Other Biblical Connections\r6. Inter-Source Relationships\r7. Convergence of Arguments \r\rFurther Reference:\rPBS, “Who Wrote The Flood Story?”\rhttp://tinyurl.com/5leorc",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dynamic Equivalence",
                           @"twitterDef":@"a translation philosophy that seeks to render the text idea for idea",
                           @"definition":@"The pre-2011 translation of the Mass and New American Bible were both based on a dynamic equivalence philosophy.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deism",
                           @"twitterDef":@"the belief that God created the world but does not intervene in it",
                           @"definition":@"The belief that God created the world but does not intervene in the natural course of the world.\r\rFurther Reference:\rWikipedia, Deism\rhttp://tinyurl.com/oc6xh",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Determinism",
                           @"twitterDef":@"the belief that all events are determined by physical phenomena",
                           @"definition":@"The belief that all events, including human actions, are determined by physical phenomena, negating the concept of free-will.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Causal Determinism”\rhttp://tinyurl.com/ew8c.",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Development",
                           @"twitterDef":@"the process of enhancing the freedom and opportunity of all people to improve their lives",
                           @"definition":@"Human development is a central theme in Catholic Social Teaching as it applies to the Life and Dignity of the Human Person. It has been measured by the United Nations since 1990 with the first Human Development Report.\r\rFurther Reference:\rUnited Nations Development Programme\rhttp://tinyurl.com/khsqbzk",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Docetism",
                           @"twitterDef":@"the belief that Jesus was not fully human",
                           @"definition":@"Docetism is alluded to in the Johonnine epistolary corpus...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Donatism",
                           @"twitterDef":@"a schismatic Christian group that denied\rthe principle of ex opere operato",
                           @"definition":@"The Donatist schism began in A.D. 311 in North Africa and flourished for about one hundred years. It began when Donatus, a bishop in the church of Carthage, was elected as a reaction against the election of Caecilian to the episcopacy. The latter had been consecrated by a traitor under the Diocletian persecution. In 313, a local council ruled against the rigorism of Donatus.\r\rFurther Reference:\r"}];
    
    [TAWord wordWithDict:@{@"name":@"Doxology",
                           @"twitterDef":@"a praise or blessing of God in prayer",
                           @"definition":@"Doxologies are found throughout the Bible...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dualism",
                           @"twitterDef":@"the belief that humans are composed of two substances, body and soul/mind",
                           @"definition":@"Also known as substance dualism; found in the Platonic influence on Christianity and later in the writings of Descartes. Associated problems include the problem of causation and the seeming violation of the scientific law of the conservation of energy.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Dualism” http://tinyurl.com/85cdhc3",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Dulia",
                           @"twitterDef":@"the Greek word meaning “veneration”;\rusually of the Saints",
                           @"definition":@"In contrast to latria, dulia refers to veneration that is appropriate for the Saints; from the Greek, δυλια.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    //E
    
    [TAWord wordWithDict:@{@"name":@"Easter",
                           @"twitterDef":@"the liturgical celebration of\rthe resurrection of Jesus",
                           @"definition":@"Easter has been celebrated since the earliest days of the Church. It is mentioned in the book of Acts..\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Eastern Catholic Churches",
                           @"twitterDef":@"Byzantine rite churches in full communion\rwith the Church of Rome",
                           @"definition":@"Eastern Catholic Churches were brought into full communion....\r\rFurther Reference:\r",
                           @"category":@"Historical"}];

    
    [TAWord wordWithDict:@{@"name":@"Ebionites",
                           @"twitterDef":@"a heretical group of 1st century Christians\rwho denied the divinity of Christ",
                           @"definition":@"The Ebionites are mentioned by Eusebius...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecclesia",
                           @"twitterDef":@"the Greek word meaning\r“those who have been called-out”; the Church",
                           @"definition":@"The word ecclesia was originally a term used to desribe the legislature of the Athenian City-State; from the Greek called-out assembly.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Economic Justice",
                           @"twitterDef":@"the right relationship between human beings to a given economic system",
                           @"definition":@"Economic justice is based on the idea that the economy of any society should serve people, not vice versa.\r\rFurther Reference:\rUSCCB, “Economic Justice”\rhttp://tinyurl.com/l7a4kwo",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Elevation",
                           @"twitterDef":@"the raising up of the consecrated bread and wine\at the end of the Eucharistic prayer",
                           @"definition":@"The Elevation can be traced back to....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Emmanuel",
                           @"twitterDef":@"a Hebrew word meaning “God is with us”\rapplied to Jesus in the Gospel of Matthew",
                           @"definition":@"This word is used as a name for the child (likely Hezekiah) born as a sign to King Ahaz in Isaiah 7:14 that the northern alliance between Assyria and Israel will not defeat Judah. The author of the gospel of Matthew uses it as a prediction of the birth of Jesus.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Enlightenment",
                           @"twitterDef":@"the cultural movement which prioritized reason over religion",
                           @"definition":@"The Enlightenment is generally dated to the late sixteenth and seventeenth centuries in Europe..\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Epiclesis",
                           @"twitterDef":@"the invocation of the Holy Spirit\ron the Eucharistic elements",
                           @"definition":@"The Epiclesis can be dated to the....century...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];

    [TAWord wordWithDict:@{@"name":@"Episcopacy",
                           @"twitterDef":@"the order of bishops",
                           @"definition":@"....;from the Greek    , episkopos, overseer.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Evolution",
                           @"twitterDef":@"a process of biological descent with modification",
                           @"definition":@"The modern theory of evolution is the result of the work of Charles Darwin...Its scientific acceptance was influential on Vatican II as seen in Gaudium et Spes....\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];


    
    [TAWord wordWithDict:@{@"name":@"Ethics",
                           @"twitterDef":@"the study of moral systems",
                           @"definition":@"Ethics - from the Greek word ηθικος (ethikos) “custom” - is the traditional third branch of Philosophy.\r\rFurther Reference:\rWikipedia, “Ethics”\rhttp://tinyurl.com/oqptk",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecclesiology",
                           @"twitterDef":@"the study of the Church",
                           @"definition":@"Ecclesiology is a subset of Systematic Theology. It examines various aspects of the Church (authority, structure, sacraments, worship, etc.). While the pre-Conciliar model of the Church was that of the Communitas Perfecta (perfect community), Vatican II, in the Dogmatic Constitution on the Church “Lumen Gentium”, chose to define the Church as the People of God and as a Mystical Communion. See “Lumen Gentium”.\r\rFurther Reference:\rWikipedia, “Ecclesiology”\rhttp://tinyurl.com/5e4obj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecumenism",
                           @"twitterDef":@"a movement that emphasizes similarities over differences",
                           @"definition":@"A movement which gained popularity in the 20th century that emphasized shared beliefs among various Christian churches over and against differences.\r\rFurther Reference:\rVatican II, “Decree on Ecumenism”\rhttp://tinyurl.com/3xnyh",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Election",
                           @"twitterDef":@"the concept that Israel and the Church were chosen by God to be in a covenant",
                           @"definition":@"Election is a concept that runs throughout both the Old and New Testaments. In the Old Testament, Israel is a nation chosen by YHWH from among other nations to be in covenant relationship. In the New Testament, Christ is referred to as the “Chosen One” and believers in him are referred to as being chosen in him.\r\rFurther Reference:\rCatechism of the Catholic Church, 762, 769 http://tinyurl.com/oy6txqx",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Eschatology",
                           @"twitterDef":@"the belief that evil and injustice will have an end brought about by Divine intervention",
                           @"definition":@"Eschatology - from the Greek εσχατον (eschaton) “last thing” - is a subject examined by Systematic Theology. It examines the Church doctrine on the destiny of the human race.\r\rFurther Reference:\rCatechism of the Catholic Church, 673\rhttp://tinyurl.com/n85jnew.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Essence",
                           @"twitterDef":@"a property that makes an object what it is",
                           @"definition":@"A property that makes an object what it is.\r\rFurther Reference:\rStandford Encyclopedia of Philosophy, “Essential vs. Accidental Properties”\rhttp://tinyurl.com/olc9dv8.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Eucharist",
                           @"twitterDef":@"the sacred meal of bread and wine in which\rChristians celebrate the death and resurrection of Jesus",
                           @"definition":@"The word Eucharist came to be associated with the bread and wine of the Eucharist which early Christians believed to be directly related to the body and blood of Jesus. The belief that Jesus is present in the Eucharist predates to the earliest years of the Church. Paul claims that bread and wine of the Eucharist are a participation in the body and blood of Christ. This belief predates any theory (e.g. transubstantiation) as to how he is present; from the Greek ευχαριστος (eucharistos) “good thanksgiving”. See “Anamnesis”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1322\rhttp://tinyurl.com/q6gyoc7\r\rPost-Synodal Exhortation on the Eucharist, http://tinyurl.com/nt7jj3z",
                           @"category":@"Liturgical"}];

    [TAWord wordWithDict:@{@"name":@"Euthyphro Problem",
                           @"twitterDef":@"a philosophical problem in ethics dealing\rwith the relation of God to the Commandments",
                           @"definition":@"Does God give the Commandments because they are good, or are the Commandments good because God gives them?\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Exclusivism",
                           @"twitterDef":@"the belief that only those who have explicit Christian faith will be saved",
                           @"definition":@"The soteriological belief that only those people who have a made an explicit Christian confession will experience salvation.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Cathedra",
                           @"twitterDef":@"a teaching from the chair of Peter",
                           @"definition":@"When the Pope teaches ex cathedra, his teaching is considered binding.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Nihilo",
                           @"twitterDef":@"“the act of God creating from nothing”",
                           @"definition":@"The phrase Ex Nihilo is used to express the belief that God created the Universe out of nothing.\r\rFurther Reference:\rCatechism of the Catholic Church, 296\rhttp://tinyurl.com/6kvj6.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Opere Operato",
                           @"twitterDef":@"the idea that a Sacrament's efficacy is not related to a celebrant's personal holiness",
                           @"definition":@"a Latin phrase meaning\r“from the work, worked”\r\rFurther Reference:\rCatechism of the Catholic Church, 1128\rhttp://tinyurl.com/cmes38",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Opere Operantis",
                           @"twitterDef":@"the idea that a Sacrament's efficacy is related to the celebrant's personal holiness",
                           @"definition":@"This phrase refers to the emphasis on the subjective character of the celebrant. In the Catholic tradition, it does not affect the validity of the Sacraments. a Latin phrase meaning\rfrom the work of the worker....See Ex Opere Operato.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Excommunication",
                           @"twitterDef":@"the state of being out of visible\rcommunion with the Church",
                           @"definition":@"Excommunication is aluded to as early as the first century in the writings of Paul...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Exorcism",
                           @"twitterDef":@"the expulsion of evil spirits\rby the authority of Jesus Christ",
                           @"definition":@"During his ministry, Jesus is reported to have conducted exorcisms....\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];


    [TAWord wordWithDict:@{@"name":@"Eisegesis",
                           @"twitterDef":@"intepreting a text by importing one's own presuppositions",
                           @"definition":@"Eisegesis is the opposite of exegesis; from the Greek εις (eis) - “into” and αγω (ago) - “to go”.\r\rFurther Reference:\rFelix Just S.J., “Biblical Exegeis”\rhttp://tinyurl.com/k3u6rma",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"El",
                           @"twitterDef":@"the father of all the gods and husband of Asherah in Canaanite mythology",
                           @"definition":@"In the Old Testament, El is referred to throughout the patriarchal sagas. See “Beth-El” in the Old Testament category of Pins in the Map tab.\r\rFurther Reference:\rWikipedia, “El”\rhttp://tinyurl.com/3r98q89",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elohim",
                           @"twitterDef":@"“gods”, “God”, or “angels”",
                           @"definition":@"The plural of “El”, “Elohim” can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.\r\rFurther Reference:\rWikipedia, “Elohim”\rhttp://tinyurl.com/yv38ap",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elohist Source",
                           @"twitterDef":@"The literary “E” Source in the Torah\rthat favors the northern traditions of Israel",
                           @"definition":@"The “E” source uses “Elohim” as primary reference for God; reflects a preference for the northern kingdom of Israel; written ca. 900 BCE; favors Moses over Aaron and southern kingdom as well as northern tribes of Ephraim and Joseph; related to the same school of priests responsible for the Deuteronomic Source.\r\rFurther Reference:\rWikipedia, “Elohist Source”\rhttp://tinyurl.com/2axcpau",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epistle",
                           @"twitterDef":@"a letter or note",
                           @"definition":@"The New Testament contains 21 letters written from apostles or apostolic associates, but mostly from Paul. The Apostolic Fathers contain various epistles as well from Ignatius of Antioch, Polycarp, Barnabas, and Diognetus.\r\rFurther Reference:\rWikipedia, “Epistle”\rhttp://tinyurl.com/6h68vhn",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Eros",
                           @"twitterDef":@"the Greek word meaning\r“physical love”",
                           @"definition":@"Eros is used to refer especially to physical love, or the love that passionately desires to possess; from the Greek, ερος.\r\rFurther Reference:\rWikipedia, “Eros”\rhttp://tinyurl.com/mw6ea3v",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Etiology",
                           @"twitterDef":@"a traditional story that explains a contemporary situation",
                           @"definition":@"The Old Testament contains numerous etiologies\r\rFurther Reference:\rWikipedia, “Etiology“\rhttp://tinyurl.com/yg6hn9",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Evangelist",
                           @"twitterDef":@"a person who spreads good news",
                           @"definition":@"The word Evangelist can be applied to any person who spreads good news. In Theology, it is usually reserved for one of the authors of the four gospels.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exegesis",
                           @"twitterDef":@"the process of determining the meaning of a text in its original context",
                           @"definition":@"Exegesis is a necessary element of hermeneutics. It is an essential component of the Historical-Critical Method; from the Greek εξ (ex) “out” and αγω (ago) “to go”. See “Hermeneutics”, “Historical-Critical Method”\r\rFurther Reference:\rFelix Just S.J., “Biblical Exegeis”\rhttp://tinyurl.com/k3u6rma",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exile",
                           @"twitterDef":@"the banishment of the southern kingdom of Judah to Babylon in 587 B.C.",
                           @"definition":@"The Exile was the most traumatic experience in the life of ancient Israel.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exodus",
                           @"twitterDef":@"the liberation of the Israelite slaves from Egypt through the obedience of Moses",
                           @"definition":@"The Exodus is traditionally dated to ca. 1275 BCE in the reign of Ramases II. It is the foundational event of the Israelite nation; current biblical research supports the idea of a small group of slaves leaving Egypt, having a Divine revelation in Midian, and traveling to Canaan. 2. The second book of the Torah.\r\rFurther Reference:\rRichard Elliot Friedman, “The Exodus Based on the Sources”\rhttp://tinyurl.com/ncovf49",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elementary Experience",
                           @"twitterDef":@"the complex of needs and evidences that humans have for truth, justice, beauty, and goodness",
                           @"definition":@"According to Fr. Luigi Giussani, the complex of needs and evidences that humans have for truth, justice, beauty, and goodness.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Ephraim",
                           @"twitterDef":@"1. one of the two sons of Joseph\r2. a prominent northern tribe",
                           @"definition":@"Ephraim is mentioned as being...\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epiphany",
                           @"twitterDef":@"the liturgical celebration of the\rappearance of Jesus to the world",
                           @"definition":@"Epiphany is celebrated on the   of January in the Western church...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epistemology",
                           @"twitterDef":@"the study of the origin, nature, and limits of human knowledge",
                           @"definition":@"Epistemology is one of the three traditional subjects of Western philosophy.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Epistemology” http://tinyurl.com/pj7qp",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Existentialism",
                           @"twitterDef":@"a philosophical movement centered upon the nature of human existence",
                           @"definition":@"1. Of or relating to existence. 2. A philosophical movement which gained popularity in the late 19th century.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Explanandum",
                           @"twitterDef":@"that which is explained by something else",
                           @"definition":@"In the study of Logic, the explanandum is always explained by something else.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Explanans",
                           @"twitterDef":@"that which explains something else",
                           @"definition":@"In the study of Logic, the explanans always explains something else...\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Environmentalism",
                           @"twitterDef":@"the concern for the environment as a matter of social justice",
                           @"definition":@"The movement, which gained popularity in the 1960s in the United States, that emphasizes concern for the environment as a matter of public policy and social justice.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Eucharistic Adoration",
                           @"twitterDef":@"the act of adoring Christ\rpresent in the Eucharist",
                           @"definition":@"The act of adoring Christ present in the Eucharist.\r\rFurther Reference:\rCatechism of the Catholic Church, 1378\rhttp://tinyurl.com/q6gyoc7",
                           @"category":@"Liturgical"}];
    
    //F
    
    [TAWord wordWithDict:@{@"name":@"Faith",
                           @"twitterDef":@"1. trust or confidence\r2. the content of a religious tradition",
                           @"definition":@"In Catholicism, both uses of faith are very common.\r\rFurther Reference:\rCatechism of the Catholic Church, 1814\rhttp://tinyurl.com/pd2yc32",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Fideism",
                           @"twitterDef":@"the belief that....",
                           @"definition":@"The belief that..\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Fallibilism",
                           @"twitterDef":@"the idea that humans can have inaccurate, yet justified beliefs about the world",
                           @"definition":@"The idea that humans can have inaccurate, yet justified beliefs about the world. \r\rFurther Reference:\rInternet Ecyclopedia of Philosophy,“Fallibilism”\rhttp://tinyurl.com/q6we5fk",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Filioque",
                           @"twitterDef":@"a Western addition to the Nicene Creed meaning\r“and the Son”",
                           @"definition":@"The Filioque phrase became a source of contention between the Eastern and Western churches after ...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Foreknowledge",
                           @"twitterDef":@"the belief that God knows future events",
                           @"definition":@"Foreknowledge features prominently in post-Exilic Hebrew literature and in the New Testament. It reflects a more developed period in Israelite theology of YHWH. Associated philosophical problems include constraints on human freedom and the problem of evil. \r\rFurther Reference:\rCatechism of the Catholic Church, 600\rhttp://tinyurl.com/p3dfabj\r\rStanford Encylopedia of Philosophy, “Foreknowledge and Free Will”\r http://tinyurl.com/g8eze",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Free Will",
                           @"twitterDef":@"the ability to freely make a rational choice",
                           @"definition":@"The ability to choose.\r\rFurther Reference:\rCatechism of the Catholic Church, 1731\rhttp://tinyurl.com/qzj6nl9",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Folio",
                           @"twitterDef":@"a page within a manuscript",
                           @"definition":@"In textual criticism, folios are sometimes all that remains of a larger manuscript.\r\rFurther Reference:\rWikipedia, “Folio”\rhttp://tinyurl.com/37amz3t",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Formal Eqivalence",
                           @"twitterDef":@"a translation philosophy that seeks to render the text word for word",
                           @"definition":@"The 2011 English translation of the Mass is based on formal equivalence, sometimes resulting in odd sentence structure as Latin syntax works differently than that of English.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Form Criticism",
                           @"twitterDef":@"a type of criticism which deciphers and analyzes a text's genre or literary form",
                           @"definition":@"Form Criticism is mentioned as necessary to proper exegesis in Vatican II's Dogmatic Constitution on Divine Revelation, “Dei Verbum”:\r\r“To search out the intention of the sacred writers, attention should be given, among other things, to 'literary forms'. For truth is set forth and expressed differently in texts which are variously historical, prophetic, poetic, or of other forms of discourse.”\r\rForm Criticism is one of the criticisms used by the Historical-Critical Method. See “Exegesis”, “Historical-Critical Method”.\r\rFurther Reference:\rVatican II, “Dei Verbum”, III.12\rhttp://tinyurl.com/3ecxu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Fundamentalism",
                           @"twitterDef":@"a fundamenalist method that exclusively uses a literalist criteron for interpretation",
                           @"definition":@"In addition to describing a particular hermeneutical method, fundamentalism also refers to an anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith. This approach to a sacred text also extends to Judaism, Islam, and other religions. The term can also refer to a strict adherence to a given viewpoint.\r\rFurther Reference:\rWikipedia, “Fundamentalism”\rhttp://tinyurl.com/2xvbkc",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Fundamental Option",
                           @"twitterDef":@"a person's basic, spiritual orientation",
                           @"definition":@"Karl Rahner was the first to develop this concept.\r\rFurther Reference:\rCatechism of the Catholic Church, 847\rhttp://tinyurl.com/oupb5"}];
    
    [TAWord wordWithDict:@{@"name":@"Feminism",
                           @"twitterDef":@"the movement that seeks female liberation from patriarchal structures and norms",
                           @"definition":@"Feminism was widely influential in the twentieth century.\r\rFurther Reference:\rWikipedia, Feminism\rhttp://tinyurl.com/mdu3o",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Fraction",
                           @"twitterDef":@"the breaking of consecrated bread\rfor the distrubution of Holy Communion",
                           @"definition":@"The Fraction symbolizes Christ's body given up for the salvation of the world.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Forgiveness of Sins",
                           @"twitterDef":@"to leave behind a broken relationship",
                           @"definition":@"Forgiveness has many nuances...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Form",
                           @"twitterDef":@"the words and matter used in a Sacrament",
                           @"definition":@"The form of the Sacraments is .....\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Fransiscan",
                           @"twitterDef":@"a member of the order of\rSt. Francis of Assisi",
                           @"definition":@"The order of Franciscans was formally recognized by Pope....\r\rFurther Reference:\r",
                           @"category":@"Historical"}];

    
    //G
    
    [TAWord wordWithDict:@{@"name":@"Grace",
                           @"twitterDef":@"unmerited favor",
                           @"definition":@"unmerited favor.\r\rFurther Reference:\rCatechism of the Catholic Church, 1996\rhttp://tinyurl.com/yaua7cc",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Great Schism",
                           @"twitterDef":@"the schism between the\rEastern and Western churches in A.D. 1056",
                           @"definition":@"The Great Schism was the result of ....\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gehenna",
                           @"twitterDef":@"a valley near Jerusalem in which devotees would sacrifice children in fire",
                           @"definition":@"A valley near Jerusalem (the Valley of Hinnom) where a non-Israelite shrine to the Canaanite god Moloch once stood and where human sacrifice of babies by burning took place. It seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed); used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1034\rhttp://tinyurl.com/l9ha57h\r\rWikipedia, Gehenna\rhttp://tinyurl.com/ymbj2d",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Genre",
                           @"twitterDef":@"the literary form of a text",
                           @"definition":@"A French word referring to the literary form of a text.\r\rFurther Reference:\rWikipedia, Genre http://tinyurl.com/gsh83",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gnosticism",
                           @"twitterDef":@"a heretical Christian sect that\rtaught salvation through esoteric knowledge",
                           @"definition":@"Gnosticism flourished in the second and third centuries...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gospel",
                           @"twitterDef":@"the message of and about Jesus of Narareth\rconcerning God, Israel, and the world",
                           @"definition":@"1. The message of the historical Jesus concerning the Kingdom of God; 2. The message about Jesus concerning the salvation of the world; 3. One of the four canonical accounts of the life and ministry of the historical Jesus (Matthew, Mark, Luke, and John); from the Greek word ευαγγελιον (evangelion) - “good news”.\r\rFurther Reference:\rCatechism of the Catholic Church, 75\rhttp://tinyurl.com/bx8mnlu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gloria Patri",
                           @"twitterDef":@"a doxology to the Trinity",
                           @"definition":@"Glory to the Father, and to the Son, and to the Holy Spirit.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Glossolalia",
                           @"twitterDef":@"the act of speaking in new languages",
                           @"definition":@"According to Paul in 1 Corinthians, glossolalia was a spiritual gift manifested in liturgical worship...\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"God of the Gaps",
                           @"twitterDef":@"the belief that any scientific unknowns\rare necessarily evidence of God's influence ",
                           @"definition":@"This phrase is used to describe the beliefs of those who misunderstand the different domains, methods, and explanations of Theology and Science.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Good Friday",
                           @"twitterDef":@"the liturigcal memorial of\rthe crucifixion of Jesus",
                           @"definition":@"Good Friday is part of the Triduum.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Great Litany",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Greek Orthodox",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gregorian Chant",
                           @"twitterDef":@"plainsong liturgical chant associated\rwith Pope Gregory I",
                           @"definition":@"Gregorian Chant is characterized by a simply rhythm...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Guardian Angel",
                           @"twitterDef":@"an angel that looks after a given person",
                           @"definition":@"Guardian angels are alluded to by Jesus himself in....\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    ///////////////////H
    
    [TAWord wordWithDict:@{@"name":@"Habit",
                           @"twitterDef":@"the liturigcal memorial of\rthe crucifixion of Jesus",
                           @"definition":@"Good Friday is part of the Triduum.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hail Mary",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hebrew",
                           @"twitterDef":@"the Semitic language of ancient Israel",
                           @"definition":@"Good Friday is part of the Triduum.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Heart",
                           @"twitterDef":@"the biblical word for\relementary experience",
                           @"definition":@"Good Friday is part of the Triduum.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hallelujah",
                           @"twitterDef":@"a Hebrew word meaning\r“Praise YHWH”",
                           @"definition":@"Hallelujah occurs frequently throughout the Old Testament, especially in the Psalms.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Heaven",
                           @"twitterDef":@"the state of complete union with God",
                           @"definition":@"Heaven is the state of those who enter eternal life in God's grace and friendship.\r\rFurther Reference:\rCatechism of the Catholic Church, 1021\rhttp://tinyurl.com/k3f2f8p",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hell",
                           @"twitterDef":@"the state of complete separation from God",
                           @"definition":@"Hell is the state of those who willingly refuse God's love and enter eternal life with the inablity to repent.\r\rFurther Reference:\rCatechism of the Catholic Church, 1033\rhttp://tinyurl.com/k3f2f8p",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Henotheism",
                           @"twitterDef":@"the belief that many gods exist while only one is served",
                           @"definition":@"The pre-exilic Israelites believed that foreign gods were real, but they only had a covenant with YHWH.\r\rFurther Reference:\rWikipedia, “Henotheism”\rhttp://tinyurl.com/chgvyn",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Heresy",
                           @"twitterDef":@"the formal denial of revealed truth",
                           @"definition":@"The formal contradiction of orthodox belief.\r\rFurther Reference:\rCatechism of the Catholic Church, 2089\rhttp://tinyurl.com/lu75a9k",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hesychasm",
                           @"twitterDef":@"a silent form of prayer\rassociated with Eastern Orthodox monks",
                           @"definition":@"This form of prayer....\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Theology",
                           @"twitterDef":@"the study of theology in light of historical periods, events, people, or trends",
                           @"definition":@"Historical Theology has become a sub-discipline of Theology since..\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hinduism",
                           @"twitterDef":@"the dominant polytheistic religion of\that holds Brahman as the Divine Absolute",
                           @"definition":@"Hinduism...\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Jesus",
                           @"twitterDef":@"the historical figure of Jesus\ras reconstructed by historical methodology",
                           @"definition":@"The historical Jesus is a term that emphasizes what can be known about Jesus of Nazareth from historical methodology apart from theological belief.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hierarchy of Truths",
                           @"twitterDef":@"the idea that some truths are more essential to salvation than others",
                           @"definition":@"The idea that some truths are more essential to salvation than others.\r\rFurther Reference:\rCatechism of the Catholic Church, 873\rhttp://tinyurl.com/m65ttaf",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Human Rights",
                           @"twitterDef":@"the rights due to a person by virtue of his or her being a human being",
                           @"definition":@"A list of thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 152 http://tinyurl.com/qfo6bd7",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Hermeneutics",
                           @"twitterDef":@"the science of interpretation",
                           @"definition":@"The science of interpretation and process of determining meaning, usually of a text - from the name of the Greek god “Hermes”, the messenger of the gods.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hermeneutical Circle",
                           @"twitterDef":@"the dialectic relationship between\rtext and interpreter",
                           @"definition":@"The hermeneutical circle begins with an interpreter and a text involved in a process of question, discovery, interpretation, which then challenges or changes the initial question.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hesed",
                           @"twitterDef":@"a Hebrew word meaning\r“loving kindness” or “covenant faithfulness”",
                           @"definition":@"Hesed occurs predominantly in the Psalms, where it is used to refer to YHWH's covenant faithfulness; from the Hebrew word   .\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Books",
                           @"twitterDef":@"the second of four divisions within the Old Testament",
                           @"definition":@"The second of four divisions within the Old Testament; contains 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, Nehemiah, Tobit, Judith, Esther, 1 & 2 Maccabees.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical-Critical Method",
                           @"twitterDef":@"the hermeneutical method which examines the author's intent through exegetical analysis",
                           @"definition":@"The hermeneutical method which seeks to uncover the intention of the author through exegetical analysis of history, language, literature, sources, and culture. According to the Pontifical Biblical Commission, it is the one essential method for Catholic hermeneutics.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, I.A”, http://tinyurl.com/2gb5dm",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Criticism",
                           @"twitterDef":@"the type of criticism which deciphers and analyzes the historical context of a text",
                           @"definition":@"The type of exegetical criticism which deciphers and analyzes the historical context of a text.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, I.A.2”, http://tinyurl.com/2gb5dm",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy",
                           @"twitterDef":@"set apart for Divine service",
                           @"definition":@"One of the four marks of the Church...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy of Holies",
                           @"twitterDef":@"the innermmost chamber in the Temple\rthat housed the Ark of the Covenant",
                           @"definition":@"The innermmost area of the Temple in Jerusalem where the Ark of the Covenant was believed to reside from the monarchy of Solomon until the Exile in 587 BCE.\r\rFurther Reference:\rEncyclopedia Britannica, “Holy of Holies”\rhttp://tinyurl.com/lcagxrw",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Orders",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Saturday",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Holy Spirit",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Water",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Homily",
                           @"twitterDef":@"a sermon based on the Mass readings\rfrom the Lectionary",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Homoiousios",
                           @"twitterDef":@"the Greek word meaning\r“of similar substance”",
                           @"definition":@"This word was used by Arius to describe the relationship of the Son to the Father.\r\rFurther Reference:\rWikipedia, “Homoiousios”\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Historical"}];

    
    [TAWord wordWithDict:@{@"name":@"Homoousios",
                           @"twitterDef":@"the Greek word meaning\r“of the same substance”",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Host",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Human Ecology",
                           @"twitterDef":@"the environmental context of the human person in light of the truths of Creation",
                           @"definition":@"The environmental context of the human person in light of the truths of Creation and the challenges posed by climate change and other developmental factors in which justice is neglected. Pope Francis has made the subject of human ecology a theme of his latest encyclical.\r\rFurther Reference:\rwww.vatican.va/....",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Human Person",
                           @"twitterDef":@"a human being with the capacity\rfor self-transcendence",
                           @"definition":@"According to the teaching of the Church, human beings are also human persons from the moment of conception. Disputed questions include the pheneomenon of twinning and the problems associated with dualism.\r\rFurther Reference:\rCatechism of the Catholic Church, 2270\rhttp://tinyurl.com/dh7r",
                           @"category":@"Systematic"}];
    
    ////////////////////////////////I
    
    [TAWord wordWithDict:@{@"name":@"Icon",
                           @"twitterDef":@"a religious image used for veneration",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];

    
    
    [TAWord wordWithDict:@{@"name":@"Iconoclasm",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Incarnation",
                           @"twitterDef":@"the uniting of the eternal Son of God to a human person; the Word made flesh",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Immaculate Conception",
                           @"twitterDef":@"the dogma that the Virgin Mary was\r conceived without the effects of Original Sin",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, \rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Infallibility",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Intercession",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Invitatory Psalm",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm.",
                           @"definition":@"The first principle in medical ethics; do no harm.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];


    [TAWord wordWithDict:@{@"name":@"Impediment",
                           @"twitterDef":@"a hiderance to a free choice;\reither virtual or actual",
                           @"definition":@"\rVirtual impediments...Actual impediments..\r\rFurther Reference:\rCatholic Moral Theology blog\rhttp://tinyurl.com/pyfcn3n",
                           @"category":@"Moral"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Immanence",
                           @"twitterDef":@"the quality of being within human experience",
                           @"definition":@"The quality of being within human experience.\r\rFurther Reference:\r\rCatechism of the Catholic Church, 239\rhttp://tinyurl.com/4tymjt",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Idolatry",
                           @"twitterDef":@"the bestowal of ultimate value on that which is not ultimate",
                           @"definition":@"The bestowal of ultimate value on that which is not ultimate.\r\rFurther Reference:\rCatechism of the Catholic Church, 2113\rhttp://tinyurl.com/lu75a9k",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Inclusivism",
                           @"twitterDef":@"the belief that those who respond to the truth they have receieved will experience salvation",
                           @"definition":@"Inclusivism is a soteriology developed by Karl Rahner in the mid-twentieth century. He claimed that all people possess a fundamental option for or against God.\r\rFurther Reference:\rCatechism of the Catholic Church, 847\rhttp://tinyurl.com/oupb5",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Inspiration",
                           @"twitterDef":@"that which provides the “breath of life”\ror motivation behind a course of action",
                           @"definition":@"Divine Inspiration is understood to mean that God has provided the “breath of life” or motivation for a course of action - from the Latin word for both “spirit” and “breath”.\r\rFurther Reference:\rVatican II, Dei Verbum, 11\rhttp://tinyurl.com/3ecxu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Interpretation",
                           @"twitterDef":@"the process of determining the meaning,\rsignificance, and relevance of a text",
                           @"definition":@"The explanation of the meaning, significance, and relevance of a text.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/2gb5dm",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Israel",
                           @"twitterDef":@"the name given to Jacob meaning\r“struggles with God”",
                           @"definition":@"According to the stories in Genesis, Jacob was the son of Isaac and father of twelve sons whose decendants became the twelve tribes of Israel.\r\rFurther Reference:\rCatechism of the Catholic Church, 62\rhttp://tinyurl.com/pesbbq3",
                           @"category":@"Biblical"}];
    
    //J
    
    [TAWord wordWithDict:@{@"name":@"Jesus of Nazareth",
                           @"twitterDef":@"the first-century Jewish prophet who proclaimed the Kingdom of God",
                           @"definition":@"The first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.\r\rFurther Reference:\rCatechism of the Catholic Church, 423\rhttp://tinyurl.com/m2a65kl",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Justification",
                           @"twitterDef":@"the act of being put into a just relationship",
                           @"definition":@"Paul uses this word to describe those who believe in Jesus as the Christ.\r\rFurther Reference:\rCatechism of the Catholic Church, 1990\rhttp://tinyurl.com/yaua7cc",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Justice",
                           @"twitterDef":@"the state of right relationships between individuals and groups in society",
                           @"definition":@"the state of right relationships between individuals and groups in society.\r\rFurther Reference:\rCatechism of the Catholic Church, 1807\rhttp://tinyurl.com/pd2yc32",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Jus Ad Bellum",
                           @"twitterDef":@"a set of criteria used to determine if war is justified in a given situation",
                           @"definition":@"Latin for “justice to war” - a set of criteria used to determine if war is justified in a given situation: just cause, comparative justice, competent authority, right intention, probability of success, last resort, proportionality. See “Just War Theory”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “War” http://tinyurl.com/84c2ppg",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Jus Im Bello",
                           @"twitterDef":@"a set of criteria used to determine if the methods of war are justified",
                           @"definition":@"Latin for “justice in war” - a set of criteria used to determine if the methods of war are justified: distinction, proportionality, military necessity; see “Just War Theory”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “War” http://tinyurl.com/84c2ppg",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Just War Theory",
                           @"twitterDef":@"the set of criteria for determining the justice of both the conditions and methods of war",
                           @"definition":@"The theory first developed by Augustine and later refined by Aquinas which consists of criteria for determining the justice of both the conditions and methods of war; see “Jus Ad Bellum” and “Jus Im Bello”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2309\rhttp://tinyurl.com/dh7r\r\rStanford Encyclopedia of Philosophy, “War” http://tinyurl.com/84c2ppg",
                           @"category":@"Moral"}];
    
    /*
     Word *jerusalem = 
     jerusalem.@"name":@"Jerusalem";
     jerusalem.@"twitterDef":@"The capital of the united monarchy established under David";
     jerusalem.@"definition":@"The capital of the united monarchy established under David; the captial of the southern kingdom of Judah after the death of Solomon; the location of Mount Zion and the Temple.";
     jerusalem.@"category":@"Biblical"}];
     */
    
    [TAWord wordWithDict:@{@"name":@"Jew",
                           @"twitterDef":@"a member of the tribe of Judah used to refer to any Israelite after the return from the Exile in 515 B.C.",
                           @"definition":@"a member of the tribe of Judah used to refer to any Israelite after the return from the Exile in 515 B.C.\r\rFurther Reference:\rWikipedia, “Jew”\rhttp://tinyurl.com/dh7r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Jubilee",
                           @"twitterDef":@"the Old Testament practice of\rforgiving debts",
                           @"definition":@"The biblical description of Jubilee is found in.....\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Judah",
                           @"twitterDef":@"1. the fourth son and tribe of Israel\r2. the southern Israelite kingdom",
                           @"definition":@"The tribe of Judah enjoyed a priviledged status during the monarchy.\r\rFurther Reference:\rWikipedia, “Judah”\rhttp://tinyurl.com/k7mdc7y",
                           @"category":@"Biblical"}];
    
    //K
    
    [TAWord wordWithDict:@{@"name":@"Kataphatic",
                           @"twitterDef":@"language which makes postiive claims about God",
                           @"definition":@"language which makes postiive claims about God.\r\rFurther Reference:\rWikipedia, “Kataphatic”\rhttp://tinyurl.com/lghxwjd",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Kenosis",
                           @"twitterDef":@"the process of emptying",
                           @"definition":@"A form of the word “kenosis” is used by Paul in his letter to the Philippians to describe the self-emptying of Jesus.\r\rFurther Reference:\rWikipedia, “Kenosis”\rhttp://tinyurl.com/64v89e",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ketuv'im",
                           @"twitterDef":@"the Hebrew word meaning\r“writings”",
                           @"definition":@"The Ketuv'im is the third of three sections in the Tanak; from the Hebrew, כְּתוּבִים. See “Tanak”.\r\rFurther Reference:\rWikipedia, “Ketuv'im”\rhttp://tinyurl.com/6os5ny",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kosher",
                           @"twitterDef":@"foods that are appropriate to eat or sacrifice to YHWH",
                           @"definition":@"often translated as “clean”, this refers to foods that are appropriate to eat or sacrifice to YHWH according to the Torah.\r\rFurther Reference:\rWikipedia, “Kosher Foods”\rhttp://tinyurl.com/druwv",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kerygma",
                           @"twitterDef":@"the Apostolic proclamation of the Gospel",
                           @"definition":@"The New Testament uses this word to describe the Apostolic proclamation of the the Gospel.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Koinonia",
                           @"twitterDef":@"communion or participation",
                           @"definition":@"The New Testament uses this word to describe the spiritual unity that exists between Christians and Christ...\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kyrie Eleison",
                           @"twitterDef":@"a liturgical phrase meaning\r“Lord, have mercy.”",
                           @"definition":@"The Kyrie Eleison is used during the \r\rFurther Reference:\r",
                           @"category":@"Biblical"}];

    
    //L
    
    [TAWord wordWithDict:@{@"name":@"Last Rites",
                           @"twitterDef":@"the final Sacraments administered\rto a person near death",
                           @"definition":@"Last Rites are mentioned as early as....\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Last Supper",
                           @"twitterDef":@"the final meal of Jesus with his\r disciples before his crucifixion",
                           @"definition":@"All four Gospels portray Jesus sharing a last meal with his disciples. However, the Synoptics claim that it was a Passover seder meal, while the Gospel of John claims it was a regular meal before the beginning of Passover.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Laity",
                           @"twitterDef":@"non-ordained members of the Church",
                           @"definition":@"The New Testament uses this word to describe the Apostolic proclamation of the the Gospel.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Latria",
                           @"twitterDef":@"worship of God",
                           @"definition":@"In contrast to dulia, latria refers to worship of God alone. See Dulia.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Law of Moses",
                           @"twitterDef":@"the first five books of the Pentateuch",
                           @"definition":@"The phrase “Law of Moses” is referred to in many places in the Hebrew Bible as a single scroll. Deuteronomy in particular presents itself as the “Law/Teaching of Moses“. The single word “Law” (Torah) is used as a shorthand for the entire Torah in the New Testament. The Law contains various commandments and regulations regarding morality and community life for the Israelites; from the Hebrew, תֹּורַת מֹשֶׁה (torat moshe) “Law of Moses”. See “Torah”, “Pentateuch”.\r\rFurther Reference:\rWikipedia, “Law of Moses”\rhttp://tinyurl.com/cgyff",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lector",
                           @"twitterDef":@"a member of the laity who leads\rthe congretation in reading or prayers",
                           @"definition":@"The New Testament uses this word to describe the Apostolic proclamation of the the Gospel.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lecturn",
                           @"twitterDef":@"see Ambo",
                           @"definition":@"\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lectio Divina",
                           @"twitterDef":@"the prayerful reading of Sacred Scripture",
                           @"definition":@"The New Testament uses this word to describe the Apostolic proclamation of the the Gospel.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lectionary",
                           @"twitterDef":@"the schedule of biblical passages\rread throughout the liturgical year",
                           @"definition":@"The New Testament uses this word to describe the Apostolic proclamation of the the Gospel.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lent",
                           @"twitterDef":@"the 40 day period of repentance\before the celebration of Easter”",
                           @"definition":@"The New Testament uses this word to describe the Apostolic proclamation of the the Gospel.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Levite",
                           @"twitterDef":@"a member of the Israelite tribe of Levi",
                           @"definition":@"According to the Elohist source, the Levites were all designated as priests of YHWH after rallying with Moses in Exodus 32.\r\rFurther Reference:\r\rWikipedia, “Levite”\rhttp://tinyurl.com/2boql2c",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lex Orandi, Lex Credendi",
                           @"twitterDef":@"a Latin phrase meaning\r“law of prayer is the law of belief”",
                           @"definition":@"The New Testament uses this word to describe the Apostolic proclamation of the the Gospel.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Litany",
                           @"twitterDef":@"an intercessory prayer led by a lector",
                           @"definition":@"The Great Litany of the Easter Vigil includes...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Literary Criticism",
                           @"twitterDef":@"the type of criticism that deciphers and analyzes the literary characteristics of a text",
                           @"definition":@"the type of exegetical criticism that deciphers and analyzes the literary characteristics of a text, including form, setting, plot, characterization, denouement, theme, and climax.\r\rFurther Reference:\rWikipedia, “Literary Criticism”\rhttp://tinyurl.com/kw5x5",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"LXX",
                           @"twitterDef":@"the numerical symbol for the Septuagint",
                           @"definition":@"The LXX is named for the supposed 70 translators of the Tanak into Greek at the request of Alexander the Great.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Liberation Theology",
                           @"definition":@"the theological movement associated with the idea that the gospel is only authentic in the face of radical poverty.\r\rFurther Reference:\rCongregation For The Doctrine Of The Faith, “Instruction On Certain Aspects Of The Theology Of Liberation”\rhttp://tinyurl.com/27d23",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Liturgy",
                           @"twitterDef":@"the public worship of the Church",
                           @"definition":@"The Liturgy of the Church....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Eucharist",
                           @"twitterDef":@"the portion of the Mass that celebrates the Eucharist",
                           @"definition":@"The Liturgy of the Eucharist...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Word",
                           @"twitterDef":@"the portion of the Mass that proclaims the Scriputres...",
                           @"definition":@"The Liturgy of the Word....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Hours",
                           @"twitterDef":@"the cycle of daily prayer offered by the Church\rthroughout the liturgical year",
                           @"definition":@"The Liturgy of the Hours is an ancient practice that dates back to the earliest days of the Church, which inhereited from Judaism the custom of praying at set times during the day. The Divine Office is the public prayer of the Church, which is offered continuously by both clergy and laity; also called “The Divine Office”.\r\rCatechism of the Catholic Church, 1174\rhttp://tinyurl.com/p9382z5",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Law of Non-Contradiction",
                           @"twitterDef":@"A and ~A cannot both be true at the same time in the same way",
                           @"definition":@"This principle is first found in the writings of Aristotle, in his fourth book on Metaphysics. There he claims that without this principle, no learning could be possible.\r\rStanford Encyclopedia of Philosophy, “Aristotle on Non-Contradiction”\rhttp://tinyurl.com/yvzfdk",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Living Wage",
                           @"twitterDef":@"A form of income that is enables a worker to support his or her family",
                           @"definition":@"The concept of a living wage in modern Catholic Social Teaching dates back to 1891 with Leo XII's encyclical, Rerum Novarum. More recently, Benedict XVI addressed the issue again in his encyclical Caritas En Veritate.\r\rFurther Reference:\rLeo XIII, Rerum Novarum, 45\rhttp://tinyurl.com/lv5y76v\r\rBenedict XVI, “Caritas En Veritate”, 63\rhttp://tinyurl.com/lpqbs8v",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Logic",
                           @"twitterDef":@"the science of reasoning",
                           @"definition":@"The principles of logic are a necessary component of rationality itelf. They are so fundamental to human reasoning that, in order to deny them, one must make use of them.\r\rFurther Reference:\rUniversity of Oxford, “The Logic Web”\rhttp://tinyurl.com/y8lr2lh.\r\rWikipedia, “Logic”\rhttp://tinyurl.com/q2uqv3x",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Logos",
                           @"twitterDef":@"the Greek word meaning\rreason or word",
                           @"definition":@"This term dates back the pre-Socratic Greek philosopher Heraclitus. It is used the Gospel of John to refer to the eternal Son of the Father who became incarnate in Jesus of Nazareth.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"LORD",
                           @"twitterDef":@"a symbolic transliteration of\rthe Divine Name, יהוה‎",
                           @"definition":@"Most contemporary English bibles render the Divine Name as the LORD....\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lord's Prayer",
                           @"twitterDef":@"the exemplary prayer that Jesus taught his disciples",
                           @"definition":@"The Lord's Prayer occurs in only two places in Scripture, Matthew 6: and Luke 6:....\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lord's Supper",
                           @"twitterDef":@"see Last Supper",
                           @"definition":@"\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    //M
    
    [TAWord wordWithDict:@{@"name":@"Magnificat",
                           @"twitterDef":@"the prayer of the Virgin Mary\rin Luke 2:...",
                           @"definition":@"The Magnificat is a part of Morning Prayer in the Liturgy of the Hours...\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Manicheism",
                           @"twitterDef":@"a heresy taught by Manes that\rmatter is evil and the spirit is the only good",
                           @"definition":@"the belief in only one God.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Maranatha",
                           @"twitterDef":@"an Aramaic word meaning\rOur Lord, come.",
                           @"definition":@"This word is referenced by Paul in 1 Corinthians 16:22 as a common expression used by early Christians...\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Marcionism",
                           @"twitterDef":@"a heresy taught by Marcion that\rrejects Israelite scritpures and theology",
                           @"definition":@"Marcionism led to the creation of the first canon of Scripture during the time of Irenaeus...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Marriage",
                           @"twitterDef":@"the Sacrament in which a\rman and woman become one flesh",
                           @"definition":@"Marriage as human institution has evolved  from to...and faces new questions as ....\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Martyr",
                           @"twitterDef":@"a witness to the faith\rto the point of death",
                           @"definition":@"Martyrs...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Mass",
                           @"twitterDef":@"the liturgy of the weekly Christian gathering",
                           @"definition":@"the belief in only one God.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Matins",
                           @"twitterDef":@"the traditional term for morning prayer",
                           @"definition":@"See Morning Prayer.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Maundy Thursday",
                           @"twitterDef":@"the celebration of the institution\rof the Lord's Supper",
                           @"definition":@"This term derives from the Latin mandatum, and John 13:34, in which Jesus says: a new commmandment I give you; that you love one another as I have loved you.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Memorial Acclamation",
                           @"twitterDef":@"the acclamation of the congregation\rafter the Words of Institution",
                           @"definition":@"...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Miracle",
                           @"twitterDef":@"a supernatural event which defies scientific explanation",
                           @"definition":@"In common parlance, miracles are events which violate the laws of nature.\r\rFurther Reference:\rInterdisciplinary Encyclopedia of Religion and Science, “Miracle”\rhttp://tinyurl.com/mmev2qy",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Monotheism",
                           @"twitterDef":@"the belief in only one God",
                           @"definition":@"the belief in only one God.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Morality",
                           @"twitterDef":@"customary norms of behavior considered good or evil",
                           @"definition":@"customary norms of behavior considered good or evil, right or wrong in a given system.\r\rFurther Reference:\rCatechism of the Catholic Church, 1749-1756\rhttp://tinyurl.com/lxslc7r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Mystery",
                           @"twitterDef":@"that which transcends human comprehension and explanation",
                           @"definition":@"that which transcends human comprehension and explanation.\r\rFurther Reference:\rNew Advent, “Mystery”\rhttp://tinyurl.com/35fsmo",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Manuscript",
                           @"twitterDef":@"a hand-written copy of a text",
                           @"definition":@"No original writings of the Bible survive. Throughout history, scribes have made copies of the originals, which themselves were the basis for further copies, and so on. The earliest manuscript of the complete New Testament that exists is Codex Sinaiticus....\r\rFurther Reference:\rWikipedia, “Manuscript”\rhttp://tinyurl.com/jwb5dhp",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Messiah",
                           @"twitterDef":@"the Hebrew equivalent title to “Christ”",
                           @"definition":@"Christ was used by the early Christians to refer to the divinely designated status of Jesus of Nazareth - from the Hebrew for “annointed one”.\r\rFurther Reference:\rCatechism of the Catholic Church, 436\rhttp://tinyurl.com/neqlbg7",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ministry",
                           @"twitterDef":@"service in the name of Christ",
                           @"definition":@"Ministry derives from the Latin, ...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Mishnah",
                           @"twitterDef":@"the written redaction of the\roral commentary on the Torah",
                           @"definition":@"an oral commentary on the Torah.\r\rFurther Reference:\rWikipedia, “Mishnah”\rhttp://tinyurl.com/zdndh",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Missal",
                           @"twitterDef":@"a book used to celebrate the Eucharist",
                           @"definition":@"The 2011 new translation of the Mass was based on the Missal used in Rome.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Missionary",
                           @"twitterDef":@"one sent on a mission\rto proclaim the Gospel",
                           @"definition":@"Missionaries date back to the earliest age of the Church.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Mitre",
                           @"twitterDef":@"a liturgical hat worn by bishops",
                           @"definition":@"Mitres appear as early as....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Modernism",
                           @"twitterDef":@"the 19th century movement that embraced\r modern advances in science, history, and philosophy",
                           @"definition":@"Modernism was initially condemned by Pope Leo XIII, but its affects reached into the twentieth century at Vatican II.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Monarchianism",
                           @"twitterDef":@"the belief that God is merely\rmanifested in three different forms",
                           @"definition":@"Monarchianism was popular during hte second and third centuries. It denied that the Father, Son, and Holy Spirit were three distinct persons. Instead,...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monastic",
                           @"twitterDef":@"relating to a life of religious vows\rlived in community",
                           @"definition":@"Monastics tace their origin to the third century with Abba Anthony of Egypt...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Monophysitism",
                           @"twitterDef":@"the teaching that Christ had a single, divine\rnature which absorbed his human nature",
                           @"definition":@"Monophysitism can be traced back to... \r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monothelitism",
                           @"twitterDef":@"the teaching that Christ had a single, divine\rwill which absorbed his human will",
                           @"definition":@"Monothelitism flourished in the seventh century....\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Myth",
                           @"twitterDef":@"a story that cannot be historically verified",
                           @"definition":@"a story that cannot be historically verified.\r\rFurther Reference:\rWikipedia, Creation Myth\rhttp://tinyurl.com/33adt4",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monstrance",
                           @"twitterDef":@"a frame for displaying the consecrated\rbread of the Eucharist for adoration",
                           @"definition":@"Monstrances were used as early as the ...and are still used today.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Montanism",
                           @"twitterDef":@"a second-century charismatic heretical\r group based on the teachings of Montanus",
                           @"definition":@"Montanus taught that the Holy Spirit, promised by Jesus, had incarnated himself in Montanus, who demanded his followers adopt a strict lifestyle...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Moral Theology",
                           @"twitterDef":@"the theology of moral norms and their application to human experience",
                           @"definition":@"Moral theology has developed into a definite sub-discipline of Theology...\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Morning Prayer",
                           @"twitterDef":@"the first hour of the\rLiturgy of the Hours",
                           @"definition":@"...also called Matins...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Metaphysics",
                           @"twitterDef":@"the study of the fundamental\rnature of reality",
                           @"definition":@"Metaphysics is a highly contested area of inquiry that has including a variation of topics throughout history since the time of Aristotle. More generally, it is teh study of being as such. Theology is a metaphysical discipline insofar as theology makes claims about the fundamental nature of reality, which, in the Catholic Tradition, is known as God.\r\rFurther Reference:\rRoutledge Encyclopedia of Philosophy, “Metaphysics”\rhttp://tinyurl.com/mydu3hx",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Muratorian Canon",
                           @"twitterDef":@"the earliest extant canonical\rindex of Scritpures",
                           @"definition":@"the belief in only one God.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Mystagogy",
                           @"twitterDef":@"the catechetical intiation into\rthe sacramental mysteries",
                           @"definition":@"Mystagogy is emphasized by apostolate groups such as the Neo-Catechumenical Way...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    //N
    
    [TAWord wordWithDict:@{@"name":@"Natural Law",
                           @"twitterDef":@"the universal moral norm, accessible by human reason",
                           @"definition":@"The concept of natural law dates back to the early Greek philosophers. It is alluded to in Paul's epistle to the Romans 1:21.\r\rFurther Reference:\rCatechism of the Catholic Church, 1954\rhttp://tinyurl.com/yla3tgm",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Natural Theology",
                           @"twitterDef":@"the study of God by inference from the facts of the physical world",
                           @"definition":@"Natural Theology is the attempt to examine the concept of God from the natural world, apart from any special revelation.\r\rFurther Reference:\rInternet Encyclopedia of Philosophy, “Natural Law”\rhttp://tinyurl.com/7ckb5tz",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Nevi'im",
                           @"twitterDef":@"the Hebrew word meaning\r“prophets”",
                           @"definition":@"The Nevi'im is the second of the three sections of the Tanak; from the Hebrew, נְבִיאִים. See “Tanak”.\r\rFurther Reference:\rWikipedia, “Nevi'im”\rhttp://tinyurl.com/qyks6kh",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"New Testament",
                           @"twitterDef":@"the 27 books dealing with the life of Jesus of Nazareth and his followers",
                           @"definition":@"The New Testament contains the 4 gospels, the Acts of the Apostles, numerous epistles, and the Apocalypse. See “Gospel”, “Epistle”, “Apocalypse”.\r\rFurther Reference:\rCatechism of the Catholic Church, 124-127\rhttp://tinyurl.com/kvc3tvq",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Nestorianism",
                           @"twitterDef":@"the heresy that Christ was two persons joined together... ",
                           @"definition":@"the belief in only one God.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"New Covenant",
                           @"twitterDef":@"the Christian covenant based on the life, death, and resurrection of Jesus",
                           @"definition":@"the belief in only one God.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Nicene-Constantiopolitan Creed",
                           @"twitterDef":@"the creed from Constantinople in A.D. 381,\rbased on the Nicene Creed in A.D. 325",
                           @"definition":@"“We believe in one God, the Father, the Almighty, maker of heaven and earth, of all that is, seen and unseen. \r\rWe believe one Lord, Jesus Christ, the only Son of God, eternally begotten of the Father, God from God, Light from Light, true God from true God, begotten, not made, one in Being with the Father. Through Him all things were made. For us men and for our salvation, He came down from heaven: by the power of the Holy Spirit He was born of the Virgin Mary, and became Man. For our sake He was crucified under Pontius Pilate. He suffered, died, and was buried. On the third day He rose again in fulfillment of the Scriptures; He ascended into heaven, and is seated at the right hand of the Father. He will come again in glory to judge the living and the dead, and His kingdom will have no end. \r\rWe believe in the Holy Spirit, the Lord, the Giver of life, Who proceeds from the Father and the Son. With the Father and the Son He is worshiped and glorified. He has spoken through the prophets.\r\rWe believe in one, holy, catholic, and apostolic Church. We acknowledge one Baptism for the forgiveness of sins. We look for the resurrection of the dead, and the life of the world to come. Amen.”\r\rSee “Nicea” in the Historical section of the Map tab.\r\rFurther Reference:\rCatechism of the Catholic Church, Sec. II\rhttp://tinyurl.com/2dszf5",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Numinous",
                           @"twitterDef":@"experience of the Holy that includes\rboth terrifying and fascinating aspects",
                           @"definition":@"According to Otto, in his seminal work, “The Idea of the Holy”, religious experience is an encounter with the Holy this is totally Other and numinous. Such experiences are mysteriously terrifying (mysterium tremendum) and mysteriously fascinating (mysterium fascinans).\r\rFurther Reference:\rWikipedia, “Numinous”\rhttp://tinyurl.com/q2nys8u",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Naturalism",
                           @"twitterDef":@"the belief that nature is all that exists and denies a supernatural order",
                           @"definition":@"\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Notes of the Church",
                           @"twitterDef":@"the belief in only one God",
                           @"definition":@"the belief in only one God.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Nunc Dimittis",
                           @"twitterDef":@"the prayer of Simeon\rin Luke 2:29-32",
                           @"definition":@"Luke portrays Simeon as offering this extemporaneous prayer after being led by the Holy Spirit to see the infant Jesus.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    //O
    
    [TAWord wordWithDict:@{@"name":@"Octave",
                           @"twitterDef":@"the celebration of a feast over eight days",
                           @"definition":@"Octaves are common...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Offertory",
                           @"twitterDef":@"the prayer said after the presentation of the Gifts to the celebrant...",
                           @"definition":@"The Roman Missal includes several options for the Offertory...\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnibenevolence",
                           @"twitterDef":@"the quality of being all-loving",
                           @"definition":@"The quality of being all-loving.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnipotence",
                           @"twitterDef":@"the quality of being all-powerful",
                           @"definition":@"The quality of being all-powerful.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnipresence",
                           @"twitterDef":@"the quality of being all-present",
                           @"definition":@"The quality of being all-present.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omniscience",
                           @"twitterDef":@"the quality of being all-knowing",
                           @"definition":@"The quality of being all-knowing.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ontological Argument",
                           @"twitterDef":@"the argument that states God, as the greatest possible Being, is a necessary Being",
                           @"definition":@"The argument, first formulated by Anselm of Canterburry, that states God, as the greatest possible Being, is a necessary Being.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ontology",
                           @"twitterDef":@"the study of Being",
                           @"definition":@"Ontology is closely related to Metaphysics...\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Open Theism",
                           @"twitterDef":@"a theological movement characterized by the belief that there are logical limits on God's power and knowledge",
                           @"definition":@"a theological movement characterized by the belief that there are logical limits on God's power and knowledge.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ordinary",
                           @"twitterDef":@"the regular diocesan bishop",
                           @"definition":@"The Ordinary is used to distinguish the diocesan bishop from an assistant or coadjutor.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ordinary Time",
                           @"twitterDef":@"the liturgical time between\rEaster and Advent.\r\rFurther Reference:\r",
                           @"definition":@"....",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ordination",
                           @"twitterDef":@"the reception of the Sacrament\rof Holy Orders",
                           @"definition":@"Ordination dates from the earliest years of the Church.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Original Sin",
                           @"twitterDef":@"1. the sin of the first humans\r2. the corruptible condition of humanity",
                           @"definition":@"Original Sin, while not named as such, is alluded to by Paul in Romans 5:12...In the traditional teaching of the Church, Original Sin can be understood as both the explanans and explanandum... ",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Orthodox",
                           @"twitterDef":@"straight or correct belief",
                           @"definition":@"A Greek word meaning 'straight belief.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Orthopraxis",
                           @"twitterDef":@"straight or correct practice",
                           @"definition":@"a Greek word meaning 'straight practice.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Old Testament",
                           @"twitterDef":@"the 46 books dealing with the people of Israel",
                           @"definition":@"the 46 books dealing with the people of Israel; contains the Pentateuch, Historical Books, Wisdom Books, and Prophetic Books.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Oracle",
                           @"definition":@"a prophetic medium...",
                           @"twitterDef":@"a prophetic medium.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Oral Tradition",
                           @"twitterDef":@"the transmission of stories and beliefs by word of mouth",
                           @"definition":@"the transmission of stories and beliefs by word of mouth.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    //////////P
    
    [TAWord wordWithDict:@{@"name":@"Pacifism",
                           @"twitterDef":@"the total rejection of violence\rin any form",
                           @"definition":@"Pacifism has its roots in the early Christian intepretation of the words of Jesus in the Sermon on the Mount. ....\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Pantheism",
                           @"twitterDef":@"the belief that everything is God",
                           @"definition":@"Pantheism is popular in ....\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Panentheism",
                           @"twitterDef":@"the belief that everything exists within God",
                           @"definition":@"Panentheism is based on the reference to the Hymn of Cleanthes in the Book of Acts...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Parousia",
                           @"twitterDef":@"a Greek word meaning\rpresence",
                           @"definition":@"Parousia is a term used by Paul to refer to the second coming of Jesus.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Paschal Mystery",
                           @"twitterDef":@"the mystery of salvation\rthrough, with, and in Jesus Christ",
                           @"definition":@"The Paschal Mystery is a phrase that dates to...\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Passion of the Lord",
                           @"twitterDef":@"the salvific suffering of Jesus\rin the hours before his death",
                           @"definition":@"a human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Pastor",
                           @"twitterDef":@"the leader of a local church",
                           @"definition":@"a human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Paten",
                           @"twitterDef":@"a small plate used to hold the Eucharist",
                           @"definition":@"a human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pater Noster",
                           @"twitterDef":@"a Latin phrase meaning\rOur Father",
                           @"definition":@"See Lord's Prayer.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Patripassianism",
                           @"twitterDef":@"the belief that the Father suffered\rin the Son",
                           @"definition":@"Patripassianism was a heresy that was consequent to Modalism.\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Patristics",
                           @"twitterDef":@"the study of the Church Fathers",
                           @"definition":@"Patristics is essential for the study of theology....\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pelagianism",
                           @"twitterDef":@"the heresy of Pelagius\rthat salvation is possible without grace",
                           @"definition":@"a human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Penance",
                           @"twitterDef":@"the act of making restitution\rfor one's sins",
                           @"definition":@"a human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Petrine Ministry",
                           @"twitterDef":@"the ministry of service to the Church\rexercised by the Bishop of Rome",
                           @"definition":@"a human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Palm Sunday",
                           @"twitterDef":@"the Sunday before Easter that commemorates\rthe final entry of Jesus into Jerusalem",
                           @"definition":@"Palm Sunday was celebrated as early as....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Person",
                           @"twitterDef":@"a human being capable of self-transcendence",
                           @"definition":@"a human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Pluralism",
                           @"twitterDef":@"the belief that all religous claims are equally valid",
                           @"definition":@"the belief that all religous claims are equally valid.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Polytheism",
                           @"twitterDef":@"the belief that many gods exist",
                           @"definition":@"the belief that many gods exist.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Predestination",
                           @"twitterDef":@"the belief that God has fixed the destiny of certain nations or peoples",
                           @"definition":@"the belief that God has fixed the destiny of certain individuals.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Principle of Double Effect",
                           @"twitterDef":@"the principle which states...",
                           @"definition":@"the principle which states.\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Process Theology",
                           @"twitterDef":@"the theological school of thought that views the basic structure of the Universe as process instead of substance",
                           @"definition":@"Process theology is named after the thought of Alfred North Whitehead.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Protestant",
                           @"twitterDef":@"the theological objection to the authority of the Pope in the Church; the Protestant Reformation",
                           @"definition":@"the theological objection to the authority of the Pope in the Church; the Protestant Reformation.\r\rFurther Reference:\r",
                           @"category":@"Ecclesial"}];
    
    [TAWord wordWithDict:@{@"name":@"Parable",
                           @"twitterDef":@"a fable-like story that makes a theological claim",
                           @"definition":@"a fable-like story that makes a theological claim; used frequently by Jesus in the synoptic gospels.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Papyrus",
                           @"twitterDef":@"a type of paper in the ancient world used for writing created from a plant",
                           @"definition":@"a type of paper used for writing created from a plant.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Passover",
                           @"twitterDef":@"the feast that commemorates the Exodus of the Israelites from slavery in Egypt",
                           @"definition":@"the feast that commemorates the exodus of the Israelites from slavery in Egypt.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pentateuch",
                           @"twitterDef":@"another term for the first five books of the Old Testament, the Torah",
                           @"definition":@"another term for the first five books of the Old Testament, the Torah - from the Greek for “five scrolls”.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pericope",
                           @"twitterDef":@"a given section of a larger text...",
                           @"definition":@"a given section of a larger text.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pharisees",
                           @"twitterDef":@"a Jewish group of laymen in the first century devoted to Torah-observance",
                           @"definition":@"A Jewish group of laymen in the first century.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Priestly Source",
                           @"twitterDef":@"The Torah literary tradition that is concerned with priestly categories of meaning",
                           @"definition":@"   The Priestly, or “P” tradition in the Torah can be dated to the time of Hezekiah (ca. 700 B.C.) and shows a major concern for order, numbers, and categories of holiness and cleanliness, especially in the book of Leviticus. The Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or “profane”; this source, along with the Elohist and Deuteronomic Sources, does not accept the revelation of the name YHWH before the Mosaic epiphany in Exodus 3. The Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word “compassionate” to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author).\r\rFurther Reference:\rWikipeida, Priestly Source\rhttp://tinyurl.com/yq83pf",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Primeval History",
                           @"twitterDef":@"The mythological stories of Genesis 1 - 11",
                           @"definition":@"Genesis chapters 1 - 11.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Prophet",
                           @"twitterDef":@"one who speaks in the place of God",
                           @"definition":@"This term is used in the Old Testament to refer to either a court prophet (such as Nathan) or an independent prophet (such as Amos).\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Prophetic Books",
                           @"twitterDef":@"the fourth of four sections in the Old Testament",
                           @"definition":@"The fourth of four sections in the Old Testament.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Philosophy",
                           @"twitterDef":@"the critical examination of human thought;\rthe love of wisdom",
                           @"definition":@"the critical examination of human thought; the love of wisdom.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Physicalism",
                           @"twitterDef":@"The belief that phenemena traditionally attributed to the soul can be more simply explained by the functioning of a brain",
                           @"definition":@"Physicalism has received from support from modern neuroscience. Various Christian philosophers, such as Nancy Murphy, are advocates of a non-reductive, physicalist anthropology.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Problem of Evil",
                           @"twitterDef":@"the philosophical problem of belief in God and the experience of evil",
                           @"definition":@"The philosophical problem that results from belief in Divine omniscience, omnipotence, and omnibenevolence and the experience of suffering and evil in the world.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    //Q
    
    [TAWord wordWithDict:@{@"name":@"Q Source",
                           @"twitterDef":@"the hypothetical written source that lies behind similar passages in Matthew and Luke",
                           @"definition":@"The hypothetical written source that lies behind the similar passages, exclusive to Matthew and Luke, which contain various teachings of Jesus; from the German word “quelle' - “source”.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Quintessence",
                           @"twitterDef":@"a term meaning “fifth essence”; used by Aristotle to refer to a substance higher than the four of earth, wind, water, and fire",
                           @"definition":@"A term meaning “fifth essence”; used by Aristotle to refer to a substance higher than the four on earth.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    //R
    
    [TAWord wordWithDict:@{@"name":@"Redaction Criticism",
                           @"definition":@"the type of exegetical criticism that seeks to decipher and analyze the various stages of redaction of a text.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Redemption",
                           @"definition":@"the process of exchanging the economic value of an object.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ressourcement",
                           @"twitterDef":@"a French term meaning “to return to the sources”",
                           @"definition":@"a French term meaning “to return to the sources”; used by some theologians as the preferred interpretation of the purpose of Vatican II...\r\rSee “Aggiornomento”.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Resurrection",
                           @"twitterDef":@"the belief that God will raise the righteous dead to eternal life",
                           @"definition":@"the belief which developed in post-Exilic Judaism, that God would raise the righteous to eternal life; the belief of the early Christians that Jesus of Nazareth was raised from the dead.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Religious Naturalism",
                           @"twitterDef":@"a movement within naturalism that emphasizes scientific knowledge as a foundational mythos",
                           @"definition":@"A movement within naturalism which emphasizes the scientific history of the universe as a core mythos around which revolve interpretive, spiritual, and moral axes.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Rerum Novarum",
                           @"twitterDef":@"the encyclical of Pope Leo XIII that laid the foundations of modern Catholic Social Teaching",
                           @"definition":@"The encyclical of Pope Leo XIII in 1891 which responded to the after effects of the Industrial Revolution in Europe by teaching that private property is relative to the Common Good and that workers have a right to unionized and to a living wage.\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    //S
    
    [TAWord wordWithDict:@{@"name":@"Salvation",
                           @"twitterDef":@"the experience of being saved from sin and eventually death",
                           @"definition":@"The experience of being saved from sin and eventually death.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Selucid",
                           @"twitterDef":@"the descendants of Alexander the Great that ruled in Syria",
                           @"definition":@"the descendants of Alexander the Great.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Social Justice",
                           @"twitterDef":@"the type of justice which prioritizes the common good with a preferential option for the poor and marginalized",
                           @"definition":@"According to Pope Paul VI, social justice is an essential aspect to the proclamation of the gospel.\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Soteriology",
                           @"twitterDef":@"the study of salvation; a particular framework of salvation",
                           @"definition":@"the study of salvation; a particular framework of salvation.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Sadducees",
                           @"twitterDef":@"the elite class of Jerusalem-based Temple scribes that mediated with the Roman occupation",
                           @"definition":@"the elite class of Jerusalem-based Temple scribes.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Satan",
                           @"twitterDef":@"the adversarial being found in post-Exilic Hebrew literature that serves to represent evil events...",
                           @"definition":@"the adversarial being found in post-Exilic Hebrew literature that serves to represent evil events.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Septuagint",
                           @"twitterDef":@"the Greek translation of the Old Testament made at the request of Alexander the Great",
                           @"definition":@"the Greek translation of the Old Testament made at the request of Alexander the Great.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Source Criticism",
                           @"twitterDef":@"the type of criticism that seeks to decipher and analyze the underlying source of a text",
                           @"definition":@"the exegetical criticism that seeks to decipher and analyze the underlying source of a text.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synagogue",
                           @"twitterDef":@"The local place of weekly assembly for Jews during the Exile in Babylon",
                           @"definition":@"The local place of weekly assembly for Jews during the Exile in Babylon; carried over into post-Exilic Judaism - from the Greek “to go together“.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synchronic",
                           @"twitterDef":@"the type of truth that is relative to the time of a text's composition",
                           @"definition":@"the type of truth that is relative to the time of a text's composition, usually relating to the worldview of the author.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synoptic",
                           @"twitterDef":@"a Greek term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity",
                           @"definition":@"a term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity of narrative and Christology contrasted with the gospel of John; from the Greek word συν (syn) - “together” and οπσις (opsis) - “appearance”.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Semiotics",
                           @"twitterDef":@"the study of signs and symbols used as elements of communication",
                           @"definition":@"the study of signs and symbols used as elements of communication.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Sociology",
                           @"twitterDef":@"The study of society",
                           @"definition":@"The study of society.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Solidarity",
                           @"twitterDef":@"the idea that human beings share a fundamental unity which should be a criteria for determining justice",
                           @"definition":@"Solidarity is a basic principle of Catholic Social Teaching.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Spirituality",
                           @"twitterDef":@"the conscious process of integration of one's life toward Ultimate value",
                           @"definition":@"the conscious process of integration of one's life toward Ultimate value.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Structuralism",
                           @"definition":@"the anthropological movement based on the work of Levi Strauss.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Supernormal Allurements",
                           @"twitterDef":@"the attraction to concentrated quantities of substances that allowed hu;manity to evolve and flourish, such as sugar, salt, and sex",
                           @"definition":@"the attraction to concentrated quantities of substances that allowed hu;manity to evolve and flourish, such as sugar, salt, and sex.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    
    //T
    
    [TAWord wordWithDict:@{@"name":@"Theodicy",
                           @"twitterDef":@"the question of God's justice in the face of suffering and evil",
                           @"definition":@"The question of God's justice in the face of suffering and evil.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theologoumenon",
                           @"twitterDef":@"a theological opinion on a disputable matter that has not been defined in Church teaching",
                           @"definition":@"A theological opinion on a disputable matter that has not been defined in Church teaching.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theology",
                           @"twitterDef":@"the study of God",
                           @"definition":@"The study of God.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theosis",
                           @"twitterDef":@"the process of becoming like God, emphasized in the Easter Orthodox tradition",
                           @"definition":@"The process of becoming like God, emphasized in the Easter Orthodox tradition.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Tradition",
                           @"twitterDef":@"the process of handing over beliefs and practices",
                           @"definition":@"the process of handing over beliefs and practices.\r\rFurther Reference:\r\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Transcendence",
                           @"twitterDef":@"the quality of going beyond human experience",
                           @"definition":@"the quality of going beyond human experience.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Transubstantiation",
                           @"twitterDef":@"the Thomistic concept that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist",
                           @"definition":@"the belief, formulated by Thomas Aquinas, that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Trinity",
                           @"twitterDef":@"the existence of God in three persons; Father, Son, and Holy Spirit",
                           @"definition":@"The belief that God exists in three persons.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Tabernacle",
                           @"twitterDef":@"the pre-Solomonic temporary dwelling place of YHWH in Israel",
                           @"definition":@"The Tabernacle was initially housed at Shiloh.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Tanak",
                           @"twitterDef":@"an acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im",
                           @"definition":@"Acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im. Since Hebrew has no vowels, those are added.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Tax Collectors",
                           @"twitterDef":@"a class of Jews who collected provincial taxes for the Roman Empire",
                           @"definition":@"Jews who collected provincial taxes for the Roman Empire; frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. They were reviled as traitors, likely cheats, and possible idolators. Jesus includes one such person (Matthew) in his inner circle of disciples.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Temple",
                           @"twitterDef":@"the permanent dwelling place of YHWH in Israel",
                           @"definition":@"The dwelling place of YHWH.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Textual Criticism",
                           @"twitterDef":@"the criticism that deciphers and analyzes the original language of a text",
                           @"definition":@"The exegetical criticism that deciphers and analyzes the original language of a text.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Theophany",
                           @"twitterDef":@"an appearance of God to a human being in which Divine communication occurs",
                           @"definition":@"An appearance of God to a human being. Numerous theophanies are recorded throughout the Bible with the account of Moses being paradigmatic.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Torah",
                           @"twitterDef":@"the first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy",
                           @"definition":@"The first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Typology",
                           @"twitterDef":@"a way of interpreting the Old Testament through a Christological hermeneutic",
                           @"definition":@"A way of reading the Old Testament.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    //U
    [TAWord wordWithDict:@{@"name":@"Universal Destination of Goods",
                           @"twitterDef":@"the idea that the goods of the earth are intended to be justly distributed",
                           @"definition":@"The idea that the goods of the earth are intended to be justly distributed among its inhabitants according to the will of the Creator.\r\rFurther Reference:\rThe Compendium of the Social Doctrine of the Church, 171",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Universalism",
                           @"twitterDef":@"the belief that all of humanity will ultimately experience salvation",
                           @"definition":@"The belief that all of humanity will ultimately experience salvation.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    //V
    
    [TAWord wordWithDict:@{@"name":@"Virginal Conception",
                           @"twitterDef":@"the belief that Jesus of Nazareth was conceived by the Holy Spirit",
                           @"definition":@"Both the gospels of Matthew and Luke claim that Jesus was concieved by a virgin mother. Later tradition would develop the idea of Mary's perpetual viriginity although this idea was not univerally accepted.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Vocation",
                           @"twitterDef":@"the calling by God of someone to a particular way of life",
                           @"definition":@"The calling by God of someone to a particular way of life.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    //W
    
    [TAWord wordWithDict:@{@"name":@"Wisdom Literature",
                           @"twitterDef":@"a genre of literature in the Old Testament that contains wise sayings and philosophical reflections on life",
                           @"definition":@"a type of literature that contains wise sayings and philosophical reflections on life.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Poetic",
                           @"twitterDef":@"the third of four sections in the Old Testament, it contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach",
                           @"definition":@"The third of four sections in the Old Testament; it consists mainly of various writings; contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Word of God",
                           @"twitterDef":@"the saving message of God in which humans trust for salvation",
                           @"definition":@"The saving message of God in which humans trust.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Will of God",
                           @"twitterDef":@"The ultimate desire of God for creation",
                           @"definition":@"The ultimate desire of God for creation.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    
    //X
    
    [TAWord wordWithDict:@{@"name":@"Xenophobia",
                           @"twitterDef":@"the fear of foreigners",
                           @"definition":@"The fear of foreigners. The ministry of the historical Jesus can be seen, partly, as a movement against the xenophobic nationalism of the religious elite in Second Temple Judaism.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    //Y
    
    [TAWord wordWithDict:@{@"name":@"Yahwist Source",
                           @"twitterDef":@"the “J” Source...",
                           @"definition":@"The “J” Source...",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"YHWH",
                           @"twitterDef":@"the four letter personal name of the God of the Israelites, also called the “Tetragrammaton”",
                           @"definition":@"The four letter personal name of the God of the Israelites, also called the 'Tetragrammaton'; it was likely pronounced 'Yah-way”; according to the E and P sources, this name was not known before it was revealed to Moses in Exodus chapter 3, the J source, however, uses it throughout Genesis, which is one argument for the Documentary Hypothesis.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Yom Kippur",
                           @"twitterDef":@"a Hebrew phrase meaning “Day of Atonement”",
                           @"definition":@"According to Leviticus 16, Yom Kippur is a day set aside on the Jewish calendar dedicated to bringing about personal and national reconciliation with YHWH.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    //Z
    
    [TAWord wordWithDict:@{@"name":@"Zealots",
                           @"twitterDef":@"a Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces",
                           @"definition":@"A Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Zion",
                           @"twitterDef":@"a synonym for the Temple Mount in Jerusalem or for the city of Jerusalem itself",
                           @"definition":@"A synonym for the Temple mountain in Jerusalem or for the city of Jerusalem itself.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [[TADataStore sharedStore] saveContext];
}

@end
