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
                           @"twitterDef":@"the Aramaic word meaning “Father” or “Daddy”",
                           @"definition":@"\rAccording to all four Gospels, this term was by Jesus to refer to God in prayer. Paul claims that Christians also use the term because of their filial adoption; “Because you are sons, God has sent the Spirit of his Son into our hearts, crying, “Abba! Father!” (Gal 4:6). See “Adoption”.\r\rAramaic, אַבָּא (abba)\r\rFurther Reference:\rCatechism of the Catholic Church, 2779\rhttp://tinyurl.com/qzz5b2e\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ablution",
                           @"twitterDef":@"the cleansing of the paten and chalice after the Eucharist",
                           @"definition":@"\rAblution can be traced as a distinct liturgical practice back to the mikvah in Judaism, which was a ceremonial washing required for ritual cleanliness. See “Eucharist”.\r\rFurther Reference:\rGeneral Instruction of the Roman Missal, 278\rhttp://tinyurl.com/yvd7md\r\r\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Adonai",
                           @"twitterDef":@"the Hebrew word meaning “Master” or “Ruler”",
                           @"definition":@"\rThis term is used as a substitute reference to Yahweh in the Tanak and in contemporary Judaism out of respect for the Tetragrammaton. See “Tanak”, “Yahweh”, “Tetragrammaton”.\r\rHebrew, אֲדֹנָי (adonai)\r\rFurther Reference:\rCatechism of the Catholic Church, 209\rhttp://tinyurl.com/bruqt9r\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Aseity",
                           @"twitterDef":@"the necessary character of God's existence",
                           @"definition":@"\rAesity is a term using in so called Perfect-Being theology in which God is described as being the most perfect Being in regard to several qualities. See “Onotological Argument”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Divine Simplicity”\rhttp://tinyurl.com/3ttzn3g\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Angelus",
                           @"twitterDef":@"an antiphonal prayer inspired by the story of the Annunciation",
                           @"definition":@"\rThe Angelus is prayed every Sunday at noon by the Pope in St. Peter's Square.\r\rV. The angel of the Lord declared unto Mary,\rR. And she conceived of the Holy Spirit.\rV. Behold the handmaid of the Lord.\rR. Let it be unto me according to thy word.\rV. And the Word was made flesh.\rR. And dwelt among us.\rV. Hail Mary, full of grace; the Lord is with Thee: blessed art thou amongst women, and blessed is the fruit of thy womb, Jesus.\rR. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.\rV. Pray for us, O Holy Mother of God.\rR. That we might be made worthy of the promises of Christ.\rV. Let us pray: Pour forth, we beseech Thee, Lord, Thy grace into our hearts; that, we, to whom the Incarnation of Christ, Thy Son, was known by the message of an angel, may, by His Passion and Cross, be brought to the glory of His Resurrection, through the same Christ our Lord,\rR. Amen.\r\rPope Paul VI encouraged the Angelus as a form of Marian devotion:\r\r“What we have to say about the Angelus is meant to be only a simple but earnest exhortation to continue its traditional recitation wherever and whenever possible. The Angelus does not need to be revised, because of its simple structure, its biblical character, its historical origin which links it to the prayer for peace and safety, and its quasi-liturgical rhythm which sanctifies different moments during the day, and because it reminds us of the Paschal Mystery, in which recalling the Incarnation of the Son of God we pray that we may be led 'through his passion and cross to the glory of his resurrection. These factors ensure that the Angelus despite the passing of centuries retains an unaltered value and an intact freshness. It is true that certain customs traditionally linked with the recitation of the Angelus have disappeared or can continue only with difficulty in modern life. But these are marginal elements. The value of contemplation on the mystery of the Incarnation of the Word, of the greeting to the Virgin, and of recourse to her merciful intercession remains unchanged. And despite the changed conditions of the times, for the majority of people there remain unaltered the characteristic periods of the day-morning, noon and evening-which mark the periods of their activity and constitute an invitation to pause in prayer.”\r-Marialus Cultus, 41\r\rSee “Incarnation”, “Annunciation”.\r\rFurther Reference:\rPaul VI, “Marialus Cultus”\rhttp://tinyurl.com/nd7l59g\r\rCompendium of the Catechism of the Catholic Church, Appendix A\rhttp://tinyurl.com/jfuwl\r\r\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Anawim",
                           @"twitterDef":@"the Hebrew word meaning “the oppressed”",
                           @"definition":@"\rThis term is used in the Hebrew Bible to refer to those who are poor, destitue, and marginalized who trust completely in the mercy of God (Is. 10:2, Zeph 2:3); frequently used in the Psalms.\r\rHebrew, עֲנָוִים (anawim)\r\rFurther Reference:\rPope John Paul II, General Audience, 5/23/2001. http://tinyurl.com/npgshqn\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anthropomorphism",
                           @"twitterDef":@"the process of attributing human characteristics to an object",
                           @"definition":@"\rGod is described in human terms throughout the Christian tradition, and especially within the Scriptures. The Yahwist Source uses anthropomorphism extensively in its portrayal of Yahweh in the Torah. Such language is, however, ultimately, only analogous to God. Pope John Paul II claimed that various modes of expression are used within the Scriptures:\r\r“Speaking about himself, whether through the prophets, or through the Son' (cf. Heb 1:1, 2) who became man, God speaks in human language, using human concepts and images. If this manner of expressing himself is characterized by a certain anthropomorphism, the reason is that man is 'like' God: created in his image and likeness. But then, God too is in some measure 'like man', and precisely because of this likeness, he can be humanly known.”-Mulierus Dignatatum, 8\r\rSee “Analogy”, “Yahwist Source”, “Yahweh”.\r\rFurther Reference:\rPope John Paul II, “Mulierus Dignatatem”\rhttp://tinyurl.com/nphq2r6\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Annunciation",
                           @"twitterDef":@"the angelic declaration to Mary that she would bear the Son of God",
                           @"definition":@"\rThe Annunciation is found in the Gospel of Luke 1:26-38 and follows the Old Testament trope of angelic communications before the birth of important figures. See “Synoptic Gospels”.\r\rFurther Reference:\rCatechism of the Catholic Church, 484\rhttp://tinyurl.com/3w9q9aw\r\r\r",
                           @"category":@"Biblical"}];

    
    /*
     Word *antiochusWord = [[Word alloc]init];
     antiochusWord.@"name":@"Antiochus IV";
     antiochusWord.@"definition":@"Greek king of Seleucid empire who ruled from 215-164 BCE and who caused the Maccabean revolt";
     */
    
    [TAWord wordWithDict:@{@"name":@"Apocalypse",
                           @"twitterDef":@"the revelation of something hidden;\rthe last book of the New Testament",
                           @"definition":@"\rSt. Paul uses this word to refer to his experience of the risen Jesus in Gal. 1:12. The Apocalypse (or Revelation) of John describes a vision of Jesus Christ about the end of the word, previously hidden from the Church's knowledge; commonly used to refer to the end of the world. See “Revelation”.\r\rGreek, ἀποκάλυψις (apokalypsis) “unveiling”\r\rFurther Reference:\rCatechism of the Catholic Church, 120\rhttp://tinyurl.com/kvc3tvq\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apocrypha",
                           @"twitterDef":@"the 7 books excluded from the Protestant Bible",
                           @"definition":@"\rSee “Deuterocanonical Books”.",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apodictic Law",
                           @"twitterDef":@"a type of law based on universal norms",
                           @"definition":@"\rApodictic law is that such as found in the Decalogue. It is contrasted with Casuistic Law, being universally binding at all times and places\r\r“The Decalogue contains all the elements necessary to provide a foundation for a balanced moral reflection suitable for our times. It is however not sufficient to translate it from the original Hebrew into a modern language. In its canonical formulation it has the form of apodictic laws detailing a morality of duties...”\r-The Bible and Morality, 30\r\rSee Exodus 20, “Decalogue”, “Casusitic Law”.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Bible and Morality”\rhttp://tinyurl.com/pgzpjov\r\r\r",
                           @"category":@"Biblical"}];
    
    /*
     Word *apollosWord = [[Word alloc]  init];
     apollosWord.@"name":@"Apollos";
     apollosWord.@"definition":@"An apostolic worker associated with Paul; according to Acts 18, he was a Jew from Alexandria who had received Christian instruction";
     */
    
    [TAWord wordWithDict:@{@"name":@"Apostle",
                           @"twitterDef":@"a disciple personally commissioned by Jesus",
                           @"definition":@"\rThis term is normally used to refer to the Twelve appointed from a larger group of disciples. It is also used by St. Paul to refer to anyone who had seen the risen Christ. See “Resurrection”.\r\rGreek, ἀπόστολος (apostolos) “delegate”\r\rFurther Reference:\rFelix Just,\r“Disciples and Apostles in the New Testament”\rhttp://tinyurl.com/mzcbt37\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Aqeda",
                           @"twitterDef":@"the Hebrew word meaning the “binding” of Isaac by Abraham",
                           @"definition":@"\rThe story of the binding and near-sacrifice of Isaac by Abraham occurs in Genesis 22. According to Richard Elliot Freidman, the Aqedah is mostly an Elohist Source story with a very different original ending that was amended by the Redactor of the Torah. See “Elohist Source”, “Torah”.\r\rHebrew, עֲקֵידָה (aqeda)\r\rFurther Reference:\rNew American Standard Bible, Genesis 22\rhttp://tinyurl.com/p2hg7n4\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Aramaic",
                           @"twitterDef":@"a Semitic language similar to Hebrew",
                           @"definition":@"\rAramaic was the native language of the historical Jesus. See “Hebrew”, “Historical Jesus”.\r\rFurther Reference:\rComprehensive Aramaic Lexicon\rhttp://tinyurl.com/oc8t2zy\r\r\r",
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
                           @"twitterDef":@"the Canaanite mother goddess & wife of El",
                           @"definition":@"\rIn Canaanite mythology, Asherah is the wife of El and the goddess of fertility. She is mentioned numerous times throughout the Old Testament. According to 2 Kings 23:4 a large Asherah statue was housed in the Temple and dressed by her cult's prostitutes before Josiah's Deuteronomic reform. See “El”, “Henotheism”.\r\rFurther Reference:\rWikipedia, “Asherah”\rhttp://tinyurl.com/6qf2tt\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ash Wednesday",
                           @"twitterDef":@"a day of abstinence and beginning of Lent observed with the distribution of ashes",
                           @"definition":@"\rAsh Wednesday is named as such because during the Mass, ashes are distributed with the reminder: “Remember you are dust. Repent and believe the Gospel”. See “Lent”.\r\rFurther Reference:\rWikipedia, “Ash Wednesday”\rhttp://tinyurl.com/t73jm\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Assyria",
                           @"twitterDef":@"the empire that conquered the northern kingdom of Israel in 722 B.C.",
                           @"definition":@"\rOne of the numerous Mesopotamian empires in the ancient world which conquered the northern kindgom of Israel in 722 B.C. See “Israel”.\r\rFurther Reference:\rPeter Dubovsky\r“Why Did the Northern Kingdom Fall According to 2 Kings 15?”, http://tinyurl.com/o375e48\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Abortion",
                           @"twitterDef":@"the willful killing of a human being in utero",
                           @"definition":@"\rIn the Catholic tradition, human beings are regarded as sacred from the moment of conception. The death of an unborn child as a consequence of other procedures deemed good in themselves is not considered an abortion per se but rather a consequence of the principle of double-effect.\r\rThe Catholic tradition is consistent in its classification of abortion as a grave sin, the willful commision of which incurs an automatic excommunication. Abortion was legalized in the United States in 1973 by the Supreme Court in Roe v. Wade. See “Principle of Double-Effect”, “Roe v. Wade”\r\rFurther Reference:\rCatechism of the Catholic Church, 2270\rhttp://tinyurl.com/dh7r\r\rCongregation for the Doctrine of the Faith\r“Donum Vitae: Instruction on Human Life”\rhttp://tinyurl.com/3yz3n\r\rRev. James Diamond\r“Abortion, Animation, and Biological Hominzation”\rhttp://tinyurl.com/pzcrp3j\r\rU.S. Supreme Court, “Roe v. Wade”\rhttp://tinyurl.com/qhpdzo3\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Abstinence",
                           @"twitterDef":@"to purposely refrain from a given activity",
                           @"definition":@"\rAbstinence is ultimately aimed at the higher purpose of spiritual edification. In the Catholic tradition, it is usually applied to food and sexual activity. Ash Wednesday and Good Friday are two Days of Abstinence in the Western Church.\r\rFurther Reference:\rCatechism of the Catholic Church, 2043\rhttp://tinyurl.com/l56b6h4\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Act",
                           @"twitterDef":@"a free act of the will",
                           @"definition":@"\rIn moral theology, an truly “human” act refers to actions made with freedom and will.\r\rFurther Reference:\rCatholic Moral Theology blog\rhttp://tinyurl.com/pyfcn3n\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Adultery",
                           @"twitterDef":@"sexual relations with another person's spouse",
                           @"definition":@"\rAdultery is prohibited by the sixth Commandment of the Decalogue. In Matthew 5:28, Jesus teaches that one should even avoid those actions that ultimately lead to adultery. See “Decalogue”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2380\rhttp://tinyurl.com/cz1w\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Absolution",
                           @"twitterDef":@"the declaration that sins are forgiven",
                           @"definition":@"\rThe act by which a priest declares the forgiveness of sins. General absolution is not considered a Sacrament like that which is given in the Sacrament of Penance. See “Sacrament”, “Penance”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1424\rhttp://tinyurl.com/l7xon9e\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Adoptionism",
                           @"twitterDef":@"the belief that Jesus was a mere man adopted as God's Son at his baptism ",
                           @"definition":@"\rAdoptionism was held by the so-called Ebionites of the end of the first century, who denied the pre-existence and incarnation of the Son.\r\rFurther Reference:\rPhillip Schaff\rHistory of the Christian Church, 117\rhttp://tinyurl.com/op64y6s\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Accident",
                           @"twitterDef":@"a nonessential property of an object in Aristotelean metaphysics",
                           @"definition":@"\rThomas Aquinas used this concept from Aristotle to support his explanation of the Real Presence in the Eucharist, called “transubstantiation”. Thomas claimed the accidents of bread and wine remain after the substance of the elements change into the substance of the body and blood of Christ. See “Eucharist”, “Metaphysics”, “Real Presence”, “Transubstantiation”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Essential vs. Accidental Properties”\rhttp://tinyurl.com/olc9dv8\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Asceticism",
                           @"twitterDef":@"the practice of self-discipline",
                           @"definition":@"\rAsceticism often involves abstinence. See “Abstinence”.\r\rGreek, ἄσκησις (askesis) “training”\r\rFurther Reference:\rPope Paul VI, “Paenitemini”\rhttp://tinyurl.com/o3pbtq8",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Adoption",
                           @"twitterDef":@"a biblical metaphor used to refer to the process of becoming a child of God",
                           @"definition":@"\rIn the New Testament, St. Paul uses this metaphor to describe God's process of extending His family through Jesus Christ.\r\rFurther Reference:\rCatechism of the Catholic Church, 1\rhttp://tinyurl.com/o7udb4d\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Agape",
                           @"twitterDef":@"the Greek word meaning “universal & unconditional love”",
                           @"definition":@"\rThe Gospel writers use this word to describe Jesus' teaching on the love for God, neighbors and enemies (Matthew 5:44, 22:37, 39). It is used by later New Testament writers to describe the love of God towards humanity as seen in the sacrificial death of Jesus and even the very nature of God. The early Christians also used “agape” to refer to their weekly communal meal (Jude 1:12). The Latin equivalent is caritas (charity).\r\rGreek, ἀγάπη (agape)\r\rFurther Reference:\rPope Benedict XVI, “Deus Caritas Est”\rhttp://tinyurl.com/p2cqlgr\r\rCatechism of the Catholic Church, 1822\rhttp://tinyurl.com/pd2yc32\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Aggiornomento",
                           @"twitterDef":@"the Italian word meaning “to update” used to describe a theme of Vatican II",
                           @"definition":@"\rAs a way to describe one of its emphases, it became popular during and synonymous with the reforms of the Second Vatican Council (1962-1965). The concept was used by various theologians to describe the purpose of Vatican II. In an Address to Bishops from Vatican II, Pope Benedict XVI claimed:\r\r“...Christianity is always new. We must never look at it as though it were a tree, fully developed from the mustard seed of the Gospel, that grew, gave its fruit, and one fine day grows old as the sun sets on its life force. Christianity is a tree that is, so to speak, ever 'timely', ever young. And this trend, this aggiornamento does not mean a break with tradition, but expresses its ongoing vitality; it does not mean reducing the faith, debasing it to the fashion of the times, measured by what pleases us, by what pleases public opinion, but it is the contrary: exactly as the Council Fathers did, we must bring the 'today' that we live to the standard of the Christian event, we must bring the 'today' of our time to the 'today' of God.”\r\rFurther Reference:\rPope Benedict XVI\rAddress To Vatican II Bishops, 10.12.2012\rhttp://tinyurl.com/p9t3a5d\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Allegory",
                           @"twitterDef":@"an interpretation that seeks higher orders of meanining",
                           @"definition":@"\rAn allegory is an interpretation of a text that goes beyond the literal meaning to find a deeper connection to a higher order of reality. In the New Testament, St. Paul claims that the story of Sarah and Hagar in Genesis is an allegory of those in Christ and those under the Law (Gal. 4:24).\r\rGreek, ἀλληγορία (allegoria)\r“speaking by way of something else”\r\rFurther Reference:\rCatechism of the Catholic Church, 117\rhttp://tinyurl.com/kvc3tvq\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Analogy of Faith",
                           @"twitterDef":@"the coherence of the truths of faith among themselves",
                           @"definition":@"\rThe Analogy of Faith is a concept that St. Paul uses in Romans 12:6. It later becomes a way to refer to the consistency and interrelationship of Church teaching.\r\rGreek, ἀναλογία (analogia) “proportion”\r\rFurther Reference:\rCatechism of the Catholic Church, 114\rhttp://tinyurl.com/kvc3tvq\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Annointing of the Sick",
                           @"twitterDef":@"the Sacrament of Healing by anointing with oil",
                           @"definition":@"\rThe Annointing of the Sick has its roots in the healing ministry of Jesus and the early Christians. See “Sacrament”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1499\rhttp://tinyurl.com/n3lyve9\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anthropocentrism",
                           @"twitterDef":@"centered on humanity",
                           @"definition":@"\rIn a neutral sense, anthropocentrism refers to a method of theological enquiry from the starting point and within the horizon of the human experience. All theological claims are claims made by human beings in human language. Theology is relevant to human beings in so far as they concern human experience. In a more negative sense, the term can refer to an over-indexed focus on huamnity to the exclusion of the larger environment. See “Human Person”.\r\rFurther Reference:\rWikipedia, “Anthropocentrism”\rhttp://tinyurl.com/8hj52d\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apocatastasis",
                           @"twitterDef":@"the Greek word meaning\r“the restoration of all things”",
                           @"definition":@"\rThis term only occurs in the New Testament in Acts 3:21, wherein Peter refers to the state of creation in the Messianic Age. Later in the Patristic era, Clement of Alexandria, Origen, and St. Gregory of Nyssa used it to the belief that, at the Eschaton, God will restore all creation back into full Divine communion. See “Eschatology”.\r\rGreek, ἀποκατάστασις (apocatastasis)\r\rFurther Reference:\rNew Schaff-Herzog Encyclopedia of Religious Knowledge, “Apocatastasis”\rhttp://tinyurl.com/ocw8zgg\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apologetics",
                           @"twitterDef":@"the rational defense of the Christian faith",
                           @"definition":@"\rThe early Christians were compelled to defend authentic Christian faith and practice against false accusations and various suspicions. Notable ancient Apologies include that of Justin Martyr and Tertullian. Modern apologetics seeks to explain the rationality of Christian belief in a scientific age of critical methodologies used across various academic disciplines, including theology itself.\r\rGreek, ἀπολογία (apologia) “defense”\r\rFurther Reference:\rCardinal William Levada, “The Urgency Of A New Apologetics”, http://tinyurl.com/q2chgg5\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apophatic",
                           @"twitterDef":@"language that uses negation to describe God",
                           @"definition":@"\rApophatic language emphasizes the discontinuity of God with anything created. It was especially popular with the certain early Greek fathers. It is the opposite of Kataphatic language.\r\r“The sense of mystery which properly characterises theology leads to a ready acknowledgement of the limits of theological knowledge, contrary to all rationalist pretensions to exhaust the Mystery of God. The teaching of Lateran IV is fundamental: ‘between creator and creature no similarity can be noted without noting a greater dissimilarity’.[160] Reason enlightened by faith and guided by revelation is always aware of the intrinsic limits of its activity. That is why Christian theology can take the form of ‘negative’ or ‘apophatic’ theology.”\r-Theology Today, 96\r\rSee “Kataphatic”.\r\rFurther Reference:\rInternational Theological Commission\r“Theology Today”, http://tinyurl.com/brdt29m\r\rRev. Harvey Egan\r“Christian Apophatic and Kataphatic Mysticisms”\rhttp://tinyurl.com/nn74e8z\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apostolic",
                           @"twitterDef":@"the quality of the Church as being based on the Apostolic tradition",
                           @"definition":@"\rApostolic is one of the four marks of the Church mentioned in the Nicene Creed; One, Holy, Catholic, Apostolic. See “Nicene Creed”.\r\rFurther Reference:\rCatechism of the Catholic Church, 857\rhttp://tinyurl.com/c5m8w5j\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Assumption of Mary",
                           @"twitterDef":@"the dogma that the Virgin Mary was assumed into heaven",
                           @"definition":@"\rThe dogma, defined by Pope Pius XII in 1950 in the Apostolic Constitution, “Munificentissimus Deus”, is based on a tradition that Mary's tomb was found empty, which dates back to the 4th century. According to the teaching of the Church, the Assumption is a sign of the Resurrection of Jesus. See “Resurrection”.\r\rFurther Reference:\rCatechism of the Catholic Church, 966\rhttp://tinyurl.com/mtfzewa\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Atonement",
                           @"twitterDef":@"the act of making restitution for inflicted harm",
                           @"definition":@"\rLiterally translated “at-one-ment”, atonement is requisite to forgiveness in the Priestly tradition of the Torah in Leviticus.  Atonement in the Hebrew Bible does not always, however, require the shedding of blood. In the New Testament, St. Paul claims that God presented Christ as an atonement for the sins of humanity (Rom. 5:11). Atonement became a dominant theological interpretation of the death of Jesus of Nazrareth in the Catholic tradition, with different understandings of how Christ atones for sin. St. Anselm's substitutionary atonement theory became dominant and influential on Protestant thinkers.\r\rGreek, ἱλαστήριον (atonement)\r\rFurther Reference:\rCatechism of the Catholic Church, 616\rhttp://tinyurl.com/p3dfabj\r\r\r",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Agnus Dei",
                           @"twitterDef":@"the invocation during the Fraction of the Eucharist that begins, “Lamb of God”",
                           @"definition":@"\rThe Agnus Dei is chanted 3 times before the distribution of the Eucharist.\r\r“Lamb of God, you who take away the sins of the world, have mercy upon us.\rLamb of God, you who take away the sins of the world, have mercy upon us.\rLamb of God, you who take away the sins of the world, grant us peace.”\r\rSee “Eucharist”, “Fraction”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Liturgy of the Eucharist”\rhttp://tinyurl.com/lleofmh\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Advent",
                           @"twitterDef":@"the first season of the liturgical year that prepares for the coming of Christ",
                           @"definition":@"\rAdvent prepares the Church for the the celebration of the birth of Jesus. It is observed over the course of four Sundays.\r\rFurther Reference:\rCatechism of the Catholic Church, 524\rhttp://tinyurl.com/mou9egj\r\r\r",
                           @"category":@"Ecclesial"}];
    
    [TAWord wordWithDict:@{@"name":@"Alleluia",
                           @"twitterDef":@"a Latinized form of the phrase meaning\r“Praise the LORD”",
                           @"definition":@"\rThe Alleluia is derived from the Hebrew expression “Praise Yahweh”. It is spoken before the reading of the Gospel during the Mass. It is not spoken during the season of Lent.\r\rFurther Reference:\rCatechism of the Catholic Church, 2589\rhttp://tinyurl.com/pynlg6a\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Altar",
                           @"twitterDef":@"the table upon which the Eucharist is placed",
                           @"definition":@"\rThe only mention of an altar in the New Testament is that of Christ's body due to the interpretation of the death of Jesus as an atoning sacrifice (Heb. 13:10). The development of dedicated altars in churches was a later development in early Christianity that coincided with its gradual acceptance into Roman society.\r\rFurther Reference:\rCatechism of the Catholic Church, 1182\rhttp://tinyurl.com/p9382z5\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ambo",
                           @"twitterDef":@"another word for “Lecturn”",
                           @"definition":@"\rSee “Lecturn”.",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Amen",
                           @"twitterDef":@"the Hebrew word meaning “may it be so” or “truthfulness“",
                           @"definition":@"\rThe Amen is traditionally said after a prayer as a form of agreement. It derives from Jewish use in the synagogue and later in the New Testament where it is used to indicate the truthfulness of what is said; “Amen, I say to you...” is a sayings formula used throughout the Gospels used to emphasize one of Jesus' teachings.\r\rHebrew, אָמֵן (amen)\r\rFurther Reference:\rCatechism of the Catholic Church, 1061\rhttp://tinyurl.com/k3f2f8p\r\rFelix Just\r“Amen, Amen Sayings in the Fourth Gospel”\rhttp://tinyurl.com/k545gaq\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anamnesis",
                           @"twitterDef":@"the Greek word meaning “lived rememberance”",
                           @"definition":@"\rThe concept of anamnesis was first used by Plato as an epistemological explanation of how human beings have knowledge. The writers of the Synoptic Gospels use it the Passion Narrative during the Words of Institution, in which Jesus asks his disciples to “remember” him when they eat the bread and drink the cup. It is a performative act used to re-present the salvific death and resurrection of Jesus.  See “Passion Narrative”, “Real Presence”, “Synoptic Gospels”, “Words of Institution”.\r\rGreek, ἀνάμνησις (anamnesis)\r\rFurther Reference:\rCatechism of the Catholic Church, 1103\rhttp://tinyurl.com/oqbzkx3\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anaphora",
                           @"twitterDef":@"the offering of the Eucharistic Prayer in structured sequences",
                           @"definition":@"\rThe Eucharistic prayer of the Mass was celebrated in structured sequences as early as possibly the first century (as evidenced in the Didache) and certainly by third century, in the Apostolic Tradtion of Hippolytus of Rome. The term is based on the Septuagint reading of Leviticus 2:14 and other passages, in which the Israelite priest offers up the sacrifice. See “Didache”, “Septuagint”.\r\rGreek, ἀναφορά (anaphora) “to lift up”\r\rFurther Reference:\rCatechism of the Catholic Church, 1352\rhttp://tinyurl.com/m88dbjl\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anathema",
                           @"twitterDef":@"the Greek word meaning “placed off limits”;\rthe state of being excommunicated",
                           @"definition":@"\rWhile it originally referred to objects that were placed off limits, over time, “anathema” came to refer to those who were accursed or banished from the community. In contrast to previous conciliar decrees from Vatican I and other councils, Vatican II did not contain any anathemas.\r\rGreek, ἀνάθεμα (anathema)\r\rFurther Reference:\rDecrees of Vatican I\rhttp://tinyurl.com/pvacoow\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Angel",
                           @"twitterDef":@"a spiritual being that communicates Divine messages",
                           @"definition":@"\rAngels are found througout the Scriptures, and their existence is affirmed by the Church as a truth of the faith. Post-Exilic Judaism had developed an intricate angeology by the first century. Jesus alludes to the idea that some angels have been assigned responsibility for the care of specific individuals. The Bible mentions different classes of angels, with Cherubim being the highest. See “Divine Revelation”.\r\rGreek, ἄγγελος (angelos) “messenger”\r\rFurther Reference:\rCatechism of the Catholic Church, 327\rhttp://tinyurl.com/qcujkzy\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Annulment",
                           @"twitterDef":@"an ecclesial declaration that a valid marriage never existed",
                           @"definition":@"\rAnnulments are not divorces in that they do not dissolve an existing marriage but rather recognize mitigating factors that invalidate a marriage, such as lack of consent or the withholding of critical information. See “Marriage”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1629\rhttp://tinyurl.com/ykptlg\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Antiphon",
                           @"twitterDef":@"a form of singing or chanting by alternating sets of voices",
                           @"definition":@"\rThe choral response sung during the entrace processional of Mass is antiphonal. See “Mass”.\r\rFurther Reference:\rGeneral Instruction on the Liturgy of the Hours, III.II http://tinyurl.com/3re28vo\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apostles' Creed",
                           @"twitterDef":@"the creed used in Rome circa A.D. 150",
                           @"definition":@"\rThe Apostles' Creed is the earliest known liturgical creed associated specifically with the Church of Rome.\r\r“I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, his only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; he descended into hell; on the third day he rose again from the dead; he ascended into heaven, and is seated at the right hand of God the Father almighty; from there he will come to judge the living and the dead. I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.”\r\rSee the Creeds section of the Overview tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 194\rhttp://tinyurl.com/mo3f24x\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Arianism",
                           @"twitterDef":@"the teaching of Arius, that the Son was not of the same substance as the Father",
                           @"definition":@"\rThe teaching of Arius that the Son was of a different substance than the Father (begotten vs. unbegotten) and thus, not fully divine. See “Homoiousios”.\r\rFurther Reference:\rCatechism of the Catholic Church, 465\rhttp://tinyurl.com/37wuaux\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"A Posteriori",
                           @"twitterDef":@"a philosophical category which follows human experience",
                           @"definition":@"\rA posteriori truth claims are those that are not self-evident, but depend upon empirical data. The statement “Water boils at 0 degrees Celsius” is an a posteriori truth.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“A Priori Justification and Knowledge”\rhttp://tinyurl.com/6tp7oyz\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"A Priori",
                           @"twitterDef":@"a philosophical category which precedes human experience",
                           @"definition":@"\rA priori truth claims are those that are self-evident, without requiring empirical data. The statement “All bachelors are unmarried' is an a priori truth.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“A Priori Justification and Knowledge”\rhttp://tinyurl.com/6tp7oyz\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Action",
                           @"twitterDef":@"direct or indirect nonviolent action taken to achieve justice",
                           @"definition":@"\rIn the context of social justice, both direct an indirect nonviolent action are appropriate responses to injustice.\r\rFurther Reference:\rPaul VI, “Octogesima Adveniens“, 48\rhttp://tinyurl.com/llup47a\r\rCompendium of the Social Doctrine of the Church, 419 http://tinyurl.com/qfo6bd7\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Agnostic",
                           @"twitterDef":@"the word used to describe uncertainty about the existence of God",
                           @"definition":@"\rUncertainty about the reality of God is quite common among modern people in modern societies. For some, an agnostic worldview is one that is an epistemological necessity given the unknowability of God. Agnostics are sometimes mistakenly confused with atheists, but can often be conflated with those who are indifferent to the question of God.\r\rFurther Reference:\rCatechism of the Catholic Church, 2127\rhttp://tinyurl.com/lu75a9k\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Analysis",
                           @"twitterDef":@"the process of discerning appropriate steps to achieving justice",
                           @"definition":@"\rAnalysis is the second of the 3 steps in achieving justice. It begins with discernment of the partiuclar situation and how the princples of social justice would be prudently and appropriately applied.\r\rFurther Reference:\rPope Paul VI,“Octogesima Adveniens“, 48\rhttp://tinyurl.com/llup47a\r\r\r",
                           @"category":@"Cultural"}];
    
    /*
    [TAWord wordWithDict:@{@"name":@"Anthropology",
                           @"twitterDef":@"the science that studies human origins, development, and culture",
                           @"definition":@"\rThe science that studies human origins, development, and culture.\r\rFurther Reference:\rAmerican Anthropological Association\rhttp://tinyurl.com/28tcvt",
                           @"category":@"Cultural"}];
     */
    
    [TAWord wordWithDict:@{@"name":@"Anti-Semitism",
                           @"twitterDef":@"prejudice, hatred, or racial bias against Jews",
                           @"definition":@"\rSome portions of the New Testament bear traces of anti-Semitism due to theological biases of some writers against the Jewish people for rejecting Christ, such as the Gospel of John. The Christian tradition has included some anti-Semitic currents that have been rejected since the Second Vatican Council. See “Vatican II” in the Historical section of Pins in the Maps tab.\r\rFurther Reference:\rVatican II, “Nostra Aetate”\rhttp://tinyurl.com/k4dj\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Argument",
                           @"twitterDef":@"a series of statements that establishes a truth claim",
                           @"definition":@"\rA series of statements that establishes a truth claim; made of two parts - premise and conclusion; the from can be deductive or inductive; deductive arguments can be valid or invalid. See “Logic”, “Philosophy”.\r\rFurther Reference:\rInternet Encylopedia of Philosophy, “Argument” http://tinyurl.com/aruqml5\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Atheism",
                           @"twitterDef":@"the belief that no God exists",
                           @"definition":@"\rAtheism can be traced back to the writings of ancient Greek philosophers such as Euripides. It can also be found in the historical roots of Buddhism. Atheism can take many varieties, but the most common is a rejection of the traditional Judeo-Christian ideal of an all-powerful, all-loving, beneficient Creator. Atheism is not a necessary consequence of honest science as is sometimes mistakenly claimed by those who find an apparent conflict between certain scientific theories and traditional religious claims.\r\rFurther Reference:\rCatechism of the Catholic Church, 2113\rhttp://tinyurl.com/lu75a9k\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Awareness",
                           @"twitterDef":@"the gathering of information about a given injustice",
                           @"definition":@"\rAwareness is first step in acheiving social justice. Without awareness of conditions in society, no change can be affected.\r\rFurther Reference:\rPope Paul VI, “A Call To Action“, 48\rhttp://tinyurl.com/llup47a\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Acolyte",
                           @"twitterDef":@"a liturgical assistant to the celebrant of Mass",
                           @"definition":@"\rAcolytes are mentioned as early as the 4th century. Until 1972, it was one of the minor orders, which Pope Paul VI renamed as “ministries”.\r\rFurther Reference:\rCatechism of the Catholic Church, 903\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Act of Contrition",
                           @"twitterDef":@"a prayer said before the Sacrament of Penance",
                           @"definition":@"\rWhile the Church does not canonize any one prayer for forgiveness, a popular one in current usage reads:\r\r“My God, I am sorry for my sins with all my heart. In choosing to do wrong and failing to do good, I have sinned against You whom I should love above all things. I firmly intend, with Your help, to do penance, to sin no more, and to avoid whatever leads me to sin. Our Saviour Jesus Christ, suffered and died for us. In His name, my God, have mercy.”\r\rSee “Reconcilation”.\r\rFurther Reference:\rCongregation for Divine Worship\r“Rite for Reconciliation of Individual Penitents”\rhttp://tinyurl.com/o84cvfx\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apostolic Fathers",
                           @"twitterDef":@"the collection of Christian texts from the late first and early second centuries",
                           @"definition":@"\rThe Aposotolic Fathers are the earliest extra-biblical texts outside the Bible. See the Fathers section of the Overview tab.\r\rFurther Reference:\rPhillip Schaff\rHistory of the Church, “Apostolic Fathers”\rhttp://tinyurl.com/oycgu83\r\r\r",
                           @"category":@"Historical"}];
    
    ///////////////////////B
    
    [TAWord wordWithDict:@{@"name":@"Beatific Vision",
                           @"twitterDef":@"the ultimate, direct, and immediate\rcontemplation of God",
                           @"definition":@"\rAccording to Jesus' teaching in Matthew 5:8, those who are pure of heart will see God. This verse has served as the starting point of Christian reflection on the ultimate destiny of humanity.\r\rFurther Reference:\rCatechism of the Catholic Church, 1028\rhttp://tinyurl.com/k3f2f8p\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Beatitudes",
                           @"twitterDef":@"Sayings of Jesus that begin with the word “Blessed”",
                           @"definition":@"\rThe Beatitudes are likely the most famous of Jesus' sayings. Matthew's version is perhaps the most popular and didactic. Luke's version of the these sayings are more consice and noticeably different in some respects. Both versions reflect an early tradition about popular sermon of the historical Jesus. They have been described as a compendium of Christian living.\r\rFurther Reference:\rCatechism of the Catholic Church, 1716\rhttp://tinyurl.com/nprr772\r\r\r",
                           @"category":@"Biblical"}];
    
    /*
    [TAWord wordWithDict:@{@"name":@"Baldachino",
                           @"twitterDef":@"a canopy use to cover a bishop's chair, the altar, or Eucharistic processions",
                           @"definition":@"\rBaldachinos are regularly seen in St. Peter's Square during open-air Masses.",
                           @"category":@"Liturgical"}];
     */

    [TAWord wordWithDict:@{@"name":@"Beneficence",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm",
                           @"definition":@"\rThis idea is found in the Hippocratic Oath and is the basis of modern biomedical ethics, even if interpreted differently in various nations.\r\rFurther Reference:\rWikipedia, “Beneficence”\rhttp://tinyurl.com/lvw8sht\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Benediction",
                           @"twitterDef":@"a final blessing at the end of Mass",
                           @"definition":@"\rThe Benediction is a liturgical inheritance of the Church from Judaism. It concludes the Mass with a blessing and a sending forth in peace. See “Blessing”.\r\rFurther Reference:\rWikipedia, “Benediction”\rhttp://tinyurl.com/bvdxj54\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Benefit/Burden Ratio",
                           @"twitterDef":@"the ratio of benefits over the burdens of a particular medical treatment",
                           @"definition":@"\rThe Benefit/Burden Ratio is a variable in morality of certain medical procedures. Its use extends outside theology to the broader study of ethics.\r\rFurther Reference:\rNational Catholic Bioethics Center\r“A Catholic Guide to End-Of-Life Decisions”\rhttp://tinyurl.com/nmko5uq\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Bioethics",
                           @"twitterDef":@"the study of ethics related to medical and life issues",
                           @"definition":@"\rBioethics has become a specialization in the field of ethics due, in part, to the tremendous technological advances that enable new forms of treatment but that also raise new ethical questions in the practice of medicine.\r\rFurther Reference:\rInternet Encyclopedia of Philosophy\r“Bioethics”, http://tinyurl.com/amogdny\r\rAmerican Bioethics Advisory Commission\r “What is Bioethics?”\rhttp://tinyurl.com/k8sppee\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Baptism",
                           @"twitterDef":@"the Sacrament of regeneration by ritual cleansing with water",
                           @"definition":@"\rBaptism is a practice which Christianity inherited from the Jewish practice of the Mikvah, or ceremonial washing in Second Temple Period. John the Baptist practiced a derivation of this in his ministry, of which Jesus of Nazareth was a follower for some period of time. According to the book of Acts, John's baptism was still being practiced concurrently with Christian baptism.\r\rBaptism, along with Eucharist, is a Christian practice dating back to the earliest days of the Church. It one of the three Sacraments of Initiation. According to the consistent tradition of the Church, Baptism removes the stain of Original Sin, forgives actual sins, and brings about a spiritual rebirth. See “Sacrament”, “Forgiveness of Sins”, “Original Sin”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1213\rhttp://tinyurl.com/ykqqof\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Biblical Novellas",
                           @"twitterDef":@"the third of five sections in the Old Testament",
                           @"definition":@"\rNovellas in the Old Testament include short stories that encourage the Israelites during times of persecution. Though it is included in the book of Genesis, the story of Joseph is recognized as being a Novella. These stories likely contain embelishments of historical events. See the Scripture section in the Overview tab.\r\rFurther Reference:\rNew American Bible Revised Edition\r“Biblical Novellas”, http://tinyurl.com/p48w4cc\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Blasphemy",
                           @"twitterDef":@"a form of religious slander that reverses good and evil",
                           @"definition":@"\rBlasphemy is regarded as a sin that removes the possibility of forgiveness when directed against the Holy Spirit.\r\rGreek, βλασφημία (blasphemia) “injurous speech”\r\rFurther Reference:\rCatechism of the Catholic Church, 2148\rhttp://tinyurl.com/bczm8h7\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessing",
                           @"twitterDef":@"a pronouncement of Divine favor",
                           @"definition":@"\rThe concept of blessing has its origins in the Old Testament. Patriarchs speak blessings over their inheritors. The Psalmist praises Yahweh for various provisions in the form of blessings. In the New Testament, spiritual blessings are seen as being bestowed on the Church in Christ.\r\rHebrew, בְּרָכָה (berakah) “blessing”\r\rFurther Reference:\rCatechism of the Catholic Church, 2626\rhttp://tinyurl.com/jwoavzg\r\r\r",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Baptistry",
                           @"twitterDef":@"the place within a church used for baptism,\rusually referred to as a “font”",
                           @"definition":@"\rBaptistries are a later development in the Christian tradition. They are connected to the growth of the Church in the late 2nd and early 3rd centuries. See “Baptism”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1185\rhttp://tinyurl.com/p9382z5\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Basilica",
                           @"twitterDef":@"a church with a distinctive architecture or honorific status",
                           @"definition":@"\rThe Church inherited basilicas from the Roman Imperial administrative system. These buildings were essentially courthouses in which Roman administrators would hear cases. Such buildings were rectangluar in shape, with a circular apse enclosing one end of the nave. Later, the term came to be reservered for churches given special status by the Pope. Such basilicas are classified as either major or minor.\r\rGreek, βασιλικὴ στοά (basilike stoa) “royal chamber”\r\rFurther Reference:\rWikipedia, “Basilica”\rhttp://tinyurl.com/22rkeso\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Benedictus",
                           @"twitterDef":@"the Canticle of Zechariah contained within the Gospel of Luke 1:68-79",
                           @"definition":@"\rThis song is recorded as the extemporaneous prayer of Zechariah on the occassion of the birth of his son, John the Baptist. The Benedictus is a part of Morning Prayer in the Liturgy of the Hours. See “Liturgy of the Hours”.\r\rFurther Reference:\rJohn Paul II, General Audience, 10/1/2013\rhttp://tinyurl.com/ofm35wp\r\rWikipedia, “Benedictus”\rhttp://tinyurl.com/nvdk23a\r\r\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Bishop",
                           @"twitterDef":@"a successor to the Apostles who oversees a particular diocese",
                           @"definition":@"\rThe office of Bishop is the third order of clerics in the Catholic tradition. In the New Testament, Paul speaks of bishops in the church at Philippi together with deacons. In the second century there seems to have been a further development of the office. Local presbyters elected one of their own to a leadership position. This is reflected in the letters of Ignatius of Antioch (ca. A.D. 110). This form of having one bishop presiding over a local church, (known as “monoepiscopacy”) became the norm in every church by the end of the third century.\r\rBishops were later attached to larger areas of churches known as dioceses, which were Roman Imperial adminstrative distrcts created by the Emperor Diocletian. After the legalization of Christianity, the Church effectively inherited these districts in its own administration. See “Diocese”, “Monoepiscopacy”.\r\rGreek, ἐπίσκοπος (episcopos) “overseer”\r\rFurther Reference:\rCatechism of the Catholic Church, 888\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ba'al",
                           @"twitterDef":@"the son of El and most active of the gods in Canannite mythology",
                           @"definition":@"\rBa'al is a Semitic word for “Ruler”, “Husband”, or “Lord”. It became synonymous with a very popular Canaanite deity who was worshipped by ancient Israelites. According to to 2 Kings 23:4 an image of Ba'al was housed in the Temple before Josiah's Deuternomic reform. See “Deuteronomic History”.\r\rFurther Reference:\rEncyclopedia Mythica, “Ba'al”\rhttp://tinyurl.com/649dcgw\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Babel",
                           @"twitterDef":@"the Hebrew word meaning “confusion”;\rthe name of the tower in Genesis 11:1-9",
                           @"definition":@"\rAs an etiology, this story explains both how human language became divided as well as the geographic distribution of human populations. See “Etiology”.\r\rHebrew, בָּבֶל (babel)\r\rFurther Reference:\rCatechism of the Catholic Church, 57\rhttp://tinyurl.com/k6ljesq\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Babylon",
                           @"twitterDef":@"the empire that conquered the southern kingdom of Judah in 587 B.C.",
                           @"definition":@"\rThe Babylonians destroyed the Temple and took most of the residents of Jerusalem captive to Babylon, where they remained for 50 years. See “Exile”.\r\rFurther Reference:\rWikipedia, “Babylon” \rhttp://tinyurl.com/9tzwbf3\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ban",
                           @"twitterDef":@"the ancient Israelite practice of destroying possessions dedicated to Yahweh",
                           @"definition":@"\rWhen victorious over its enemies, Israel was to place certain possessions, including people, under the Ban and completely destroy them in order to devote them anew to Yahweh. Such is the case in Joshua 6 and 1 Samuel 15, which explicity commands the death of women and children. See “Yahweh”.\r\rHebrew, חֶרֶם (herem) “cursed”\r\rFurther Reference:\rWikipedia, “Ban”\rhttp://tinyurl.com/p7phypo\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Big Bang Theory",
                           @"twitterDef":@"the theory that the Universe expanded from an initial singularity",
                           @"definition":@"\rThe cosmological theory, first developed by Fr. George Lemaitre, that claims that the Universe began at an infintely small and dense point of matter, energy, space, and time which then expanded over the course of time to become the observable cosmos we see today. See “Creation”.\r\rFurther Reference:\rInternational Theological Commission,\r“Communion & Stewardshp”, 63\rhttp://tinyurl.com/c37p5\r\rWikipedia, “Big Bang”\rhttp://tinyurl.com/9nq4k\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessed Sacrament",
                           @"twitterDef":@"a reference to the Eucharist as Christ's body and blood, soul and divinity",
                           @"definition":@"\rThe Blessed Sacrament is a term most often associated with Eucharistic Adoration. See “Eucharist”.\r\rFurther Reference:\rCatechism of Catholic Church, 1374\rhttp://tinyurl.com/q6gyoc7\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Buddhism",
                           @"twitterDef":@"the philosophy and religion based on the teachings of Siddartha Gotama",
                           @"definition":@"\rBuddhism is based on the teachings after Siddartha's claim to enlightenmnet, (ca. 500 B.C.). He taught the Four Noble Truths:\r\r1. Life is Suffering.\r2. Attachement is the root of suffering.\r3. Suffering can be overcome.\r4. The Eightfold Path.\r\rBuddhism has had increasing contact with Christianity over the last 100 years. Perhaps the most famous point of intersection was between the Trappist monk, Thomas Merton and the Dalai Lama in 1968. Buddhism claims to be offer a lifestyle that can be adapted to anu religion, although this is contested due to some of its claims.\r\rFurther Reference:\rBuddhnet, “Basic Buddhism”\rhttp://tinyurl.com/69cl\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Byzantine Rite",
                           @"twitterDef":@"the liturgical rite of Eastern Orthodox and Catholic Churches",
                           @"definition":@"\rThe Byzantine Rite can be traced back as early as the 3rd century in Constantinople. Two of the more popular liturgies are the Liturgy of St. John Chrysostom and St. Basil the Great. See “Eastern Orthodox”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1203\rhttp://tinyurl.com/ndllues\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Breaking of the Bread",
                           @"twitterDef":@"a biblical phrase used to describe the Agape-Eucharist meal",
                           @"definition":@"\rThis phrase first occurs in the Acts 2:46 as part of a description of the daily lives of the first Christians.\r\rFurther Reference:\rCatechism of Catholic Church, 1329\rhttp://tinyurl.com/q6gyoc7\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessed Virgin Mary",
                           @"twitterDef":@"a liturgical title of the Virgin Mary",
                           @"definition":@"\rThe title Blessed Virgin Mary is based, in part, on the prediction of Mary in the Gospel of Luke 1:46: “From now on, all generations will call me blessed”. The emergence of Marian devotion in the Catholic tradition is, according the theologian, Elizabeth Johnson, evidence of humanity's desire to know the feminine aspect of God:\r\r“The Marian phenomenon is to be attributed to humanity's desire for a maternal, mild, life-giving gestalt of God. The whole history of religions demonstrates this need, they affirm, and the original gospel could insinuate itself into its surrounding cultural milieu only by incorporating some feminine imagery. As Mary was the first human being to give a full response to God's word, so too as Mother of God she becomes the 'revelation of the feminine-maternal side of the being of God.'”\r-Johnson, 519\r\rFurther Reference:\rCatechism of the Catholic Church, 971\rhttp://tinyurl.com/mtfzewa\r\rSr. Elizabeth Johnson\r“Mary and the Female Face of God”\rhttp://tinyurl.com/q42wh5b\r\r\r",
                           @"category":@"Systematic"}];
    
    /*
     Word *bathshebaWord = 
     bathshebaWord.@"name":@"Bathsheba";
     bathshebaWord.@"definition":@"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
     */
    
    [TAWord wordWithDict:@{@"name":@"Bible",
                           @"twitterDef":@"the collection of the Old and New Testaments",
                           @"definition":@"\rThe collection of the Old and New Testaments regarded as canonical and inspired within Catholicism. Historically, the Catholic canon of Scripture has included the Deuterocanonical books while Protestant bibles have excluded them. The Bible is a primary source for theology. See the Scripture section of the Overview tab.\r\rGreek, βιβλία (biblia) “scrolls”\r\rFurther Reference:\rUnited States Conference of Catholic Bishops\r“Books of the Bible”\rhttp://tinyurl.com/8tfyv5g\r\rWikipedia, “Bible”\rhttp://tinyurl.com/lkugd\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Breviary",
                           @"twitterDef":@"a book of the Liturgy of the Hours",
                           @"definition":@"\rBreviaries are books that contain the prayers and readings of the Divine Office. See “Liturgy of the Hours”.",
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
    
    
    
    
    
    
    ////////////////////////////////////C
    
    [TAWord wordWithDict:@{@"name":@"Catechumen",
                           @"twitterDef":@"a person training for Baptism",
                           @"definition":@"\rCatechumens have been recognized as a distinct group since the earliest days of the Church.\r\rGreek, κατηχούμενος (katechoumenos) “one who hears”\r\rFurther Reference:\rWikipedia, “Catechumen”\rhttp://tinyurl.com/lqhsomc\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Candidates",
                           @"twitterDef":@"non-Catholics who have received Baptism in preparation for Confirmation and Eucharist",
                           @"definition":@"\rCandidates are generally composed of the baptized who convert to Catholicism from another Christian tradition.\r\rFurther Reference:\rUnited States Confernce of Catholic Bishops\r“Rite of Christian Initiation of Adults”\rhttp://tinyurl.com/mb2cv93\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cantor",
                           @"twitterDef":@"the leader of liturgical singing",
                           @"definition":@"\rCantors are an inheritance of the Church from Judaism. In conjuction with the Choir, they are responsible for leading the congregation in the singing of various responses in the Liturgy:\r\rProvision should be made for at least one or two properly trained singers, especially where there is no possibility of setting up even a small choir. The singer will present some simpler musical settings, with the people taking part, and can lead and support the faithful as far as is needed. The presence of such a singer is desirable even in churches which have a choir, for those celebrations in which the choir cannot take part but which may fittingly be performed with some solemnity and therefore with singing.\r-Instruction, 21\r\rFurther Reference:\rVatican II, “Instruction on Music in the Liturgy”\rhttp://tinyurl.com/l35djx\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cardinal Virtues",
                           @"twitterDef":@"justice, prudence, temperance, fortitude",
                           @"definition":@"\rThe four Cardinal Virtues are first mentioned by Plato in the “Republic”, Book IV as being necessary to cultural flourishing. According to the teaching of the Church, the Cardinal Virtues are rooted in the Theological Virtues of faith, hope, and love. See “Theological Virtues”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1804\rhttp://tinyurl.com/pd2yc32\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Catechism",
                           @"twitterDef":@"a systematized summary of Catholic teaching regarding faith and morals",
                           @"definition":@"\rPope Paul VI called for a new Catechism to be produced from various local catechisms throughout the 20th century. The result, published under John Paul II in 1992 and revised in 1994, was the Catechism of the Catholic Church.\r\rFurther Reference:\rThe Catechism of the Catholic Church, 18\rhttp://tinyurl.com/nxgcz89\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Catechist",
                           @"twitterDef":@"a certified teacher of the Faith",
                           @"definition":@"\rCatechists are usually those who teach in religious education programs, but the title applies especially to Bishops, whose function it is to teach the Faith.\r\rFurther Reference:\rCongregation for the Clergy\r“General Directory on Catechesis”\rhttp://tinyurl.com/tgju\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Catechesis",
                           @"twitterDef":@"a basic education in the Faith in a systematized and organic manner",
                           @"definition":@"\rCatechesis is based on the idea of handing down beliefs and practices to others by word of mouth. It is essential to mature Christian spirituality. In the Catholic tradition, it normally begins with children in preparation for Confirmation. The catechesis for adults is called the Rite of Christian Initiation of Adults (RCIA). See “Confirmation”.\r\rGreek, κατήχησις (katechesis) “instruction by word of mouth”\r\rFurther Reference:\rCatechism of the Catholic Church, 18\rhttp://tinyurl.com/nxgcz89\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Censer",
                           @"twitterDef":@"a vessel used for burning incense",
                           @"definition":@"\rCensers are not unique to Catholicism, but rather are used throughout every major, global religious tradition. In Catholicism, they hold the burning incense which symbolizes the prayers of the congregation ascending to God; also called a “Thurible”.\r\rFurther Reference:\rWikipedia, “Censer”\rhttp://tinyurl.com/p4c7brx\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Casuistic Law",
                           @"twitterDef":@"a type of law derived from individual cases rather than universal norms",
                           @"definition":@"\rCasuistic law is contrasted with apodictic law. The latter is exemplified by the 10 Commandments, while the former is found in the Covenant Code of Exodus 21-23. See “Apodictic Law”, “Covenant Code”.\r\rFurther Reference:\rWikipedia, “Casuistry”\rhttp://tinyurl.com/2pntmh\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cappadocian Fathers",
                           @"twitterDef":@"St. Basil the Great, St. Gregory of Nyssa, and\rSt. Gregory of Nazianzus",
                           @"definition":@"\rThese three fathers occupy a special place in the Eastern Orthodox tradition. They were influential in converting many Arians to orthdox belief.\r\rFurther Reference:\rWikipedia, “Cappadocian Fathers”\rhttp://tinyurl.com/zn8yn\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Catholic Social Teaching",
                           @"twitterDef":@"the teaching of the Church which applies the principles of justice to society",
                           @"definition":@"\rAccording to Pope Paul VI's encyclical, “Populorum Progressio”, Catholic Social Teaching is essential to authentic evangelization. It consists of principles of reflection, criteria of judgment, and directives for action. See “Social Justice”, “Signs of the Times”.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 85. http://tinyurl.com/o6scpuy\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Commutative Justice",
                           @"twitterDef":@"the aspect of justice which emphasizes obligations between individuals",
                           @"definition":@"\rCommutative Justice is identified in Catholic teaching as being the foundational aspect of justice that is essential for its contributive and distributive aspects.\r\r“Commutative justice calls for fundamental fairness in all agreements and exchanges between individuals or private social groups. It demands respect for the equal human dignity of all persons in economic transactions, contracts, or promises. For example, workers owe their employers diligent work in exchange for their wages. Employers are obligated to treat their employees as persons, paying them fair wages in exchange for the work done and establishing conditions and patterns of work that are truly human.”\r-Economic Justice For All, 69\r\rSee “Justice”\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Economic Justice For All”\rhttp://tinyurl.com/75hnlx3\r\rCatechism of the Catholic Church, 2411\rhttp://tinyurl.com/6y3q4\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Contributive Justice",
                           @"twitterDef":@"the aspect of justice that emphasizes the obligation of individuals toward society",
                           @"definition":@"\rContributive justice is met when the individual fulfills his responsbilities to the larger society.\r\r“Social justice implies that persons have an obligation to be active and productive participants in the life of society and that society has a duty to enable them to participate in this way. This form of justice can also be called 'contributive', for it stresses the duty of all who are able to help create the goods, services, and other nonmaterial or spiritual values necessary for the welfare of the whole community. In the words of Pius XI, 'It is of the very essence of social justice to demand from each individual all that is necessary for the common good.' Productivity is essential if the community is to have the resources to serve the well-being of all.”\rEconomic Justice For All, 71\r\rSee “Justice”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Economic Justice For All”\rhttp://tinyurl.com/75hnlx3\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Canon",
                           @"twitterDef":@"the Greek word for “measuring stick” used to refer to a criterion or standard",
                           @"definition":@"\rSaints are canonized by the Church as standards by which Catholics may judge their lives. The Bible is referred to as the canon of the Scriptures that provide criteria for faith and practice. The earliest process at canonization of Scripture is the Muratorian Canon. In the Christian Tradition, the canon of Scripture is closed while the canon of Saints is open, and continues to grow as more Saints are canonized. See “Muratorian Canon”. See “Sacred Scripture” in the Overview tab.\r\rGreek, κανών (kanon)\r\rFurther Reference:\rCatechism of the Catholic Church, 120\rhttp://tinyurl.com/kvc3tvq\r\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/2gb5dm\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Catholic",
                           @"twitterDef":@"the quality of being universal in nature",
                           @"definition":@"\rCatholic describes the characteristic of the Church as being universal. It is one of the four marks of the Church. The term is first used by Ignatius of Antioch in his Letter to the Smyrneans ca. A.D. 110. Cyril of Jerusalem taught that the Church is “universal” in the senses that it is global in scope and differentiates the Church founded by Christ through the Apostles from heretical groups. St. Vincent of Lerins taught that Catholic was to be understood according to the rule of universality, antiquity, and consent.\r\r“We shall follow universality if we confess that one faith to be true, which the whole church throughout the world confesses; antiquity, if we in no wise depart from those interpretations which it is manifest were notoriously held by our holy ancestors and fathers; consent, in like manner, if in antiquity itself we adhere to the consentient definitions and determinations of all, or at the least of almost all priests and doctors.”\r\rGreek, καθολικός (katholikos) “according to the whole”\r\rFurther Reference:\rCatechism of the Catholic Church, 830\rhttp://tinyurl.com/c5m8w5j\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Celibacy",
                           @"twitterDef":@"a lifestyle of sexual abstinence",
                           @"definition":@"\rCelibacy is a vocation that is trans-cultural and trans-historical; people from various religious and philosophical traditions have led celibate lifestyles for varying reasons. In the Catholic tradition, celibacy is a gift and an escatological sign of the Kingdom of God. In Matthew 19, Jesus declares that those who can accept the lifestyle should do so. The current discipline of the Latin Rite is to only ordain celibate men to the priesthood, while Eastern Rite and Eastern Orthodox churches may ordain married men.\r\rFurther Reference:\rCatechism of the Catholic Church, 1579\rhttp://tinyurl.com/4hs6lso\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Chastity",
                           @"twitterDef":@"the respectful integration of dignity within relationships",
                           @"definition":@"\rChastity is a term that has to do with more than simply virginity. It is the appropriate expression of dignity within one's station in life (e.g. marriages are called to be chaste). It informs the expression of sexuality in the recognition that all persons possess dignity. Chastity is the opposite of the objectification within sexuality. See “Dignity of the Human Person”, “Sexuality”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2337\rhttp://tinyurl.com/cz1w\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Christ",
                           @"twitterDef":@"an eschatological title of Jesus meaning “annointed one”",
                           @"definition":@"\rWhile Christ was originally a royal title, given to the annointed king of Israel/Judah, by the 1st century it had become a term associated with the Messiah who would usher in the End of Days and inaugurate the Messianic Age in which Israel's enemies would be defeated, peace would be established on the earth, and the righteous raised to Eternal Life. According to Acts 2:36, God installed Jesus as the Christ by virtue of his resurrection.\r\rGreek, Χριστός (christos) “annointed one”\r\rFurther Reference:\rCatechism of the Catholic Church, 436\rhttp://tinyurl.com/neqlbg7\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Christ of Faith",
                           @"twitterDef":@"the term for the risen Jesus that emphasizes his glorified existence",
                           @"definition":@"\rThe term Christ of Faith is often contrasted with the Jesus of History.\r\rFurther Reference:\rAmerica, “The Jesus Controversy”\rhttp://tinyurl.com/oh6rl7g\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Christology",
                           @"twitterDef":@"the study of the person and nature of Christ",
                           @"definition":@"\rChristology takes as its point of departure the Chalcedonian Definition of the two natures and hypostatic union in Jesus. Biblical criticism of the New Testament has distinguished between “High” and “Low” Christology, based on an emphasis on the divinity and humanity of Christ, respectively. See “Hypostesis”, “Chalcedonian Definition”.\r\rFurther Reference:\rInternational Theological Commission\r“The Consciousness of Christ”\rhttp://tinyurl.com/nl6bhyf\r\rWikipedia, “Christology”\rhttp://tinyurl.com/2b79fj\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Chalcedonian Definition",
                           @"twitterDef":@"the dogmatic truth that Jesus Christ is one person with a divine and human nature",
                           @"definition":@"\rThe Council of Chalcedon taught that Jesus Christ is:\r\r“One and the Same Christ, Son, Lord, Only-begotten; acknowledged in Two Natures unconfusedly, unchangeably, indivisibly, inseparably; the difference of the Natures being in no way removed because of the Union, but rather the properties of each Nature being preserved, and concurring into One Person and One Hypostasis”.\r\rSee “Chalcedon” in the Historcal section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 468\rhttp://tinyurl.com/37wuaux\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Church",
                           @"twitterDef":@"the People of God",
                           @"definition":@"\rThe community belonging to the Lord, who have been called out to follow him. The Church is the community centered on the belief that Jesus of Nazraeth is the divine Savior of the world. See “Ecclesia”.\r\rFurther Reference:\rCatechism of the Catholic Church, 751\rhttp://tinyurl.com/ojrdr53\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"College of Bishops",
                           @"twitterDef":@"the group of the successors of the Apostles",
                           @"definition":@"\rThe College of Bishops is a concept emphasized by Vatican II. See “Apostle”.\r\rFurther Reference:\rCatechism of the Catholic Church, 880-887\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Compline",
                           @"twitterDef":@"the traditional word for Night Prayer",
                           @"definition":@"\rSee “Night Prayer”.\r\rFurther Reference:\rWikipeida, “Compline”\rhttp://tinyurl.com/c739hq\r\r\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Communicatio Idiomatum",
                           @"twitterDef":@"the interexchange of Christ's divine and human natures",
                           @"definition":@"\rThe idea of the Communicatio Idiomatum means that the properties of the human Jesus can also be predicated of the Logos and vice versa. See “Chalcedonian Definition”.\r\rFurther Reference:\rWikipedia, “Communicatio Idiomatum”\rhttp://tinyurl.com/nn83smb\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Communion of Saints",
                           @"twitterDef":@"the unity among believers that exists in Christ",
                           @"definition":@"\rThe Communion of Saints is an article of Faith dating to the earliest days of the Church. It is specifically mentioned in the Apostle's Creed.\r\rFurther Reference:\rCatechism of the Catholic Church, 946\rhttp://tinyurl.com/pkxuudx\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Confession",
                           @"twitterDef":@"the contrite acknowledgement of sins",
                           @"definition":@"\rConfession is a required for forgiveness. It also is another name for the the Sacrament of Penance. See “Penance”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1424\r http://tinyurl.com/l7xon9e\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Confirmation",
                           @"twitterDef":@"the Sacrament of Christian Maturity in the Holy Spirit",
                           @"definition":@"\rThroughout the New Testament, the Spirit is given to empower both Jesus and his followers to witness to the Gospel. In the book of Acts, it is seen as a distinct movement of grace apart from Baptism. The Council of Trent established Confirmation as one of the seven Sacraments. Confirmation has been administered at various ages throughout the history of the Church. The 1983 Code of Canon Law established the age of discretion as the time for Confirmation. However, the last 100 years have seen greater discussion of the benefits of Confirmation administered to more mature believers. Fr. Francis Buckly emphasized this when he stated:\r\r“We do not encourage teenage marriages, or ordinations, precisely because these sacraments have enduring effects, while the teen-ager is notoriously unstable. Few at that age are capable of making a lasting self-dedication. Fewer still can do so before reaching adolescence. Is the effect of confirmation less lasting or less important than the effects of marriage or ordination? True, the consequences may not be so serious for the individual in terms of invalidating a subsequent marriage, but what are the consequences for the Church when the majority of those confirmed go through a routine action because it is expected of them at a certain age or in a certain grade of school? Perhaps much of the apathy of the laity in even the post-conciliar Church is traceable to a latent resentment of a 'conveyor-belt Christianity,' in which personal choice and commitment has been neglected. More and more this underlying hostility is rising to the surface and finding expression as college students and other young adults feel cheated of an opportunity to declare themselves firmly for Christ by an act which shapes their future indelibly and permanently.”\r-Buckly, 664\r\rSee “Sacrament”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1285\rhttp://tinyurl.com/lcgw5p7\r\rRev. Francis Buckley\r“Note: What Age for Confirmation?”\rhttp://tinyurl.com/oth2zfo\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Conversion",
                           @"twitterDef":@"the process of spiritual transformation",
                           @"definition":@"\rAccording to the teaching of the Church, conversion is the “first work of grace of the Holy Spirit”. See “Holy Spirit”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1989\rhttp://tinyurl.com/yaua7cc\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Cosmological Argument",
                           @"twitterDef":@"an argument for God's existence, based on Aristotle's First Cause argument",
                           @"definition":@"\rOne of the classical arguments for the existence of God, based on the First Cause argument. See “Big Bang Theory”\r\rFurther Reference:\rSee Stanford Encyclopedia of Philosophy, “Cosmological Argument”\rhttp://tinyurl.com/8xkm72n\r\rThomas Aquinas, Summa Theologica, ST,Ia,q.2a.3co. http://tinyurl.com/my5bedq\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Contemplation",
                           @"twitterDef":@"a form of silent and meditative prayer",
                           @"definition":@"\rThis form of prayer is mystical in that it is a gaze of faith that enables a more intense communion with the Trinity. See “Prayer”, “Trinity”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2709\rhttp://tinyurl.com/n937nqh\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Chalice",
                           @"twitterDef":@"the litugical name for a cup used during the Eucharist",
                           @"definition":@"\rThe 2011 new translation of the Mass refers to the cup (still called such in the Memorial Acclamation) as a chalice.\r\rFurther Reference:\rWikipedia, “Chalice”\rhttp://tinyurl.com/oqzrgjk\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cherubim",
                           @"twitterDef":@"a class of angelic figures depicted in the Bible",
                           @"definition":@"\rCherubim (plural of “cherub”) are found from as early as Genesis 3, where one guards the Tree of Life. They also feature prominently in some prophetic and apocalyptic literature.\r\rFurther Reference:\rRaanan Eichler\r“Cherub: A History of Interpretation”\rhttp://tinyurl.com/p5g3owo\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Conscience",
                           @"twitterDef":@"that which prompts us to do good and avoid evil",
                           @"definition":@"\rAccording to Church teaching, all people are morally obligated to follow the dictates of their consciences. However, the subjective nature of the conscience does not guarantee the objective correspondence with moral truth. See “Morality”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1776\rhttp://tinyurl.com/n6fjppn\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Consecration",
                           @"twitterDef":@"the act of setting someone or something\rapart for special service",
                           @"definition":@"\rConsecration usually takes the form of the consecration of the Eucharistic elements of bread and wine. The term is also used to describe the ordination to Holy Orders or dedication to Divine service. See “Eucharist”, “Holy Orders”.\r\rFurther Reference:\rWikipedia, “Consecration”\rhttp://tinyurl.com/p7vdt94\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Consubstantial",
                           @"twitterDef":@"having the same substance",
                           @"definition":@"\rThis term is the Latin translation of the Greek word “homoousious”. See “Homoousious”.\r\rFurther Reference:\rCatechism of the Catholic Church, 242\rhttp://tinyurl.com/4tymjt\r\r\r",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Contrition",
                           @"twitterDef":@"repentance from sin and intention for conversion",
                           @"definition":@"\rContrition has been traditionally been categorized as perfect and inperfect. See “Confession”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1451\rhttp://tinyurl.com/l7xon9e\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Concelebration",
                           @"twitterDef":@"the celebration of the Mass by two or more priests",
                           @"definition":@"\rConcelebration is reserved for special celebrations.\r\rFurther Reference:\rWikipedia, “Concelebration”\rhttp://tinyurl.com/mlkeb3f\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Corpus Christi",
                           @"twitterDef":@"the liturgical feast that celebrates the Real Presence of Christ in the Eucharist",
                           @"definition":@"\rCorpus Christi is a feast day for the Church.\r\rFurther Reference:\rWikipedia, “Corpus Christi”\rhttp://tinyurl.com/yt7hu4\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Crucifixion",
                           @"twitterDef":@"a form of death by hanging that induces asphyxiation",
                           @"definition":@"\rThe Romans aquired the practice of crucifixion from the Carthaginians. It was reserved for Roman non-citizens.\r\rFurther Reference:\rWikipedia, “Crucifixion of Jesus”\rhttp://tinyurl.com/b474qw\r\r\r",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Creation",
                           @"twitterDef":@"that which exists contingently;\rthe Universe",
                           @"definition":@"\rCreation has been traditionally understood as ocurring out of nothing (ex nihilo). Recent scientific discoveries have led theologians such as John Haught to emphasize the perpetual aspect of the unfolding of an evolutionary universe (creatio continua). From a metaphysical perspective, Creation is contingent upon the creative act of God, Who is not contingent but necessary. Pope Benedict XVI referred to this aspect of Creation in his Address to the Pontifical Academy of Sciences in 2008:\r\r“In order to develop and evolve, the world must first be, and thus have come from nothing into being. It must be created, in other words, by the first Being who is such by essence. To state that the foundation of the cosmos and its developments is the provident wisdom of the Creator is not to say that creation has only to do with the beginning of the history of the world and of life. It implies, rather, that the Creator founds these developments and supports them, underpins them and sustains them continuously.”\r\rPope Francis has stated that the concept of Creation is one that implies an act of love:\r\r“In the Judaeo-Christian tradition, the word 'creation' has a broader meaning than 'nature', for it has to do with God’s loving plan in which every creature has its own value and significance. Nature is usually seen as a system which can be studied, understood and controlled, whereas creation can only be understood as a gift from the outstretched hand of the Father of all, and as a reality illuminated by the love which calls us together into universal communion.”\r-Laudato Si, 76\r\rTheologians such as Sr. Ilia Delio have sought to ground the theology of Creation within the larger dynamic of Trinitarian life:\r\r“Creation, therefore, is not a mere external act of God, an object on the fringe of divine power; rather, it is rooted in the self-diffusive goodness of God's inner life and emerges out of the innermost depths of trinitarian life. Since creation emanates out of and is a limited expression of divine goodness, we may think of creation as unfolding 'within' the trinitarian relations of divine love rather than being radically separate from God...”\r-Delio, 286\r\rFurther Reference:\rPope Benedict XVI\rAddress to the Pontifical Academy of Sciences, 2008\rhttp://tinyurl.com/nlbzxvm\r\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rCatechism of the Catholic Church, 280\rhttp://tinyurl.com/6kvj6\r\rSr. Elia Delio\r“Is Creation Eternal?”\rhttp://tinyurl.com/nqbmu89\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Creationism",
                           @"twitterDef":@"the belief that God created the world as described in the book of Genesis",
                           @"definition":@"\rThe belief that God created the earth and human beings directly, with no biological predecessors as described in the book of Genesis. A 2009 conference on Evolution and Theolgoy sponsored by the Vatican did not included Creationsm proponents. See “Evolution”.\r\rFurther Reference:\rCatholic News Service\r“Vatican Evolution Congress To Exclude Creationism, Intelligent Design”\rhttp://tinyurl.com/64bf49\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Creed",
                           @"twitterDef":@"a statement of faith or belief",
                           @"definition":@"\rThis word is traditionally used to refer to the historical creeds of the Church, most notably the Apostle's and Nicene creed. It may also indicate a personal belief. See “Apostle's Creed”, “Nicene Creed”. See the Creeds section of the Overview tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 187\rhttp://tinyurl.com/mo3f24x\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Call Narrative",
                           @"twitterDef":@"a literary form used throughout the Bible in which a prophet is called by God",
                           @"definition":@"\rNorman Habel has proposed 6 characteristics of call narratives in the Hebrew Bible:\r\r1. Divine Confrontation\r2. Introductory Word\r3. Commission\r4. Objection\r5. Reassurance\r6. Sign\r\rThe stories of Moses, Jeremiah, and Isaiah all involve a call narrative. Other famous call narratives (such as that of Samuel) have variations of these elements.\r\rFurther Reference:\rNorm Habel\r“The Form and Signficance of Call Narratives”\rhttp://tinyurl.com/ncxlj9a\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Charism",
                           @"twitterDef":@"a spiritual gift that results from the experience of the Holy Spirit",
                           @"definition":@"\rAccording to the Apostle Paul, spiritual gifts accompany the Christian experience of the Holy Spirit. See 1 Corinthians 12.\r\rGreek, χαρίσμa (charisma) “gifts”.\r\rFurther Reference:\rWikipedia, “Charism”\rhttp://tinyurl.com/kqw3n6\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Chesed",
                           @"twitterDef":@"a Hebrew word meaning “loving kindness”",
                           @"definition":@"\rChesed occurs predominantly in the Psalms, where it is used to refer to Yahweh's covenant faithfulness. See “Agape”.\r\rHebrew, חֶסֶד (chesed)\r\rFurther Reference:\rWikipedia, “Chesed”\rhttp://tinyurl.com/9b59jr\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Circumcision",
                           @"twitterDef":@"the ritual cutting of the male foreskin",
                           @"definition":@"\rCircumcision is the essential sign of the covenant according to the Priestly Source in Genesis 17. See “Priestly Source”.\r\rFurther Reference:\rWikipedia, “Circumcision”\rhttp://tinyurl.com/6yfbn\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Codex",
                           @"twitterDef":@"a collection of manuscripts",
                           @"definition":@"\rVarious codices make up the biblical manuscript tradition. One of the more famous is Codex Sinaiticus, the oldest complete manuscript of the New Testament. See “Manuscript”.\r\rFurther Reference:\rCodex Sinaiticus\rhttp://tinyurl.com/5fg98l\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Covenant",
                           @"twitterDef":@"a sacred contract or agreement",
                           @"definition":@"\rCovenants are used throughout the Bible. They refer to the relationship between Yahweh and Noah and all living creatures in Genesis 9; between God and Abraham in Genesis 15 and 17; between Yahweh and all Israel in Exodus 25; and between God and humanity in the Gospels.\r\rFurther Reference:\rCatechism of the Catholic Church, 56, 59, 62, 73 http://tinyurl.com/pesbbq3\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Covenant Code",
                           @"twitterDef":@"the body of legal codes found in Exodus 21-23",
                           @"definition":@"\rAlso known as the “Book of the Covenant”, the Covenant Code contains various casuistic laws that were likely independent but later connected to the Elohist account of the covenant with Moses. See “Casuistic Law”, “Elohist Source”.\r\rFurther Reference:\rWikipedia, “Covenant Code”\rhttp://tinyurl.com/qxa25wj\r\r\r",
                           @"category":@"Biblical"}];
    /*
    [TAWord wordWithDict:@{@"name":@"Church/State",
                           @"twitterDef":@"a philosophical, theological, and legal dichotomy of religious and political entities",
                           @"definition":@"\rThe dichotomy used to express philosophical, theological, and legal differences in religious and political entities.\r\rFurther Reference:\r\r\r",
                           @"category":@"Cultural"}];
    */
    /*
    
    [TAWord wordWithDict:@{@"name":@"Colonialism",
                           @"twitterDef":@"the practice of a country claiming foreign lands\ras its own",
                           @"definition":@"\rThe practice of settling foreign lands.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
     */
     
    [TAWord wordWithDict:@{@"name":@"Common Good",
                           @"twitterDef":@"the social condition in which all people are allowed to reach their full development",
                           @"definition":@"\rThe Common Good is not a strategy to obtain the most good for the most people. Rather, it stems from the Digntity of the Human Person. It the goal of social justice, and that which relativizes all aboslute claims to individual rights. See “Dignity of the Human Person”, “Social Justice”.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 164. http://tinyurl.com/455cdw3\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Compatiblism",
                           @"twitterDef":@"the idea that human freedom is compatible with determinism",
                           @"definition":@"\rThe belief that human freedom is compatible with deterministic elements of human experience.\r\rFurther Reference:\rStandford Encyclopedia of Philosophy, “Compatibilism”. http://tinyurl.com/l3aj5j\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Concupiscence",//added 8.9.2015
                           @"twitterDef":@"an intense form of human desire that is contrary to reason",
                           @"definition":@"\rAccording to the teaching of the Church affirmed at the Council of Trent, Concupiscence is a consequence of Original Sin along with suffering and death. While the state of Original Sin is removed in Baptism, Concupiscence is not. See “Baptism”, “Original Sin”. See “Trent” in the Church History section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 2515\rhttp://tinyurl.com/m3mdvmt\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Council",
                           @"twitterDef":@"a gathering of the Church to settle disputed matters of Christian teaching",
                           @"definition":@"\rThe prototypical council is depicted in Acts 15 in which the Church determines the requirements for Gentile membership. Later councils were local or regional; ecumenical councils, or councils of the whole Church, began in A.D. 325 at the behest of the Emperor Constantine in the city of Nicea. Seven such ecumenical councils are recognized by both the Eastern and Western Church. See the Councils section of the Overview tab and the Historical section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 884\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Cybertheology",
                           @"twitterDef":@"the intelligence of faith in the era of the Internet and World Wide Web",
                           @"definition":@"\rAccording to Fr. Antonio Spadaro, the term “cybertheology” refers to the intelligence of faith in the era of the Internet and World Wide Web, which arises from the recognition that, as technology changes ways of thinking, theology necessarily changes as well.\r\rFurther Reference:\r“Cybertelogia”, http://tinyurl.com/kuxll8z\r\r\r",
                           @"category":@"Systematic"}];
    
    ///////////////////////////D

    
    
    [TAWord wordWithDict:@{@"name":@"Day of Atonement",
                           @"twitterDef":@"the annual day in Judaism on which sins are forgiven",
                           @"definition":@"\rSee “Yom Kippur”.\r\r\r",
                           @"category":@"Biblical"}];
    
   // [TAWord wordWithDict:@{@"name":@"Deanery",
                           //@"twitterDef":@"a smaller geographical area within a diocese",
                           //@"definition":@"\rDeaneries are made up of both clergy and lay representatives from various parishes....\r\rFurther Reference:\r\r\r",
                           //@"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Dehumanization",
                           @"twitterDef":@"the process of objectifying a human being, violating his or her dignity",
                           @"definition":@"\rOne theory of dehumanization claims that it can take one of two forms: animalistic or mechanistic. The former denies uniqely human characteristics (such as civility, morality, rationality). The latter denies characteristics of human nature that are fundamental but not unique to humans (such as emotional responsiveness, individuality, interpersonalism). See “Human Person”.\r\rFurther Reference:\r“Dehumanization: An Integrative Review”\rhttp://tinyurl.com/okhuczt\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Deontology",
                           @"twitterDef":@"the study of ethics from the framework of moral duties in the form of rules and laws",
                           @"definition":@"\rDeontology is a theory of morality based on what we ought to do in contrast to virtue theories, which based on the kinds of persons we should be.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Deontological Ethics”\rhttp://tinyurl.com/ya6dgay\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Dignity of the Human Person",
                           @"twitterDef":@"the sacred status of human beings derived from their creation in the Image of God",
                           @"definition":@"\rHuman dignity is based on the understanding that all people are loved unconditionally and universally and called to be in loving relationship with the Creator. Human dignity is fulfilled in this vocation and is essential to human development. It is the first principle of Catholic Social Teaching in which all others are based. See “Catholic Social Teaching”, “Human Person”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1700\rhttp://tinyurl.com/kaz99um\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Disciple",
                           @"twitterDef":@"a follower of Jesus",
                           @"definition":@"\rAccording to the Gospels, Jesus had numerous disciples; Luke records about 70. The Apostles were chosen from this larger group of disciples. In the Catholic Tradition, all Christians are called to be disciples. See “Apostles”.\r\rFurther Reference:\rFelix Just\r“Disciples and Apostles in the New Testament”\rhttp://tinyurl.com/mzcbt37\r\r\r",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Distributive Justice",
                           @"twitterDef":@"the type of justice which emphasizes society's responsibilities to the individual",
                           @"definition":@"\rDistributive justice is an essential aspect of social justice. It is fulfilled when society meets its obligations to the individual based on his or her contribution and need.\r\r“Distributive justice requires that the allocation of income, wealth, and power in society be evaluated in light of its effects on persons whose basic material needs are unmet. The Second Vatican Council stated: 'The right to have a share of earthly goods sufficient for oneself and one's family belongs to everyone. The fathers and doctors of the Church held this view, teaching that we are obliged to come to the relief of the poor and to do so not merely out of our superfluous goods.' Minimum material resources are an absolute necessity for human life. If persons are to be recognized as members of the human community, then the community has an obligation to help fulfill these basic needs unless an absolute scarcity of resources makes this strictly impossible. No such scarcity exists in the United States today.”\r-Economic Justice For All, 70.\r\rSee “Justice”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Economic Justice For All”\rhttp://tinyurl.com/75hnlx3\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Divine Liturgy",
                           @"twitterDef":@"the name of the Eucharistic celebration in the Byzantine liturgical tradition",
                           @"definition":@"\rThe Liturgy of St. John Chrysostom is the litugry used most often in the Byzantine tradition, while other liturgies are used on various special occassions.\r\rFurther Reference:\rGreek Orthodox Archdiocese in America\r“The Divine Liturgy of Saint John Chrysostom”\rhttp://tinyurl.com/nmkpnt8\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Divine Revelation",
                           @"twitterDef":@"the act of God's Self-Communication",
                           @"definition":@"\rSince God is ultimately Mystery, God must reveal God's Self to human beings. In the Old Testament, Revelation usually occurs in the context of a Theophany. Divine Revelation was treated extensively at Vatican II in the Dogmatic Constitution on Divine Revelation, Dei Verbum. Increasingly, theology is being invited to discern what contribution that Divine Revelation makes to a scientifically-informed worldview shaped by modern understandings of the role of historicity. In discussing Pope John Paul II's understanding of Divine Revelation in his encyclical “Fides et Ratio”, Fr. Thomas Guarino has emphasized the importance of context:\r\r“In the encyclical, God’s self-manifestation is understood as an eternal and unchangeable word to humanity. It is a word that has been crystallized in the Church, under the divine guidance of the Holy Spirit, into various dogmatic and doctrinal statements. These assertions, although cast in imperfect human formulations and open to legitimate development, are fundamentally unchangeable. Any revelationally appropriate philosophy, capable of performing the officium congruum, must be able to defend the possibility of these universal, continuous, and objective truths. Hence, the encyclical’s profound reliance on metaphysics. But what if revelation is differently conceived?\r\rA different understanding of God’s self-communication would place far greater weight on the historicity of truth, the perspective of the interpreting subject and human embeddedness in particular socio-cultural-linguistic worlds; in other words, on all of the epistemological dimensions that received scant emphasis in the encyclical. In this view, revelation would be more Heideggerian and epiphanic in kind, moving ultimately within the fundamental horizon of immersed historicity rather than that of perduringly disclosed being. It would be a notion of revelation allowing for a more profound interplay between lēthē and alētheia, between presence and absence. It would also call into question — or at least significantly reinterpret in accordance with the strictures of historically situated thought — the traditional hallmarks of Catholic doctrine. Revelation would be seen less as an abiding word crystallized in certain doctrinal statements requiring universality and continuity as essential benchmarks and more as eruptive manifestations of truthfulness unveiled before humanity, distinctly differing from age to age and from culture to culture. Continuity of doctrine would not mean that the same doctrinal meaning could be found in every period. It would mean, rather, that the same text, in this case a doctrinal statement, would be subject to continuous interpretation in various epochs. There would certainly be continuity. But it would be a formal continuity provided by history and tradition, a continuity of the interpreting act in every generation rather than a material continuity, a continuous preservation of meaning, organically developed, from age to age.”\r-Guarino, 698\r\rSee “Theophany”, “Dei Verbum”. See the Scripture section in the Overview tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 638-655\rhttp://tinyurl.com/nrt2f6g\r\rRev. Thomas Guarino\r“Fides et Ratio: Theology and Contemporary Pluralism”, http://tinyurl.com/qhsj5q8\r\r\r",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Deacon",
                           @"twitterDef":@"an ordained servant of the Church",
                           @"definition":@"\rDeacons are referred to throughout the New Testament. In the Latin Rite, they are ordained to assist bishops and priests in the celebration of the Christian Mysteries. See “Holy Orders”.\r\rGreek, διάκονος (diakonos) “server”\r\rFurther Reference:\rCatechism of the Catholic Church, 1570\rhttp://tinyurl.com/4hs6lso\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Deposit of Faith",
                           @"twitterDef":@"the content of the Christian faith given by God to the Church through the Apostolic tradition",
                           @"definition":@"\rThe Depsit of Faith is regarded as delievered once for all to the Saints by the author of the Epistle of Jude. See “Divine Revelation”, “Tradition”.\r\rFurther Reference:\rCatechism of the Catholic Church, 84\rhttp://tinyurl.com/bx8mnlu\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Development of Doctrine",
                           @"twitterDef":@"the idea that the teaching of the Church can faithfully develop over time",
                           @"definition":@"\rThe concept of the Development of Doctrine is first found in the writings of Vincent of Lerins and later re-emphasized by Cardinal John Henry Newman. The former was cited explicitly by the council fathers at Vatican I. Recently, Fr. Thomas Guarino has argued that his lack of representation at Vatican II was the result of a misinterpretation of Vincent's famous claim:\r\r“We hold that which has been believed everywhere, always, and by everyone.”\r\rPope Francis has recently quoted Vincent's ideas in his discussions on abortion and gay marriage.\r\rFurther Reference:\rJohn Henry Newman\r“Essay on the Development of Doctrine”\rhttp://tinyurl.com/ndegq9s\r\rFr. Thomas Guarino\r“Tradition and Doctrinal Development: Can Vincent of Lérins Still Teach the Church?”\rhttp://tinyurl.com/q6ztz9n\r\r\r",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Devil",
                           @"twitterDef":@"a personal, malevolent spiritual being oppposed to the will of God",
                           @"definition":@"\rThe Devil became synonymous with the Hebrew figure of Satan in the inter-testamental years. By the writing of the Gospels, Jesus' ministry was interpreted as a spiritual conflict with the Devil. See “Satan”.\r\rFurther Reference:\rCatechism of the Catholic Church, 391\rhttp://tinyurl.com/llux3he\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Doctrine",
                           @"twitterDef":@"a systemized body of teaching",
                           @"definition":@"\rThe word doctrine is used in Catholicism to refer to the teaching of Church in a general sense. In this regard, it is synonymous with catechesis. See “Catechesis”, “Dogma”.\r\rFurther Reference:\rCatechism of the Catholic Church, 18\rhttp://tinyurl.com/nxgcz89\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Dogma",
                           @"twitterDef":@"the Greek word for “opinion” used for a doctrine that has been infallibly defined",
                           @"definition":@"\rA dogma in the Catholic tradition is a subset of Church doctrine. It refers to a divinely revealed truth that has been defined infallibly. All dogmas are doctrines, but not all doctrines are dogmas.\r\rGreek, δόγμα (dogma)\r\rFurther Reference:\rInternational Theological Commission\r“The Interpretation of Dogma”\rhttp://tinyurl.com/md9yco5\r\rCatechism of the Catholic Church, 88\rhttp://tinyurl.com/bx8mnlu\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Decalogue",
                           @"twitterDef":@"the 10 Commandments",
                           @"definition":@"\rThe Decalogue is found in both Exodus 20 and Deuteronomy 5. In Exodus, they are part of the Mosaic theophany. See “Divine Revelation”.\r\rGreek, δέκα λόγους (deka logous) “ten words”\r\rFurther Reference:\rCatechism of the Catholic Church, 2056\rhttp://tinyurl.com/nc86ead\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dei Verbum",
                           @"twitterDef":@"the Dogmatic Constitution of Vatican II concerning Divine Revelation",
                           @"definition":@"\rDei Verbum is the most definitive statement on the Church's belief in Divine Revelation, the Scriptures and Tradition. See “Divine Revelation”, “Bible”, “Tradition”. See the Scripture tab in the Overview section.\r\rLatin, (dei verbum) “Word of God”\r\rFurther Reference:\rVatican II, “Dei Verbum”\rhttp://tinyurl.com/3ecxu\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Demythologization",
                           @"twitterDef":@"the process of separating time-conditioned myths from their underlying truths",
                           @"definition":@"\rFollowing a similar line of thought as Spinoza, Rudolph Bultmann coined this term to refer to way of interpreting the New Testament within a scientific worldview:\r\r“...the Kerygma is incredible to modern man, for he is convinced that the mythical view of the world is obsolete. We are therefore bound to ask whether, when we preach the Gospel today, we expect our converts to accept not only the Gospel message, but also the mythical view of the world in which it is set. If not, does the New Testament embody a truth which is quite independent of its mythical setting? If it does, theology must undertake the tast of stripping the Kerygma from its mythical framework, of 'demythologizing' it.”\r-Bultmann, 4\r\rIn reflecting on the impact of Bultmann's thesis, Fr. Myles Bourke stated:\r\r“Whatever one may think of Bultmann's enterprise, and of his success in carrying it through, one cannot but be struck by the profoundly religious inspiration - indeed, on his own understanding of it, the profoundly Christian inspiration — of his work. For Bultmann defends the reality of the act of God in Christ, and keeps the Gospel from being reduced to a system of religious philosophy, a statement of some few timeless religious truths. That he has impoverished the Christian message; that he has eliminated practically all of the redemptive history, should not blind us to his positive contribution. And, as in the case of so many similar enterprises, the Catholic theologian can learn from Bultmann.”\r-Bourke, 130\r\rSee “Kerygma”, “New Testament”.\r\rFurther Reference:\rRudolf Bultmann\r“New Testament and Mythology”\rhttp://tinyurl.com/naqbj62\r\rRev. Myles Bourke\r“Rudolf Bultmann's Demythologization of the New Testament”, http://tinyurl.com/pkkeb7x\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Didache",
                           @"twitterDef":@"the name of the earliest extra-biblical Christian document",
                           @"definition":@"\rThe Didache, also known by its full title, “The Teaching of the Twelve Apostles”, is the first so-called “church order”; manuals for Christian living as well as public worship that would become popular in the 3rd and 4th centuries. It contains the earliest complete Christian liturgy, whose Eucharistic prayers show close similarity to the Jewish synagogue prayers. See “Eucharist”. See the Church Fathers section of the Overview tab.\r\rGreek, διδαχή (didache) “teaching”\r\rFurther Reference:\rChris Thomas\r“The Didache: Its Origin and Significance”\rhttp://tinyurl.com/ppeydnh\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Diocese",
                           @"twitterDef":@"the administrative area of a Bishop",
                           @"definition":@"\rThe concept of a diocese derives from the practice of household management. The Emperor Diocletian, in the fourth century A.D., divided up the Roman Empire into smaller administrative districts. As the Church assumed more civil responsibility, this districting system was adopted for ecclesial administration. See “Bishop”.\r\rFurther Reference:\rWikipedia, “Roman Diocese”\rhttp://tinyurl.com/qynktwj\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deuterocanonical Books",
                           @"twitterDef":@"the 7 books excluded from the Protestant Bible",
                           @"definition":@"\rAlso known as the “Apocrypha”, these books were defined as being canonical in the Church at the Council of Trent: Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom. See “Apocrypha”, “Canon”, “Old Testament”.\r\rGreek, ἀπόκρυφος (apokryphos) “hidden”\r\rFurther Reference:\r“Canons and Decrees of the Council of Trent”, Session IV\rhttp://tinyurl.com/5uugstm\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deuteronomic Code",
                           @"twitterDef":@"a legal code found in Deuteronomy 4:44-26:19",
                           @"definition":@"\rThe Deuteronomic Code is one three major legal codes within the Torah that is associated with the Sinaitic Covenant. It draws direct connections between liturgical worship and social justice, with the latter serving as a necessary condition for the former:\r\r“The Deuteronomic Code juxtaposes cultic laws and prescriptions for social justice. The laws concerning the single sanctuary and the prohibition of idolatry (cf. Deut 12–13) precede the social injunctions in Deut 14.22–15.18, but they unite closely cultic and ethical imperatives. In this manner the triennial tithes, originally a cultic prescription, serve a new purpose given by the centralization of the cult in Jerusalem, that of providing for the sustenance of widows, strangers, orphans and Levites (cf. Deut 14.28-29; 26,12–15). Lastly, the pilgrimage feasts require the participation of the poor (Deut 16.11. 12 -14). Worship in the Jerusalem temple will therefore not be valid unless it is linked to social justice founded on the memory of the slavery in Egypt, Israel’s deliverance and the gift of the land from God. The laws of the Torah, therefore, draw attention to the ethical implications of every religious celebration as well as to the theological dimension of social ethics.”\r-The Bible and Morality, 35.\r\rSee “Deuteronomic Source.”\r\rFurther Reference:\rPontifical Biblical Commission\r“The Bible and Morality”\rhttp://tinyurl.com/pgzpjov\r\rRev. M.B. Fallon, “Statues and Edicts”\rhttp://tinyurl.com/oa8jl4b\r\r\r",
                           @"category":@"Biblical"}];



    [TAWord wordWithDict:@{@"name":@"Deuteronomic History",
                           @"twitterDef":@"the theologized history of Israel in Joshua, Judges, 1 & 2 Samuel, and 1 & 2 Kings",
                           @"definition":@"\rThe term given to the books Joshua, Judges, 1 & 2 Samuel, and 1 & 2 Kings, based on the theology of the book of Deuteronomy, which detail the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel. It shows discernable signs of a major redaction after the Exile. Thus, Dtr1 is the pre-Exilic form of the history of Israel that portrays Yahweh promising that the Davidic Covenant and Solomonic Temple will last forever. The post-Exilic version, Dtr2, adds renders those promises conditional, thus explaining the Exile in terms of disobedience to the Deuteronomic Code. See “Deuteronomic Code”, “Israel”.\r\rFurther Reference:\rWikipedia, “Deuteronomic History”\rhttp://tinyurl.com/poqwjxo\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deuteronomic Source",
                           @"twitterDef":@"the literary source (D) in the Torah consisting of the book of Deuteronomy",
                           @"definition":@"\rThe “D” source is one of the four sources which compose the Torah. According to Richard Elliot Freidman, the author of D was most likely the prophet Jeremiah. See “Documentary Hypothesis.”\r\rFurther Reference:\rWikipedia, “Deuteronomist”\rhttp://tinyurl.com/myayczm\r\r\r",
                           @"category":@"Biblical"}];
    
    /*
    [TAWord wordWithDict:@{@"name":@"Deuteronomy",
                           @"twitterDef":@"the fifth and last book of the Pentateuch",
                           @"definition":@"\rDeuteronomy is the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    */
    
    [TAWord wordWithDict:@{@"name":@"Diachronic Analysis",
                           @"twitterDef":@"the analysis of a text which considers its historical development",
                           @"definition":@"\rDiachronic analysis is the primary concern of the various criticisms used by the Historical-Critical Method. Proper interpretationof the biblical text requires its use as well as synchronic analysis as well:\r\r“...diachronic study remains indispensable for making known the historical dynamism which animates sacred Scripture and for shedding light upon its rich complexity: For example, the covenant code (Ex. 21-23) reflects a political, social and religious situation of Israelite society different from that reflected in the other law codes preserved in Deuteronomy (Chapters 12-26) and in Leviticus (the holiness code, Chapters 17-26). We must take care not to replace the historicizing tendency, for which the older historical-critical exegesis is open to criticism, with the opposite excess, that of neglecting history in favor of an exegesis which would be exclusively synchronic.”\r-Interpretation, I.A.4\r\rSee “Historical-Critical Method”, “Synchronic Analysis”.\r\rFurther Reference:\rPontifical Biblical Commission,\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/ymsltv\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Diaspora",
                           @"twitterDef":@"the dispersion of Israelites to surrounding regions before, during, and after the Exile",
                           @"definition":@"\rThe first major diaspora occured after the fall of the Northern Kingdom of Israel to the Assyrians in 722 B.C. When the Babylonian Empire conquered the Southern Kingdom of Judah in 587 B.C., various groups of Jews were deported to the surrounding regions. After the return from the Exile, many Jews chose to settle elsewhere. See “Assyrian Empire”, “Babylonian Empire”, “Exile”.\r\rFurther Reference:\rWikipedia, “Diaspora”\rhttp://tinyurl.com/bsqcdar\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Divine Office",
                           @"twitterDef":@"the traditional word for the Liturgy of the Hours",
                           @"definition":@"\rSee “Liturgy of the Hours”.\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Documentary Hypothesis",
                           @"twitterDef":@"the theory that there are 4 sources which comprise the Torah: J, E, P, and D",
                           @"definition":@"\rThe theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah that have been edited together into its current canonical form; “Yahwist” (J), “Elohist” (E), “Priestly” (P), and “Deuteronomic” (D).\r\rAccording to Richard Elliot Freidman, there are seven arguments for its validity:\r\r1. Language\r2. Terminology\r3. Consistent Content\r4. Narrative Flow\r5. Other Biblical Connections\r6. Inter-Source Relationships\r7. Convergence of Arguments\r\rSee “Deuteronomic Source”, “Elohist Source”, “Priestly Source”, “Yahwist Source”.\r\rFurther Reference:\rPBS, “Who Wrote The Flood Story?”\rhttp://tinyurl.com/5leorc\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dynamic Equivalence",
                           @"twitterDef":@"a translation philosophy that seeks to render the text idea for idea",
                           @"definition":@"\rThe pre-2011 translation of the Mass and New American Bible were both based on a dynamic equivalence philosophy. See “Mass”.\r\rFurther Reference:\rRev. Felix Just\r“English Translations of the Bible” http://tinyurl.com/qhfucxz\r\rWikipedia, “Dynamic and Formal Equivalence”\rhttp://tinyurl.com/lwylgtu\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deism",
                           @"twitterDef":@"the belief that God created the world but does not intervene in it",
                           @"definition":@"\rDeism became popular during the Enlightenment and rise of science primarily in Europe during the 16th and 17th centuries. It is most famously displayed in the works of Voltaire. See “Creation”. See the Science section in the Overview tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 285\rhttp://tinyurl.com/6kvj6\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Determinism",
                           @"twitterDef":@"the belief that all events are determined by physical phenomena",
                           @"definition":@"\rThe belief that all events, including human actions, are determined by physical phenomena, negating the concept of free-will. See “Free Will”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“Causal Determinism”. http://tinyurl.com/ew8c\r\r\r",
                           @"category":@"Cultural"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Docetism",
                           @"twitterDef":@"the heresy that Jesus was not fully human",
                           @"definition":@"\rDocetism is a form of Gnosticism, and as such, denied the full humanity of Jesus Christ. It is alluded to in the Johonnine epistolary corpus. See “Heresy”.\r\rGreek, δοκεῖν (dokein) “to seem”\r\rFurther Reference:\rCatechism of the Catholic Church, 465\r\rWikipedia, “Docetism”\rhttp://tinyurl.com/yoalfv\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Donatism",
                           @"twitterDef":@"a schismatic Christian group that denied the principle of ex opere operato",
                           @"definition":@"\rThe Donatist schism began in A.D. 311 in North Africa and flourished for about one hundred years. It began when Donatus, a bishop in the church of Carthage, was elected as a reaction against the election of Caecilian to the episcopacy. The latter had been consecrated by a traitor under the Diocletian persecution. Donatus declared all sacraments and ordinations by Caecilian to be invalid and caused a schism in Northern Africa. In 313, a local council ruled against the rigorism of Donatus. See “Schism”.\r\rFurther Reference:\rWikipedia, “Donatism”\rhttp://tinyurl.com/o73ocyf\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Doxology",
                           @"twitterDef":@"a praise or blessing of God in prayer",
                           @"definition":@"\rDoxologies are found throughout the Bible, and are very prevalent in the Psalms. In the New Testament, St. Paul's letters contain numerous doxologies that center around the revelation of God's Mystery in Christ. See “Mystery”, “Prayer”.\r\rFurther Reference:\rWikipedia, “Doxology”\rhttp://tinyurl.com/5tk73ue\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dualism",
                           @"twitterDef":@"the belief that humans are composed of two substances, body and soul/mind",
                           @"definition":@"\rAlso known as substance dualism, dualism is found in the Platonic philosophical influence on Christianity and later in the writings of Descartes. Associated problems include the problem of causation and the seeming violation of the scientific law of the conservation of energy. See “Philosophy”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Dualism”, http://tinyurl.com/85cdhc3\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Dulia",
                           @"twitterDef":@"the Greek word meaning “veneration”",
                           @"definition":@"\rIn contrast to latria, dulia refers to veneration that is appropriate for the Saints or other sources of inspiration for Christian living. The Virgin Mary is the object of hyperdulia, the highest veneration one can give to anything created. See “Latria”.\r\rGreek, δουλεία (douleia)\r\rFurther Reference:\rCatechism of the Catholic Church, 971\rhttp://tinyurl.com/mtfzewa\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    
    
    
    
    /////////////////////////////////////E
    
    
    
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Easter",
                           @"twitterDef":@"the liturgical celebration of the resurrection of Jesus",
                           @"definition":@"\rEaster is the Feast of feasts for the Church; the holiest day of the year. The resurrection of Jesus has been celebrated from the earliest days of the Church either the actual day of week or on the first Sunday after Passover. The Quartodeciman Controversy in the 2nd century illustrated that Catholicity did not necessitate uniformity. See “Quartodeciman Controversy”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1169-1170\rhttp://tinyurl.com/l7cbxu5\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Eastern Catholic Churches",
                           @"twitterDef":@"autonomous non-Western churches in full communion with the Church of Rome",
                           @"definition":@"\rEastern Catholic Churches include Alexandrian, Antiochian, Armenian, Byzantine, and Syrian churches. They are represented in the Congregation for the Oriental Chuches. See “Catholic”.\r\rFurther Reference:\rCongregation for Oriental Churches\rhttp://tinyurl.com/oqrrpmy\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Eastern Orthodox",
                           @"twitterDef":@"autocephalous churches in communion with the Bishop of Constantinople",
                           @"definition":@"\rEastern Orthodox churches are those historic churches of the Greek East. In A.D. 1054 the Bishop of Constantinople and delegates from the Bishop of Rome excommunicated each other. See “Catholic”.\r\rFurther Reference:\rCongregation for Oriental Churches\rhttp://tinyurl.com/oqrrpmy\r\r\r",
                           @"category":@"Historical"}];

    
    [TAWord wordWithDict:@{@"name":@"Ebionites",
                           @"twitterDef":@"a sect of 1st century Jewish Christians who denied the divinity of Christ",
                           @"definition":@"\rThe Ebionites are mentioned by Irenaeus. Other Church Fathers (such as Origen and Tertullian) mention them as well. They seem to have had similar characteristics as the Essenes. They respected James the Just and believed St. Paul of Tarsus to be a heretic. Ebionite beliefs are considred heretical by the Church. See “Heresy”.\r\rFurther Reference:\rWikipedia, “Ebionites”\rhttp://tinyurl.com/yjrqt9y\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecclesia",
                           @"twitterDef":@"the Greek word meaning “those who have been called out”",
                           @"definition":@"\rThe word ecclesia was originally a term used to desribe the legislature of the Athenian City-State. The Greek translators of the Septuagint and writers of the New Testament use it to refer to the Church. See “Septuagint”, “Church”.\r\rGreek, ἐκκλησία (ecclesia)\r\rFurther Reference:\rCatechism of the Catholic Church, 751\rhttp://tinyurl.com/oy6txqx\r\r\r",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Economic Justice",
                           @"twitterDef":@"the right relationship between human beings to a given economic system",
                           @"definition":@"\rEconomic justice is based on the idea that the economy of any society should serve people, not vice versa. See “Justice”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Economic Justice”. http://tinyurl.com/l7a4kwo\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Elevation",
                           @"twitterDef":@"the raising of consecrated bread and wine at the end of the Eucharistic prayer",
                           @"definition":@"\rThe Host is elevated so that it can be venerated by the congregation. The practice can be traced back to Eudes de Sully, Bishop of Paris (1198-1208). See “Liturgy of the Eucharist”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “General Instruction of the Roman Missal”\rhttp://tinyurl.com/pe365cl\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Enlightenment",
                           @"twitterDef":@"the 17th-18th century cultural movement which prioritized reason over religion",
                           @"definition":@"\rThe Enlightenment was essential to the development of modern nation states, economics, and science. See “Philosophy”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Enlightenment”, http://tinyurl.com/cqvbd37\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Epiclesis",
                           @"twitterDef":@"the Greek word meaning “invocation”;\rof the Holy Spirit upon the Eucharist",
                           @"definition":@"\rThe Epiclesis invites the Holy Spirit to transform the gifts of bread and wine into the body and blood of Christ. See “Liturgy of the Eucharist”.\r\rGreek, ἐπίκλησις (epiklesis)\r\rFurther Reference:\rCatechism of the Catholic Church, 1105\rhttp://tinyurl.com/oqbzkx3\r\r\r",
                           @"category":@"Liturgical"}];

    [TAWord wordWithDict:@{@"name":@"Episcopacy",
                           @"twitterDef":@"the third degree of Holy Orders",
                           @"definition":@"\rSee “Bishop”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1555\rhttp://tinyurl.com/4hs6lso\r\r\r",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Evolution",
                           @"twitterDef":@"a process of biological descent with modification",
                           @"definition":@"\rThe modern theory of evolution is the result of over 100 years of rigorous testing of Charles Darwin's theory of biological decent with modification. In 2004, the International Theological Commission summed up the current scientific status of the theory:\r\r“According to the widely accepted scientific account, the universe erupted 15 billion years ago in an explosion called the 'Big Bang' and has been expanding and cooling ever since. Later there gradually emerged the conditions necessary for the formation of atoms, still later the condensation of galaxies and stars, and about 10 billion years later the formation of planets. In our own solar system and on earth (formed about 4.5 billion years ago), the conditions have been favorable to the emergence of life. While there is little consensus among scientists about how the origin of this first microscopic life is to be explained, there is general agreement among them that the first organism dwelt on this planet about 3.5-4 billion years ago. Since it has been demonstrated that all living organisms on earth are genetically related, it is virtually certain that all living organisms have descended from this first organism. Converging evidence from many studies in the physical and biological sciences furnishes mounting support for some theory of evolution to account for the development and diversification of life on earth, while controversy continues over the pace and mechanisms of evolution. While the story of human origins is complex and subject to revision, physical anthropology and molecular biology combine to make a convincing case for the origin of the human species in Africa about 150,000 years ago in a humanoid population of common genetic lineage. However it is to be explained, the decisive factor in human origins was a continually increasing brain size, culminating in that of homo sapiens. With the development of the human brain, the nature and rate of evolution were permanently altered: with the introduction of the uniquely human factors of consciousness, intentionality, freedom and creativity, biological evolution was recast as social and cultural evolution.”\r-Communion, 63\r\rThe scientific and cultural acceptance of Evolution was influential on Vatican II as seen in Gaudium et Spes:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis.”\r-Gaudium, 5\r\rMore recently, Cardinal Joseph Ratzinger gave a modern interpretation of the Creation account in Genesis 2:\r\r“The clay became man at the moment in which a being for the first time was capable of forming, however dimly, the thought of 'God'. The first 'Thou' that—however stammeringly—was said by human lips to God marks the moment in which the spirit arose in the world. Here the Rubicon of anthropogenesis was crossed. For it is not the use of weapons or fire, not new methods of cruelty or of useful activity, that constitute man, but rather his ability to be immediately in relation to God. This holds fast to the doctrine of the special creation of man ... herein ... lies the reason why the moment of anthropogenesis cannot possibly be determined by paleontology: anthropogenesis is the rise of the spirit, which cannot be excavated with a shovel. The theory of evolution does not invalidate the faith, nor does it corroborate it. But it does challenge the faith to understand itself more profoundly and thus to help man to understand himself and to become increasingly what he is: the being who is supposed to say Thou to God in eternity.”\r-Ratzinger, 46-47\r\rSee the Science section of the Overview tab.\r\rFurther Reference:\rInternational Theological Commission\r“Communion & Stewardshp”\rhttp://tinyurl.com/c37p5\r\rVatican II, “Gaudium er Spes”\rhttp://tinyurl.com/34xrhq\r\rNational Center for Science Education\r“Evolution”, http://tinyurl.com/mbx353a\r\rCardinal Joseph Ratzinger\r“Credo For Today”\rhttp://tinyurl.com/qzrref2\r\rPatrick Byrne\r“Evolution, Randomness, and Divine Purpose”\rhttp://tinyurl.com/pu3bg66\r\rWikipedia, “Catholic Church and Evolution”\rhttp://tinyurl.com/pzgun6b\r\r\r",
                           @"category":@"Cultural"}];


    
    [TAWord wordWithDict:@{@"name":@"Ethics",
                           @"twitterDef":@"the study of moral systems",
                           @"definition":@"\rEthics is one of the three traditional branches of Philosophy. Christian ethics is the study of morality in the Christian tradition. See “Moral Theology”.\r\rGreek, ἠθικός (ethikos) “custom”\r\rFurther Reference:\rInternational Theological Commission\r“In Search of a Universal Ethic”\rhttp://tinyurl.com/pxcjasx\r\rWikipedia, “Ethics”\rhttp://tinyurl.com/oqptk\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecclesiology",
                           @"twitterDef":@"the study of the Church",
                           @"definition":@"\rEcclesiology examines various aspects of the Church (authority, structure, sacraments, worship, etc.). While the pre-Conciliar model of the Church was that of the perfect community (communitas perfecta), Vatican II, in the Dogmatic Constitution on the Church “Lumen Gentium”, chose to define the Church as the People of God united in a Mystical Communion. See “Lumen Gentium”.\r\rFurther Reference:\rVatican II, “Lumen Gentium”\rhttp://tinyurl.com/3wxff\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecumenical Council",
                           @"twitterDef":@"a gathering of bishops from the Church to discern matters of faith and practice",
                           @"definition":@"\rSee the Councils section of the Overview tab and the Historical section of the Maps tab.\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecumenism",
                           @"twitterDef":@"a movement that emphasizes similarities over differences",
                           @"definition":@"\rEcumenism is a movement which gained popularity in the 20th century that emphasized shared beliefs among various Christian churches over and against differences. It was a particular emphasis of Vatican II.\r\rFurther Reference:\rVatican II, “Unitatis Redintegratio”\rhttp://tinyurl.com/3xnyh\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Election",
                           @"twitterDef":@"the concept that Israel and the Church were chosen by God to be in a covenant",
                           @"definition":@"\rElection is a concept that runs throughout both the Old and New Testaments. In the Old Testament, Israel is a nation chosen by Yahweh from among other nations to be in covenant relationship. In the New Testament, Christ is referred to as the “Chosen One” and believers in him are referred to as being chosen in him.\r\rFurther Reference:\rCatechism of the Catholic Church, 762, 769\rhttp://tinyurl.com/oy6txqx\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Eschatology",
                           @"twitterDef":@"the belief that evil and injustice will have an end brought about by Divine intervention",
                           @"definition":@"\rEschatology is traditionally known as the Last Things. It examines the Church doctrine on the destiny of the human race. The historic Creeds of the Church state that Christ will return to judge the living and dead at the end of time.\r\rFurther Reference:\rCatechism of the Catholic Church, 673\rhttp://tinyurl.com/n85jnew\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Essence",
                           @"twitterDef":@"a property that makes an object what it is",
                           @"definition":@"\rEssence (or substance) is contrasted with accidents.\r\rFurther Reference:\rStandford Encyclopedia of Philosophy\r“Essential vs. Accidental Properties”\rhttp://tinyurl.com/olc9dv8\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Eucharist",
                           @"twitterDef":@"the Sacramental meal in which Christians celebrate the Pashcal Mystery",
                           @"definition":@"\rThe word Eucharist came to be associated with the bread and wine of the Eucharist which early Christians believed to be directly related to the body and blood of Jesus. The belief that Jesus is present in the Eucharist predates to the earliest years of the Church. Paul claims that bread and wine of the Eucharist are a participation in the body and blood of Christ. This belief predates any explanation (e.g. Transubstantiation) as to how he is present. See “Anamnesis”, “Transubstantiation”.\r\rGreek εὐχαριστία (eucharistia) “good thanksgiving”\r\rFurther Reference:\rCatechism of the Catholic Church, 1322\rhttp://tinyurl.com/q6gyoc7\r\rPope Benedict XVI\rPost-Synodal Exhortation on the Eucharist\rhttp://tinyurl.com/nt7jj3z\r\rRev. Robert Daly\r“Eucharistic Origins: From the New Testament to the Liturgies of the Golden Age”\rhttp://tinyurl.com/nfbqbpz\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Eucharistic Prayer",
                           @"twitterDef":@"the prayer said throughout the Liturgy of the Eucharist",
                           @"definition":@"\rThe Roman Missal offers four options to celebrants of Mass for the Eucharistic Prayer. See “Liturgy of the Eucharist”.\r\rFurther Reference:\rCongregation for Divine Worship\r“General Instruction of the Roman Missal”, 219-236. http://tinyurl.com/q5zmkts\r\r\r",
                           @"category":@"Liturgical"}];

    [TAWord wordWithDict:@{@"name":@"Euthyphro Dilemma",
                           @"twitterDef":@"does God give the Law because it is good? or is the Law good because God gives it?",
                           @"definition":@"\rThe Euthphro Problem takes its name from Plato's Dialogue, Euthyphro, in which Socrates asks Euthyphro: Is the pious loved by the gods because it is pious, or is it pious because it is loved by the gods? In contemporary moral theology, the question can be framed: Does God give the Commandments because they are good, or are the Commandments good because God gives them?\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Religion and Morality”\rhttp://tinyurl.com/6wc2qkg\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Exclusivism",
                           @"twitterDef":@"the belief that outside the Church there is no salvation",
                           @"definition":@"\rThe ancient phrase “extra ecclesium nulla sallus” (outside the Church there is no salvation) has been traditionally interpreted to mean that only Catholics will be saved. The Anonymous Christian notion of Karl Rahner was influential on Vatican II and was the catalyst for a development of this teaching. See “Anonymous Christian”.\r\rFurther Reference:\rCatechism of the Catholic Church, 846\rhttp://tinyurl.com/oupb5\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Cathedra",
                           @"twitterDef":@"an infallible teaching from the chair of Peter",
                           @"definition":@"\rWhen the Pope explicitly teaches from the chair (ex cathedra) of Peter, his teaching is considered infallible:\r\r“...we teach and define as a divinely revealed dogma that when the Roman pontiff speaks ex cathedra, that is, when, in the exercise of his office as shepherd and teacher of all Christians, in virtue of his supreme apostolic authority, he defines a doctrine concerning faith or morals to be held by the whole church, he possesses, by the divine assistance promised to him in blessed Peter, that infallibility which the divine Redeemer willed his church to enjoy in defining doctrine concerning faith or morals. Therefore, such definitions of the Roman pontiff are of themselves, and not by the consent of the church, irreformable.”\r\r\rFurther Reference:\rVatican I, Canon IV\rhttp://tinyurl.com/p7a6vvj\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Nihilo",
                           @"twitterDef":@"the act of God creating from nothing",
                           @"definition":@"\rThe phrase ex nihilo is used to express the belief that God created the Universe out of nothing. See “Creation”.\r\rLatin (ex nihilo) “from nothing”\r\rFurther Reference:\rCatechism of the Catholic Church, 296\rhttp://tinyurl.com/6kvj6\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Opere Operato",
                           @"twitterDef":@"the idea that a Sacrament's efficacy is not related to a celebrant's personal holiness",
                           @"definition":@"\rThe Donatist Schism was initiated by a refusal of Donatus and his followers to adhere to this teaching. a Latin phrase meaning “from the work, worked”. See “Ex Opere Operantis”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1128\rhttp://tinyurl.com/cmes38\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Opere Operantis",
                           @"twitterDef":@"the idea that a Sacrament's efficacy is related to the celebrant's personal holiness",
                           @"definition":@"\rThis phrase refers to the emphasis on the subjective character of the celebrant. In the Catholic tradition, it does not affect the validity of the Sacraments. See “Ex Opere Operato”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1128\rhttp://tinyurl.com/cmes38\r\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Excommunication",
                           @"twitterDef":@"the state of being out of visible communion with the Church",
                           @"definition":@"\rExcommunication is aluded to as early as the first century in the writings of Paul, who taught the Corinthian exclude an unrepentant member from communion. In the current Code of Canon Law, only a Pope or authorized representative can lift an excommunication\r\rFurther Reference:\rCatechism of the Catholic Church, 1463\rhttp://tinyurl.com/l7xon9e\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Exorcism",
                           @"twitterDef":@"the expulsion of evil spirits by the authority of Jesus Christ",
                           @"definition":@"\rDuring his ministry, Jesus is reported to have conducted exorcisms. The Acts of the Apostles also portrays the Apostles as conducting exorcisms.\r\rFurther Reference:\rCatechism of the Catholic Church, 1673\rhttp://tinyurl.com/oo3cp5p\r\r\r",
                           @"category":@"Systematic"}];


    [TAWord wordWithDict:@{@"name":@"Eisegesis",
                           @"twitterDef":@"intepreting a text by importing one's own presuppositions",
                           @"definition":@"\rEisegesis occurs when exegesis is neglected. See “Exegesis”.\r\rFurther Reference:\rFelix Just, “Biblical Exegeis”\rhttp://tinyurl.com/k3u6rma\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"El",
                           @"twitterDef":@"the father of all the gods and husband of Asherah in Canaanite mythology",
                           @"definition":@"\rIn the Old Testament, El is referred to throughout the patriarchal sagas. See “Asherah”. See “Beth-El” in the Old Testament category of Pins on the Maps tab.\r\rFurther Reference:\rWikipedia, “El”\rhttp://tinyurl.com/3r98q89\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elohim",
                           @"twitterDef":@"the Hebrew word meaning “gods”, “God”, or “angels”",
                           @"definition":@"\rThe plural of “El”, “Elohim” can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.\r\rHebrew, אֱלֹהִים (elohim)\r\rFurther Reference:\rWikipedia, “Elohim”\rhttp://tinyurl.com/yv38ap\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elohist Source",
                           @"twitterDef":@"the literary source (E) in the Torah that favors the northern traditions of Israel",
                           @"definition":@"\rThe “E” source uses “Elohim” as primary reference for God before the Theophany in Exodus 3. It was likely written ca. 900 BCE and favors Moses and the northern tribes of Ephraim and Joseph over Aaron and the southern tribes. It is likely related to the same school of priests responsible for the Deuteronomic Source.\r\rFurther Reference:\rWikipedia, “Elohist Source”\rhttp://tinyurl.com/2axcpau\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epistle",
                           @"twitterDef":@"a letter or note",
                           @"definition":@"\rThe New Testament contains 21 letters written from apostles or apostolic associates, but mostly from Paul. The Apostolic Fathers contain various epistles as well from Ignatius of Antioch, Polycarp, Barnabas, and Diognetus.\r\rFurther Reference:\rWikipedia, “Epistle”\rhttp://tinyurl.com/6h68vhn\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Eros",
                           @"twitterDef":@"the Greek word meaning “physical love”",
                           @"definition":@"\rEros is used to refer especially to physical love, or the love that passionately desires to possess.\r\rGreek, ἔρως (eros)\r\rFurther Reference:\rWikipedia, “Eros”\rhttp://tinyurl.com/mw6ea3v\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Etiology",
                           @"twitterDef":@"the study of origins;\ra traditional story that explains a present reality",
                           @"definition":@"\rThe Old Testament contains numerous etiologies that explain relationships or conditions widely known by the authors' audiences. Genesis 1 contains an etiology of the Sabbath as being rooted in God's resting from creation.\r\rFurther Reference:\rWikipedia, “Etiology“\rhttp://tinyurl.com/yg6hn9\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Evangelist",
                           @"twitterDef":@"a person who spreads good news",
                           @"definition":@"\rThe word “evangelist” can be applied to any person who spreads the good news of Jesus Christ. It is usually reserved for one of the authors of the four Gospels. See “Gospel”.\r\rFurther Reference:\rWikipedia, “Four Evangelists”\rhttp://tinyurl.com/ozctv2\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exegesis",
                           @"twitterDef":@"the process of determining the meaning of a text in its original context",
                           @"definition":@"\rExegesis is a necessary element of hermeneutics. The present meaning of a text cannot be known if its past meaning is not properly understood. Exegesis uses the Historical-Critical Method to perform its essential task. See “Hermeneutics”, “Historical-Critical Method”.\r\rGreek, ἐξήγησις (exegesis) “leading out”\r\rFurther Reference:\rFelix Just, “Biblical Exegeis”\rhttp://tinyurl.com/k3u6rma\r\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/ymsltv\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exile",
                           @"twitterDef":@"the banishment of the southern kingdom of Judah to Babylon in 587 B.C.",
                           @"definition":@"\rThe Exile was the most traumatic experience in the life of ancient Israel. The prophetic literature and the revised Deuteronomic History claims that it was the result of idolatry and failure to practice social justice. Three major theological developments occured as a result of it - true Monotheism, the character of Satan, and the Resurrection of the Dead. See “Monotheism”, “Satan”, “Resurrection”.\r\rFurther Reference:\rWikipedia, “Babylonian Captivity”\rhttp://tinyurl.com/256xlc\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exodus",
                           @"twitterDef":@"the liberation of the Israelite slaves from Egypt under Moses",
                           @"definition":@"\rThe Exodus is traditionally dated to ca. 1275 BCE in the reign of Ramases II. It is the foundational event of the Israelite nation; current biblical research supports the idea of a small group of slaves leaving Egypt, having a Divine Revelation in Midian, and traveling to Canaan, where they met newly liberated Canaanite slaves. Exodus is also the name of the second book of the Torah. Richard Elliot Friedman argues that the Levites were the Israelites who left Egypt based on the following facts:\r\r1. Moses is identified as a Levite.\r2. Only Levites had Egyptian names.\r3. Levites had no alloted territory.\r4. Israel is absent from the Song of the Sea.\r5. Levites are absent from the Song of Debrah.\r6. Only Levite authors require circumcision, an Egyptian practice.\r7. Levite authors claim God was known by “El” until “Yahweh” was revealed to Moses, a Levite.\r8. Only Levite authors include the Plagues.\r9. The Tabernacle & Temple are strikingly similar to Egyptian archeology.\r10. Levites murder those opposed to Moses.\r\rFurther Reference:\rRichard Elliot Friedman,\r“The Exodus Based on the Sources”\rhttp://tinyurl.com/ncovf49\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elementary Experience",
                           @"twitterDef":@"the existential set of needs and evidences\rfor truth, justice, beauty, and goodness",
                           @"definition":@"\rAccording to Fr. Luigi Giussani, the founder of the Communion and Liberation Movement, elementary experience is what drives human civilization and development It is what the Bible describes as the “heart”.\r\rFurther Reference:\rJorge Bergoglio, “For Man” in “A Generative Thought: An Introduction to the Works of Luigi Giussani”\rhttp://tinyurl.com/pkk5k6m\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Ephraim",
                           @"twitterDef":@"a prominent northern Israelite tribe descended from a son of Joseph",
                           @"definition":@"\rEphraim is mentioned in the Bible as being one of the two sons of Joseph. His descendents were alloted a northern central territory in Joshua 16. Its important religious shrines included Shechem, Shiloh, and Bethel. Ephraim became representative of the entire northern kingdom after the divided monarchy.\r\rFurther Reference:\rWikipedia, “Tribe of Ephraim”\rhttp://tinyurl.com/48drdr\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epiphany",
                           @"twitterDef":@"the liturgical celebration of the appearance of Jesus to the world",
                           @"definition":@"\rEpiphany is celebrated on January 6 in the Western church.\r\rFurther Reference:\rWikipedia, “Epiphany”\rhttp://tinyurl.com/8rjlf6\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epistemology",
                           @"twitterDef":@"the study of the origin, nature, and limits of human knowledge",
                           @"definition":@"\rEpistemology is one of the three traditional subjects of Western philosophy. See “Philosophy”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Epistemology”,  http://tinyurl.com/pj7qp\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Existentialism",
                           @"twitterDef":@"a philosophical movement centered upon the nature of human existence",
                           @"definition":@"\rAs a philosophical movement which gained popularity in the late 19th century, Existentialism emphasizes the virtue of authenticity as understanding the human situation.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Existentialism”, http://tinyurl.com/2669u6\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Explanandum",
                           @"twitterDef":@"that which is explained by something else",
                           @"definition":@"\rIn the study of Logic, the explanandum is a given phenomenon that can always be explained by something else. It is often the conclusion of a deductive argument, the premises of which, constitute the explanans. See “Explanans”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“Scientific Explanation”, http://tinyurl.com/nrkj5bd\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Explanans",
                           @"twitterDef":@"that which explains something else",
                           @"definition":@"\rIn the study of Logic, the explanans always explains a given phenomenon. It is often antecedent to the explanandum in the form of premises, which, when taken in sequence, deductively establishes the explanandum. See “Explanandum”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Scientific Explanation”, http://tinyurl.com/nrkj5bd\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Environmentalism",
                           @"twitterDef":@"the concern for the environment as a matter of social justice",
                           @"definition":@"\rThe movement, which gained popularity in the 1960s in the United States, that emphasizes concern for the environment as a matter of public policy and social justice. Pope Francis has made the care of the Earth the subject of his latest encyclical.\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Eucharistic Adoration",
                           @"twitterDef":@"the act of adoring Christ present in the Eucharist",
                           @"definition":@"\rEucharistic Adoration can be traced to the ministry of St. Francis of Assisi in the early 13th century. It usually consists of a Eucharistic Host encased in a Monstrance, which is displayed for veneration.\r\rFurther Reference:\rCatechism of the Catholic Church, 1378\rhttp://tinyurl.com/q6gyoc7\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    
   //////////////////////////////////////////F
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Faith",
                           @"twitterDef":@"trust or confidence;\rthe content of a religious tradition",
                           @"definition":@"\rThe importance of faith is first illustrated in Genesis 15. According to the text, after Yahweh promised Abram that he would father many nations, “Abram put his faith in the LORD who attributed it to him as an act of righteousness. Habbakuk 2:4 claims “the righteous will live by faith. Paul uses both of these references in his letter to the Romans, in which he claims that salvation is by “grace through faith”. Jude 1:3 refers to the Faith as “once for all delivered to the Saints”. See “Justification”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1814\rhttp://tinyurl.com/pd2yc32\r\r\r",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Fideism",
                           @"twitterDef":@"the reliance of faith rather than reason in the search for truth",
                           @"definition":@"\rAn early proponent of Fideism was Tertullian, who famously asked: “What has Athens to do with Jerusalem?” Other early Christian thinkers (such as Origen and Augustine) took a more integrative approach to the Church's use of Philosophy. The Catholic tradition has consistently held that both faith and reason are necessary for human flourishing. Fideism is popular among certain Protestant churches that are Fundamentalist in belief. See “Faith”, “Fundamentalism”, “Philosophy”. See the Philosophy section in the Overview tab.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Fideism”\rhttp://tinyurl.com/2682fjk\r\r\r",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Fallibilism",
                           @"twitterDef":@"the idea that humans can have inaccurate, yet justified beliefs about the world",
                           @"definition":@"\rFallibilism is evidenced in theology when new scientific discoveries mandate a new interpretation of the Biblical text, even though the previous interpretation was justified based on the available data.\r\rFurther Reference:\rInternet Ecyclopedia of Philosophy, “Fallibilism”\rhttp://tinyurl.com/q6we5fk\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Filioque",
                           @"twitterDef":@"a Latin phrase added to the Nicene Creed meaning “and the Son”",
                           @"definition":@"\rThe Filioque phrase dates to the Patristic era. It is found in the writings of Augustine of Hippo, Leo the Great, and others. It gradually became a source of contention between the Eastern and Western churches as seen in the Photian and Great Schism. See “Photian Schism”, “Great Schism”.\r\rFurther Reference:\rCatechism of the Catholic Church, 246-247\rhttp://tinyurl.com/4tymjt\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Foreknowledge",
                           @"twitterDef":@"the knowledge future events",
                           @"definition":@"\rAs a characteristic of God, foreknowledge features prominently in post-Exilic Hebrew literature and in the New Testament. It reflects a more developed period in Israelite theology from that of the Yahwist Source, which presents a highly anthropomorphic portrayal of God. Associated philosophical problems include constraints on Free Will and the Problem of Evil. See “Free Will”, “Problem of Evil”.\r\rFurther Reference:\rCatechism of the Catholic Church, 600\rhttp://tinyurl.com/p3dfabj\r\rStanford Encylopedia of Philosophy\r“Foreknowledge and Free Will”, http://tinyurl.com/g8eze\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Free Will",
                           @"twitterDef":@"the ability to freely make a rational choice",
                           @"definition":@"\rFree will has traditionally been interpreted as a characteristic of human nature being made in the Image of God. The degree of freedom of the will is a factor in analyzing the morality of certain acts. Impediments (both virtual and habitual) can mitigate both responsibility and morality of human actions.\r\rFurther Reference:\rCatechism of the Catholic Church, 1731\rhttp://tinyurl.com/qzj6nl9\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Folio",
                           @"twitterDef":@"a page within a manuscript",
                           @"definition":@"\rIn textual criticism, folios are sometimes all that remains of a larger manuscript. See “Textual Criticism”.\r\rFurther Reference:\rWikipedia, “Folio”\rhttp://tinyurl.com/37amz3t\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Formal Eqivalence",
                           @"twitterDef":@"a translation philosophy that seeks to render the text word for word",
                           @"definition":@"\rThe New American Bible Revised Edition is a translation based on Formal Equivalence. The 2011 English translation of the Mass is also based on formal equivalence, sometimes resulting in odd sentence structure as Latin syntax works differently than that of English.\r\rFurther Reference:\r\rFelix Just, “English Translations of the Bible” http://tinyurl.com/qhfucxz\r\rWikipedia, “Dynamic and Formal Equivalence”\rhttp://tinyurl.com/lwylgtu\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Form Criticism",
                           @"twitterDef":@"the analysis of the genre or literary form of a text",
                           @"definition":@"\rForm Criticism is mentioned as necessary to proper exegesis in Vatican II's Dogmatic Constitution on Divine Revelation, “Dei Verbum”:\r\r“To search out the intention of the sacred writers, attention should be given, among other things, to 'literary forms'. For truth is set forth and expressed differently in texts which are variously historical, prophetic, poetic, or of other forms of discourse.”\r-Dei Verbum, III.12\r\rForm Criticism is one of the criticisms used by the Historical-Critical Method. See “Dei Verbum”, “Exegesis”, “Historical-Critical Method”.\r\rFurther Reference:\rVatican II, “Dei Verbum”\rhttp://tinyurl.com/3ecxu\r\rRev. Felix Just\r“Introduction to Biblical Genrè and Form Criticism”\rhttp://tinyurl.com/6nn8vpm\r\rRev. Joseph Fitzmeyer\r“Historical Criticism: Its Role in Biblical Interpretation and Church Life”, 251\rhttp://tinyurl.com/p7488ev\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Fundamentalism",
                           @"twitterDef":@"a fundamenalist method that exclusively uses a literalist criteron for interpretation",
                           @"definition":@"\rIn addition to describing a particular hermeneutical method, fundamentalism also refers to an anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith. Pope John Paul II critiqued this hermeneutical method in 1993, when he said:\r\r“A false idea of God and the incarnation presses a certain number of Christians to...believe that, since God is the absolute Being, each of his words has an absolute value, independent of all the conditions of human language. Thus, according to them, there is no room for studying these conditions in order to make distinctions that would relativize the significance of the words. However, that is where the illusion occurs and the mysteries of scriptural inspiration and the incarnation are really rejected, by clinging to a false notion of the Absolute.”\r-Address, 8\r\rThis approach to a sacred text also extends to Judaism, Islam, and other religions. The term can also refer to a strict adherence to a given viewpoint.\r\rFurther Reference:\rPope John Paul II\rAddress on the Interpretation of the Bible in the Church, http://tinyurl.com/o4dtqdk\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Fundamental Option",
                           @"twitterDef":@"a person's basic, spiritual orientation",
                           @"definition":@"\rThe German theologian Karl Rahner was the first to develop this concept. He taught that what the Catholic tradition has termed “mortal sin” can be understood as setting one's Fundamental Option against God. Pope John Paul II taught, in his encyclical “Veritatis Splendor”, that the Fundamental Option is always incarnated in particular human acts:\r\r“Some authors, however, have proposed an even more radical revision of the relationship between person and acts. They speak of a 'fundamental freedom', deeper than and different from freedom of choice, which needs to be considered if human actions are to be correctly understood and evaluated. According to these authors, the key role in the moral life is to be attributed to a 'fundamental option', brought about by that fundamental freedom whereby the person makes an overall self-determination, not through a specific and conscious decision on the level of reflection, but in a 'transcendental' and 'athematic' way. Particular acts which flow from this option would constitute only partial and never definitive attempts to give it expression; they would only be its 'signs' or symptoms. The immediate object of such acts would not be absolute Good (before which the freedom of the person would be expressed on a transcendental level), but particular (also termed 'categorical') goods. In the opinion of some theologians, none of these goods, which by their nature are partial, could determine the freedom of man as a person in his totality, even though it is only by bringing them about or refusing to do so that man is able to express his own fundamental option...These tendencies are therefore contrary to the teaching of Scripture itself, which sees the fundamental option as a genuine choice of freedom and links that choice profoundly to particular acts. By his fundamental choice, man is capable of giving his life direction and of progressing, with the help of grace, towards his end, following God's call. But this capacity is actually exercised in the particular choices of specific actions, through which man deliberately conforms himself to God's will, wisdom and law. It thus needs to be stated that the so-called fundamental option, to the extent that it is distinct from a generic intention and hence one not yet determined in such a way that freedom is obligated, is always brought into play through conscious and free decisions. Precisely for this reason, it is revoked when man engages his freedom in conscious decisions to the contrary, with regard to morally grave matter.”\r-Veritatis, 65, 67\r\rFurther Reference:\rPope John Paul II, “Veritatis Splendor”\rhttp://tinyurl.com/pz7yjz9\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Feminism",
                           @"twitterDef":@"the movement that seeks female liberation from patriarchal structures and norms",
                           @"definition":@"\rFeminism was widely influential in the twentieth century, and has raised a new awareness of women's concerns in hermeneutics.\r\rFurther Reference:\rEdward Vacek, “Feminism and the Vatican”\rhttp://tinyurl.com/nl4bmmq\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Fraction",
                           @"twitterDef":@"the breaking of consecrated bread for the distrubution of Holy Communion",
                           @"definition":@"\rThe Fraction symbolizes Christ's body given up for the salvation of the world.\r\rFurther Reference:\rCongregation for Divine Worship\r“General Instruction of the Roman Missal”, 83\rhttp://tinyurl.com/kmepha\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Forgiveness of Sins",
                           @"twitterDef":@"the nullification of offence or injury;\rthe primary effect of Baptism",
                           @"definition":@"\rForgiveness has many nuances. The Greek root ἄφεσις (aphesis) means “leave behind” and is also used to describe Jesus' exit from a town. In the Gospel of Luke, Jesus makes forgiveness of a brother conditional upon repentance, while he asks God to forgive those responsible for his crucifixion since they “know not what they do”. In the Nicene-Constantinopolitan Creed, Baptism is linked to the Forgiveness of Sins. See “Baptism”, “Nicene-Constantiopolitan Creed”.\r\rFurther Reference:\rCatechism of the Catholic Church, 977\rhttp://tinyurl.com/kd44r5d\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Form",
                           @"twitterDef":@"the words used in a Sacrament",
                           @"definition":@"\rAccording to the Catechism of the Council of Trent, the form of a Sacrament is one of its constituent parts. The form of a Sacrament is the word, which, when joined to the matter and intention, constitute a valid sacrament.\r\rFurther Reference:\rCatechism of the Council of Trent, Part II\rhttp://tinyurl.com/lcfwkhy\r\r\r",
                           @"category":@"Systematic"}];
    /*
    [TAWord wordWithDict:@{@"name":@"Franciscan",
                           @"twitterDef":@"a member of the order\rfounded by St. Francis of Assisi",
                           @"definition":@"\rThe order of Franciscans was formally recognized by Pope Honorius III\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
     */
    
    //G
    
    [TAWord wordWithDict:@{@"name":@"Grace",
                           @"twitterDef":@"unmerited Divine help to fulfill the Christian vocation",
                           @"definition":@"\rSacraments are the ordinary means of Grace. According to Thomas Aquinas, Grace can be either sanctifying or habitual.\r\rFurther Reference:\rCatechism of the Catholic Church, 1996\rhttp://tinyurl.com/yaua7cc\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Great Schism",
                           @"twitterDef":@"the schism between the Eastern and Western churches in A.D. 1054",
                           @"definition":@"\rThe Great Schism was the result of a long period of estrangement between the Latin West and Greek East. Amongst the causes of the formal schism was the Filioque convtroversy. See “Filioque”.\r\rFurther Reference:\rWikipedia, “East-West Schism”\rhttp://tinyurl.com/8tyom4d\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gehenna",
                           @"twitterDef":@"a valley near Jerusalem in which devotees would sacrifice children to Molech in fire",
                           @"definition":@"\rGehenna (the Valley of Ben-Hinnom) seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed). It is used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1034\rhttp://tinyurl.com/l9ha57h\r\rWikipedia, “Gehenna”\rhttp://tinyurl.com/ymbj2d\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Genre",
                           @"twitterDef":@"the literary form of a text",
                           @"definition":@"\rA French word referring to the literary form of a text. According to the teaching of the Church, examination of the literary form of the text is essential for a proper interpretation:\r\r“In order to discover the sacred authors' intention, the reader must take into account the conditions of their time and culture, the literary genres in use at that time, and the modes of feeling, speaking and narrating then current. 'For the fact is that truth is differently presented and expressed in the various types of historical writing, in prophetical and poetical texts, and in other forms of literary expression.'”\r-Catechism, 110\r\rSee “Form Critcism”.\r\rFurther Reference:\rCatechism of the Catholic Church\rhttp://tinyurl.com/kvc3tvq\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Globalization",
                           @"twitterDef":@"the increasing degree of societal integration through the interchange of culture",
                           @"definition":@"\rGlobalization as a phenomenon conincides with advances in communication, trade, and travel infrastructure, and the World Wide Web. While its roots lay in the Industrial Revolution, it became a growing realization in the latter half of the 20th century and continues into the present. Fr. Kenneth Himes has observed that Globalization presents new challenges to Catholic Social Teaching (CST):\r\r“Moral reflection by Catholics on social conditions did not begin in 1891 with Rerum Novarum. The occasion of that text has provided a useful but overemphasized date for discussing CST. The truth is that ethical debate and judgment about social realities long precedes the era of modern CST. In the long history of CST we can find helpful 'ethical coordinates' for a normative assessment of globalization. Globalization may not be an entirely novel phenomenon, but the forms it takes today do present new challenges. If CST is to have an impact on globalization it cannot do so merely by repeating past insights. Further development of the tradition is necessary in order to guide globalization along a path that assures that the 'joys and hopes' of the people of our age will be realized while their 'griefs and anxieties' are properly addressed.”\r-Himes, 289\r\rIn his latest encyclical, Pope Francis has warned against the “globalization of indifference” to the needs of the poor. See “Catholic Social Teaching”.\r\rFurther Reference:\rRev. Kenneth Himes\r“Globalization with a Human Face: Catholic Social Teaching and Globalization”\rhttp://tinyurl.com/qa7gf7g\r\rPope Francis, “Laudato Si”, 52\rhttp://tinyurl.com/o6sowft\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Gnosticism",
                           @"twitterDef":@"a heretical Christian sect that taught salvation through esoteric knowledge",
                           @"definition":@"\rGnosticism flourished in the second and third centuries. As a dualistic philosophy, it claimed that the material world was evil and the spirit was the only good. Various versions of Gnosticism were prevalent during the Ante-Nicene era. Irenaeus of Lyons directed his work, Against Heresies, to the Gnosticism of his day. See “Ante-Nicene Fathers” in the Fathers section of the Reference tab.\r\rGreek, γνῶσις (gnosis) “knowledge”.\r\rFurther Reference:\rInternet Encyclopedia of Philosophy, “Gnosticism”\rhttp://tinyurl.com/7fw4t3w\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gospel",
                           @"twitterDef":@"the good news of and about Jesus of Narareth;\rone of the four biblical accounts of his life",
                           @"definition":@"\rThe concept of the gospel first appears Isaiah 52:7, where it is connected to the good news that Israel's God is King:\r\r“How beautiful upon the mountains are the feet of the one bringing good news, announcing peace, bearing good news, announcing salvation, saying to Zion, 'Your God is King!'”\r\rNew Testament writers such as Paul use it to refer to the message about Jesus as Messiah. Later, it became a term for one of the four canonical written accounts of the life and ministry of Jesus (Matthew, Mark, Luke, and John). The synoptic gospels of Matthew, Mark, and Luke use it to refer to Jesus' message about the Kingdom of God. It was also used by Roman authors to describe the events surrounding the Emperor of Rome.\r\rAs a literary genrè, the Gospels are theological interpretations of the life of Jesus. The Church has identified three distinct stages of Gospel formation:\r\r1. the ministry of the historical Jesus\r2. the preaching of the Apostles\r3. the composition of the Gospels\r\rSee “Synoptic Gospels”.\r\rGreek, εὐαγγέλιον (evangelion) “good news”\r\rFurther Reference:\rPontifical Biblical Commission\r“Instruction on the Historical Truth of the Gospels”, http://tinyurl.com/pbazegx\r\rCatechism of the Catholic Church, 75\rhttp://tinyurl.com/bx8mnlu\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gloria Patri",
                           @"twitterDef":@"a doxology to the Trinity in Latin",
                           @"definition":@"\r“Glory to the Father, and to the Son, and to the Holy Spirit, as it was in the beginning, is now, and ever shall be world without end. Amen.”\r\rFurther Reference:\rAdoremus, “Latin Prayers”\rhttp://tinyurl.com/pv5cjvr\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Glossolalia",
                           @"twitterDef":@"the speaking in new languages inspired by the Holy Spirit",
                           @"definition":@"\rAccording to St. Paul in 1 Corinthians 14, glossolalia was a spiritual gift manifested in liturgical worship. While not denying its validity, he encouraged a disciplined practice only if accompanied by a translation.\r\rFurther Reference:\rJ. Massingberd Ford\r“Toward a Theology of Speaking in Tongues”\rhttp://tinyurl.com/p3n7dwq\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"God of the Gaps",
                           @"twitterDef":@"the belief that any scientific unknowns are necessarily evidence of God's intervention",
                           @"definition":@"\rThis phrase is used to describe the beliefs of those who misunderstand the different domains, methods, and explanations of theology and science. They mistake the absence of scientific explanation for proof of a theological claim. As stated by the National Academy of Sciences in 2008:\r\r“Both science and religion are weakened by claims that something not yet explained scientifically must be attributed to a supernatural deity. Theologians have pointed out that as scientific knowledge about phenomena that had been previously attributed to to supernatural causes increases, a 'god of the gaps' approach can undermine faith. Furthermore, it confuses the roles of science and religion by attributing explanations to one that belong in the domain of another.”\r-Science, 54\r\rFurther Reference:\rScience Meets Religion\r“God of the Gaps”, http://tinyurl.com/q82ajyv\r\rNational Academy of Sciences\r“Science, Evolution, and Creationism”\rhttp://tinyurl.com/qhk7tvv\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Good Friday",
                           @"twitterDef":@"the liturigcal memorial of the crucifixion of Jesus",
                           @"definition":@"\rGood Friday is the day of the Crucifixion and is part of the Triduum. Like Ash Wednesday, it is a traditional day of fasting and abstinence. See “Triduum”.\r\rFurther Reference:\rPope Francis, Good Friday Way of the Cross\rhttp://tinyurl.com/ljvqyjp\r\rWikipedia, Good Friday”\rhttp://tinyurl.com/blzzm\r\r\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Greek Orthodox",
                           @"twitterDef":@"the Eastern churches in communion with\rthe Patriarch of Constantinople",
                           @"definition":@"\rSee “Eastern Orthodox”.",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gregorian Chant",
                           @"twitterDef":@"plainsong liturgical chant associated\rwith Pope Gregory I",
                           @"definition":@"\rNamed after Pope Gregory I, who collected various liturgical chants, Gregorian Chant is a form of plainchant characterized by a simple, monophonic melody. The Bishops of Vatican II taught that it should be given priority in liturgical services. In 1974, Pope Paul VI directed the Sacred Congregation for Divine Worship to send a booklet of Gergorian Chants to all Bishops containing a concise collection of chants for use in the Liturgy:\r\r“This minimum repertoire of Gregorian chant has been prepared with that purpose in mind: to make it easier for Christians to achieve unity and spiritual harmony with their brothers and with the living traditions of the past. Hence it is that those who are trying to improve the quality of congregational singing cannot refuse to Gregorian chant the place which is due to it.”\r-Voluntati Obsequens\r\rSee “Liturgy”. See the Liturgy section of the Overview tab.\r\rFurther Reference:Congregation for Divine Worship\r“Jubilate Deo”\rhttp://tinyurl.com/3rbssgk\r\rVatican II, “Sacrosanctum Concilium”, 116\rhttp://tinyurl.com/ay8y\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    /////////////////////////H
    
    [TAWord wordWithDict:@{@"name":@"Habit",
                           @"twitterDef":@"a pattern of action acquired through repetition",
                           @"definition":@"\rAncient Greek philosophers identified the phenomenon and influence of habits on human behavior. Habits can mitigate the moral culpability of human acts. St. Thomas Aquinas described theological habits as being necessary for authentic theology. The British theologian, Aidan Nichols, has identified three characteristics of intellectual habits: argumentation, retention, and imagination. These three, in addition to the dimension of faith, are necessary for the study of theology.\r\rFurther Reference:\rWikipedia, “Habit”\rhttp://tinyurl.com/ygop72e\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hail Mary",
                           @"twitterDef":@"an invocation to the Blessed Virgin Mary for her intercession",
                           @"definition":@"\rThe Haily Mary is a prayer based on the angel Gabriel's message to Mary in the Gospel of Luke:\r\r“Hail Mary, full of grace, the Lord is with thee! Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.”\r\rFurther Reference:\rCatechism of the Catholic Church, 2676\rhttp://tinyurl.com/k5r7clc\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hebrew",
                           @"twitterDef":@"the Semitic language of ancient Israel",
                           @"definition":@"\rThe original language of the Old Testament, with a few portions written in Aramaic.\r\rFurther Reference:\rDavid Steinberg\r “History of the Ancient and Modern Hebrew Language”\rhttp://tinyurl.com/o3op9by\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Heart",
                           @"twitterDef":@"the biblical word for the needs and desires of human nature",
                           @"definition":@"\rAccording to the late Msgr. Luigi Guissani, what the Bible calls the “heart”, is a shorthand reference to the larger set of needs and desires of human nature; truth, goodness, beauty, and justice. Before being elected Pope, Cardinal Bergoglio claimed that most urgent task for faith today is uncovering the true desires and needs of the heart. See “Elementary Experience”.\r\rFurther Reference:\rJorge Mario Bergolgio\r“For Man” in “A Generative Thought: An Introduction to the Works of Luigi Giussani”\rhttp://tinyurl.com/pkk5k6m\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hallelujah",
                           @"twitterDef":@"a Hebrew word meaning “Praise Yahweh”",
                           @"definition":@"\rHallelujah occurs frequently throughout the Old Testament, especially in the Psalms.\r\rHebrew, הַלְּלוּיָהּ (halleluya)\r\rFurther Reference:\rWikipedia, “Hallelujah”\rhttp://tinyurl.com/5gctqe\r\r\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Heaven",
                           @"twitterDef":@"the state of complete union with God",
                           @"definition":@"\rHeaven is the state of those who willingly accept God's love for eternity.\r\rFurther Reference:\rCatechism of the Catholic Church, 1021\rhttp://tinyurl.com/k3f2f8p\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hell",
                           @"twitterDef":@"the state of complete separation from God",
                           @"definition":@"\rHell is the state of those who willingly refuse God's love for eternity.\r\rFurther Reference:\rCatechism of the Catholic Church, 1033\rhttp://tinyurl.com/k3f2f8p\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Henotheism",
                           @"twitterDef":@"the belief that many gods exist while only one is served",
                           @"definition":@"\rThe pre-exilic Israelites believed that foreign gods were real, but that they only had a covenant with Yahweh. See “Monotheism”.\r\rFurther Reference:\rWikipedia, “Henotheism”\rhttp://tinyurl.com/chgvyn\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Heresy",
                           @"twitterDef":@"the formal denial of revealed truth",
                           @"definition":@"\rHeresy is characterized by obstinance in the denial of fomrally revealed truth.\r\rFurther Reference:\rCatechism of the Catholic Church, 2089\rhttp://tinyurl.com/lu75a9k\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hesychasm",
                           @"twitterDef":@"a silent form of prayer associated with Eastern Orthodox monks",
                           @"definition":@"\rHesychasm is a mystical form of prayer with an emphasis on silence and the quieting of the physical senses in order to focus on the sense of the soul.\r\rGreek, ἡσυχία (hesychia) “silence”\r\rFurther Reference:\rWikipedia, “Hesychasm”\rhttp://tinyurl.com/5s5joa\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Theology",
                           @"twitterDef":@"the study of theology in light of historical periods, events, people, or trends",
                           @"definition":@"\rOver the last 100 years, historical theology has become a sub-discipline of theology. It is usually divided into various periods in Church history:\r\rPatristic\rMedieval\rByzantine\rReformation\rModern\r\rSee “Theology”.\r\rFurther Reference:\rChurch History and Historical Theology\rhttp://tinyurl.com/nlhkquo\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hinduism",
                           @"twitterDef":@"the dominant polytheistic religion of India that holds Brahman as the Divine Absolute",
                           @"definition":@"\rHinduism is the world's oldest recognized and third largest religion. It is characterized by a belief in the inspiration of the Vedas, reincarnation, and a Supreme Being known as Brahman.\r\rFurther Reference:\rWikipedia, “Hinduism”\rhttp://tinyurl.com/6ufnx\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Jesus",
                           @"twitterDef":@"the historical figure of Jesus as reconstructed by historical methodology",
                           @"definition":@"\rThe historical Jesus is a term that emphasizes what can be known about Jesus of Nazareth from historical methodology apart from theological belief. The so-called Quest for the Historical Jesus is a phrase invented by Albert Schweitzer, based on his book of the same name. There have been 3 quests over the last 200 years, with each period producing successive consensus claims. John Meier cautions against equating the Historical Jesus with the “real” Jesus:\r\r“Jesus lived for roughly 35 years in first- century Palestine. Each of those years was filled with physical and psychological changes. Even before he began his public ministry, many of his words and deeds would have been witnessed by his family and friends, his neighbors and customers. In principle these events were available at the time to the interested inquirer. Then, for the last three years or so of his life, much of what Jesus said and did occurred in public or at least before his disciples, especially those who traveled with him. Again, in principle these events were recoverable by a zealous inquirer. And yet the vast majority of these deeds and words, the 'reasonably complete' record of the 'real' Jesus, is irrevocably lost to us today...The Jesus of history is a modern abstraction and construct, not to be equated with the 'real' Jesus, whether that reality be understood as 'total' or just 'reasonably complete.' By the Jesus of history I mean the Jesus whom we can 'recover' and examine by using the scientific tools of modern historical research...Of its very nature this quest can reconstruct only fragments of a mosaic, the faint outline of a faded fresco that allows of many interpretations. We constantly have to remind our pupils, and sometimes even ourselves, that there are no video tapes or cassette recordings of what Jesus said or did. For better or worse, there are no Watergate tapes of Jesus' trial before Pilate. Worse still, this marginal Jew in a marginal province at the eastern end of the Roman Empire left no writings of his own (as Cicero did), no archeological monuments or artifacts (as Augustus did), nothing that comes directly from him without mediators. A moment's reflection on these stark facts makes clear why the paradox I offer has to be true: the historical Jesus is not the real Jesus, and vice versa. The historical Jesus may give us fragments of the real person, but nothing more.”\r-Meier, 15, 18-19\r\rSee “Jesus of Nazareth”\r\rFurther Reference:\rJohn Meier\r“The Historical Jesus: Rethinking Some Concepts”\rhttp://tinyurl.com/ngubz7o\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hierarchy of Truths",
                           @"twitterDef":@"the relative degrees of importance between various truths of the faith",
                           @"definition":@"\rThe notion of the Hierarchy of Truths is a recognition that some doctrines are more foundational to Christian identity than others.\r\rFurther Reference:\rVatican II, “Unitatis Redintegratio”, 11\rhttp://tinyurl.com/3xnyh\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Human Rights",
                           @"twitterDef":@"the rights due to a person by virtue of his or her being a human being",
                           @"definition":@"\rA list of thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights. Pope John XXIII was the first Pope to give them ecclesial sanction.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 152. http://tinyurl.com/pgklzdg\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Hermeneutics",
                           @"twitterDef":@"the science of interpretation",
                           @"definition":@"\rHermeneutics is a fundamental human activity as they seek to derive meaning from their experience. In the context of theology, it is used to describe the process of interpreting a text, typically the Bible or Magisterial statement. Proper understanding of the meaning of a text it the present requires proper understanding of the meaning of a text in its original context. Thomas Ommen notes that the act of interpretation produces its own dynamic that transcends historical understanding:\r\r“In both the philosophical and theological hermeneutical discussions, the situation of the interpreter clearly appears as a hermeneutical problem when two objectives of interpretation are chosen. In the first place, the interpreter is drawn into the event of interpretation when he is asked to read and interpret texts in light of the subject matter or tradition they bring to expression. Interpretation in light of the subject matter identifies the tradition in which both text and interpreter are located which transcends the particular horizon of each considered in itself. The second point at which the situation of the interpreter has a clear impact on historical understanding is in the interpreter's attempt to apply the subject matter of tradition in his own situation. The reformulation of a text in one's own terms mediates tradition not as a past fact but as an existentially significant concern for men today. Interpretation in light of the subject matter and application compels the interpreter to make decisions, draw upon his personal convictions and experience, and appropriate the past in an involved, existential manner that is not so typical of the reconstruction of the meaning of a text in its own historical situation and of the past tradition in which it stands.”\r-Ommen, 615\r\rThe Greek root of “hermeneutics” is named after Heremes, the messenger of the gods in Greek mythology. See “Exegesis”, “Historical-Critical Method”.\r\rGreek, ἑρμηνεία (hermeneia) “interpretation”\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/ymsltv\r\rThomas Ommen\r“The Hermeneutic of Dogma”\rhttp://tinyurl.com/noj8w8f\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hermeneutical Circle",
                           @"twitterDef":@"the dialectic relationship between text and interpreter",
                           @"definition":@"\rThe hermeneutical circle begins with an interpreter and a text involved in a process of question, discovery, interpretation, which then challenges or changes the initial question.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Hermeneutics”, http://tinyurl.com/mylef6\r\r\r",
                           @"category":@"Systematic"}];
    

    [TAWord wordWithDict:@{@"name":@"Historical Books",
                           @"twitterDef":@"the second of five sections in the Old Testament",
                           @"definition":@"\rThe Historical Books deal primarily with the beginning of the Israelite nation, subsequent downfall, and eventual restoration. They include Joshua, Judges, Ruth, 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, and Nehemiah. See the Scripture section of the Overview tab.\r\rFurther Reference:\rNew American Bible Revised Edition\r “Historical Books”, http://tinyurl.com/qg82mvo\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical-Critical Method",
                           @"twitterDef":@"the hermeneutical method which examines an author's intent through exegesis",
                           @"definition":@"\rThe hermeneutical method which seeks to uncover the intention of the author through exegetical analysis of history, language, literature, sources, and culture. According to the Pontifical Biblical Commission, it is the one essential method for Catholic hermeneutics. Fr. Joseph Fitzmeyer summarizes its characteristics:\r\r“The method is called 'historical-critical' because it borrows its techniques of interpreting the Bible from historical and literary criticism. It recognizes that the Bible, though containing the Word of God, is an ancient record, composed indeed by a multiplicity of authors over a long period of time in antiquity. Being such an ancient composition, it has to be studied and analyzed like other ancients records. Since much of it presents a narrative account of events that affected the lives of ancient Jews and early Christians, the various accounts have to be analyzed against their proper human and historical backgrounds, in their contemporary contexts, and in their original languages. In effect, this method applies to the Bible all the critical techniques of classical philology, and in doing so it refuses a priori to exclude any critical analysis in its quest for the meaning of the text.”\r-Fitzmeyer, 249\r\rHowever, while this method may be necessary, it is not, in itself, sufficient for a complete interpretation of a text. Fr. John Wright noted that authentic interpretation involves an existential affordance:\r\r“In all of this the historical-critical method of inquiry will be very necessary for determining the meaning of the text, hence the meaning of the faith/revelation event which the text embodies. But it seems clear that the historical-critical method will not be sufficient; for the meaning of words is not determined merely by other words but by distinctive experiences, and the distinctive experiences underlying the words of the faith/revelation event are precisely experiences of faith in response to divine self-communication. Theologians using the Scriptures in theology must, then, not only use all the necessary aids of historical-critical research; they must also allow the words of Scripture to bring about in their own interior the event of faith/revelation that the words express and embody, endeavor to understand this, and to express it in a way relevant to their own cultural and life situations.”\r-Wright, 658\r\rSee “Exegesis”, “Hermeneutics”\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/nmj6amr\r\rRev. Joseph Fitzmeyer\r“Historical Criticism: Its Role in Biblical Interpretation and Church Life”\rhttp://tinyurl.com/p7488ev\r\rRev. John Wright\r“The Bible and the Hermeneutical Horizon: The Use of Scripture in Theology”\rhttp://tinyurl.com/nf2v2h7\r\r\r",
                           @"category":@"Biblical"}];
   
    /*
    [TAWord wordWithDict:@{@"name":@"Historical Criticism",
                           @"twitterDef":@"the analysis of the historical context of a text",
                           @"definition":@"\rThe type of exegetical criticism which deciphers and analyzes the historical context of a text. See “Historical-Critical Method”.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/nmj6amr\r\rRev. Joseph Fitzmeyer\r“Historical Criticism: Its Role in Biblical Interpretation and Church Life”, 249. http://tinyurl.com/p7488ev\r\r\r",
                           @"category":@"Biblical"}];
    */
    
    [TAWord wordWithDict:@{@"name":@"Holy",
                           @"twitterDef":@"set apart from the ordinary, sacred",
                           @"definition":@"\rGod is characterized as holy throughout the Catholic tradition. In the Scriptures, Yahweh declares himself to be worshipped with the refrain “Holy, Holy, Holy” (Isaiah 6:3). Jesus is referred to as the Holy One (Acts 3:14). The Blessed Virgin Mary is referred to as the panhagia (all-holy). Holiness is one of the four marks of the Church.\r\rFurther Reference:\rWikipedia, “Sacred”\rhttp://tinyurl.com/pl9q2zh\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy of Holies",
                           @"twitterDef":@"the innermmost chamber in the Temple that housed the Ark of the Covenant",
                           @"definition":@"\rThe Holy of Holies was the permanent resting place for the Ark of the Covenant, believed to reside in the Temple from the monarchy of Solomon until the Exile in 587 BCE. Only the High Priest was allowed to enter it once a year on the Day of Atonement. See “Day of Atonement”.\r\rFurther Reference:\rWikipedia, “Holy of Holies”\rhttp://tinyurl.com/qdrws4v\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Holiness Code",
                           @"twitterDef":@"the legal code found in Leviticus 17-26",
                           @"definition":@"\rThe Holiness Code is one of three distinct legal codes found within the Torah. Like the Covenant and Deuteronomic Codes, the Holines Code includes various casuistic laws dealing with altar sacrifices, sexual immorality, and series of laws also found in the Decalogue. See “Covenant Code”, “Decalogue, “Deuteronomic Code”, “Priestly Source”.\r\rFurther Reference:\rRev. M.B. Fallon, “Holiness Code”\rhttp://tinyurl.com/np5prcc\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Orders",
                           @"twitterDef":@"the Sacrament of Ordination to Apostolic ministry",
                           @"definition":@"\rThere are three degrees of Holy Orders: episcopate, presbyterate, and diaconate. See “Bishop”, “Priest”, “Deacon”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1536\rhttp://tinyurl.com/4hs6lso\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Saturday",
                           @"twitterDef":@"the liturgical memorial of Christ's descent into the underworld",
                           @"definition":@"\rThe Apostle's Creed states that Christ descended into “hell”. The Latin edition of the Creed uses infero (“those below”), while the original Greek of the Creed uses the word κατώτατα (“the lowest”) to refer to the place where Christ descended.\r\rFurther Reference:\rVatican, “Ancient Homily for Holy Saturday”\rhttp://tinyurl.com/czv5g7\r\r\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Holy Spirit",
                           @"twitterDef":@"the third person of the Trinity",
                           @"definition":@"\rThe Spirit (or breath) of God is the animating principle of creation in the Genesis creation accounts (Gen 1:1, 2:7). The Spirit of God is that which causes Moses and other prophets to utter divine oracles (Num. 11:29). The Spirit of God descends upon Jesus at his Baptism (Mark 1:10) and enables him to preform exorcisms (Matt. 12:28). It is the promised advocate (John 14:6) given as a gift (Acts 2:38) to those who confess Jesus as Lord (1 Cor. 12:3). In patristic thought, the Holy Spirit is analogous to the love between the Father and Son. It credal disputes, the Holy Spirit proceeds from the Father and the Son. See “Filioque”, “Periochoresis”, “Trinity”.\r\rFurther Reference:\rCatechism of the Catholic Church, 691\rhttp://tinyurl.com/nhrp9uj\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Water",
                           @"twitterDef":@"the Sacramental of water that signifies Baptism",
                           @"definition":@"\rHoly Water is sprinkled on worshippers during the Easter Vigil and usually available at various stations in a church building. See “Baptism”, “Sacramental”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1668\rhttp://tinyurl.com/oo3cp5p\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Homily",
                           @"twitterDef":@"a discourse based on the mysteries of faith and Christian life suited to the congregation",
                           @"definition":@"\rHomilies are present with Scripture itself (Luke 6, Acts 4) and always serve to build up the Church. The Homily should be based on the readings and the prayers from Lectionary.\r\rFurther Reference:\rCongregation for Divine Worship\r“Homiletic Directory”\rhttp://tinyurl.com/oreb9lc\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Homoiousios",
                           @"twitterDef":@"the Greek word meaning “of similar substance”",
                           @"definition":@"\rThis word was used by Arius and pro-Arian bishops at Nicea to describe the relationship of the Son to the Father. See “Homoousious”.\r\rGreek, ὁμοιούσιος (homoiousios)\r\rFurther Reference:\rCatechism of the Catholic Church, 465\rhttp://tinyurl.com/37wuaux\r\r\r",
                           @"category":@"Historical"}];

    [TAWord wordWithDict:@{@"name":@"Homoousios",
                           @"twitterDef":@"the Greek word meaning “of the same substance”",
                           @"definition":@"\rHomoousios was one of the terms used by Athanasius and other like-minded bishops at Nicea to explain the relationship of the Son to the Father. See “Homoiousious”.\r\rGreek, ὁμοούσιος (homoousios)\r\rFurther Reference:\rCatechism of the Catholic Church, 465\rhttp://tinyurl.com/37wuaux\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Host",
                           @"twitterDef":@"the unleavened bread reserved for Eucharistic consecration",
                           @"definition":@"\rThe Host is made of unleavened bread in the Western liturgical tradtion, while the East has historically used leavened bread. It is placed on a Paten when on the Altar. See “Altar”, “Eucharist”, “Paten”.\r\rFurther Reference:\rNew Advent, “Host”\rhttp://tinyurl.com/7p5tg75\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Human Development",
                           @"twitterDef":@"the vocation to be fully human by enhancing the integral well-being of all people in light of the Gospel",
                           @"definition":@"\rHuman Development is a central theme in Catholic Social Teaching as it applies to the principle of the Life and Dignity of the Human Person. Recent popes have emphasized its holistic character, while cautioning against tendencies to reduce it to mere economic well-being. Pope Benedict XVI claimed:\r\r“...authentic human development concerns the whole of the person in every single dimension. Without the perspective of eternal life, human progress in this world is denied breathing space. Enclosed within history, it runs the risk of being reduced to the mere accumulation of wealth; humanity thus loses the courage to be at the service of higher goods, at the service of the great and disinterested initiatives called forth by universal charity. Man does not develop through his own powers, nor can development simply be handed to him. In the course of history, it was often maintained that the creation of institutions was sufficient to guarantee the fulfilment of humanity's right to development. Unfortunately, too much confidence was placed in those institutions, as if they were able to deliver the desired objective automatically. In reality, institutions by themselves are not enough, because integral human development is primarily a vocation, and therefore it involves a free assumption of responsibility in solidarity on the part of everyone. Moreover, such development requires a transcendent vision of the person, it needs God: without him, development is either denied, or entrusted exclusively to man, who falls into the trap of thinking he can bring about his own salvation, and ends up promoting a dehumanized form of development. Only through an encounter with God are we able to see in the other something more than just another creature, to recognize the divine image in the other, thus truly coming to discover him or her and to mature in a love that 'becomes concern and care for the other.'”\r-Benedict XVI, 18\r\rThe economic aspect of human development has been measured by the United Nations since 1990 with the first Human Development Report, which informs the work of the Catholic Campaign For Human Development. See “Dignity of the Human Person”, “Catholic Social Teaching”.\r\rFurther Reference:\rBenedict XVI\r“Caritas En Veritate”\rhttp://tinyurl.com/lpqbs8v\r\rInternational Theological Commission\r“Human Development and Christian Salvation”\rhttp://tinyurl.com/pjfjvtk\r\rUnited Nations Development Programme\rhttp://tinyurl.com/khsqbzk\r\r\r",
                           @"category":@"Cultural"}];

    
    [TAWord wordWithDict:@{@"name":@"Human Person",
                           @"twitterDef":@"a human being with the capacity for self-transcendence",
                           @"definition":@"\rAccording to the teaching of the Church, human beings are also human persons from the moment of conception. Disputed questions include the pheneomenon of twinning and the problems associated with dualism. See “Personhood”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2270\rhttp://tinyurl.com/dh7r\r\r\r",
                           @"category":@"Systematic"}];
    
    
    
    
    ////////////////////////////////////////////////////////////I
    
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Icon",
                           @"twitterDef":@"a religious image used for veneration",
                           @"definition":@"\rIcons were approved for use in worship after the Iconoclasm controversy, settled at the Second Council of Nicea in A.D. 787. See “Iconoclasm”. See “Nicea” in the Historical section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 1159\rhttp://tinyurl.com/oa9lfkj\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Immanuel",
                           @"twitterDef":@"a Hebrew word meaning “God is with us” applied to Jesus in the Gospel of Matthew",
                           @"definition":@"\rThis word is used as a name for the child (likely Hezekiah) born as a sign to King Ahaz in Isaiah 7:14 that the northern alliance between Assyria and Israel will not defeat Judah. The author of the gospel of Matthew uses it as a typology of the birth of Jesus. See “Typology”.\r\rHebrew, עִמָּנוּאֵל (immanuel)\r\rFurther Reference:\rNew American Bible Revised Edition\rIsaiah 7:14\rhttp://tinyurl.com/no8ezoz\r\r\r",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Iconoclasm",
                           @"twitterDef":@"the prohibition against the veneration of Icons",
                           @"definition":@"\rIconoclasm was based on the injunction given in the first Commandment in Exodus 20: “You shall not make for yourself any graven image.” Proponents of icons argued that the Incarnation had introduced a new economy of images, since the Image of God Himself, had become visible. Iconoclasm was anathematized at the Second Council of Nicea in A.D. 787.\r\rFurther Reference:\rCatechism of the Catholic Church, 2131\rhttp://tinyurl.com/lu75a9k\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Incarnation",
                           @"twitterDef":@"the uniting of the eternal Son of God to a human nature",
                           @"definition":@"\rThe Incarnation is described directly in John 1:14: “And the Word was made flesh and dwelt among us.” The Church teaches that in the Incarnation, God became human so that humanity could become divinized. See “Chalcedonian Definition”, “Theosis”.\r\rFurther Reference:\rCatechism of the Catholic Church, 461\rhttp://tinyurl.com/37wuaux\r\r\r",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Immaculate Conception",
                           @"twitterDef":@"the dogma that the Virgin Mary was conceived without Original Sin",
                           @"definition":@"\rThe dogma of the Immaculate Conception was defined by Pope Pius IX in his 1854 encyclical, “Ineffibalis Deus”. It emaphsizes the pre-eminent role of the Blessed Virgin Mary in Salvation history. See “Dogma”, “Original Sin”, “Salvation”.\r\rFurther Reference:\rCatechism of the Catholic Church, 491\rhttp://tinyurl.com/3w9q9aw\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Infallibility",
                           @"twitterDef":@"the supernatural guarantee that the Church cannot err in teaching revealed truth",
                           @"definition":@"\rInfallibility is exercised in three ways:\r\r-by the consent of the Faithful\r-by the Bishops together with the Pope\r-by the Pope ex cathedra\r\rFurther Reference:\rCatechism of the Catholic Church, 888-892\rhttp://tinyurl.com/m65ttaf\r\rRev. Francis Sullivan\r“The Secondary Object of Infallibility”\rhttp://tinyurl.com/q5vf33e\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Intercession",
                           @"twitterDef":@"a type of prayer on behalf of others",
                           @"definition":@"\rIntercessory prayers are mentioned specifically in 1 Tim. 2:1. The Gospel of Luke portrays Jesus interceding for his enemies on the Cross. See “Prayer”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2634\rhttp://tinyurl.com/jwoavzg\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Invitatory Psalm",
                           @"twitterDef":@"the Psalm said either before the Office of Readings or Morning Prayer",
                           @"definition":@"\rThe Invitatory Psalm usually has the theme of praise to God for the newness of the day. It is often said as an antiphon. See “Antiphon”, “Morning Prayer”, “Office of Readings”.\r\rFurther Reference:\rCongregation for Divine Worship\r“General Instruction of the Liturgy of the Hours”\rhttp://tinyurl.com/3re28vo\r\r\r",
                           @"category":@"Liturgical"}];


    [TAWord wordWithDict:@{@"name":@"Impediment",
                           @"twitterDef":@"a hiderance to human freedom, actual or habitual",
                           @"definition":@"\rActual impediments are those found in the external situation of the subject. Virtual impediments are those found internally within the character of the subject.\r\rFurther Reference:\rCatechism of the Catholic Church, 1754\rhttp://tinyurl.com/lxslc7r\r\r\r",
                           @"category":@"Moral"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Immanence",
                           @"twitterDef":@"the quality of being located within human experience",
                           @"definition":@"\rThe Yahwist Source, more than any other literary source in the Torah, portrays God as immanent due to its prevalent use of anthropomorphism. See “Yahwist Source”, “Anthropomorphism”.\r\rFurther Reference:\rCatechism of the Catholic Church, 239\rhttp://tinyurl.com/4tymjt\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Idolatry",
                           @"twitterDef":@"the bestowal of ultimate value on that which is not ultimate",
                           @"definition":@"\rThe post-Exilic Hebrew prophets repeatedly condemn the worship of other gods by the Israelites as idolatry. Pope Francis has repeatedly condemned the idolatry of money, prevalent in wealthy nations, as a driving force of social injustice:\r\r“We have created new idols. The worship of the ancient golden calf (cf. Ex 32:1-35) has returned in a new and ruthless guise in the idolatry of money and the dictatorship of an impersonal economy lacking a truly human purpose. The worldwide crisis affecting finance and the economy lays bare their imbalances and, above all, their lack of real concern for human beings; man is reduced to one of his needs alone: consumption.”\r-Evangelii Gaudium, 55\r\rFurther Reference:\rPope Francis, “Evangelii Gaudium”\rhttp://tinyurl.com/ojdpva4\r\rFurther Reference:\rCatechism of the Catholic Church, 2113\rhttp://tinyurl.com/lu75a9k\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Inclusivism",
                           @"twitterDef":@"the belief that those who respond to the truth they have receieved may be saved",
                           @"definition":@"\rInclusivism is a soteriology developed by Karl Rahner in the mid-twentieth century. He developed the concept that all people possess a fundamental option for or against God. Those who have not experienced the particular grace of the Holy Spirit may nevertheless be saved if they have responded faithfully to the whatever light they have received:\r\r“Those also can attain to salvation who through no fault of their own do not know the Gospel of Christ or His Church, yet sincerely seek God and moved by grace strive by their deeds to do His will as it is known to them through the dictates of conscience. Nor does Divine Providence deny the helps necessary for salvation to those who, without blame on their part, have not yet arrived at an explicit knowledge of God and with His grace strive to live a good life. Whatever good or truth is found amongst them is looked upon by the Church as a preparation for the Gospel.”\r-Lumen, 16\r\rSee “Fundamental Option”.\r\rFurther Reference:\rInternational Theological Commission\r“Christianity and the World Religions”\rhttp://tinyurl.com/psjvt8z\r\rVatican II, “Lumen Gentium”\rhttp://tinyurl.com/3wxff\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Inspiration",
                           @"twitterDef":@"the Divine catalyst for the writing of Sacred Scripture",
                           @"definition":@"\rAccording to Church teaching, the Scriptures are inspired. Accordingly, this means that God motivated the human authors of Scripture to write as they did. Inspiration is not dictation; the Word of God is expressed through dynamism of the human person in the words of Scripture.\r\rLatin, (inspirata) “breathed”\r\rFurther Reference:\rVatican II, “Dei Verbum”, 11\rhttp://tinyurl.com/3ecxu\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Integral Ecology",
                           @"twitterDef":@"the environmental context of the human person in light of the truths of Creation",
                           @"definition":@"\rPope Francis has made the subject of integral ecology a theme of his latest encyclical.\r\r“Since everything is closely interrelated, and today’s problems call for a vision capable of taking into account every aspect of the global crisis, I suggest that we now consider some elements of an integral ecology, one which clearly respects its human and social dimensions...When we speak of the “environment”, what we really mean is a relationship existing between nature and the society which lives in it. Nature cannot be regarded as something separate from ourselves or as a mere setting in which we live. We are part of nature, included in it and thus in constant interaction with it...An integral ecology is marked by this broader vision.”\r-Laudato Si”, 137, 139, 159\r\rFurther Reference:\rPope Francis, “Laudato Si”\rhttp://tinyurl.com/o6sowft\r\rUnited States Conference of Catholic Bishops, “Renewing The Earth”, http://tinyurl.com/88p92au\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Interpretation",
                           @"twitterDef":@"the process of determining the meaning, significance, and relevance of a text",
                           @"definition":@"\rInterpretation of any text, especially the Bible, requires knowing the context of the writing. This, in turn, requires efforts to know the author's intent, which is partly discerned by studying the text's literary form. See “Exegesis”, “Hermeneutics”, “Sitz im Leben”.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/nmj6amr\r\rRev. M.B. Fallon\r“Interpreting and Understanding the Texts”\rhttp://tinyurl.com/pas2gb5\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Israel",
                           @"twitterDef":@"the Hebrew name given to Jacob meaning “struggles with God”",
                           @"definition":@"\rAccording to the stories in Genesis, Jacob was the son of Isaac and father of twelve sons whose decendants became the twelve tribes of Israel.\r\rHebrew, יִשְׂרָאֵל (yisrael)\r\rFurther Reference:\rCatechism of the Catholic Church, 62\rhttp://tinyurl.com/pesbbq3\r\r\r",
                           @"category":@"Biblical"}];
    
    
    
    //////////////////////////////J
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Jesus of Nazareth",
                           @"twitterDef":@"the first-century Jewish prophet who proclaimed the Kingdom of God",
                           @"definition":@"\rAccording to the teaching of the Church, the historical Jesus of Nazareth was the subject of the Incarnation. He proclaimed and manifested the Kingdom of God during his public ministry. He was executed by the Roman govenor Pontius Pilate according to the set purpose of God, and was raised from dead as the Christ and Son of God. See “Christ”, Historical Jesus”, “Incarnation”.\r\rFurther Reference:\rCatechism of the Catholic Church, 423\rhttp://tinyurl.com/m2a65kl\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"JE Epic",
                           @"twitterDef":@"the combined work of the Yahwisht and Elohist authors into a single theological history of Israel",
                           @"definition":@"\rBefore or soon after the fall of the Northern Kingdom of Israel to the Assyrians in 722 B.C., an unknown scribe brought the Elohist Source material south to Jerusalem for safe keeping. At a later date, another scribe (likely from the tribe of Judah) combined these two narratives into a single work with the resulting story being dominated by the Yahwist account. See “Documentary Hypothesis”, “Elohist Source”, “Yahwist Source”.\r\rFurther Reference:\rNew American Bible Revised Edition\r“Pentateuch”, http://tinyurl.com/qbuoudr\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Justification",
                           @"twitterDef":@"the act of being put into a just relationship",
                           @"definition":@"\rSt. Paul uses this legal term in his letter to the Romans to describe those who have faith in Jesus Christ. The genetive case of the Greek phrase πίστις Χριστοῦ (pistis Christou) can be translated “faith about Christ” or “faith of Christ”. The former is the more traditional translation. The latter lends itself to an interpretation of Paul that emphasizes trust in God like that of Jesus himself being that which justifies. In both interpretations, however, Jesus is the exemplar of the human response to God.\r\rFurther Reference:\rCatechism of the Catholic Church, 1990\rhttp://tinyurl.com/yaua7cc\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Justice",
                           @"twitterDef":@"the state of right relationships between individuals and groups in society",
                           @"definition":@"\rThe biblical authors use the concept of Justice to describe the proper relationship between God and human beings. Abraham was justified because of his faith. St. Paul claims that believers in Jesus are justified through their faith in the same way. According the Social Doctrine of the Church, there are three aspects to Social Justice:\r\r-Commutatitve\r-Contributive\r-Distributive\r\rSee “Commutative Justice”, “Contributive Justice”, “Distributive Justice”, “Social Justice”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1807\rhttp://tinyurl.com/pd2yc32\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Jus Ad Bellum",
                           @"twitterDef":@"a set of criteria used to determine if war is justified in a given situation",
                           @"definition":@"\rJus Ad Bellum criteria include: just cause, comparative justice, competent authority, right intention, probability of success, last resort, proportionality. See “Just War Theory”.\r\rLatin, (jus ad bellum) “justice to war”\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “War”\rhttp://tinyurl.com/84c2ppg\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Jus Im Bello",
                           @"twitterDef":@"a set of criteria used to determine if the methods of war are justified",
                           @"definition":@"\rJus Im Bello criteria include: distinction, proportionality, military necessity. See “Just War Theory”.\r\rLatin, (jus im bello) “justice in war”\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “War”\rhttp://tinyurl.com/84c2ppg\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Just War Theory",
                           @"twitterDef":@"the set of criteria for determining the justice of both the conditions and methods of war",
                           @"definition":@"\rThe theory first developed by Augustine and later refined by Aquinas which consists of criteria for determining the justice of both the conditions and methods of war. See “Jus Ad Bellum”, “Jus Im Bello”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2309\rhttp://tinyurl.com/dh7r\r\rStanford Encyclopedia of Philosophy, “War”\rhttp://tinyurl.com/84c2ppg\r\r\r",
                           @"category":@"Moral"}];
    
    /*
     Word *jerusalem = 
     jerusalem.@"name":@"Jerusalem";
     jerusalem.@"twitterDef":@"The capital of the united monarchy established under David";
     jerusalem.@"definition":@"The capital of the united monarchy established under David; the captial of the southern kingdom of Judah after the death of Solomon; the location of Mount Zion and the Temple.";
     jerusalem.@"category":@"Biblical"}];
     */
    
    [TAWord wordWithDict:@{@"name":@"Jew",
                           @"twitterDef":@"a post-Exilic term for an Israelite",
                           @"definition":@"\rThe term “Jew” became synonymous with “Israelite” after the Exile, in part, because most of the captives from the southern kingdom were from the tribe of Judah. See “Exile”.\r\rFurther Reference:\rWikipedia, “Jew”\rhttp://tinyurl.com/dh7r\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Jubilee",
                           @"twitterDef":@"a year dedicated to the forgiveness of debts and liberation of property",
                           @"definition":@"\rThe biblical description of Jubilee is found in Levicticus 25:8-13. Every 50th year was to be a Jubilee year in which slaves were freed, debts were forgiven, and land was not sowed or plowed in order to replenish the soil. See “Forgiveness”.\r\rFurther Reference:\rVatican, “What Is A Holy Year?”\rhttp://tinyurl.com/4urhj\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Judah",
                           @"twitterDef":@"the fourth son and tribe of Israel;\rthe southern Israelite kingdom",
                           @"definition":@"\rThe tribe of Judah enjoyed a priviledged status during the united monarchy, especially under Solomon. Judah was exempt from his policies of taxation and forced labor. Captives from the kingdom of Judah were taken to Babylon during the Exile in 587 B.C. See “Jew”, “Exile”.\r\rFurther Reference:\rWikipedia, “Judah”\rhttp://tinyurl.com/k7mdc7y\r\r\r",
                           @"category":@"Biblical"}];
    
    /////////////////////////////////K
    
    [TAWord wordWithDict:@{@"name":@"Kataphatic",
                           @"twitterDef":@"language which makes postiive claims about God",
                           @"definition":@"\rKataphatic theology emphasizes the idea that God can be known through Divine Revelation. See “Divine Revelation”.\r\rFurther Reference:\rInternational Theological Commission\r“Theology Today”, http://tinyurl.com/brdt29m\r\rRev. Harvey Egan\r“Christian Apophatic and Kataphatic Mysticisms”\rhttp://tinyurl.com/nn74e8z\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Kenosis",
                           @"twitterDef":@"a Greek word meaning “the process of emptying”",
                           @"definition":@"\rSt. Paul uses the root of this word in his letter to the Philippians to describe the self-sacrifice of Jesus.\r\rFurther Reference:\rCatechism of the Catholic Church, 472\rhttp://tinyurl.com/37wuaux\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ketuv'im",
                           @"twitterDef":@"the Hebrew word meaning “writings”",
                           @"definition":@"\rThe Ketuv'im is the third of three sections in the Tanak and contains various writings such as the Psalms, Proverbs, Job, Song of Songs, Ruth, Lamentations, Ecclesiastes, Esther, Daniel, Ezra, and Chronicles. See “Tanak”.\r\rHebrew, כְּתוּבִים (tanak)\r\rFurther Reference:\rWikipedia, “Ketuv'im”\rhttp://tinyurl.com/6os5ny\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kosher",
                           @"twitterDef":@"foods that are appropriate to eat or sacrifice to Yahweh",
                           @"definition":@"\rThe classification of some foods as “kosher” is unique to the Priestly Source. Leviticus 11 gives a detailed list of foods that are considered by the Priestly author to be unclean. See “Priestly Source”.\r\rFurther Reference:\rTalmud, “Pesachim”, 22b\rhttp://tinyurl.com/n99yop6\r\rWikipedia, “Kosher Foods”\rhttp://tinyurl.com/druwv\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kerygma",
                           @"twitterDef":@"a Greek word meaning “proclamation”;\rthe proclamation of the Gospel",
                           @"definition":@"\rThe New Testament uses this word to describe both the proclamation of Jesus himself about the good news of the Kingdom as well as the Apostolic proclamation about his death and resurrection. Pope John Paul II stressed the continuity between the kergyma and ongoing catechesis:\r\r“Thus through catechesis the Gospel kerygma (the initial ardent proclamation by which a person is one day overwhelmed and brought to the decision to entrust himself to Jesus Christ by faith) is gradually deepened, developed in its implicit consequences, explained in language that includes an appeal to reason, and channelled towards Christian practice in the Church and the world. All this is no less evangelical than the kerygma, in spite of what is said by certain people who consider that catechesis necessarily rationalizes, dries up and eventually kills all that is living, spontaneous and vibrant in the kerygma. The truths studied in catechesis are the same truths that touched the person's heart when he heard them for the first time. Far from blunting or exhausting them, the fact of knowing them better should make them even more challenging and decisive for one's life.”\r-Catechesi, 25\rSee “Catechesis”, “Gospel”.\r\rGreek, κήρυγμα (kerygma)\r\rFurther Reference:\rPope John Paul II\r“Catechese Tradendae”\r\rhttp://tinyurl.com/ojhsyx8\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Koinonia",
                           @"twitterDef":@"a Greek word meaning “communion” or “participation”",
                           @"definition":@"\rSt. Paul uses this word to describe the spiritual unity that exists between Christians and Christ as well as the spiritual nature of Jesus body and blood made present during the Eucharist. See “Body of Christ”, “Eucharist”.\r\rFurther Reference:\rCatechism of the Catholic Church, 948\rhttp://tinyurl.com/pkxuudx\r\rWikipedia, “Koinonia”\rhttp://tinyurl.com/yl32y6a\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kyrie Eleison",
                           @"twitterDef":@"a Greek phrase used in the Liturgy meaning “Lord, have mercy.”",
                           @"definition":@"\rThe Kyrie dates back to the Old Testament as it appears in many of Psalms. It is mentioned explicitly as being part of the Liturgy in the Apostolic Constitutions of the 4th century. It is part of the Penetential Rite of the Roman Liturgy. See “Penitential Rite”.\r\rGreek, Κύριε, ἐλέησον (kyrie eleison)\r\rFurther Reference:\rHistory of Christian Liturgy: Kyrie\rhttp://tinyurl.com/23beubk\r\r\r",
                           @"category":@"Biblical"}];

    
    ///////////////////////////////////////////////////////L
    
    [TAWord wordWithDict:@{@"name":@"Last Rites",
                           @"twitterDef":@"the Sacraments of Penance and Eucharist administered to a person near death",
                           @"definition":@"\rLast Rites are the last Sacraments given in preparation for the final journey of the believer into eternal life. See “Sacrament”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1524\rhttp://tinyurl.com/n3lyve9\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Last Supper",
                           @"twitterDef":@"the final meal of Jesus with his disciples before his crucifixion",
                           @"definition":@"\rAll four Gospels portray Jesus sharing a last meal with his disciples. However, the Synoptics claim that it was a Passover seder meal, while the Gospel of John claims it was a regular meal before the beginning of Passover. See “Eucharist”, “Lord's Supper”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1323\rhttp://tinyurl.com/m88dbjl\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Laity",
                           @"twitterDef":@"non-ordained members of the Church",
                           @"definition":@"\rThe Laity are called to share in the kingly, prophetic, and priestly office of Christ. They manifest the “sensus fidei” (sense of the faith), which has at times, according to Cardinal John Henry Newman, preserved the faith of the Church and prevented the Magisterium from teaching error. See “Sensus Fidelium”.\r\rFurther Reference:\rCatechism of the Catholic Church, 897\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Latria",
                           @"twitterDef":@"a Greek word meaning “worship of God”",
                           @"definition":@"\rIn contrast to Dulia (veneration) given to creation, Latria refers to worship of God alone. See “Dulia”.\r\rFurther Reference:\rPope Paul IV, “Mysterium Fidei”, 55.\rhttp://tinyurl.com/p3hnoar\r\r\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Law of Moses",
                           @"twitterDef":@"the first five books of the Pentateuch",
                           @"definition":@"\rThe phrase “Law of Moses” is referred to in many places in the Hebrew Bible as a single scroll. Deuteronomy in particular presents itself as the “Law/Teaching of Moses“. The single word “Law” (Torah) is used as a shorthand for the entire Torah in the New Testament. The Law contains various commandments and regulations regarding morality and community life for the Israelites. See “Torah”, “Pentateuch”.\r\rHebrew, תֹּורַת מֹשֶׁה (torat moshe) “Law of Moses”\r\rFurther Reference:\rRev. M.B. Fallon, “Torah”\rhttp://tinyurl.com/o9ughyw\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lector",
                           @"twitterDef":@"a member of the laity who leads the congretation in reading or prayers",
                           @"definition":@"\rThe ministry of Lector is a service in the Liturgy through the reading of the Scriptures and and the Prayer of the Faithful. It is open to qualified members of the Laity. See “Laity”.\r\rFurther Reference:\rCatechism of the Catholic Church, 903\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lecturn",
                           @"twitterDef":@"the elevated platform behind which the lector, cantor, or homilist stands",
                           @"definition":@"\rThe Lecturn is usually placed beside the Altar. See “Ambo”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1184\rhttp://tinyurl.com/p9382z5\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lectio Divina",
                           @"twitterDef":@"the prayerful reading of Sacred Scripture",
                           @"definition":@"\rLectio Divina is part of the larger practice of Meditation, which the Church encourages on a regular basis. Lectio Divina increases attentiveness to the Word of God, which is active the life of the believer.\r\rLatin, (lectio divina) “Divine reading”\r\rFurther Reference:\rCatechism of the Catholic Church, 2708\rhttp://tinyurl.com/n937nqh\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lectionary",
                           @"twitterDef":@"the schedule of biblical passages read throughout the liturgical year",
                           @"definition":@"\rThe Church's Lectionary for Sundays is a three-year cycle of Scripture readings; the first reading from the Old Testament, a responsorial Psalm, a second reading from the New Testament (often an epistle), and a third reading from the Gospel. The weekday cycle is the first reading and Psalm every two years with the Gospel every year. See “Lector”, “Liturgy”\r\rFurther Reference:\rCongregation for Divine Worship\r“General Introduction to the Lectionary”\rhttp://tinyurl.com/pz7qk6r\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lent",
                           @"twitterDef":@"the 40 day period of repentance before the celebration of Easter",
                           @"definition":@"\rLent developed gradually in the Church. Irenaeus evidences its various observances in the late second century. Later, in the sixth century during the time of Gregory the Great, it was seen as a tithe of days at 36. The later practice of 40 days became standardized throughout the Church.\r\rFurther Reference:\rCongregation for Divine Worship\r“Paschalis Sollemnitatis”, 1\rhttp://tinyurl.com/mw2jk6h\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Leitmotif",
                           @"twitterDef":@"a recurring literary motif or theme",
                           @"definition":@"\rLeitmotifs derive from themes in musical compositions. See “Literary Criticism”.\r\rFurther Reference:\rWikipedia, “Leitmotif”\rhttp://tinyurl.com/pyfwwf6\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Levite",
                           @"twitterDef":@"a member of the priestly tribe of Levi",
                           @"definition":@"\rAccording to the Elohist Source in Exodus 32:29, the Levites were set apart to serve Yahweh as a reward for their faithfulness after rallying with Moses. Later in Deuteronomy 18:1-8, the Levites were specifically chosen as being the priests of Yahweh. This view is in contrast to that of the Priestly Source, which only allows the sons of Aaron to serve as priests. See “Priestly Source”.\r\rFurther Reference:\rWikipedia, “Levite”\rhttp://tinyurl.com/2boql2c\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lex Orandi, Lex Credendi",
                           @"twitterDef":@"a Latin phrase meaning the “law of prayer is the law of belief”",
                           @"definition":@"\rThis phrases stems from the Patristic era. idea makes the connection between belief and practice explicit.\r\rLatin, (lex orandi, lex credendi) “law of prayer, law of belief”\r\rFurther Reference:\rCatechism of the Catholic Church, 1124\rhttp://tinyurl.com/cmes38\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Litany",
                           @"twitterDef":@"a petitionary prayer led by a lector",
                           @"definition":@"\rThe Litany of Saints of the Easter Vigil includes is an invocation of various Saints of the Church for their intercession.\r\rGreek, λιτανεία (litaneia) “supplication”\r\rFurther Reference:\rWikipedia, “Litany”\rhttp://tinyurl.com/l92sqgg\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Literary Criticism",
                           @"twitterDef":@"the analysis of the literary characteristics of a text",
                           @"definition":@"\rLiterary Criticism is a synchronic form of analysis of a text used by the Historical-Critical Method. It examines the form, setting, plot, characterization, denouement, theme, and climax. See “Historical-Critical Method”, “Synchronic Analysis”.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/nmj6amr\r\rRev. Joseph Fitzmeyer\r“Historical Criticism: Its Role in Biblical Interpretation and Church Life”, 250. http://tinyurl.com/p7488ev\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"LXX",
                           @"twitterDef":@"the Roman numerical symbol for the Septuagint",
                           @"definition":@"\rSee “Septuagint”.\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Liberation Theology",
                            @"twitterDef":@"the belief that the gospel is only authentic in the face of radical poverty",
                           @"definition":@"\rLiberation theology was developed by Fr. Gustavo Gutierrez in the early 1970's through his major work “A Theology of Liberation”. See “Catholic Social Teaching“, “Social Justice“.\r\rFurther Reference:\rCongregation For The Doctrine Of The Faith, “Instruction On Certain Aspects Of The Theology Of Liberation”, http://tinyurl.com/27d23\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Liturgy",
                           @"twitterDef":@"the participation of the Church in the Paschal Mystery",
                           @"definition":@"\rThe Liturgy of the Church is not limited to its public worship. Rather, it includes works of charity as well as the proclamation of the Gospel. It is an “exercise of the priestly office of Jesus Christ”. See the Liturgy section in the Overview tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 1069\rhttp://tinyurl.com/opjnz9x\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Eucharist",
                           @"twitterDef":@"the central celebration of the Mass",
                           @"definition":@"\rThe Liturgy of the Eucharist, preceded by the Liturgy of the Word, includes the following elements:\r\r-Thanksgiving\r-Acclamation\r-Epiclesis\r-Words of Institution\r-Anamnesis\r-Oblation\r-Intercessions\r-Doxology\r\rSee “Liturgy of the Word”, “Epiclesis”, “Anamnesis”, “Words of Institution”, “Doxology”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Liturgy of the Eucharist”\rhttp://tinyurl.com/lleofmh\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Word",
                           @"twitterDef":@"the public reading and hearing of\rSacred Scripture at Mass",
                           @"definition":@"\rThe Liturgy of the Word, the Church listens to the Word of God from the Scriptures and is exhorted to Christian living in the homily. It concludes with the Prayer of the Faithful. See “Homily”, “Prayer of the Faithful”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Liturgy of the Word”, http://tinyurl.com/lzxk5e8\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Hours",
                           @"twitterDef":@"the cycle of daily prayer offered by the Church throughout the liturgical year",
                           @"definition":@"\rThe Liturgy of the Hours is an ancient practice that dates back to the earliest days of the Church, which inhereited from Judaism the custom of praying at set times during the day. The Divine Office is the public prayer of the Church, which is offered continuously by both clergy and laity; also called “The Divine Office”. See “Breviary”.\r\rCongretation for Divine Worship\r“General Instruction on the Liturgy of the Hours”\rhttp://tinyurl.com/3re28vo\r\rCatechism of the Catholic Church, 1174\rhttp://tinyurl.com/p9382z5\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Law of Non-Contradiction",
                           @"twitterDef":@"A and ~A cannot be true at the same time in the same way",
                           @"definition":@"\rThis principle is first found in the writings of Aristotle, in his fourth book on Metaphysics. There he claims that without this principle, no learning could be possible.\r\rStanford Encyclopedia of Philosophy\r“Aristotle on Non-Contradiction”\rhttp://tinyurl.com/yvzfdk\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Living Wage",
                           @"twitterDef":@"a level of income that is enables a worker to support his or her family",
                           @"definition":@"\rThe concept of a living wage in modern Catholic Social Teaching dates back to 1891 with Leo XII's encyclical, Rerum Novarum. More recently, Benedict XVI addressed the issue again in his encyclical “Caritas En Veritate”.\r\rFurther Reference:\rLeo XIII, “Rerum Novarum”, 45\rhttp://tinyurl.com/lv5y76v\r\rBenedict XVI, “Caritas En Veritate”, 63\rhttp://tinyurl.com/lpqbs8v\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Logic",
                           @"twitterDef":@"the science of reasoning",
                           @"definition":@"\rThe principles of logic are a necessary component of rationality itelf. They are so fundamental to human reasoning that, in order to deny them, one must make use of them.\r\rFurther Reference:\rUniversity of Oxford, “The Logic Web”\rhttp://tinyurl.com/y8lr2lh.\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Logos",
                           @"twitterDef":@"the Greek word meaning “reason” or “word”",
                           @"definition":@"\rThis term dates back the pre-Socratic Greek philosopher Heraclitus. It is used the Gospel of John to refer to the eternal Son of the Father who became incarnate in Jesus of Nazareth. See “Incarnation”.\r\rGreek, λόγος (logos)\r\rFurther Reference:\rWikipedia, “Logos”\rhttp://tinyurl.com/om4rp\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"LORD",
                           @"twitterDef":@"a symbolic transliteration of the Tetragrammaton",
                           @"definition":@"\rMost contemporary English bibles render the Divine Name as the LORD to indicate that the underlying Hebrew name of God. See “Tetragrammaton”\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lord's Prayer",
                           @"twitterDef":@"the exemplary prayer that Jesus taught his disciples",
                           @"definition":@"\rThe Lord's Prayer occurs in only two places in the New Testament, Matthew 6:9-13 and Luke 11:2-4. Luke's version was likely given as rubric, allowing for contextual customization, while Matthew's version was used in early Christian liturgies. The Matthean version also reflects that found in the Didache. See “Our Father”, “Didache”.\r\rCatechism of the Catholic Church, 2759\rhttp://tinyurl.com/m8f77wr\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lord's Supper",
                           @"twitterDef":@"the celebration of the Eucharist;\rthe memorial of the last supper of Jesus",
                           @"definition":@"\rSee “Last Supper”, “Eucharist”.",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Lumen Gentium",
                           @"twitterDef":@"the Dogmatic Constitution of Vatican II concerning the Church",
                           @"definition":@"\rLumen Gentium is the most authoritative Church teaching on the nature, structure, and mission of the Church. See “Ecclesiology”, “Church”.\r\rLatin (lumen gentium) “light of the nations”\r\rFurther Reference:\rVatican II, “Lumen Gentium”\rhttp://tinyurl.com/3wxff\r\r\r",
                           @"category":@"Biblical"}];
    
    /////////////////////////////M
    
    
    [TAWord wordWithDict:@{@"name":@"Magisterium",
                           @"twitterDef":@"the teaching authority of the Church",
                           @"definition":@"\rAccording to the teaching of the Church, the Magisterium has its origin in God's providential plan for the Church. Catholic tradition distinguishes between various aspects of the Magisterium: Ordinary and Extraordinary. The latter occurs in the form of an Ecumenical Council or exercise of Papal Definition Ex Cathedra. The former occurs during the normal course of teaching of the Bishops. Since Vatican II, this aspect has raised numerous questions. Richard Gaillardetz observes:\r\r“In the early Church it was commonly held that when the bishops pro- claimed the apostolic kerygma,they did so in confidence that they were united with their brother bishops in the proclamation of the one faith in Jesus Christ. This daily preaching and teaching was the 'ordinary' mode by which bishops exercised their authority as preachers and teachers. Only when a proximate threat was raised against the received faith was it deemed necessary to 'define' the faith in a more solemn fashion, initially by way of councils, and eventually by way of solemn papal judgments as well. In the years since the Second Vatican Council, this basic insight regarding the significance of the common teaching of the bishops exercised in their daily ministry has been transformed into a vehicle for addressing controversial matters. A disturbing trend has emerged in which the authoritative status of these disputed teachings has been elevated by appeal to this 'third modality' for the exercise of infallibility. There is a real danger that a too far ranging appeal to the infallibility of the ordinary universal magisterium may foreshorten the necessary discourse of the whole Christian community on questions being posed in significantly new contexts and therefore not susceptible to 'definitive' determinations. Claims to the exercise of the ordinary universal magisterium have changed in significant ways. It is only in recovering the more ancient ecclesiological vision of the universal consensus of the churches and their bishops that the problematic features of this shift can be overcome.”\rGaillardetz, 471\r\rSee the Magisterium section in the Overview tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 85-95\rhttp://tinyurl.com/bx8mnlu\r\rRichard Gaillardetz\r“The Ordinary Universal Magisterium: Unsolved Questions”, http://tinyurl.com/q3534g8\r\r\r",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Magnificat",
                           @"twitterDef":@"the prayer of the Virgin Mary at the Annunciation",
                           @"definition":@"\rThe Magnificat is a part of Morning Prayer in the Liturgy of the Hours. It is based on the prayer of Hannah in 1 Samuel 2:1-10. See “Annunciation”.\r\rFurther Reference:\rWikipedia, “Magnificat”\rhttp://tinyurl.com/yljmjjd\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Manicheism",
                           @"twitterDef":@"a heresy taught by Manes that matter is evil and the spirit is the only good",
                           @"definition":@"\rSt. Augustine of Hippo was a follower of Manicheism until his conversion. See “Heresy”.\r\rFurther Reference:\rWikipedia, “Manicheism”\rhttp://tinyurl.com/ysvrjs\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Maranatha",
                           @"twitterDef":@"an Aramaic phrase meaning “Our Lord, come.”",
                           @"definition":@"\rThis word is referenced by Paul in 1 Corinthians 16:22 as a common expression used by early Christians to invoke the Parousia. An alternative translation renders this phrase as a declarative statement: “Our Lord has come”. See “Parousia”.\r\rAramaic, מרנא תא (marana tha)\r\rFurther Reference:\rWikipedia, “Maranatha”\rhttp://tinyurl.com/yv4vcj\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Marcionism",
                           @"twitterDef":@"the teaching of Marcion that rejected Israelite scriptures and theology",
                           @"definition":@"\rIn the late 2nd century A.D., a wealthy ship builder name Marcion began teaching that the God of the Old Testament was not the God Jesus revealed. As a result, he rejected the inspiration and canonicity of the Old Testament and only accepted the Gospel of Luke and some of Paul's letters as properly Christian. Marcionism led to the creation of the first canon of Scripture during the time of Irenaeus, who identified 4 authentic gospels. See “Canon”, “Inspiration”, “Gospel”, “Old Testament”.\r\rFurther Reference:\rWikipedia, “Marcionism”\rhttp://tinyurl.com/yo3bp6\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Marriage",
                           @"twitterDef":@"the Sacrament in which a man and woman form a life partnership for mutual support and raising children",
                           @"definition":@"\rAs human institution, Marriage has evolved in conjunction with human society. As a Sacrament, Marriage reflects the nuptial identity of the human person and is intrinsically connected to the creation of families. Vatican II declared:\r\r“The intimate partnership of married life and love has been established by the Creator and qualified by His laws, and is rooted in the conjugal covenant of irrevocable personal consent. Hence by that human act whereby spouses mutually bestow and accept each other a relationship arises which by divine will and in the eyes of society too is a lasting one. For the good of the spouses and their off-springs as well as of society, the existence of the sacred bond no longer depends on human decisions alone. For, God Himself is the author of matrimony, endowed as it is with various benefits and purposes. All of these have a very decisive bearing on the continuation of the human race, on the personal development and eternal destiny of the individual members of a family, and on the dignity, stability, peace and prosperity of the family itself and of human society as a whole. By their very nature, the institution of matrimony itself and conjugal love are ordained for the procreation and education of children, and find in them their ultimate crown. Thus a man and a woman, who by their compact of conjugal love 'are no longer two, but one flesh' (Matt. 19:ff), render mutual help and service to each other through an intimate union of their persons and of their actions. Through this union they experience the meaning of their oneness and attain to it with growing perfection day by day. As a mutual gift of two persons, this intimate union and the good of the children impose total fidelity on the spouses and argue for an unbreakable oneness between them.”\r-Gaudium, 48\r\rIt faces new theological questions in light of the growing societal recognition of same-sex relationships and new pastoral challenges in light of the growing numbers of divorce and dysfunctional households. See “Sexuality”.\r\rFurther Reference:\rVatican II, “Gaudium et Spes”\rhttp://tinyurl.com/34xrhq\r\rCatechism of the Catholic Church, 1601\rhttp://tinyurl.com/ykptlg\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Martyr",
                           @"twitterDef":@"a witness to the faith to the point of death",
                           @"definition":@"\rA famous quote from Tertullian sums up the importance of Martyrs for evangelization:“The blood of the Marytrs is the seed of the Church”. See “Gospel”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2473\rhttp://tinyurl.com/3bfbm27\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Mass",
                           @"twitterDef":@"the liturgy of the weekly celebration of the Eucharist",
                           @"definition":@"\rThe Mass is composed of two parts: the Liturgy of the Word and Liturgy of the Eucharist. See “Liturgy of the Word”, “Liturgy of the Eucharist”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1332\rhttp://tinyurl.com/m88dbjl\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Matins",
                           @"twitterDef":@"the traditional term for Morning Prayer",
                           @"definition":@"\rSee “Morning Prayer”.",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Maundy Thursday",
                           @"twitterDef":@"the celebration of the institution of the Lord's Supper",
                           @"definition":@"\rMaundy Thursday is part of the Triduum. It derives from the Latin word “mandatum” in the Vulgate translation of John 13:34, in which Jesus says:“A new commmandment I give you; that you love one another as I have loved you.”See “Triduum”, “Vulgate”.\r\rFurther Reference:\rWikipedia, “Maundy Thursday”\rhttp://tinyurl.com/37sy85\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Memorial Acclamation",
                           @"twitterDef":@"the response of the congregation after the Words of Institution",
                           @"definition":@"\rThe Memorial Acclamation is introduced with the phrase chanted by the celebrant: “the mystery of faith”. See “Words of Institution”.\r\rFurther Reference:\rWikipedia, “Memorial Acclamation”\rhttp://tinyurl.com/mjgllzr\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Miracle",
                           @"twitterDef":@"a supernatural event which defies scientific explanation",
                           @"definition":@"\rIn common parlance, miracles are events which violate the laws of nature. While biblical authors did not share that perspective, the Bible is nevertheless full of claims about God's “mighty deeds” of power.\r\rFurther Reference:\rInterdisciplinary Encyclopedia of Religion and Science, “Miracle”, http://tinyurl.com/mmev2qy\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Monotheism",
                           @"twitterDef":@"the belief in only one God",
                           @"definition":@"\rMonotheism was slow to develop in ancient Israel. After the Exile, the belief in only one God becomes a defining characteristic of the Jews, whereas in pre-Exilic times, Israel accepted the existence of other gods. See “Henotheism”.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Morality",
                           @"twitterDef":@"customary norms of behavior considered good or evil",
                           @"definition":@"\rMorality has been the subject of various analyses throughtout the history of Philosophy. One of the more famous treatments were those of Aristotle and Immanuel Kant. In the Catholic Tradition, morality is based on both Natural Law and Divine Revelation. See the Philosophy section in the Overview tab. See “Natural Law”, “Divine Revelation”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1749-1756\rhttp://tinyurl.com/lxslc7r\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Mystery",
                           @"twitterDef":@"that which transcends human comprehension and explanation",
                           @"definition":@"\rIn the Catholic tradition, God is ultimately Mystery and can only be partially known through Divine Revelation. See “Divine Revelation”, “Trinity”.\r\rFurther Reference:\rWikipedia, “Absolute”\rhttp://tinyurl.com/q9atwcx\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Manuscript",
                           @"twitterDef":@"a hand-written copy of a text",
                           @"definition":@"\rNo original writings of the Bible survive. Throughout history, scribes have made copies of the originals, which themselves were the basis for further copies, and so on. The earliest manuscript of the complete New Testament that exists is Codex Sinaiticus, which dates to the 4th century A.D. See “Codex”.\r\rFurther Reference:\rCodex Sinaiticus\rhttp://tinyurl.com/5fg98l\r\rWikipedia, “Manuscript”\rhttp://tinyurl.com/jwb5dhp\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Messiah",
                           @"twitterDef":@"another word for “Christ”",
                           @"definition":@"\rSee “Christ”.",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ministry",
                           @"twitterDef":@"service in the name of Christ",
                           @"definition":@"\rMinistry in the Church takes many different forms. The two primary categories are ordained and lay ministry. See “Laity”, “Holy Orders”.\r\rFurther Reference:\rCatechism of the Catholic Church, 874\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Mishnah",
                           @"twitterDef":@"the written form of the oral commentary on the Torah",
                           @"definition":@"\rThe Mishnah was the first major work of Rabbinic Judaism which contains oral commentary on the Torah that dates back to the Second Temple Judaism. It is arranged topically, rather than canonically. See “Second Temple Judaism”.\r\rFurther Reference:\rWikipedia, “Mishnah”\rhttp://tinyurl.com/zdndh\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Missal",
                           @"twitterDef":@"a guidebook used to celebrate the Eucharist",
                           @"definition":@"\rThe 2011 new translation of the Mass was based on the Roman Missal. See “Liturgy”.\r\rFurther Reference:\rCongregation for Divine Worship\r“General Instruction on the Roman Missal”\rhttp://tinyurl.com/kmepha\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Missionary",
                           @"twitterDef":@"one sent on a mission to proclaim the Gospel",
                           @"definition":@"\rMissionaries date back to the earliest age of the Church. The Apostles were all missionaries. Missionary bishops were those sent to help evangelize a unchurched region. Today, certain Catholic apostolates send missionaries to aid in evangelization. See “Gospel”.\r\rFurther Reference:\rWikipedia, “Missionary”\rhttp://tinyurl.com/kkyzo\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Mitre",
                           @"twitterDef":@"a liturgical hat worn by bishops",
                           @"definition":@"\rMitres are worn by bishops and other prelates of the Church and symbolize the flame of the Holy Spirit.\r\rFurther Reference:\rWikipedia, “Mitre”\rhttp://tinyurl.com/p995yt8\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Modernism",
                           @"twitterDef":@"the 19th century movement that embraced modern advances in human knowledge",
                           @"definition":@"\rModernism was initially condemned by Pope Leo XIII, but its affects reached into the twentieth century at Vatican II. See “Aggiornomento”.\r\rFurther Reference:\rWikipedia, “Modernism”\rhttp://tinyurl.com/mafqt\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Monarchianism",
                           @"twitterDef":@"the belief that God is merely manifested in three different forms",
                           @"definition":@"\rMonarchianism was popular during the second and third centuries. It denied that the Father, Son, and Holy Spirit were three distinct persons. Instead, it claimed that God was one person manifested in three forms. See “Sabellianism”.\r\rFurther Reference:\rWikipedia, “Monarchianism”\rhttp://tinyurl.com/28a82l\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monasticism",
                           @"twitterDef":@"the practice of religious vows lived in community",
                           @"definition":@"\rMonastics tace their origin to the third century with Abba Anthony of Egypt. It quickly spread around the Mediterranean basin where it flourished. Many monks were responsible for the creation of copies of early manuscripts. See “Manuscript”.\r\rFurther Reference:\rWikipedia, “Monasticism”\rhttp://tinyurl.com/n7kl2y\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Monophysitism",
                           @"twitterDef":@"the teaching that Christ had a single, divine nature which absorbed his human nature",
                           @"definition":@"\rMonophysitism was condemned in 451 A.D. at the Council of Ephesus. See “Ephesus” in the Historical section of the Maps tab.\r\rFurther Reference:\rWikipedia, “Monophysitism”\rhttp://tinyurl.com/2ve4jf7\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monothelitism",
                           @"twitterDef":@"the teaching that Christ had a single, divine will which absorbed his human will",
                           @"definition":@"\rMonothelitism flourished in the seventh century and was condemned in A.D. 681 by the Third Council of Constantinople. See “Constantinople” in the Historical section of the Maps tab.\r\rFurther Reference:\rWikipedia, “Monothelitism”\rhttp://tinyurl.com/ojzevrh\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Myth",
                           @"twitterDef":@"a story that cannot be historically verified",
                           @"definition":@"\rMyths may express truths that are not subject to historical verification. The Primeval History contained in Genesis 1-11 is widely regarded as myth that communicates theological truth about the Creator and the created order, the effects of sin, and the Divine quest for reunion with humanity.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/nmj6amr\r\rWikipedia, “Creation Myth”\rhttp://tinyurl.com/33adt4\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monstrance",
                           @"twitterDef":@"a frame for displaying the consecrated\rbread of the Eucharist for adoration",
                           @"definition":@"\rMonstrances were used as early as the 13th century and are still used today. They are usually reserved for Eucharstic Adoration. See “Eucharistic Adoration”.\r\rFurther Reference:\rWikipedia, “Monstrance”\rhttp://tinyurl.com/2evkwxg\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Montanism",
                           @"twitterDef":@"a second-century charismatic, heretical group based on the teachings of Montanus",
                           @"definition":@"\rMontanus taught that the Holy Spirit, promised by Jesus, had incarnated itself in him, who demanded his followers adopt a strict lifestyle. The Church Father Tertullian eventually converted to Montanism.\r\rFurther Reference:\rWikipedia, “Montanism”\rhttp://tinyurl.com/dnms5r\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Moral Theology",
                           @"twitterDef":@"the theology of moral norms and their application to human experience",
                           @"definition":@"\rMoral theology was identified by St. Thomas Aquinas as early as the 14 century and has developed into a definite sub-discipline of theology.\r\rFurther Reference:\rWikipedia, “Catholic Moral Theology”\rhttp://tinyurl.com/ohgghsw\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Morning Prayer",
                           @"twitterDef":@"the first hour of the Liturgy of the Hours",
                           @"definition":@"\rMorning Prayer is the beginning of the Divine Office. See “Liturgy of the Hours”.\r\rFurther Reference:\rCongretation for Divine Worship\r“General Instruction on the Liturgy of the Hours”\rhttp://tinyurl.com/3re28vo\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Metaphysics",
                           @"twitterDef":@"the study of the fundamental nature of reality",
                           @"definition":@"\rMetaphysics is a highly contested area of inquiry that has including a variation of topics throughout history since the time of Aristotle. More generally, it is the study of being as such. Theology is a metaphysical discipline insofar as theology makes claims about the fundamental nature of reality, which, in the Catholic Tradition, is known as God.\r\rFurther Reference:\rRoutledge Encyclopedia of Philosophy\r“Metaphysics”, http://tinyurl.com/mydu3hx\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Muratorian Fragment",
                           @"twitterDef":@"the earliest extant canonical index of Scriptures",
                           @"definition":@"\rThe Muratorian Canon dates to as early as A.D. 170. The formation of the canon of Scripture was occassioned by the Marcionism heresy. The Muratorian Fragment was discovered and published in 1740 by Fr. Ludavico Muratori in the Ambrosian Library. See “Canon”, “Marcionism”.\r\rFurther Reference:\rWikipedia, “Muratorian Fragment”\rhttp://tinyurl.com/ampawp\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Mystagogy",
                           @"twitterDef":@"the catechetical intiation into the sacramental mysteries",
                           @"definition":@"\rMystagogy was renewed and emphasized as part of the adult baptismal initiation rite based on the practice of the early Church. It is emphasized by apostolate groups such as the Neo-Catechumenical Way.\r\rFurther Reference:\rPope Benedict XVI\r“Sacramentum Caritatis”, 64\rhttp://tinyurl.com/nn8bpbh\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    /////////////////////////////////N
    
    
    
    [TAWord wordWithDict:@{@"name":@"Natural Law",
                           @"twitterDef":@"the universal moral standard, accessible by human reason",
                           @"definition":@"\rThe concept of natural law dates back to the early Greek philosophers. It is alluded to in St. Paul's epistle to the Romans 1:21. It is treated extensively by St. Thomas Aquinas in the “Summa Theologica”. Pope John Paul II emphasized its importance for Catholic moral teaching numerous times. More recent treatments have analyzed the concept in the context of its acknowledged conceptual difficulties. the Synod of Bishops in 2014 stated that the concept of Natural Law, given modern cultural pluralism, is problematic at best, if not entirely unintelligible:\r\r“In a vast majority of responses and observations, the concept of natural law today turns out to be, in different cultural contexts, highly problematic, if not completely incomprehensible. The expression is understood in a variety of ways, or simply not understood at all...Consequently, the natural law is perceived as an outdated legacy. Today, in not only the West but increasingly every part of the world, scientific research poses a serious challenge to the concept of nature. Evolution, biology and neuroscience, when confronted with the traditional idea of the natural law, conclude that it is not 'scientific'....In other words, from an emerging point of view, drawn from a widely diffused culture, the natural law is no longer to be considered as applicable to everyone, since people mistakenly come to the conclusion that a unique system of reference does not exist.”\r-Synod, 21\r\rNadia Delicata contextualizes this disconnect with Natural Law in the growing dominance of technology:\r\r“...if the crisis of natural law among the Catholic faithful reflects a spiritual and existential crisis and not only a doctrinal and moral one, its retrieval as a robust foundation of the Christian life needs to face head-on other forces in human life that shape the spirit or ratio of our existence...We have now entered a new era shaped not by a modern 'mechanistic' mindset, but by a digital one of 'information.' If digitality is the most obvious technological substratum of the new age, 'information' is becoming its horizon of meaning...Just like the Christian life is in a mutual self-mediation with the emerging digital culture, the contemporary understanding of natural law must also evolve to accommodate emerging sensibilities and expressions..”\r-Delicata, 2\r\rFurther Reference:\rInternational Theological Commission\r“In Search of a Universal Ethic”\rhttp://tinyurl.com/pxcjasx\r\rCatechism of the Catholic Church, 1954\rhttp://tinyurl.com/yla3tgm\r\rSynod of Bishops\r“Pastoral Challenges of the Family”\rhttp://tinyurl.com/ot9gmdg\r\rNadia Delicata\r“Natural Law in a Digital Age”\rhttp://tinyurl.com/qx4nmac\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Natural Theology",
                           @"twitterDef":@"the study of God by inference from the facts of the physical world",
                           @"definition":@"\rNatural theology is the attempt to examine the concept of God from the natural world, apart from any special revelation. See “Divine Revelation”.\r\rFurther Reference:\rInternet Encyclopedia of Philosophy\r“Natural Theology”, http://tinyurl.com/7ckb5tz\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Nevi'im",
                           @"twitterDef":@"the Hebrew word meaning “prophets”",
                           @"definition":@"\rThe Nevi'im is the second of the three sections of the Tanak. Isaiah, Jeremiah, and Ezekiel are the major prophets, while others are considered minor prophets, due to the length of their books. See “Tanak”.\r\rHebrew, נְבִיאִים (neviim)\r\rFurther Reference:\rRev. M.B. Fallon\r“Prophecy in Ancient Israel”\rhttp://tinyurl.com/qg74o5f\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"New Testament",
                           @"twitterDef":@"the 27 books dealing with the life of Jesus of Nazareth and his disciples",
                           @"definition":@"\rThe New Testament contains the 4 gospels, the Acts of the Apostles, numerous epistles, and the Apocalypse. See “Gospel”, “Epistle”, “Apocalypse”.\r\rFurther Reference:\rCatechism of the Catholic Church, 124-127\rhttp://tinyurl.com/kvc3tvq\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Nestorianism",
                           @"twitterDef":@"the heresy Christ's human and divine nature were radically divided",
                           @"definition":@"\rThe teaching of Nestorius was condemned at the Council of Ephesus in A.D. 431. St. Cyril argued persuasively against his teaching. See “Ephesus” in the Historical section of the Maps Tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 466\rhttp://tinyurl.com/37wuaux\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"New Covenant",
                           @"twitterDef":@"the Christian covenant based on the life, death, and resurrection of Jesus",
                           @"definition":@"\rThe concept of a new covenant occurs for the first time in Jeremiah 31:31-34:\r\r“Behold, the days are coming, declares the Lord, when I will make a new covenant with the house of Israel and the house of Judah, not like the covenant that I made with their fathers on the day when I took them by the hand to bring them out of the land of Egypt, my covenant that they broke, though I was their husband, declares the Lord. For this is the covenant that I will make with the house of Israel after those days...I will forgive their iniquity, and I will remember their sin no more.”\r\rJesus of Nazareth likely alluded to this passage during the Last Supper in which he declared the cup to be the cup of the New Covenant in his blood. See “Last Supper”.\r\rFurther Reference:\rCatechism of the Catholic Church, 613\rhttp://tinyurl.com/o3pwxjn\r\rWikipedia, “New Covenant”\rhttp://tinyurl.com/oglufpu\r\r\r",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Nicene Creed",
                           @"twitterDef":@"the creed from Constantinople in A.D. 381, based on the Nicene Creed in A.D. 325",
                           @"definition":@"\rThe Nicene Creed is also referred to as the Nicene-Constantinopolitan Creed:\r\r“We believe in one God, the Father, the Almighty, maker of heaven and earth, of all that is, seen and unseen.\r\rWe believe one Lord, Jesus Christ, the only Son of God, eternally begotten of the Father, God from God, Light from Light, true God from true God, begotten, not made, one in Being with the Father. Through Him all things were made. For us men and for our salvation, He came down from heaven: by the power of the Holy Spirit He was born of the Virgin Mary, and became Man. For our sake He was crucified under Pontius Pilate. He suffered, died, and was buried. On the third day He rose again in fulfillment of the Scriptures; He ascended into heaven, and is seated at the right hand of the Father. He will come again in glory to judge the living and the dead, and His kingdom will have no end. \r\rWe believe in the Holy Spirit, the Lord, the Giver of life, Who proceeds from the Father and the Son. With the Father and the Son He is worshiped and glorified. He has spoken through the prophets.\r\rWe believe in one, holy, catholic, and apostolic Church. We acknowledge one Baptism for the forgiveness of sins. We look for the resurrection of the dead, and the life of the world to come. Amen.”\r\rSee the Creeds section of the Overview tab. See “Nicea” in the Historical section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, Sec. II\rhttp://tinyurl.com/2dszf5\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Numinous",
                           @"twitterDef":@"experience of the Holy that includes\rboth terrifying and fascinating aspects",
                           @"definition":@"\rAccording to Rudolf Otto, in his seminal work, “The Idea of the Holy”, religious experience is an encounter with the Holy this is totally Other and numinous. Such experiences are mysteriously terrifying (mysterium tremendum) and mysteriously fascinating (mysterium fascinans).\r\rFurther Reference:\rWikipedia, “Numinous”\rhttp://tinyurl.com/pl2jakw\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Naturalism",
                           @"twitterDef":@"the belief that the visible world of nature is all that exists",
                           @"definition":@"\rNaturalism can be traced to the writings of the pre-Socratic philosopher Thales. It experienced a surge during the Enlightenment, being promoted by thinkers such as Voltaire. In the 20th century, naturalism was held by such thinkers as John Dewey. Understood in an ontological sense, Naturalism denies the existence of a supernatural Creator, distinct from the natural world.\r\rFurther Reference:\rWikipedia, “Naturalism”\rhttp://tinyurl.com/ynzpwh\r\r\r",
                           @"category":@"Cultural"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Nunc Dimittis",
                           @"twitterDef":@"the prayer of Simeon in Luke 2:29-32",
                           @"definition":@"\rLuke portrays Simeon as offering this extemporaneous prayer after being led by the Holy Spirit to see the infant Jesus.\r\rFurther Reference:\rWikipedia, “Nunc Dimittis”\rhttp://tinyurl.com/o7mejxw\r\r\r",
                           @"category":@"Liturgical"}];
    
    //////////////////////////O
    
    [TAWord wordWithDict:@{@"name":@"Octave",
                           @"twitterDef":@"the celebration of a feast over eight days",
                           @"definition":@"\rThe Catholic Church only celebrates two Octaves: Christmas and Easter.\r\rFurther Reference:\rWikipedia, “Octave”\rhttp://tinyurl.com/d5u8q5v\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Offertory",
                           @"twitterDef":@"the presentation of the gifts of bread and wine to the celebrant of Mass",
                           @"definition":@"\rThe Offertory is prefigured in the offering of bread and wine by Melchizedek to Abraham.\r\rFurther Reference:\rCatechism of the Catholic Church, 1350\rhttp://tinyurl.com/m88dbjl\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Office of Readings",
                           @"twitterDef":@"the set of spiritual readings for the Liturgy of the Hours",
                           @"definition":@"\rThe Office of Readings was originally connected to Night Prayer, but was moved to accompany prayer throughout the course of the day. It contains readings from the Scriptures as well as selected texts from the Church Fathers. These readings are intended as an aid to meditation.\r\rFurther Reference:\rCongregation for Divine Worship\r“General Instruction on the Liturgy of the Hours”, 55-69, http://tinyurl.com/3re28vo\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnibenevolence",
                           @"twitterDef":@"the quality of being all-loving",
                           @"definition":@"\rOmnibenevolence is a traditional characteristic of God that is emphasized in the New Testament and throughout the Catholic tradition. Together with Omnipotence and Omniscience, it is a consideration in the Problem of Evil.\r\rFurther Reference:\rWikipedia, “Omnibenevolence”\rhttp://tinyurl.com/qhrwnk3\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnipotence",
                           @"twitterDef":@"the quality of being all-powerful",
                           @"definition":@"\rOmnipotence is a traditional characteristic of God that is emphasized throughout the Scriptures. Together with Omnibenevolence and Omniscience, it is a consideration in the Problem of Evil. See “Problem of Evil”.\r\rFurther Reference:\rInternet Encyclopedia of Philosophy\r“Omnipotence”, http://tinyurl.com/p7h67uq\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnipresence",
                           @"twitterDef":@"the quality of being all-present",
                           @"definition":@"\rOmnipresence was a development from the teaching that God is Spirit.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Omnipresence”, http://tinyurl.com/njlv6ku\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omniscience",
                           @"twitterDef":@"the quality of being all-knowing",
                           @"definition":@"\rOmniscience poses a philosophical obstacle to the concept of free-will. Together with Omnibenevolence and Omniscience, it is a consideration in the Problem of Evil. See “Foreknowledge”, “Problem of Evil”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Omniscience”, http://tinyurl.com/o3qhjr2\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ontological Argument",
                           @"twitterDef":@"the argument that states God, as the greatest possible Being, is necessary",
                           @"definition":@"\rThe argument, first formulated by St. Anselm of Canterbury, that states God, as the greatest possible Being, is a necessary Being:\r\r1. By definition, God is a being than which none greater can be imagined.\r\r2. A being that necessarily exists in reality is greater than a being that does not necessarily exist.\r\r3. Thus, by definition, if God exists as an idea in the mind but does not necessarily exist in reality, then we can imagine something that is greater than God.\r\r4. But we cannot imagine something that is greater than God.\r\r5. Thus, if God exists in the mind as an idea, then God necessarily exists in reality.\r\r6. God exists in the mind as an idea.\r\r7. Therefore, God necessarily exists in reality.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Ontological Arguments”,  http://tinyurl.com/5z59lw\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ontology",
                           @"twitterDef":@"the study of Being",
                           @"definition":@"\rOntology is closely related to Metaphysics and concerns the question of the categories of existence.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Logic and Ontology”\rhttp://tinyurl.com/owl4r2j\r\r\r",
                           @"category":@"Cultural"}];
    /*
    [TAWord wordWithDict:@{@"name":@"Open Theism",
                           @"twitterDef":@"a theological movement characterized by the belief that there are logical limits on God's power and knowledge",
                           @"definition":@"\ra theological movement characterized by the belief that there are logical limits on God's power and knowledge.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    */
    
    [TAWord wordWithDict:@{@"name":@"Ordinary",
                           @"twitterDef":@"bishop or other prelate who has authority to govern",
                           @"definition":@"\rThe Ordinary is used to distinguish the diocesan bishop from an assistant or coadjutor.\r\rFurther Reference:\rCatechism of the Catholic Church, 888\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ordinary Time",
                           @"twitterDef":@"the liturgical time between Easter and Advent",
                           @"definition":@"\rOrdinary Time is divided into two segments; from the Baptism of the Lord to Ash Wednesday and from Pentecost to Advent:\r\rBesides the times of year that have their own distinctive character, there remain in the yearly cycle thirty-three or thirty-four weeks in which no particular aspect of the mystery of christ is celebrated, but rather the mystery of christ itself is honoured in its fullness, especially on sundays. This period is known as ordinary time.\r-Universal Norms, 43\r\rDuring Ordinary Time, the readings in the Lectionary are not chosen topically. See “Lectionary”.\r\rFurther Reference:\rPope Paul VI\r“Universal Norms on the Liturgical Year and Calendar”\rhttp://tinyurl.com/qg56ryg\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ordination",
                           @"twitterDef":@"the reception of the Sacrament of Holy Orders",
                           @"definition":@"\rOrdination dates from the earliest years of the Church. It involves the laying on of hands and initiation into an ordo or society. There are three such ordos in the Church; Bishops, Priests, and Deacons. See “Holy Orders”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1357\rhttp://tinyurl.com/4hs6lso\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Original Sin",
                           @"twitterDef":@"the sin of the first humans;\rthe corruptible condition of humanity",
                           @"definition":@"\rOriginal Sin, while not named as such, is alluded to by St. Paul in Romans 5:12. St. Augustine coined the term in his dispute with the Pelagians. In the traditional teaching of the Church, Original Sin can be understood as both the explanans and explanandum. As explananas it explains the human condition of evil, suffering, and death. As explanandum, it is the human condition which requires explanation. Fr. Stephen Duffy notes the difficulty in reconciling the traditional formulation with contemporary science and offers a modern interpretation:\r\r“...the classic reading of Genesis in its attempt to drive a wedge between finitude and sin lyrically depicts an idyllic state of righteousness or perfection before the Fall. Adam and Eve were blessed with heapings of moral and intellectual perfection and immunity to suffering and death, all of which was grounded in the supreme gift of an immediate companionship with their God. Such postulation of a perfect creation flies in the face of our evolutionary worldview and renders the Fall itself wholly unintelligible...Original sin is a code natural to humans as disordered and incomplete. Human evil, therefore, must be grasped as underdevelopment by reference to a future goal and as statistical necessity in an evolving universe. It is difficult to imagine a world created for development and the becoming of freedom where evil is not a structural component.”\r-Duffy 608, 619\r\rFurther Reference:\rCatechism of the Catholic Church I.7\rhttp://tinyurl.com/llux3he\r\rRev. Stephen Duffy\r“Our Hearts of Darkness: Original Sin Revisited”\rhttp://tinyurl.com/pc9x5xe\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Orthodox",
                           @"twitterDef":@"straight or correct belief",
                           @"definition":@"\rOrthodoxy was a term applied early to authentic Catholic teaching, in contrast to heterodoxy.\r\rFurther Reference:\rWikipedia, “Orthodoxy”\rhttp://tinyurl.com/4tcywr\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Orthopraxis",
                           @"twitterDef":@"straight or correct practice",
                           @"definition":@"\rOrthopraxy was a term applied to authentic Catholic practice, in contrast to that of heretical Christians.\r\rFurther Reference:\rWikipedia, “Orthopraxy”\rhttp://tinyurl.com/c3w3knk\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Old Testament",
                           @"twitterDef":@"the 46 books dealing with the people of Israel",
                           @"definition":@"\rThe books of the Old Testament are grouped into five categories:\r\r-Pentateuch\r-Historical Books\r-Biblical Novellas\r-Wisdom Books\r-Prophetic Books\r\rThe Church teaches that the Old Testament prefigures the life of Christ through Typology. The Old Testament is based on the Hebrew Bible, which only includes 39 books. See “Tanak”, “Typology”.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Jewish People and their Sacred Scriptures in the Christian Bible”\rhttp://tinyurl.com/mt3e\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Oracle",
                           @"twitterDef":@"a Divine utterance;\ra location of Divine utterances",
                           @"definition":@"\rThe phenomenon of oracles as was widespread in the ancient world. The Oracle at Delphi was Pythia, who was associated with the Greek god Apollo. In the biblical tradition, oracles were messages of God spoken by humans. St. Paul speaks of the nation of Israel as having been entrusted with the Oracles of God (Rom. 3:2).\r\rFurther Reference:\rWikipedia, “Oracle”\rhttp://tinyurl.com/pjmt2c9\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Oral Tradition",
                           @"twitterDef":@"the transmission of stories and beliefs by word of mouth",
                           @"definition":@"\rBefore the writing of any biblical text, their stories were transmitted orally. The book of Deuteronomy dictates that the commandments of the Torah be passed down orally from parents to children. Eventually, written sources were made in order to establish an official record of the beginnings of the Israelite nation (most likely during the Davidic or Solomonic monarchies). Variations on a common story indicate an oral narrative core around which various authors tailored their writing. For example, in the Old Testament there was an oral tradition that circulated about the patriarch Abraham and his covenant with Yahweh. This tradition was retold with different details based on the narrator's audience, as evidenced in its Yahwist, Elohist, and Priestly accounts.\r\rIn the New Testament, the words of Jesus were passed down orally before the composition of any of the 4 gospels, which were occassioned by the destruction of the Temple and consequent delay of the Parousia. Oral traditions that were recorded but not contained in the gospels illustrate the predominance of the oral tradition in 1st century Palestine. The oral commentary on the Torah (Mishnah) is regarded as equally authortative as the written Torah in modern Judaism. See “Mishnah”, “Parousia”, “Tradition”.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Jewish People and their Sacred Scriptures in the Christian Bible”\rhttp://tinyurl.com/mt3e\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Our Father",
                           @"twitterDef":@"the first phrase of the Lord's Prayer that addresses God as Father",
                           @"definition":@"\rThe “Our Father” is prayed during the Liturgy of the Eucharist as part of the Anaphora. See “Lord's Prayer”.",
                           @"category":@"Biblical"}];
    
    //////////////////////////////////////////P
    
    [TAWord wordWithDict:@{@"name":@"Pacifism",
                           @"twitterDef":@"the total rejection of violence",
                           @"definition":@"\rPacifism has its roots in the early Christian intepretation of the words of Jesus in the Sermon on the Mount. Early Christian writers such as Justin Martyr, Origen, Clement of Alexandria, Irenaeus, and Tertullian claimed that Christians did not shed blood in war. While the limited reach of Christianity to army-eligible Romans is somewhat a factor in this, it remains the case that pacifism was the earliest response of the Church to war. Origen grounds the pacifism of all Christians in their participation in the priestly office of Christ.\r\rAs Christianity developed and expanded, and after its legalization by Constantine in A.D. 313, the Church faced a new situation as it slowly acquired the same political power that was used to crucify its Founder. St. Augustine was instrumental in the development of the Just War Theory, which begins with a presumption against violence that can only be overriden if specific criteria are met. Vatican II praised pacifist objection to war so long as additional rights are not violated. See “Just War Theory”.\r\rFurther Reference:\rVatican II, “Gaudium et Spes”, 78\rhttp://tinyurl.com/34xrhq\r\rStanford Encyclopdia of Philosophy\r“Pacifism”, http://tinyurl.com/curckzx\r\rKenneth Kemp\r“Personal Pacifism”\rhttp://tinyurl.com/nv7xmpl\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Pantheism",
                           @"twitterDef":@"the belief that everything is God",
                           @"definition":@"\rPantheism is popular in New Age forms of spirituality and in some Eastern religious traditions.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Pantheism”\rhttp://tinyurl.com/2w3x69\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Panentheism",
                           @"twitterDef":@"the belief that everything exists within God",
                           @"definition":@"\rPanentheism is examplified in Acts 17:28 in which St. Paul claims that God gives everything life; “in him we live, move, and have our being”. Both modern theologians and philosophers have claimed a panentheistic model of the God-World relationship. According to Alfred North Whitehead, in a panentheistic worldview, God has both necessary and contigent properties. See “Process Theology”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Panentheism”, http://tinyurl.com/5e8c62\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Parousia",
                           @"twitterDef":@"a Greek word meaning “presence”;\rthe presence of the glorified Christ",
                           @"definition":@"\rParousia is a term used by St. Paul in the New Testament to refer to the second coming of Christ.\r\rGreek, παρουσία (parousia)\r\rFurther Reference:\rPope Benedict XVI\rGeneral Audience, 11.12.2008\rhttp://tinyurl.com/plqoxp8\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Paschal Mystery",
                           @"twitterDef":@"the experience of salvation through, with, and in Jesus Christ",
                           @"definition":@"\rThe Paschal Mystery is based in the the death and resurrection of Jesus. It is a transcendent event that participates in the Divine, and, as such, its effects are not limited to the constraints of time and space.\r\rFurther Reference:\rCatechism of the Catholic Church, 1085\rhttp://tinyurl.com/oqbzkx3\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Passion of the Lord",
                           @"twitterDef":@"the salvific suffering of Jesus in the hours before his death",
                           @"definition":@"\rAccording to the teaching of the Church, the Passion of Christ merits salvation for the human race according to the plan and foreknowledge of God.\r\rFurther Reference:\rCatechism of the Catholic Church, 607\rhttp://tinyurl.com/p3dfabj\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Pastor",
                           @"twitterDef":@"a priest or bishop responsible for the Christian Faithful",
                           @"definition":@"\rPastors are tasked with the administration of the Sacraments and care of the Christian congregation. The Petrine Ministry has always been viewed as the pastoral role par excellence in the Catholic Tradition. See “Petrine Ministry”.\r\rFurther Reference:\rCongregation for the Doctrine of the Faith, “The Primacy of the Successor of Peter in the Mystery of the Church”, http://tinyurl.com/ms5hgvj\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Paten",
                           @"twitterDef":@"a small plate used to hold the Eucharist",
                           @"definition":@"\rThe Paten is set on the Altar, and is usually made of gold or silver. See “Altar”, “Eucharist”.\r\rFurther Reference:\rCongregation for Divine Worship\r“General Instruction of the Roman Missal”\rhttp://tinyurl.com/lgdqh94\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pater Noster",
                           @"twitterDef":@"a Latin phrase meaning “Our Father”",
                           @"definition":@"\rSee “Lord's Prayer”.",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Patripassianism",
                           @"twitterDef":@"the belief that the Father suffered in the Son",
                           @"definition":@"\rPatripassianism was a heresy that was consequent to Monarchianism and was based on the Greek philosophical concept that God could not suffer. See “Monarchianism”.\r\rFurther Reference:\rWikipedia, “Patripassianism”\rhttp://tinyurl.com/26r7xj2\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Patristics",
                           @"twitterDef":@"the study of the Church Fathers",
                           @"definition":@"\rPatristics is essential for the study of theology. The period of the Church Fathers usually extends from the sub-Apostolic Age to the 8th century, ending with the 7th Ecumenical Council at Nicea and the life of St. John of Damascus. See the Fathers section of the Overview tab.\r\rFurther Reference:\rWikipedia, “Patristics”\rhttp://tinyurl.com/qy8fxhj\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pelagianism",
                           @"twitterDef":@"the heresy of Pelagius that salvation is possible without grace",
                           @"definition":@"\rPelagius was likely a British monk who came to Rome around the year A.D. 400. He later had contact with St. Augustine in Carthage around A.D. 411. Among the supposed tenets of Pelagius were the following:\r\r-Even if Adam had not sinned, he would have died.\r-Adam's sin injured only himself, not humanity\r-Children are born in the same state as Adam before the Fall\r-Salvation is possible without special grace\r\rAgainst Pelagian ideas, St. Augustine wrote works in which he articulated the concept of Original Sin and the necessity of Baptism for salvation. See “Baptism”, “Original Sin”.\r\rFurther Reference:\rWikipedia, “Pelagianism”\rhttp://tinyurl.com/nnqdgvz\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Penance",
                           @"twitterDef":@"the Sacrament of reconciliation with the Church by restitution for one's sins",
                           @"definition":@"\rThe Sacrament of Penance is offered in order to repair the harm caused by sin. Also known as the “second conversion”, it is the means through which post-Baptismal sins are forgiven. See “Sacrament”, “Forgiveness”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1422\rhttp://tinyurl.com/l7xon9e\r\rRev. Peter Beer\r“Trent's Temporal Punishment and Today's Renewal of Penance”, http://tinyurl.com/ovz83lo",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Petrine Ministry",
                           @"twitterDef":@"the ministry of service to the Church exercised by the Bishop of Rome",
                           @"definition":@"\rThe Petrine ministry is based on the role of Peter among the 12 Apostles as spokesman and leader, which is continued analogously in the person of the Pope, the Bishop of Rome.\r\rFurther Reference:\rCatechism of the Catholic Church, 881\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Palm Sunday",
                           @"twitterDef":@"the Sunday before Easter that commemorates the final entry of Jesus into Jerusalem",
                           @"definition":@"\rAccording to Letter XX of St. Ambrose of Milan, Palm Sunday was the day on which the Creed was taught to Catechumens. The current practice of congregants waving palm branches dates to the 9th century in France.\r\rFurther Reference:\rPope Francis, Palm Sunday Homily 2015\rhttp://tinyurl.com/pllaa46\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Personhood",
                           @"twitterDef":@"the capacity for self-awareness and rational moral agency",
                           @"definition":@"\rRecent trends in contemporary philosophy have raised the question of non-human persons, such as dolphins, elephants, and other higher mamals. In the biblical tradition, angels are viewed as having personhood, while being non-human. Some theologians posit the existence of extra-terrestrial persons.\r\rFurther Reference:\rWikipedia, “Personhood”\rhttp://tinyurl.com/7dvvved\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Pluralism",
                           @"twitterDef":@"the belief that all religous claims are equally valid",
                           @"definition":@"\rReligious Pluralism is distinct from Inclusivism or Ecumenism. The former retains an exclusive claim to truth and the latter promotes similarity of shared belief. Religious Pluralism entails that no single religion may lay claim to the truth to the exclusion of others.\r\rFurther Reference:\rWikipedia, “Religious Pluralism”\rhttp://tinyurl.com/3dzu8e\r\rJeannine Fletcher\r“Religious Pluralism in an Era of Globalization: The Making of Modern Religious Identity”\rhttp://tinyurl.com/plwg3hf\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Polytheism",
                           @"twitterDef":@"the belief that many gods exist",
                           @"definition":@"\rPolytheism was common in the ancient world. Pre-Exilic Israelites believed that many gods existed, as evidenced in the Decalogue and multiple references to foreign deities such as El, Asherah, Molech, and Ba'al. However, they had entered into a covenant with and only served one of them, Yahweh. After the Exile, monotheism becomes the dominant and distinguishing feature of the Israelites. See “Henotheism”, “Monotheism”.\r\rFurther Reference:\rWikipeida, “Polytheism”\rhttp://tinyurl.com/33v9dl\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Postmodernism",
                           @"twitterDef":@"the belief that there are no universally accesible truths or determinite meaning",
                           @"definition":@"\rPostmoderism arose in the late 19th century as a critique of the philosophical foundations of the Enlightenment and Modernism. Leading propnents included Frederick Nietzsche, Karl Marx, and Sigmund Freud. It is a philosophical premise of modern Relativism, leading to a Hermeneutics of suspcision. See “Hermeneutics”, “Philosophy”, “Relativism”.\r\rFurther Reference:\rRev. Thomas Guarino\r“Postmodernity and Five Fundamental Theological Issues”, http://tinyurl.com/pggnqup\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Predestination",
                           @"twitterDef":@"the belief that God has fixed the destiny of certain nations or peoples",
                           @"definition":@"\rAccording to the teaching of the Church, God's predestination of human events is based on the foreknowledge of each person's free response. See “Foreknowledge”.\r\rFurther Reference:\rCatechism of the Catholic Church, 600\rhttp://tinyurl.com/p3dfabj\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Principle of Double Effect",
                           @"twitterDef":@"the moral acceptance of an unintended evil caused by an intended good",
                           @"definition":@"\rThe Principle of Double Effect (PDE) was developed by St. Thomas Aquinas. When considering a given act and its effect, the PDE may be employed if 4 traditional criteria are satisfied:\r\r1. The act must be morally good.\r2. The agent may not will the evil affect.\r3. The good must result from the act.\r4. The good must be proportional.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Doctrine of Double Effect”\rhttp://tinyurl.com/2zz6sg\r\rRev. James Keenan\r“The Function of the Principle of Double Effect”\rhttp://tinyurl.com/ojwf9o6\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Process Theology",
                           @"twitterDef":@"the belief that God is in process with Creation",
                           @"definition":@"\rProcess theology is named after the philosophical thought of Alfred North Whitehead, who argued for a metaphysics that saw the basic element of the Universe not in terms of substance, but one of process. His work was applied to theology primarily by Charles Hartshorne. Process thought sees God as having necessary aspect of essence that does not change, but a contingent aspect of experience that is subject to change. As such, process theology is a reaction against and contradicts some aspects of classical Theism. See “Theism”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“Process Theism”, http://tinyurl.com/eg2qc\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Protestant Reformation",
                           @"twitterDef":@"the 16th century schism in the Church occassioned by Martin Luther",
                           @"definition":@"\rMartin Luther's objections to the ecclesial abuses of his day were detailed in the 95 Theses.\r\rFurther Reference:\rWikipedia, “Protestant Reformation”\rhttp://tinyurl.com/ltwnf\r\r\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Parable",
                           @"twitterDef":@"a fable-like story that makes a theological claim",
                           @"definition":@"\rParables are used frequently by Jesus in the synoptic gospels. They occur infrequently in the Old Testament (Nathan's parable to David of the rich and poor men's lambs is an example). Jesus' use of parables illustrate various aspects about the Kingdom of God.\r\rFurther Reference:\rRev. Felix Just,\r“Parables in the Gospels”\rhttp://tinyurl.com/6lobcvh\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Papyrus",
                           @"twitterDef":@"a type of plant-based paper used for writing",
                           @"definition":@"\rPapyrus was used for the writing of both the Old and New Testaments. No original manuscripts exist due to the short lifespan of Papyrus.\r\rFurther Reference:\rWikipedia, “Papyrus”\rhttp://tinyurl.com/5ta7h4\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Passover",
                           @"twitterDef":@"the feast that commemorates the Exodus of Israel from slavery in Egypt",
                           @"definition":@"\rThe Passover is found in both the Yahwist and Priestly sources. It apparently fell into disuse by the time of Hezekiah, who reinstituted it around 700 B.C. It nevertheless waned in importance until the time of Josiah, who also reinstituted Passover. According to Richard Elliot Freidman, the Passover tradition can be traced to a historical event of a small group of Levites leaving Egypt circa 1250 B.C. Jesus of Nazareth was crucified by Pontius Pilate during the Passover festival, likely around A.D. 30. The Synoptics and John, however, differ on their respective chronologies with the Synoptics portaying the Last Supper as a Passover meal, and John depicting it as a common meal before the beginning of the Passover feast.\r\rFurther Reference:\rWikipedia, “Passover”\rhttp://tinyurl.com/pol8o\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pentateuch",
                           @"twitterDef":@"the first of five books in the Old Testament;\rthe Torah",
                           @"definition":@"\rThe Pentateuch includes the books of the Torah: Genesis, Exodus, Leviticus, Numbers, and Deuteronomy. The recent acceptance of the Documentary Hypothesis has led to a better understanding of the history of the Pentateuch's composition.\r\r“Who wrote the Pentateuch, and when? Up to the seventeenth century, the virtually unanimous answer of Jews and Christians was 'Moses'. Moses wrote the Pentateuch as David wrote the Psalter and Solomon wrote the wisdom literature. Though scholars had noted inconsistencies (compare Ishmael’s age in Gn 16:16 and 21:5, 14) and duplications (Gn 12, 20, and 26), they assumed Mosaic authorship because of the prevalent theory of inspiration: God inspired authors while they wrote. With the rise of historical criticism, scholars began to use the doublets and inconsistencies as clues to different authors and traditions.\r\rBy the late nineteenth century, one theory of the sources of the Pentateuch had been worked out that proved acceptable in its main lines to the majority of scholars (apart from Christian and Jewish conservatives) then and now. It can be quickly sketched. In the premonarchic period of the Judges (ca. 1220–1020 B.C.), the twelve tribes had an oral form of their story from creation to the taking of the land. With the beginnings of monarchy in the late eleventh and tenth centuries, the oral material was written down, being known as the Yahwist account (from its use of the divine name Yahweh). Its abbreviation, “J,” comes from the German spelling of the divine name. In the following century, another account took shape in the Northern Kingdom (called E after its use of Elohim as a divine name); some believe the E source is simply a supplement to J. After the fall of the Northern Kingdom in 722/721 B.C., the E version was taken to Jerusalem where it was combined with the J version to produce J-E. During the exile (conventionally dated 587–539 B.C.) or thereafter, an editor recast J-E to make it relevant for the exiled population. This editor is conventionally known as P (=Priestly) because of the chronological and ritual interests apparent in the work. P can also designate archival material and chronological notices. The audience for the Priestly edition no longer lived in the land and was deeply concerned about its survival and its claim on the land.\r\rDeuteronomy (=D) stands alone in style, genre (preaching rather than narrative), and content. How did it come to be the fifth book of the Pentateuch? The J-E narrative actually ends in Numbers, when Israel arrives at the plains of Moab. Many scholars believe that Deuteronomy was secondarily attached to Numbers by moving the account of Moses’ death from its original place in the J-E version in Numbers to the end of Deuteronomy (chap. 34). Deuteronomy was attached to Genesis–Numbers to link it to another great work, the Deuteronomistic History (Joshua to Kings). Deuteronomy is now the fifth book of the Pentateuch and the first book of the Deuteronomistic History”.\r-Pentateuch\r\rSee “Documentary Hypothesis”, “Torah”. See the Scripture section of the Overview tab.\r\rGreek, πεντάτευχος (pentateuchos) “five scrolls”\r\rFurther Reference:\rNew American Bible Revised Edition\r“Pentateuch”\rhttp://tinyurl.com/qbuoudr\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pericope",
                           @"twitterDef":@"a coherent, self-contained section of a larger text",
                           @"definition":@"\rPericopes are most frequently mentioned in the context of stories or sayings from the Gospels. They also figure prominently the Prophetic Writings.\r\rGreek, περικοπή (pericope) “a cutting around”\r\rFurther Reference:\rWikipedia, “Pericope”\rhttp://tinyurl.com/ptoqwnn\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Perichoresis",
                           @"twitterDef":@"a Greek word meaning “rotation” used to describe the inner relationship of the Trinity",
                           @"definition":@"\rPerichoresis is used by St. John of Damascus to refer to the relationship between the Father, Son, and Holy Spirit.\r\rGreek, περιχώρησις (perichoresis) “a rotation”\r\rFurther Reference:\rCatechism of the Catholic Church, 255\rhttp://tinyurl.com/4tymjt\r\rWikipedia, “Perichoresis”\rhttp://tinyurl.com/pbfwnf8\r\r\r",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Pharisees",
                           @"twitterDef":@"a Jewish group of laymen in the first century devoted to Torah-observance",
                           @"definition":@"\rThe Pharisees are portrayed as the opponents of Jesus in the Synoptic Gospels. The book of Acts reports that many Pharisees became members of the nacent Christian community. See “Second Temple Judaism”, “Synoptic Gospels”.\r\rFurther Reference:\rWikipedia, “Pharisees”\rhttp://tinyurl.com/5kgenf\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Priestly Source",
                           @"twitterDef":@"the literary source (P) in the Torah that is concerned with priestly categories",
                           @"definition":@"\rThe Priestly, or “P” tradition in the Torah can be dated to the time of Hezekiah (ca. 700 B.C.) and shows a major concern for order, numbers, and categories of holiness and cleanliness, especially in the book of Leviticus. The Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or “profane”; this source, along with the Elohist and Deuteronomic Sources, does not accept the revelation of the name Yahweh before the Mosaic epiphany in Exodus 3.\r\rThe Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word “compassionate” to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author).\r\rFurther Reference:\rWikipeida, “Priestly Source”\rhttp://tinyurl.com/yq83pf\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Primeval History",
                           @"twitterDef":@"the mythological stories of Genesis 1 - 11, dealing with Creation, the Flood, and Babel",
                           @"definition":@"\rThe Primeval History has a different literary quality than the later chapters of Genesis which are associated with known historical locations. Genesis 1-11 is composed mostly of the Yahwist and Priestly Sources with additions from the final Redactor.\r\rFurther Reference:\rWikipedia, “Book of Genesis”\rhttp://tinyurl.com/2yeugf\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Prophet",
                           @"twitterDef":@"one who speaks in the place of God",
                           @"definition":@"\rThis term is used in the Old Testament to refer to either a court prophet (such as Nathan) or an independent prophet (such as Amos).\r\rFurther Reference:\rFelix Just\r“What is Biblical Prophecy?”\rhttp://tinyurl.com/82n9ezg\r\rRev. M.B. Fallon\r“Prophecy in Ancient Israel”\rhttp://tinyurl.com/qg74o5f\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Prophetic Books",
                           @"twitterDef":@"the fifth of five sections of the Old Testament",
                           @"definition":@"\rThe Prophetic Books are usually divided into the categories of “major” and “minor”, based on the length of the book. Isaiah, Jeremiah, and Ezekiel are the major prophetic books, while the remaining books are considered minor.\r\r“The prophetic books bear the names of the four major and twelve minor prophets, in addition to Lamentations and Baruch. The terms “major” and “minor” refer to the length of the respective compositions and not to their relative importance. Jonah is a story about a prophet rather than a collection of prophetic pronouncements. In the Hebrew Bible, Lamentations and Daniel are listed among the Writings (Hagiographa), not among the prophetic books. The former contains a series of laments over the destruction of Jerusalem by the Babylonians. The latter is considered to be a prophetic book, though it consists of a collection of six edifying diaspora tales (chaps. 1–6) and four apocalyptic visions about the end time (chaps. 7–12). Baruch is not included in the Hebrew canon, but is in the Septuagint or Old Greek version of the Bible, and the Church has from the beginning acknowledged its sacred and inspired character. The prophetic books contain a deposit of prophetic preaching, and several of them in addition are filled out with narrative about prophets (e.g., Is 7; 36–39; Jer 26–29; 36–45; Am 7:10–17). In ancient Israel a prophet was understood to be an intermediary between God and the community, someone called to proclaim the word of God. Prophets received such communications through various means, including visions and dreams, often in a state of transformed consciousness, and transmitted them to the people as God’s messengers through oracular utterances, sermons, writings, and symbolic actions.”\r-Prophetic Books\r\rSee the Scripture section of the Overview tab.\r\rFurther Reference:\rNew American Bible Revised Edition\r“Prophetic Books”, http://tinyurl.com/qz8dyvx\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Philosophy",
                           @"twitterDef":@"the critical examination of human thought;\rthe love of wisdom",
                           @"definition":@"\rPhilosophy in the Western tradition originated in ancient Greece. As a discipline, philosophy has an authentic independence from theology. Among contemporary Catholic theologians, Fr. Thomas Guarino has explored the relationship between the two in the following theses:\r\r1. Theology legitimately assimilates Philosophy.\r2. Theology must discipline Philosophy.\r3. Philosophy has a relative autonomy.\r4. Theological Pluralism is necessary.\r5. Theology requires Metaphysics.\r\rFurther Reference:\rRev. Thomas Guarino\r“Fides et Ratio: Theology and Contemporary Pluralism”\rhttp://tinyurl.com/qhsj5q8\r\rWikipedia, “Philosophy”\rhttp://tinyurl.com/e5h6u\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Physicalism",
                           @"twitterDef":@"the belief traditional properties of the soul are emergent properties of the brain",
                           @"definition":@"\rPhysicalism is offered as an alternative to traditional Dualism and has received from support from modern neuroscience. Various Christian philosophers, such as Nancy Murphy, are advocates of a non-reductive, physicalist anthropology. See “Dualism”.\r\rFurther Reference:\rNancey Murphy\r“Is Non-Reductive Physicalism an Oxymoron?”\rhttp://tinyurl.com/po8oo85\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Prayer",
                           @"twitterDef":@"communication with God",
                           @"definition":@"\rPrayer is referred to throughout Sacred Scripture. It developed in pre-Exilic Judaism with stories of the Patriarchs and was intricately connected to the practice of sacrifice by the Priestly author. In the New Testament, Jesus is portrayed numerous times as praying in solitary places and before significant events in his ministry. St. Paul claims that prayer in the Holy Spirit expresses the Christian's adoptive sonship. See “Abba”, “Intercession”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2559\rhttp://tinyurl.com/letv3vp\r\r\r",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Problem of Evil",
                           @"twitterDef":@"the philosophical problem of belief in God with the experience of evil",
                           @"definition":@"\rThe Problem of Evil can be traced to the writings of the Greek philosopher Epicurus. It takes two forms: logical and evidential. The former results from belief in Divine omniscience, omnipotence, and omnibenevolence and the experience of suffering and evil in the world producing a logical inconsistency. It proposes the question: if God is all-loving, all-knowing, and all-powerful, why does evil (particularly so-called natural evil) exist? If not seen as logically incompatible, the evidential form of the Problem of Evil claims that such evil severely lowers the probability of the truth of Theism. See “Omnibenevolence”, “Omniscience”, “Omnipotence”, “Theism”, “Theodicy”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy\r“The Problem of Evil”, http://tinyurl.com/mvkoe4\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Pseudepigrapha",
                           @"twitterDef":@"texts falsely attributed to others",
                           @"definition":@"\rThe process of falsely attriubting authorship of texts was common in the ancient world. There are pseudepigraphical texts from both the Old and New Testament eras. Old Testament pseudepigrapha include texts such as 1 Enoch, while New Testament pseudepigrapha include texts such as “The Infancy Gospel” and “Gospel of Thomas”.\r\rFurther Reference:\rWikipedia, “Pseudepigrapha”\rhttp://tinyurl.com/35mxyk\r\r\r",
                           @"category":@"Biblical"}];
    
    
    ////////////////////////////////////////////////////////////////////Q
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Q Source",
                           @"twitterDef":@"the hypothetical document that lies behind similar passages in Matthew and Luke",
                           @"definition":@"\rThe Q Source is believed to lie behind similar passages, exclusive to Matthew and Luke, which contain various teachings of Jesus. See “Two-Source Hypothesis”.\r\rGerman, (quelle) “source”.\r\rFurther Reference:\rWikipedia, “Q Source”\rhttp://tinyurl.com/46hamlg\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Quintessence",
                           @"twitterDef":@"an Aristotelean fifth essence;\ra hypothetical form of dark energy in physics",
                           @"definition":@"\rAs part of his metaphysics, Aristotle posited a 5th essence or element that permeated the Divine realm; also known as “aether”. In modern physics, Quintessence is a possible explanation for the expansion of the Universe. See the Philosophy and Science sections in the Overview tab. See “Big Bang”.\r\rFurther Reference:\rWikipedia, “Aether”\rhttp://tinyurl.com/olx6j\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Quartodeciman Controversy",
                           @"twitterDef":@"a 2nd century liturgical dispute over the celebration of Easter",
                           @"definition":@"\rLeviticus 23:5 regulates the celebration of Passover to the fourteenth day of Nisan. Asiatic Christians celebrated the Resurrection of Jesus on that exact day, while Roman Christians celebrated Easter on the first Sunday after the Nisan 14. Irenaeus of Lyons persuaded Anicetus, the Bishop of Rome at the time, not to excommunicate the Asiatic churches over such a difference.\r\rFurther Reference:\rWikipedia, “Quartodecimanism”\rhttp://tinyurl.com/nl3pd8p\r\r\r",
                           @"category":@"Historical"}];
    
    
    ///////////////////////////////////////////////////////////////////////////////R
    
    [TAWord wordWithDict:@{@"name":@"RCIA",
                           @"twitterDef":@"a basic education in the Faith in a systematized and organic manner",
                           @"definition":@"\rSee “Catechesis”.\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Real Presence",
                           @"twitterDef":@"the Eucharistic presence of Christ",
                           @"definition":@"\rFrom the earliest days of the Church, Christians have believed that Christ is present in the Eucharist. The belief in the Real Presence precedes later theological attempts to explain how Christ is present. See “Transubstantiation”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1374\rhttp://tinyurl.com/m88dbjl\r\r\r",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Redaction Criticism",
                           @"twitterDef":@"the analysis of the various stages of the editing of a text",
                           @"definition":@"\rRedaction Criticism is primarily used in studies of the Gospels. It is specifically mentioned as a criticsm used as part of the larger Historical-Critical Method by the Pontifical Biblical Commission.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/ymsltv\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Redemption",
                           @"twitterDef": @"an economic metaphor used to describe the experience of salvation in Christ",
                           @"definition":@"\rThe biblical tradition is replete with the metaphor of redemption being applied to God's salvation of Israel and the Church.\r\rFurther Reference:\rNew Catholic Encyclopedia, “Redemption”\rhttp://tinyurl.com/nbl8ftm\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Repentance",
                           @"twitterDef":@"the contrite changing of one's thinking",
                           @"definition":@"\rRepentance is necessary when one's relationship with God is impaired by sin. It is a theme of the Hebrew prophets in the Old Testament. It is a corollary of Jesus' message of the Kingdom of God in the Synoptic Gospels. Later in the New Testament, Repentance is linked to the Forgiveness of Sins in Baptism. The question of post-Baptismal sin became significant in the early Church. Penance came to be seen as a “second repentance”. See “Baptism”, “Forgiveness of Sins”, “Penance”.\r\rGreek, μετάνοια (metanoia) “after thought”\r\rFurther Reference:\rCatechism of the Catholic Church, 1431\rhttp://tinyurl.com/l7xon9e\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Relativism",
                           @"twitterDef":@"the belief that there are no universal truths",
                           @"definition":@"\rRelativism can be traced to various thinkers in the ancient Greek philosophical tradition. Modern relativism often takes the form of moral relativism. Before his electction to the Papacy, Cardinal Joseph Ratzinger emphasized the dangers of such a worldview:\r\r“Today, having a clear faith based on the Creed of the Church is often labeled as fundamentalism. Whereas relativism, that is, letting oneself be 'tossed here and there, carried about by every wind of doctrine', seems the only attitude that can cope with modern times. We are building a dictatorship of relativism that does not recognize anything as definitive and whose ultimate goal consists solely of one's own ego and desires.”\r-Papal Homily\r\rSee “Philosophy”, “Logic”.\r\rFurther Reference:\rCardinal Joseph Ratzinger\r“Papal Homily, 4.18.2005”\rhttp://tinyurl.com/7nlhk\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Ressourcement",
                           @"twitterDef":@"a French term meaning “to return to the sources”",
                           @"definition":@"\rThis term is used by some theologians as the preferred interpretation of the purpose of Vatican II; that being a return to the Patristic sources of the Church. It was given the French designation, La Nouvelle Theologie (“The New Theology”) by its critics who accused the movement of being, instead of true return to the sources, the invention of a new theology which was too accommodating to the errors of Modernism. See “Aggiornomento”, “Modernism”.\r\rFurther Reference:\rWikipedia, “Nouvelle Theologie”,\rhttp://tinyurl.com/qg2nljj\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Resurrection",
                           @"twitterDef":@"God's raising the righteous dead into eternal life",
                           @"definition":@"\rThe belief in resurrection developed in post-Exilic Judaism, in part, as an answer the question of the continued misfortune of the Covenant-faithful. The early Christians believed that Jesus of Nazareth was raised from the dead and thus, demonstrated to be the Messiah and Lord. In the Gospel of John, Thomas is portrayed as having difficulty in connecting the experience of the Resurrection with the tragedy of the Crucifixion. Fr. David Norman observes:\r\r“Thomas doubted the truth conveyed by the cross and the resurrection. If he had not been so importunate, then his faith truly could have been counted as folly. Though it would appear that Thomas insists on proof, that he see, the object of his doubt cannot be the truth of the appearing of God to the ten; he doubts that the theophany has Jesus of Nazareth as its subject. Thomas refuses to believe until he can certify that the appearing one is the one who was crucified. The evidence for belief in a crucified Lord is insufficient if it is merely a question of the appearing of the Glorified and Exalted One. For Thomas to change his Jewish concept of God — to believe that the crucified Jesus of Nazareth is one with the God of Israel — he needs to 'see,' to verify that the Glorified One is the Crucified One. To give him his credit, he would have garnered the moniker 'gullible' if he had demanded anything less. Instead, his intellectual honesty earned him the misnomer 'doubter'.”\r-Norman, 810\r\rSt. Paul claims that the resurrection of Jesus was the “firstfruits” of the general resurrection that inaugurated the eschaton. Pierre Teilhard de Chardin interpreted the Resurrection as a pre-figuring of the endpoint of human evolution, which he termed the “Omega Point”. See “Crucifixion”, “Second Temple Judaism”, “Jesus of Nazareth”.\r\rFurther Reference:\rCatechism of the Catholic Church, 638-655\rhttp://tinyurl.com/nrt2f6g\r\rRev. David Norman\r“Doubt and the Resurrection of Jesus”\rhttp://tinyurl.com/q5kt2uh\r\r\r",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Religious Naturalism",
                           @"twitterDef":@"a movement that emphasizes scientific knowledge as a foundational mythos",
                           @"definition":@"\rReligious Naturalism views the scientific history of the universe as a core mythos around which revolve interpretive, spiritual, and moral axes.\r\rFurther Reference:\rReligious Naturalist Association\r“Who Is A Religious Naturalist?”\rhttp://tinyurl.com/o7d4zgf\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Rerum Novarum",
                           @"twitterDef":@"the encyclical of Pope Leo XIII that initiated modern Catholic Social Teaching",
                           @"definition":@"\rThe encyclical of Pope Leo XIII in 1891 which responded to the after effects of the Industrial Revolution in Europe by teaching that private property is relative to the Common Good and that workers have a right to unionized and to a living wage. See “Catholic Social Teaching”, “Living Wage”.\r\rLatin, (rerum novarum), “of new things”\r\rFurther Reference:\rPope Leo XIII, “Rerum Novarum”\rhttp://tinyurl.com/lv5y76v\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Righteousness",
                           @"twitterDef":@"a right or just relationship",
                           @"definition":@"\rRigheousness is first spoken of in the Bible in reference to Abaham. After hearing the promise of Yahweh that he would be the father of many nations, he “put his faith in the LORD, who credited it to him as an act of righteousness” (Gen 15:6). St. Paul uses this same example to claim that those who have faith in (or of) Jesus Christ are put into a right relationship with God. The word “Justification” derives from the same cognate. See “Justification”, “Justice”.\r\rGreek, δικαιοσύνη (dikaisune) “righteousness”\r\rFurther Reference:\rCatechism of the Catholic Church, 1992\rhttp://tinyurl.com/yaua7cc\r\r\r",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Roe v. Wade",
                           @"twitterDef":@"the landmark, 1973 U.S. Supreme Court case legalizing abortion",
                           @"definition":@"\rRoe v. Wade ruled that state laws criminalizing abortion were unconstitutional due to an inherent right to privacy. The ruling stated that before the age of viability, no state may restrict abortion. In the 2nd and 3rd trimesters, however, states may restrict the practice. See “Abortion”.\r\rFurther Reference:\rU.S. Supreme Court, “Roe v. Wade”\rhttp://tinyurl.com/qhpdzo3\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Rosary",
                           @"twitterDef":@"the prayer based on the Hail Mary and the Our Father",
                           @"definition":@"\rThe Rosary dates back to the time of St. Dominic in which the praying of 50 Hail Marys was popular.\r\rFurther Reference:\rCatechism of the Catholic Church, 971\rhttp://tinyurl.com/mtfzewa\r\r\r",
                           @"category":@"Liturgical"}];
    
    
    
    //////////////////////////////////////S
    
    
    [TAWord wordWithDict:@{@"name":@"Sacrament",
                           @"twitterDef":@"an efficacious sign of the Paschal Mystery that confers the grace it signifies",
                           @"definition":@"\rAccording to the teaching of the Church, it is Christ who acts in the Sacraments, independent of the personal virtue of the celebrant. Sacraments are valid if they possess the appropriate matter and form and if they are administered with the right intention. The effects of the Sacraments are still dependent upon the disposition of the recipient. The Council of Trent defined the Sacraments as being seven in number:\r\r-Bapstism\r-Confirmation\r-Eucharist\r-Reconcilation\r-Annointing of the Sick\r-Holy Orders\r-Marriage\r\rThe Sacraments of Initiation include Baptism, Confirmation, and Eucharist. See “Paschal Mystery”, “Ex Opere Operato”. See “Trent” in the Historical section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 113-130\rhttp://tinyurl.com/cmes38\r\rRev. Edward Kilmartin\r“Sacraments as Liturgy of the Church”\rhttp://tinyurl.com/netg4bx\r\r\r",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Sacramentals",
                           @"twitterDef":@"sacred signs that signify the effects of the Sacraments",
                           @"definition":@"\rSacramentals dispose the Faithful to receive the grace of the Sacraments. They are instituted for the sanctification of various circumstances in the Christian vocation.\r\rFurther Reference:\rCatechism of the Catholic Church, 1667-1676\rhttp://tinyurl.com/oo3cp5p\r\r\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Salvation",
                           @"twitterDef":@"deliverance from sin and death",
                           @"definition":@"\rSalvation is a theme that runs throughout the Scriptures. Yahweh is referred to as a Savior in the Old Testament, and the New Testament refers to Jesus as the Savior of the world. His is the name by which all must be saved (Acts 4:12). The ancient dictum: Extra Ecclesium Nulla Salus (“Outside the Church there is no salvation.”) has been positively interpreted by the Fathers of the Second Vatican Council as meaning that non-Christians relate to the Church in various ways. Those who have never experienced the particular grace of the Holy Spirit may nevertheless be saved. See “Inclusivism”.\r\rFurther Reference:\rRichard Clifford & Khaled Anatolios\rChristian Salvation: “Biblical and Theological Perspectives”\rhttp://tinyurl.com/old3n3a\r\r\r",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Schism",
                           @"twitterDef":@"the Greek word meaning “division”;\ra split in visible unity of the Church",
                           @"definition":@"\rSchisms are not necessarily heresies; they are the result of a failure in discipline, which may include matters of belief. Schisms may result from non-doctrinal matters. St. Paul mentions a local schism in the church at Corinth. While every heresy necessarily involvesa schism, not every schism necessarily involves a heresy. See “Heresy”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2089\rhttp://tinyurl.com/lu75a9k\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Seleucid",
                           @"twitterDef":@"the Greek dynasty that ruled in Syria",
                           @"definition":@"\rThe Seleucids were descendants of Seleucus, a general of Alexander the Great. The most famous of the Seleucid dynasty was undoubtedly Antiochus IV, who installed a statue of Zeus in the Temple of Jerusalem and attempted to Hellenize the Jews by force. The sect of the Sadducees were descended from them. See “Sadducees”.\r\rFurther Reference:\rWikipedia, “Seleucid Empire”\rhttp://tinyurl.com/pq4w6z7\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Social Justice",
                           @"twitterDef":@"the just structuring of society that prioritizes the common good and the poor",
                           @"definition":@"\rAccording to Pope Paul VI, social justice is an essential aspect to the proclamation of the gospel.\r\rFurther Reference:\rCatechism of the Catholic Church, 1928\rhttp://tinyurl.com/ow79m3t\r\rCompendium of the Social Doctrine of the Church, 85, http://tinyurl.com/pgklzdg\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Speciesism",
                           @"twitterDef":@"the denial of moral value to non-human animals",
                           @"definition":@"\rSpeciesism has been treated extensively by ethicists such as Peter Singer. Catholic theologians have expressed a growing concern that human treatment of non-human animals is significant in moral theology.\r\rFurther Reference:\rJohn Berkman\r“From Theological Speciesism to a Theological Ethology: Where Catholic Moral Theology Needs to Go”, http://tinyurl.com/nc46h5u\r\rCharles Camosy & Susan Kopp\r“The Use of Non-Human Animals in Biomedical Research: Can Moral Theology Fill the Gap?”\rhttp://tinyurl.com/nc46h5u\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Soteriology",
                           @"twitterDef":@"the study of salvation;\ra particular framework of salvation",
                           @"definition":@"\rSoteriology examines the nature of salvation and its relationship with the larger subject of Ecclesiology. See “Ecclesiology”, “Salvation”.\r\rFurther Reference:\rWikipedia, “Soteriology”\rhttp://tinyurl.com/m3ysznn\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Sadducees",
                           @"twitterDef":@"the elite class of priests and scribes in Second Temple Judaism",
                           @"definition":@"\rThe Sadducees were the group of priests that served at the Temple in Jerusalem. They mediated between the authority of Rome and the will of Israel. They were descendants of the Seleucid dynasty in Syria. The Gospels portray them as Jesus' most severe critics and conspirators in his crucifixion by Pontius Pilate. See “Seleucids”, “Second Temple Judaism”.\r\rFurther Reference:\rWikipedia, “Sadducees”\rhttp://tinyurl.com/kfyzlvc\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Satan",
                           @"twitterDef":@"a Hebrew word meaning “adversary” used for a malevolent spiritual being",
                           @"definition":@"\rThe development of the character of Satan is linked to the larger shift in Israelite theology after the Exile. Monotheism replaced Henotheism and no longer allowed the possibility that Yahweh was responsible for evil (such as indicated by various passages in pre-Exilic Hebrew writings). Thus, a character developed which was seen as an adversarial member of Yahweh's heavenly court, the Satan. For a clear example of this theological shift, see 2 Sam. 24:1 and 1 Chronicles 21:1.\r\rA later tradition interprets references to the Kings of Babylon and Tyre in Isaiah 14 and Ezekiel 38, respectively, to refer to Satan as a fallen angel who was expelled from Heaven after a failed attempt to dethrone the Almighty. The New Testament uses this later interpretation of Satan to refer to a malevolent spiritual being opposed to the will of God and seeking to destroy human welfare. See “Exile”, “Henotheism”, “Monotheism”, “Second Temple Judaism”, “Yahweh”.\r\rHebrew, שָּׂטָן (satan)\r\rFurther Reference:\rWikipedia, “Satan”\rhttp://tinyurl.com/czesk\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Septuagint",
                           @"twitterDef":@"the Greek translation of the Old Testament",
                           @"definition":@"\rAccording to legend, the Septuagint was made at the request of Alexander the Great by 70 Jewish scribes.\r\rFurther Reference:\rWikipedia, “Septuagint”\rhttp://tinyurl.com/ysxfhh\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Sitz im Leben",
                           @"twitterDef":@"a German word meaning “setting in life” referring to the context of a text",
                           @"definition":@"\rForm Criticism determines the literary form of a text. This form is intrinsically connected to its setting in life. The German biblical scholar Hermann Gunkel coined the phrase to refer to this context.\r\rGerman, (sitz em leben)\r\rFurther Reference:\rWikipedia, “Sitz im Leben”\rhttp://tinyurl.com/cj4hy7\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Social Revolution Model",
                           @"twitterDef":@"the theory which claims that Israelites were mostly native Canaanites",
                           @"definition":@"\rA number of facts render the traditional Conquest (based on Joshua) and Immigration (based on Judges) models of Settlement problematic, such as:\r\r-signs of internal revolt in certain Canaanite sites\r-exponential population increase in the Canaanite highlands between 1200-1000 B.C.\r-narrative discrepancies between Joshua and Judges\r-the dimishment of Egyptian power over Canaanite city-states\r-the prevalence of idolatry throughout ancient Israel\r\rSee “Documentary Hypothesis”.\r\rFurther Reference:\rNOVA, “Moses and the Exodus”\rhttp://tinyurl.com/b5lmmy9\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Source Criticism",
                           @"twitterDef":@"the analysis of the underlying sources of a text",
                           @"definition":@"\rSource Criticism is a criticism used in the larger Historical-Critical Method. It was developed in the 19th century by German biblical scholars and eventually led to the formulation of the Documentary Hypothesis of the Torah and the Two-Source Theory of the Gospels. See “Documentary Hypothesis”, “Historical-Critical Method”, “Two-Source Theory”.\r\rFurther Reference:\rRev. Joseph Fitzmeyer\r“Historical Criticism: Its Role in Biblical Interpretation and Church Life”, 250-251\rhttp://tinyurl.com/p7488ev\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synagogue",
                           @"twitterDef":@"the local gathering place for Jews on the Sabbath",
                           @"definition":@"\rSynagogues developed among Jews during the Exile in Babylon as a means of preserving national and religious identity. They were carried over into post-Exilic, Second Temple Judaism. Jesus of Nazareth is portrayed as teaching in the synagogues of the Galilee in the Gospels. See “Second Temple Judaism”.\r\rGreek, συναγωγή (synagoge) “gathering”\r\rFurther Reference:\rWikipedia, “Synagogue”\rhttp://tinyurl.com/yjbh2z\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synchronic Analysis",
                           @"twitterDef":@"the analysis of a text which considers various aspects of its present form",
                           @"definition":@"\rSynchronic Analysis studies the present form a text. It uses methods of Literary Criticism that include Rhetorical, Narrative, and Semiotic Analysis. See “Diachronic Analysis”, “Literary Criticism”.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/ymsltv\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synoptic Gospels",
                           @"twitterDef":@"the gospels of Matthew, Mark, and Luke",
                           @"definition":@"\rThe gospels of Matthew, Mark, and Luke are grouped together due to their similarity of narrative and low Christology contrasted with that of the gospel of John. The Two-Source Theory explains their relationship. See “Christology”, “Gospel”, “Two-Source Theory”.\r\rGreek, σύνοψις (synopsis) “seeing together”\r\rFurther Reference:\rWikipedia, “Synoptic Gospels”\rhttp://tinyurl.com/aofv2x\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Semiotics",
                           @"twitterDef":@"the study of signs and symbols used as elements of communication",
                           @"definition":@"\rSemiotic analysis is a synchronic aspect of Literary Criticism as applied to the biblical texts. See “Synchronic Analysis”, “Literary Criticism”.\r\rFurther Reference:\rWikipedia, “Semiotics”\rhttp://tinyurl.com/25kpos\r\r\r",
                           @"category":@"Cultural"}];
    
    /*
    [TAWord wordWithDict:@{@"name":@"Sociology",
                           @"twitterDef":@"The study of society",
                           @"definition":@"\rThe study of society.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
     
    */
    
    [TAWord wordWithDict:@{@"name":@"Second Temple Judaism",
                           @"twitterDef":@"the nature of Judaism from 515 B.C. to A.D. 70, marked by distinctive theological characteristics",
                           @"definition":@"\rSecond Temple Judaism has its roots in 4 major, post-Exilic theological developments in the ancient Israelite concept of the Covenant:\r\r1. Monotheism\r2. Torah\r3. Satan\r4. Resurrection\r\rWith the rise of Monotheism, the theme of adherence to the Torah became central to Jewish identity. As the attribution of misfortune shifted from Yahweh to the character of the Satan, Resurrection arose, in part, as a response to the question of Yahweh's justice in light of Covenant-faithfulness without the promised blessings. During the rebuiling of Solomon's Temple in 515 B.C. and its destruction in A.D. 70, Judaism was marked by various schools of thought which revolved around various interpretations of these elements. These schools of thought were facilitated by Synagogue worship, which had developed during the Exile and and would continue to the present day. See “Covenant”, “Monotheism”, “Resurrection”, “Satan”, “Synagogue”, “Torah”.\r\rFurther Reference:\rWikipedia, “Second Temple Judaism”\rhttp://tinyurl.com/ouo2ho5\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Sensus Fidelium",
                           @"twitterDef":@"the sense of the Faith within the Church",
                           @"definition":@"\rThe Sensus Fidelium is manifested in the Church among the Faithful. In particular, the Laity manifest this supernatural sense when they express universal consent in faith and morals. According to the International Theological Commission, the Sensus Fidelium as manifested by the Laity has preserved the  Church from heresy.\r\r“In some cases, as Blessed John Henry Newman (1801-90) remarked, the faith of the laity, in particular, played a crucial role. The most striking example was in the famous controversy in the fourth century with the Arians, who were condemned at the Council of Nicaea (325 AD), where the divinity of Jesus Christ was defined. From then until the Council of Constantinople (381 AD), however, there continued to be uncertainty among the bishops. During that period, ‘the divine tradition committed to the infallible Church was proclaimed and maintained far more by the faithful than by the Episcopate’. There was a temporary suspense of the functions of the ‘Ecclesia docens’. The body of Bishops failed in their confession of the faith. They spoke variously, one against another; there was nothing, after Nicaea, of firm, unvarying, consistent testimony, for nearly sixty years.’...The whole Church, laity and hierarchy together, bears responsibility for and mediates in history the revelation which is contained in the holy Scriptures and in the living apostolic Tradition. The Second Vatican Council stated that the latter form ‘a single sacred deposit of the word of God’ which is ‘entrusted to the Church’, that is, ‘the entire holy people, united to its pastors’. The Council clearly taught that the faithful are not merely passive recipients of what the hierarchy teaches and theologians explain; rather, they are living and active subjects within the Church.”\rSensus, 26, 67\r\rSee “Laity”, “Heresy”.\r\rFurther Reference:\rInternational Theological Commission\r“Sensus Fidei in the Life of the Church”\rhttp://tinyurl.com/phjf7sf\r\rCatechism of the Catholic Church, 897\rhttp://tinyurl.com/m65ttaf\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Sexuality",
                           @"twitterDef":@"the ability to form bonds of communion with others, especially in love and procreation",
                           @"definition":@"\rAccording to the teaching of the Church, sexuality affects the entirety of the human person. It is intrinsically tied to a person's sexual identity as either male or female. Vatican II declared that sexual acts should always be expressed in ways that are “truly human”:\r\r“The actions within marriage by which the couple are united intimately and chastely are noble and worthy ones. Expressed in a manner which is truly human, these actions promote that mutual self-giving by which spouses enrich each other with a joyful and a ready will. Sealed by mutual faithfulness and hallowed above all by Christ's sacrament, this love remains steadfastly true in body and in mind, in bright days or dark.”\r-Gaudium, 49\r\rIn 1968, Pope Paul VI taught that sexual love is ultimately unitive and that every sexual act between married couples must remain open to life:\r\rThe sexual activity, in which husband and wife are intimately and chastely united with one another, through which human life is transmitted, is, as the recent Council recalled, 'noble and worthy.' It does not, moreover, cease to be legitimate even when, for reasons independent of their will, it is foreseen to be infertile. For its natural adaptation to the expression and strengthening of the union of husband and wife is not thereby suppressed. The fact is, as experience shows, that new life is not the result of each and every act of sexual intercourse. God has wisely ordered laws of nature and the incidence of fertility in such a way that successive births are already naturally spaced through the inherent operation of these laws. The Church, nevertheless, in urging men to the observance of the precepts of the natural law, which it interprets by its constant doctrine, teaches that each and every marital act must of necessity retain its intrinsic relationship to the procreation of human life.”\r-Paul VI, 9, 11\r\rMore recently, theologians such as Todd Salzman and Michael Lawler have (controversially) argued for more inclusive definition of “truly human” sexual acts in a broader understanding of complimentarity:\r\r“We suggest that the needed complementarity for a truly human sexual act is holistic complementarity that unites people bodily, affectively, spiritually, and personally in light of a person’s sexual orientation...A truly human sexual act is an actus humanus in accord with a person’s sexual orientation that facilitates a deeper appreciation, integration, and sharing of a person’s embodied self with another embodied self.”\r-Salzman, 645-646, 648\r\rSee “Marriage”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2332\rhttp://tinyurl.com/cz1w\r\rPope Paul VI\r“Humanae Vitae”\rhttp://tinyurl.com/of8rjur\r\rTodd Salzman & Michael Lawler\r“Catholic Sexual Ethics: Complimentarity and the Truly Human”, http://tinyurl.com/pkdlwhy\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Solidarity",
                           @"twitterDef":@"the fundamental unity of human beings as a criteria for determining justice",
                           @"definition":@"\rSolidarity is a basic principle of Catholic Social Teaching. The Compendium of the Social Doctrine of the Church states:\r\r“Solidarity highlights in a particular way the intrinsic social nature of the human person, the equality of all in dignity and rights and the common path of individuals and peoples towards an ever more committed unity. Never before has there been such a widespread awareness of the bond of interdependence between individuals and peoples, which is found at every level. The very rapid expansion in ways and means of communication “in real time”, such as those offered by information technology, the extraordinary advances in computer technology, the increased volume of commerce and information exchange all bear witness to the fact that, for the first time since the beginning of human history, it is now possible — at least technically — to establish relationships between people who are separated by great distances and are unknown to each other.”\r-Compendium, 192\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church\rhttp://tinyurl.com/ow79m3t\r\rCatechism of the Catholic Church, 1939\rhttp://tinyurl.com/cu6e64y\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Spirituality",
                           @"twitterDef":@"the conscious process of integration of one's life toward Ultimate value",
                           @"definition":@"\rIn the Catholic Tradition, the term “spirituality” has referred to various types of prayer or ways of living one's faith, often with a particular community\r\rFurther Reference:\rCatechism of the Catholic Church, 2684\rhttp://tinyurl.com/ocstm6t\r\rSandra Schneiders\r“Spirituality in the Academy”\rhttp://tinyurl.com/pfosbqw",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Structuralism",
                           @"twitterDef":@"the idea that cultural elements are properly understood in a systematized context",
                           @"definition":@"\rAs a philosophical movement, Structuralism has influenced Literary Criticism, and by extention, Hermeneutics. It has a parallel in the idea that one of the necessary elements of proper Hermeneutics is that Scriputre is to be intepreted within the light of the entire Canon of Scripture. See “Hermeneutics”, “Canon”.\r\rFurther Reference:\rWikipedia, “Structuralism”\rhttp://tinyurl.com/qufwa\r\r\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Supernormal Allurements",
                           @"twitterDef":@"the attraction to concentrated goods that allowed humanity to evolve",
                           @"definition":@"\rSupernormal Allurements activate our physical, social, and interpretive instincts; all of which have enabled the human species to evolve.\r\rFurther Reference:\rWikipedia, “Supernormal Stimulus”\rhttp://tinyurl.com/bdd68qx\r\r\r",
                           @"category":@"Cultural"}];
    
    
    ////////////////////////////////T
    
    
    
    [TAWord wordWithDict:@{@"name":@"Theodicy",
                           @"twitterDef":@"the question of God's justice in the face of suffering and evil",
                           @"definition":@"\rTheodicy is the philosophical response to the Problem of Evil. See “Problem of Evil”.\r\rFurther Reference:\rWikipedia, “Theodicy”\rhttp://tinyurl.com/2vj6j4\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theological Notes",
                           @"twitterDef":@"qualifications of different Church teachings as having different levels of authority",
                           @"definition":@"\rTheological Notes are given to clarify the level of authority of a particular doctrine. Not every doctrine is, of itself, infallible. So called “noninfallible teaching”, while definitive, is nevertheless subject to continuous reinterpretation, which is occasioned by and filtred through larger cultural contexts. The International Theological Commission distinguished between common doctrines of the Church and faith of the Church:\r\r“The fact that tradition is a really live reality explains why there are so many declarations by the Magisterium of varying importance and varying degrees of obligation. To gauge these exactly and to interpret them, theology has worked out the doctrine of theological qualifications or notes, which, to some extent, the Magisterium has adopted. In recent times, this approach has unfortunately been more or less forgotten. But it is useful in the interpretation of dogma and should therefore be reistinated and developed further.”\r-Interpretation, B.II.3\r\rTo illustrate this point, the doctrine of Limbo, even though taught by Popes and the Magisterium as part of the common doctrine of the Church, was never infallibly defined as being a part of Divine Revelation. As such, it was qualified as being theological opinion and not of the Faith in 2007 by the International Theological Commission.\r\rFurther Reference:\rInternational Theological Commission\r“The Interpretation of Dogma”\rhttp://tinyurl.com/md9yco5\r\rHarold Earnst\r“The Theological Notes and the Interpretation of Doctrine”, http://tinyurl.com/pv6fxh3\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theologoumenon",
                           @"twitterDef":@"a theological opinion on a disputable matter that has not been defined in Church teaching",
                           @"definition":@"\rThe belief in Limbo was an example of a theologoumenon. The International Theological Commission clarified the Church's teaching on the Limbo in 2007. See “Theological Notes”.\r\rFurther Reference:\rInternational Theological Commission\r“The Hope Of Salvation For Infants Who Die Without Being Baptized“\rhttp://tinyurl.com/3x7puy\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theology",
                           @"twitterDef":@"faith seeking understanding",
                           @"definition":@"\rTheology has been traditionally understood as the intelligence of faith. Theology uses philosophical tools in its quest to better understand the content of Divine Revelation, which it takes as its point of departure. The International Theological Commission has identified several criteria for authentic Catholic theology.\r\rTheology:\r\r-recognizes the primacy of the Word of God\r\r-understands the Faith of the Church as its source, context, and norm\r\r-seeks to understand the rationality of faith\r\r-draws upon and promotes the Scriptural witness of the Faith\r\r-stands in fidelity to the Apostolic Tradition\r\r-is attentive to the sensus fidelium\r\r-adheres respsonsibly to the Magisterium in its various gradations\r\r-is practiced in prayerful collaboration within the theological community and larger communion of the Church\r\r-is in constant dialogue with the world\r\r-strives to rationally articulate the truths of the Christian Faith\r\r-attempts to integrate diverse methods and enquiries into a unified project\r\r-seeks and delights in the wisdom of God\r\rFurther Reference:\rInternational Theological Commission\r“Theology Today: Perspectives, Principles, and Criteria”, http://tinyurl.com/brdt29m\r\rCongregation for the Doctrine of the Faith\r“Instruction on the Ecclesial Vocation of the Theologian”, http://tinyurl.com/bhu2k\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theosis",
                           @"twitterDef":@"a Greek word meaning “becoming like God”",
                           @"definition":@"\rTheosis is referred to in 2 Peter 1:4 when it refers to Christians as “partakers in the Divine Nature” of God. St. Irenaeus of Lyon claimed that God was made man so that man might become God. It is heavily emphasized in Eastern Orthodox churches.\r\rGreek, θέωσις (theosis)\r\rFurther Reference:\rWikipedia, “Divinization”\rhttp://tinyurl.com/lxhcwgk\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Tradition",
                           @"twitterDef":@"the process of handing over beliefs, texts, and practices",
                           @"definition":@"\rThe Catholic Tradition encompasses the entire process of the transmission of Divine Revelation, including the composition of Sacred Scripture. Following the injunction of St. Paul to hold fast to the Apostolic traditions by word of mouth or letter (2 Thess. 2:15), the fathers of the Second Vatican Council taught that Tradition and Scripture form a single sacred deposit of Faith and that each should equally revered. See “Bible”, “Divine Revelation”. \r\rFurther Reference:\rVatican II, “Dei Verbum”, 9\rhttp://tinyurl.com/3ecxu\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Transcendence",
                           @"twitterDef":@"the quality or phenomenon of exceeding human experience",
                           @"definition":@"\rTranscendence is often contrasted with Immanence. In the Catholic Tradition, God is seen as both transcendent and immanent, ultimately in the Incarnation. See “Immanent”, “Incarnation”.\r\rFurther Reference:\rWikipedia, “Transcendence”\rhttp://tinyurl.com/47wzzm\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Transubstantiation",
                           @"twitterDef":@"the substance of bread and wine becoming that of the body and blood of Christ",
                           @"definition":@"\rIn the midst of a long tradition of attempts to explain how the Real Presence is possible, St. Thomas Aquinas, using Aristotelean metaphysics, taught that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist. His idea of Transubstantiation was recognized by the Council of Trent as being a “fitting” description of the change in the Eucharistic elements. See “Real Presence”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1376\rhttp://tinyurl.com/q6gyoc7\r\rRichard Cipolla\r“Selvaggi Revisted: Transubstantiation and Contemporary Science”, http://tinyurl.com/pl8hzgo\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Trinity",
                           @"twitterDef":@"the existence of God in three persons; Father, Son, and Holy Spirit",
                           @"definition":@"\rThe doctrine of the Trinity is the most important in the Hierarchy of Truths of the Catholic Faith. Like other doctrines, it developed over a period of 400 years, from the Apostolic Age to the Council of Constantinople in A.D. 381. Theophilus of Antioch is the first Christian writer to use the Greek term Τριάδος (Triados) in A.D. 170 and Tertullian is the first Christian writer to use the Latin term Trinitas circa A.D. 200. as well as the classical formulation which states that God is one in substance in three persons. Later Patristic thinkers would distinguish between different aspects of Trinitarian belief. According to the Catechism of the Catholic Church, par. 236:\r\r“The Fathers of the Church distinguish between theology (theologia) and economy (oikonomia). ‘Theology’ refers to the mystery of God's inmost life within the Blessed Trinity and ‘economy’ to all the works by which God reveals himself and communicates his life. Through the oikonomia the theologia is revealed to us; but conversely, the theologia illuminates the whole oikonomia. God's works reveal who he is in himself; the mystery of his inmost being enlightens our understanding of all his works. So it is, analogously, among human persons. A person discloses himself in his actions, and the better we know a person, the better we understand his actions.”\r\rLater Trinitarian questions included the nature of  Perichoresis, the Filioque, and the limits of human language. In his analysis of the use of the term “person” to describe the Trinity, Fr. Lawerence Porter states:\r\r“...the personal character of the Godhead is the result of a complexity of self-relatedness within the one eternal being that is God. And since each of these relations in the Godhead is seen as thus having the fullest expression of personal character, we use the metaphorical language of person to indicate this. Thus Father, Son, and Holy Spirit is each a distinct personal relation, the 'other' in a relation of personal being, though none is in itself a separate consciousness. If today this language of persons in the Trinity entails more than ever the scandalous risk of implying a real self-consciousness too, the risk is still worth it.”\r-Porter, 547\r\rSee “Filioque”, “Perichoresis”, “Mystery”.\r\rFurther Reference:\r\rCatechism of the Catholic Church, 232-260\rhttp://tinyurl.com/4tymjt\r\rRev. Lawerence Porter\r“On Keeping Persons in the Trinity: A Linguistic Approach to Trinitarian Thought”\rhttp://tinyurl.com/q3e7ddl\r\rWikipedia, “Trinity”\rhttp://tinyurl.com/lbxfb\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Tabernacle",
                           @"twitterDef":@"the pre-Solomonic temporary dwelling place of Yahweh in Israel",
                           @"definition":@"\rThe Tabernacle was initially housed at Shiloh. It is described in detail in the Priestly Source texts of Exodus 25-30 and the Elohist Source text of Exodus 33. It is never mentioned by the Yahwist or Deuteronomic Sources. Richard Elliot Freidman claims that the Tabernacle was housed in the Temple.\r\rFurther Reference:\rWikipedia, “Tabernacle”\rhttp://tinyurl.com/gwcu2\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Tanak",
                           @"twitterDef":@"the Hebrew Bible",
                           @"definition":@"\rThe Hebrew Bible, or “Tanak”, consists of 39 books grouped into three sections:\r\r-Torah\r-Nevi'im\r-Ketuv'im\r\rThe Tanak is the foundation of the Old Testament. “Tanak” is an acronymic term: T = Torah, N = Nevi'im, K = Ketuv'im, with the addition of vowels. See “Torah”, “Nevi'im”, “Ketuv'im”.\r\rFurther Reference:\rInternational Theological Commission\r“The Jewish People and their Sacred Scriptures in the Christian Bible”, http://tinyurl.com/mt3e\r\rWikipedia, “Tanak”\rhttp://tinyurl.com/2vxgml\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Tax Collectors",
                           @"twitterDef":@"local residents who collected provincial taxes for the Roman Empire",
                           @"definition":@"\rTax Collectors are frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. As Jews in the service of Rome, hey were reviled as traitors, likely cheats, and sinners. Jesus includes one such person (Levi/Matthew) in his inner circle of disciples.\r\rFurther Reference:\rWikipedia, “Publican”\rhttp://tinyurl.com/m637gxw\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Temple",
                           @"twitterDef":@"the permanent dwelling place of Yahweh in Israel",
                           @"definition":@"\rAccording to the Priestly and Deuteronomic Sources, Yahweh told King David that his son would build a house for His Name to dwell in forever. 1 Kings 6, details the construction of the Temple. It was destroyed in 586 B.C. by the Babylonians and rebuilt in 515 B.C. after the return from Exile. Herod the Great rennovated the Temple at the beginning of the 1st century A.D., and it was destroyed by the Roman army under Titus in A.D. 70. The New Testament uses Temple imagery and metaphors in describing the experience of the Holy Spirit in the Church.\r\rFurther Reference:\rWikipedia, “Temple in Jerusalem”\rhttp://tinyurl.com/ja9hh\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Tetragrammaton",
                           @"twitterDef":@"a Greek word meaning “four letters” referring to the four-letter name of God",
                           @"definition":@"\rThe Tetragrammaton is rendered in English bibles as “LORD”. See “Yahweh”.\r\rGreek, τετραγράμματον (tetragrammaton)\r\rFurther Reference:\rWikipedia, “Tetragrammaton”\rhttp://tinyurl.com/7u37s\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Textual Criticism",
                           @"twitterDef":@"the analysis of the original language of a text",
                           @"definition":@"\rTextual criticism is the first exegetical analysis in using the Historical-Critical Method to interpret a text. It consists of three steps: Eclecticism (collation of diverse copies of a particular tradition), Stemmatics (analysis of related errors), and Copy-Text Editing (correction of errors in the base text). Textual critics dicipher the original language of the biblical text as it appears in Manuscripts and Papyrus fragments. See “Historical-Critical Method”, “Manuscript”. See “Codex Sinaiticus” in the Reference tab.\r\rFurther Reference:\rPontifical Biblical Commission\r“The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/ymsltv\r\rRev. Joseph Fitzmeyer\r“Historical Criticism: Its Role in Biblical Interpretation and Church Life”, 249. http://tinyurl.com/p7488ev\r\rWikipedia, “Textual Criticism”\rhttp://tinyurl.com/2g7ol8\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Theophany",
                           @"twitterDef":@"an appearance of God to a human being in which Divine communication occurs",
                           @"definition":@"\rNumerous theophanies are recorded throughout the Bible with the account of Moses and the Burning Bush in Exodus 3 becoming paradigmatic as a literary form. The New Testament considers the Incarnation to be the ultimate Theophany. Early Christian writers, such as St. Justin Martyr, will interpret the Angel of the LORD, described in the Burning Bush story, to be a Theophany of the pre-Incarnate Christ.\r\rFurther Reference:\rWikipedia, “Theophany”\rhttp://tinyurl.com/yt4guu\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Torah",
                           @"twitterDef":@"the Hebrew word meaning “instruction” or “law”",
                           @"definition":@"\rThe Torah is the first section of the Tanak and composed of five books; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy. It is the foundation of the Hebrew Bible. In the Gospels, Jesus quotes from the Torah more than any other section of the Tanakh. See “Second Temple Judaism”, “Tanak”.\r\rFurther Reference:\rNew American Bible Revised Edition\r“Pentateuch”, http://tinyurl.com/qbuoudr\r\rRev. M.B. Fallon, “Torah”\rhttp://tinyurl.com/o9ughyw\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Triduum",
                           @"twitterDef":@"the three days beginning on Maundy Thursday evening and concluding at Easter Sunday evening",
                           @"definition":@"\rThe Triduum is marked with the biblical custom of beginning the day at sundown.\r\rFurther Reference:\rWikipedia, “Paschal Triduum”\rhttp://tinyurl.com/cmy9hmg\r\r\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Two-Source Hypothesis",
                           @"twitterDef":@"the theory that Mark and Q were the main sources for Matthew and Luke",
                           @"definition":@"\rThe Two-Source Hypothesis is the most widely accepted theory of gospel composition due to its ability to explain most of the literary features found in the Synoptic Gospels. See “Synoptic Gospels”, “Q Source”.\r\rFurther Reference:\rWikipedia, “Two-Source Hypothesis”\rhttp://tinyurl.com/uj4a9\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Typology",
                           @"twitterDef":@"interpreting the Old Testament through a Christological paradigm",
                           @"definition":@"\rTypology interprets the Old Testament through a series of “types” that correspond to various aspects of the life of Christ. This practice has its roots in the Bible itself. St. Paul claims that rock from which the Israelites drank water was Christ. Origen of Alexandria was the most erudite Church Father to make use of Typology in his homilies, the earliest which survive.\r\rFurther Reference:\rCatechism of the Catholic Church, 130\rhttp://tinyurl.com/kvc3tvq\r\rWikipedia, “Typology”\rhttp://tinyurl.com/kl5rr6c\r\r\r",
                           @"category":@"Biblical"}];
    

    ////////////////////////////////////U
    
    
    
    [TAWord wordWithDict:@{@"name":@"Universal Destination of Goods",
                           @"twitterDef":@"the idea that the goods of the earth are intended to be justly distributed",
                           @"definition":@"\rThe Universal Destination of Goods has its roots in the Patristic interpretation of Scripture. According to the consent of the Fathers, the will of the Creator is that the gifts of Creation should be justly distributed among humankind.\r\rFurther Reference:\rThe Compendium of the Social Doctrine of the Church, 171, http://tinyurl.com/m42jykm\r\r\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Universalism",
                           @"twitterDef":@"the belief that all of humanity will ultimately be saved",
                           @"definition":@"\rUniversalism has its roots in Patristic thought. Origen of Alexandria and St. Gregory of Nyssa are two prominent Church Fathers who believed that biblical references to Divine punishment must ultimately be aimed at rehabilitation. See “Apocatastasis”.\r\rFurther Reference:\rRev. John Sachs\r“Current Eschatology: Universal Salvation and the Problem of Hell”, http://tinyurl.com/oqfxwo8\r\r\r",
                           @"category":@"Systematic"}];
    
    //V
    
    [TAWord wordWithDict:@{@"name":@"Virginal Conception",
                           @"twitterDef":@"the belief that Jesus of Nazareth was conceived by the Holy Spirit",
                           @"definition":@"\rBoth the gospels of Matthew and Luke claim that Jesus was concieved by a virgin mother. Later tradition would develop the idea of Mary's perpetual viriginity although this idea was not univerally accepted. Virginal Conception is differentiated from the idea of Virgin Birth. The former is explicitly stated in Scripture, while the latter refers to the Patristic interpretation of Mary's virginity before, during, and after the birth of Christ; virginitas ante partum, virginitas in partu, virginitas post partum. Both senses, however, are part of the larger Catholic Tradition. See “Incarnation”.\r\rFurther Reference:\rCatechism of the Catholic Church, 484\rhttp://tinyurl.com/3w9q9aw\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Vocation",
                           @"twitterDef":@"the calling to a particular lifestyle of Christian holiness",
                           @"definition":@"\rAccording to the bishops of the Second Vatican Council, every baptized Christian is called to holiness, regardless of in which particular state he or she lives; married, single, or ordained. The vocation to holiness is rooted in the Sacrament of Baptism which precedes both Marriage and Holy Orders. Thus, all the Baptized are called to share in the same degree of holiness. See “Baptism”, “Holy”.\r\rFurther Reference:\rVatican II, “Lumen Gentium”, 11\rhttp://tinyurl.com/3wxff\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Vulgate",
                           @"twitterDef":@"the Latin translation of the Bible",
                           @"definition":@"\rThe Vulgate was initially translated by St. Jerome. It was adopted as the official bible of the Roman Catholic Church at the Council of Trent. See “Trent” in the Historical section of the Maps tab. See “Bible”.\r\rFurther Reference:\rWikipedia, “Vulgate”\rhttp://tinyurl.com/ywebum\r\r\r",
                           @"category":@"Biblical"}];
    
    
    
    
    /////////////////////////////////////////////////////////////////W
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Wisdom Books",
                           @"twitterDef":@"the fourth of five sections in the\rOld Testament",
                           @"definition":@"\rThe section of Wisdom Books consist mainly of various writings that offer moral instruction in the form of axioms and parallelisms. It contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach. They all fall into a similar genre, commonly referred to as “wisdom literature”. See “Genre”, “Form Criticism”. See the Scripture section in the Overview tab.\r\rFurther Reference:\rNew American Bible Revised Edition\r“Wisdom Books”, http://tinyurl.com/oz6lzoz\r\r\r",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Word of God",
                           @"twitterDef":@"the saving message of God in which humans trust for salvation",
                           @"definition":@"\rThe Word of God is a result of God's self-revelation. In the Old Testament, this often is often described as a Theophany. In the New Testament, Incarnation of the Logos is viewed as the ultimate disclosure of the Divine Word. See “Incarnation”, “Logos”, “Divine Revelation”.\r\rFurther Reference:\rVatican II, “Dei Verbum”\rhttp://tinyurl.com/3ecxu\r\r\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Will of God",
                           @"twitterDef":@"the ultimate desire of God for creation",
                           @"definition":@"\rGod's will is spoken of a mystery by St. Paul, who also claims that it has been revealed to the Church in Christ. Jesus is portrayed in the New Testament as the new Adam who perfectly fulfills the will of his Father. In prayer, Christians seek the discernment and accomplishment of God's will. One of the petitions of Lord's Prayer is that the will of the Father may be done “on earth as it is in heaven”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2822-2827\rhttp://tinyurl.com/o7fztj6\r\r\r",
                           @"category":@"Systematic"}];
    
    
    
    
    
    //////////////////////////////////////////////////////////////////////////////X
    
    [TAWord wordWithDict:@{@"name":@"Xenophobia",
                           @"twitterDef":@"the fear of foreigners",
                           @"definition":@"\rThe ministry of Jesus can be seen, partly, as a movement against the xenophobic nationalism of the religious elite in Second Temple Judaism. See “Jesus of Nazareth”, “Second Temple Judaism”.\r\rFurther Reference:\rWikipedia, “Xenophobia”\rhttp://tinyurl.com/q3l46\r\r\r",
                           @"category":@"Biblical"}];
    
    
    
    ////////////////////////////////////////////////////////////////////////////////Y
    
    [TAWord wordWithDict:@{@"name":@"Yahwist Source",
                           @"twitterDef":@"the literary source (J) in the Torah that uses the Divine Name before Exodus 3",
                           @"definition":@"\rAccording to the Documentary Hypothesis, the Yahwist Source (also called “J” due to its German origin) is the earliest of the four written sources that comprise most of the Torah. In contrast to the other sources of the Documentary Hypothesis, the Yahwist Source is highly anthroporphic and knows the Tetragrammaton before Exodus 3. It, along with the Elohist Source, were likely combined to form a single narrative (the JE Epic) to which the Priestly author added his own material in addition to Deuteronomy and the Deuteronomic History. See “Documentary Hypothesis”, “Deuteronomic History”, “Elohist Source”, “JE Epic”, “Tetragrammaton”\r\rFurther Reference:\rWikipedia, “Yahwist Source”\rhttp://tinyurl.com/ye7axpa\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Yahweh",
                           @"twitterDef":@"the personal name of the God of the Israelites",
                           @"definition":@"\rThe four letter personal name of the God of the Israelites, also called the “Tetragrammaton”. According to the Elohist and Priestly sources, this name was not known before it was revealed to Moses in Exodus chapter 3. The Yahwhist Source, however, knows of it and uses it throughout Genesis as the personal name of God, which is one argument for multiple authorship of the Torah; the essence of the Documentary Hypothesis. See “Tetragrammaton”, “Documentary Hypothesis”.\r\rHebrew, יְהוָ֨ה (YHWH) “yahwéh”\r\rFurther Reference:\rDavid Cunningham\r“On Translating the Divine Name”\rhttp://tinyurl.com/oaz69p5\r\rWikipedia, “Yahweh”\rhttp://tinyurl.com/y4vmqc\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Yom Kippur",
                           @"twitterDef":@"a Hebrew phrase meaning “Day of Atonement”",
                           @"definition":@"\rAccording to Leviticus 16, Yom Kippur is a day set aside on the Jewish calendar dedicated to bringing about personal and national reconciliation with Yahweh through the forgiveness of sins. See “Forgiveness”.\r\rFurther Reference:\rWikipedia, “Yom Kippur”\rhttp://tinyurl.com/ja2uz\r\r\r",
                           @"category":@"Biblical"}];
    
    
    
    
    ///////////////////////////////////////////////////////////////////////////////Z
    
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Zealots",
                           @"twitterDef":@"a Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces",
                           @"definition":@"\rA Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces. Jesus is portrayed as having at least one Zealot, Simon, among his Apostles. See “Apostle”.\r\rFurther Reference:\rWikipedia, “Zealots”\rhttp://tinyurl.com/p96dtu6\r\r\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Zion",
                           @"twitterDef":@"a synonym for the Temple Mount in Jerusalem or for the city of Jerusalem itself",
                           @"definition":@"\rZion is referred to numerous times in the Psalms as being representative for the nation of Israel. See “Israel”.\r\rFurther Reference:\rWikipedia, “Zion”\rhttp://tinyurl.com/27zh84\r\r\r",
                           @"category":@"Biblical"}];
    
    [[TADataStore sharedStore] saveContext];
}

@end
