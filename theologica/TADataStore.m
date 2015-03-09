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
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Anawim",
                           @"twitterDef":@"the Hebrew word meaning\r“the oppressed”",
                           @"definition":@"\rThis term is used in the Hebrew Bible to refer to those who are poor, destitue, and marginalized who trust completely in the mercy of God (Is. 10:2, Zeph 2:3); frequently used in the Psalms.\r\rHebrew, עֲנָוִים (anawim)\r\rFurther Reference:\rPope John Paul II, General Audience, 5/23/2001 http://tinyurl.com/lyfphvo",
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
                           @"twitterDef":@"the revelation of something hidden;\rthe last book of the New Testament",
                           @"definition":@"\rPaul uses this word to refer to his experience of the risen Jesus. The Apocalypse (or Revelation) of John describes a vision of Jesus Christ about the end of the word, previously hidden from the Church's knowledge.\r\rGreek, ἀποκάλυψις (apokalypsis) “unveiling”\r\rFurther Reference:\rCatechism of the Catholic Church, 120\rhttp://tinyurl.com/kvc3tvq",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apocrypha",
                           @"twitterDef":@"the 7 books excluded from\rthe Protestant Bible",
                           @"definition":@"\rApocrypha is the Protestant term for the 7 Old Testament books not found in the Protestant canon; Baruch, Judith, 1st and 2nd Maccabees, Sirach, Tobit, Wisdom. See “Canon”, “Old Testament”.\r\rGreek, ἀπόκρυφος (apokryphos) “hidden”\r\rFurther Reference:\rWikipedia, “Apocrypha”\rhttp://tinyurl.com/bddlr",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Apodictic Law",
                           @"twitterDef":@"a type of law based on universal norms",
                           @"definition":@"\rApodictic law is that such as found in the 10 Commandments;universally binding at all times and places. It is contrasted with casuistic law. See Exodus 20, “Decalogue”, “Casusitic Law”.\r\rFurther Reference:\rWikipedia, “Apodicticity”\rhttp://tinyurl.com/k7u8mkr",
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
    
    [TAWord wordWithDict:@{@"name":@"Ash Wednesday",
                           @"twitterDef":@"a day of abstinence and beginning of Lent\robserved with the distribution of ashes",
                           @"definition":@"\rAsh Wednesday is named as such because during the Mass, ashes are distributed with the reminder: “Remember you are dust. Repent and believe the Gospel”. See “Lent”.\r\rFurther Reference:\rWikipedia, “Ash Wednesday”\rhttp://tinyurl.com/t73jm",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Assyria",
                           @"twitterDef":@"the empire that conquered the northern kingdom of Israel in 722 B.C.",
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
                           @"twitterDef":@"sexual relations with\ranother person's spouse",
                           @"definition":@"\rAdultery is prohibited by the sixth Commandment of the Decalogue. In Matthew 5:28, Jesus teaches that one should even avoid those actions that ultimately lead to adultery. See “Decalogue”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2380\rhttp://tinyurl.com/cz1w ",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Absolution",
                           @"twitterDef":@"the declaration that sins are forgiven",
                           @"definition":@"\rThe act by which a priest declares the forgiveness of sins. General absolution is not considered a Sacrament like that which is given in the Sacrament of Reconciliation.\r\rFurther Reference:\rCatechism of the Catholic Church, 1424\rhttp://tinyurl.com/l7xon9e",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Adoptionism",
                           @"twitterDef":@"the belief that Jesus was a mere man\radopted as God's Son at his baptism ",
                           @"definition":@"\rAdoptionism was held by the so-called Ebionites of the end of the first century, who denied the pre-existence and incarnation of the Son.\r\rFurther Reference:\rWikipedia, “Adoptionism”\rhttp://tinyurl.com/25fgze",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Accident",
                           @"twitterDef":@"a nonessential property of an object\rin Aristotelean metaphysics",
                           @"definition":@"\rThomas Aquinas used this concept from Aristotle to support his explanation of the Real Presence in the Eucharist, called “transubstantiation”. Thomas claimed the accidents of bread and wine remain after the substance of the elements change into the substance of the body and blood of Christ. See “Eucharist”, “Metaphysics”, “Real Presence”, “Transubstantiation”.\r\rFurther Reference:\rWikipedia, “Accident”\rhttp://tinyurl.com/88ojytv",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Asceticism",
                           @"twitterDef":@"the practice of self-discipline",
                           @"definition":@"\rThe practice of self-discipline for a higher purpose, often involving abstinence. See “Abstinence”.\r\rGreek, ἄσκησις (askesis) “training”\r\rFurther Reference:\rWikipedia, “Asceticism”\rhttp://tinyurl.com/29eqh2",
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
                           @"twitterDef":@"the coherence of the truths of faith\ramong themselves",
                           @"definition":@"\rThe Analogy of Faith is a phrase that occurs in Romans 12:6. It later becomes a way to refer to the consistency and interrelationship of Church teaching.\r\rGreek, ἀναλογία (analogia) “proportion”\r\rFurther Reference:\rCatechism of the Catholic Church, 114\rhttp://tinyurl.com/kvc3tvq",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Annointing of the Sick",
                           @"twitterDef":@"the Sacrament of Healing\rby anointing with oil",
                           @"definition":@"The sacrament of healing in which sacramental oil is applied to an infirm human body.\r\rFurther Reference:\rCatechism of the Catholic Church, 1499\rhttp://tinyurl.com/n3lyve9",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anthropocentrism",
                           @"twitterDef":@"centered on humanity",
                           @"definition":@"\rA method of theological enquiry from the starting point and within the horizon of the human experience. All theological claims are claims made by human beings in human language. Theology is relevant to human beings in so far as they concern human experience.\r\rFurther Reference:\rWikipedia, “Anthropocentrism”\rhttp://tinyurl.com/8hj52d",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apocatastasis",
                           @"twitterDef":@"the Greek word meaning\r“the restoration of all things”",
                           @"definition":@"\rThis term only occurs in the New Testament in Acts 3:21, wherein Peter refers to the state of creation in the Messianic Age. Later in the Patristic era, Origen and St. Gregory of Nyssa used it to the belief that, at the Eschaton, God will restore all creation back into full Divine communion. See “Eschatology”.\r\rGreek, ἀποκατάστασις (apocatastasis)\r\rFurther Reference:\rWikipedia, “Apocatastasis”\rhttp://tinyurl.com/n8txupj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apologetics",
                           @"twitterDef":@"the rational defense of the Christian faith",
                           @"definition":@"\rThe early Christians were compelled to defend authentic Christian faith and practice against false accusations and various suspicions. Notable ancient Apologies include that of Justin Martyr and Tertullian. Modern apologetics seeks to explain the rationality of Christian belief in a post-scientific age of critical methodologies used across various academic disciplines, including Theology itself.\r\rGreek, ἀπολογία (apologia) “defense”\r\rFurther Reference:\rWikipedia, “Apologetics”\rhttp://tinyurl.com/cxswly",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apophatic",
                           @"twitterDef":@"language that uses negation\rto describe God",
                           @"definition":@"\rApophatic language emphasizes the discontinuity of God with anything created. It was especially popular with the early Greek fathers.\r\rFurther Reference:\rWikipedia, “Apophatic Theology”\rhttp://tinyurl.com/22pm86z",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Apostolic",
                           @"twitterDef":@"the quality of the Church as being based on the Apostolic tradition",
                           @"definition":@"\rOne of the four marks of the Church - One, Holy, Catholic, Apostolic.\r\rFurther Reference:\rCatechism of the Catholic Church, 857\rhttp://tinyurl.com/oupb5",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Assumption of Mary",
                           @"twitterDef":@"the dogma that the Virgin Mary was assumed into heaven",
                           @"definition":@"\rThe dogma, defined by Pope Pius XII in 1950 in the Apostolic Constitution, Munificentissimus Deus, is based on a tradition that Mary's tomb was found empty, which dates back to the 4th century.\r\rFurther Reference:\rCatechism of the Catholic Church, 966\rhttp://tinyurl.com/mtfzewa",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Atonement",
                           @"twitterDef":@"the act of making restitution\rfor inflicted harm",
                           @"definition":@"\rLiterally translated “at-one-ment”, mandated in requisite to forgiveness in the Priestly tradition of the Torah in Leviticus. Atonement became a dominant theological interpretation of the death of Jesus of Nazrareth in the early Church.\r\rFurther Reference:\rCatechism of the Catholic Church, 616\rhttp://tinyurl.com/p3dfabj",
                           @"category":@"Systematic"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Agnus Dei",
                           @"twitterDef":@"the invocation during the Fraction\rof the Eucharist that begins, “Lamb of God”",
                           @"definition":@"\rThe Agnus Dei is chanted 3 times before the distribution of the Eucharist.\r\r“Lamb of God, you who take away the sins of the world, have mercy upon us.\rLamb of God, you who take away the sins of the world, have mercy upon us.\rLamb of God, you who take away the sins of the world, grant us peace.”\r\rSee “Eucharist”, “Fraction”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Liturgy of the Eucharist”\rhttp://tinyurl.com/lleofmh",
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
                           @"twitterDef":@"the Hebrew word meaning\r“may it be so” or “truthfulness“",
                           @"definition":@"\rThe Amen is traditionally said after a prayer as a form of agreement. It derives from Jewish use in the synagogue and later in the New Testament where it is used to indicate the truthfulness of what is said; “Amen, I say to you...” is a sayings formula used throughout the Gospels used to emphasize one of Jesus' teachings.\r\rHebrew, אָמֵן (amen)\r\rFurther Reference:\rCatechism of the Catholic Church, 1061\rhttp://tinyurl.com/k3f2f8p\r\rFelix Just, S.J., “Amen Amen Sayings in the Fourth Gospel”\rhttp://tinyurl.com/k545gaq",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anamnesis",
                           @"twitterDef":@"the Greek word meaning\r“lived rememberance”",
                           @"definition":@"\rThe concept of anamnesis was first used by Plato as an epistemological explanation of how human beings have knowledge. The writers of the Synoptic Gospels use it the Passion Narrative during the Words of Institution, in which Jesus asks his disciples to “remember” him when they eat the bread and drink the cup. It is a performative act used to re-present the salvific death and resurrection of Jesus.  See “Passion Narrative”, “Real Presence”, “Synoptic Gospels”, “Words of Institution”.\r\rGreek, ἀνάμνησις (anamnesis)\r\rFurther Reference:\rCatechism of the Catholic Church, 1103\rhttp://tinyurl.com/oqbzkx3",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anaphora",
                           @"twitterDef":@"the offering of the Eucharistic Prayer\rin structured sequences",
                           @"definition":@"\rThe Eucharistic prayer of the Mass was celebrated in structured sequences as early as possibly the first century (in the Didache) and certainly by third century, in the Apostolic Tradtion of Hippolytus of Rome. The term is based on the Septuagint reading of Leviticus 2:14 and other passages, in which the Israelite priest offers up the sacrifice.\r\rGreek, ἀναφορά (anaphora) “to lift up”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1352\rhttp://tinyurl.com/m88dbjl",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Anathema",
                           @"twitterDef":@"the Greek word meaning “placed off limits”;\rthe state of being excommunicated",
                           @"definition":@"\rOver time, Anathema came to refer to those who were accursed or banished from the community.\r\rGreek, ἀνάθεμα (anathema)\r\rFurther Reference:\rNew Advent, “Anathema”\rhttp://tinyurl.com/o5fl88l",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Angel",
                           @"twitterDef":@"a spiritual being that communicates\rDivine messages",
                           @"definition":@"\rAngels are found througout the Scriptures, and their existence is affirmed by the Church as a truth of the faith. Post-Exilic Judaism developed a Jesus alludes to the idea that some angels have been assigned responsibility for the care of specific individuals. The Bible mentions different classes of angels, with Cherubim being the highest.\r\rGreek, ἄγγελος (angelos) “messenger”\r\rFurther Reference:\r327",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Annulment",
                           @"twitterDef":@"an ecclesial declaration that a valid marriage never existed",
                           @"definition":@"\rAnnulments are not divorces in that they do not dissolve an existing marriage but rather recognize mitigating factors that invalidate a marriage, such as lack of consent or the withholding of critical information.\r\rFurther Reference:\rCatechism of the Catholic Church, 1629\rhttp://tinyurl.com/ykptlg",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Antiphon",
                           @"twitterDef":@"a form of singing or chanting\by alternating sets of voices",
                           @"definition":@"\rThe choral response sung during the entrace processional of Mass is antiphonal.\r\rFurther Reference:\rGeneral Instruction on the Liturgy of the Hours, III.II http://tinyurl.com/ku23eyw",
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
                           @"definition":@"\rA posteriori truth claims are those that are not self-evident, but depend upon empirical data. The statement “Water boils at 0 degrees Celsius” is an a posteriori truth.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“A Priori Justification and Knowledge”\rhttp://tinyurl.com/6tp7oyz",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"A Priori",
                           @"twitterDef":@"a philosophical category which precedes human experience",
                           @"definition":@"\rA priori truth claims are those that are self-evident, without requiring empirical data. The statement “All bachelors are unmarried' is an a priori truth.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy,\r“A Priori Justification and Knowledge”\rhttp://tinyurl.com/6tp7oyz",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Action",
                           @"twitterDef":@"direct or indirect nonviolent action\r taken to achieve justice",
                           @"definition":@"\rIn the context of social justice, both direct an indirect nonviolent action are appropriate responses to injustice.\r\rFurther Reference:\rPaul VI, “A Call To Action“, 48\rhttp://tinyurl.com/llup47a\r\rCompendium of the Social Doctrine of the Church, 419 http://tinyurl.com/qfo6bd7",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Agnostic",
                           @"twitterDef":@"the word used to describe uncertainty about the existence of God",
                           @"definition":@"\rAgnostics are sometimes mistakenly confused with atheists.\r\rFurther Reference:\rCatechism of the Catholic Church, 2127\rhttp://tinyurl.com/lu75a9k.",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Analysis",
                           @"twitterDef":@"the process of discerning appropriate steps to achieving justice",
                           @"definition":@"\rAnalysis is the second of the 3 steps in achieving justice. It begins with discernment of the partiuclar situation and how the princples of social justice would be prudently and appropriately applied.\r\rFurther Reference:\rPope Paul VI, A Call To Action, 48\rhttp://tinyurl.com/llup47a",
                           @"category":@"Cultural"}];
    
    /*
    [TAWord wordWithDict:@{@"name":@"Anthropology",
                           @"twitterDef":@"the science that studies human origins, development, and culture",
                           @"definition":@"\rThe science that studies human origins, development, and culture.\r\rFurther Reference:\rAmerican Anthropological Association\rhttp://tinyurl.com/28tcvt",
                           @"category":@"Cultural"}];
     */
    
    [TAWord wordWithDict:@{@"name":@"Anti-Semitism",
                           @"twitterDef":@"prejudice, hatred, or racial bias against Jewish persons",
                           @"definition":@"\rPrejudice, hatred, or racial bias against Jews. Some portions of the New Testament bear traces of anti-Semitism due to theological biases against the Jewish people for rejecting Christ. Thus, the Christian tradition has included anti-Semitic currents that have been rejected since the Second Vatican Council.\r\rFurther Reference:\rVatican II, “Nostra Aetate”\rhttp://tinyurl.com/k4dj",
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
                           @"twitterDef":@"the gathering of information\rabout a given injustice",
                           @"definition":@"\rAwareness is first step in acheiving social justice. Without awareness of conditions in society, no change can be affected.\r\rFurther Reference:\rPope Paul VI, “A Call To Action“, 48\rhttp://tinyurl.com/llup47a",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Acolyte",
                           @"twitterDef":@"a liturgical assistant to the\rcelebrant of Mass",
                           @"definition":@"\rAcolytes are mentioned as early as the 4th century. Until 1972, it was one of the minor orders, which Pope Paul VI renamed as “ministries”.\r\rFurther Reference:\rCatechism of the Catholic Church, 903\rhttp://tinyurl.com/m65ttaf",
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
                           @"twitterDef":@"the ultimate, direct, and immediate\r contemplation of God",
                           @"definition":@"\rAccording to the Gospel of Matthew, those who are pure of heart will see God.\r\rFurther Reference:\rCatechism of the Catholic Church, 1028\rhttp://tinyurl.com/k3f2f8p",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Beatitudes",
                           @"twitterDef":@"a series of sayings in Matthew that begin\rwith the word “Blessed”",
                           @"definition":@"\rThe Beatitudes are likely the most famous of Jesus' sayings from the Sermon on the Mount. They have been described as a compendium of Christian living.\r\rFurther Reference:\rCatechism of the Catholic Church, 1716\rhttp://tinyurl.com/nprr772",
                           @"category":@"Biblical"}];
    
    /*
    [TAWord wordWithDict:@{@"name":@"Baldachino",
                           @"twitterDef":@"a canopy use to cover a bishop's chair, the altar, or Eucharistic processions",
                           @"definition":@"\rBaldachinos are regularly seen in St. Peter's Square during open-air Masses.",
                           @"category":@"Liturgical"}];
     */

    [TAWord wordWithDict:@{@"name":@"Beneficence",
                           @"twitterDef":@"the first principle in medical ethics:\rdo no harm",
                           @"definition":@"\rThis idea is found in the Hippocratic Oath and is the basis of modern biomedical ethics, even if interpreted differently in various nations.\r\rFurther Reference:\rWikipedia, “Beneficence”\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Benediction",
                           @"twitterDef":@"a final blessing at the end of Mass",
                           @"definition":@"\rThe Benediction is a liturgical inheritance of the Church from Judaism. It concludes the Mass with a blessing and a sending forth in peace.\r\rFurther Reference:\rWikipedia, “Benediction”\rhttp://tinyurl.com/bvdxj54",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Benefit/Burden Ratio",
                           @"twitterDef":@"the ratio of benefits over the burdens of a particular medical treatment",
                           @"definition":@"\rThe Benefit/Burden Ratio is a variable in morality of certain medical procedures. It's use extends outside theology to the broader study of ethics.\r\rFurther Reference:\rNational Catholic Bioethics Center, “A Catholic Guide to End-Of-Life Decisions”\rhttp://tinyurl.com/nmko5uq",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Bioethics",
                           @"twitterDef":@"the study of ethics related to\rmedical and life issues",
                           @"definition":@"\rBioethics has become a specialization in the field of ethics due, in part, to the tremendous technological advances that enable new forms of treatment but that also raise new ethical questions in the practice of medicine.\r\rFurther Reference:\rAmerican Bioethics Advisory Commission, “What is Bioethics?”\rhttp://tinyurl.com/k8sppee",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Baptism",
                           @"twitterDef":@"the Sacrament of Initiation into the Church\rby ritual cleansing with water",
                           @"definition":@"\rBaptism is a practice which Christianity inherited from the Jewish practice of the Mikvah, or ceremonial washing in Second Temple Period. John the Baptist practiced a derivation of this in his ministry, of which Jesus of Nazareth was a follower for some period of time. According to the book of Acts, John's baptism was still being practiced concurrently with Christian baptism.\r\rBaptism, along with Eucharist, is a Christian practice dating back to the earliest days of the Church. According to the consistent tradition of the Church, Baptism removes the stain of Original Sin, forgives actual sins, and brings about a spiritual rebirth. See “Forgiveness of Sins”, “Original Sin”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1213\rhttp://tinyurl.com/ykqqof",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Blasphemy",
                           @"twitterDef":@"a form of religious slander\rthat reverses good and evil",
                           @"definition":@"\rBlasphemy is regarded as a sin that removes the possibility of forgiveness when directed against the Holy Spirit.\r\rGreek, βλασφημία (blasphemia) “injurous speech”\r\rFurther Reference:\rCatechism of the Catholic Church, 2148\rhttp://tinyurl.com/bczm8h7",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessing",
                           @"twitterDef":@"a pronouncement of Divine favor",
                           @"definition":@"\rThe concept of blessing has its origins in the Old Testament.\r\rHebrew, בְּרָכָה (berakah) “blessing”\r\rFurther Reference:\rCatechism of the Catholic Church, 2626\rhttp://tinyurl.com/jwoavzg",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Baptistry",
                           @"twitterDef":@"the place within a church used for baptism,\rusually referred to as a “font”",
                           @"definition":@"\rBaptistries are a later development in the Christian tradition. They are connected to the growth of the Church in the late 2nd and early 3rd centuries. See “Baptism”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1185\rhttp://tinyurl.com/p9382z5",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Basilica",
                           @"twitterDef":@"a church with a distinctive architecture\ror honorific status",
                           @"definition":@"\rThe Church inherited basilicas from the Roman Imperial administrative system. These buildings were essentially courthouses in which Roman administrators would hear cases. Such buildings were rectangluar in shape, with a circular apse enclosing one end of the nave. Later, the term came to be reservered for churches given special status by the Pope. Such basilicas are classified as either major or minor.\r\rGreek, βασιλικὴ στοά (basilike stoa) “royal chamber”\r\rFurther Reference:\rWikipedia, “Basilica”\rhttp://tinyurl.com/22rkeso",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Benedictus",
                           @"twitterDef":@"the Canticle of Zechariah contained within the Gospel of Luke 1:68-79",
                           @"definition":@"\rThis song is recorded as the extemporaneous prayer of Zechariah on the occassion of the birth of his son, John the Baptist. The Benedictus is a part of Morning Prayer in the Liturgy of the Hours. See “Liturgy of the Hours”.\r\rFurther Reference:\rWikipedia, “Benedictus”\rhttp://tinyurl.com/nvdk23a",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Bishop",
                           @"twitterDef":@"a successor to the Apostles who oversees a particular diocese",
                           @"definition":@"\rThe office of Bishop is the third order of clerics in the Catholic tradition. In the New Testament, Paul speaks of bishops in the church at Philippi together with deacons. In the second century there seems to have been a further development of the office. Local presbyters elected one of their own to a leadership position. This is reflected in the letters of Ignatius of Antioch (ca. A.D. 110). This form of having one bishop presiding over a local church, (known as “monoepiscopacy”) became the norm in every church by the end of the third century.\r\rBishops were later attached to larger areas of churches known as dioceses, which were Roman Imperial adminstrative distrcts set up by the Emperor Diocletian. After the legalization of Christianity, the Church inherited these districts in its own administration. See “Monoepiscopacy”.\r\rGreek, ἐπίσκοπος (episcopos) “overseer”\r\rFurther Reference:\rCatechism of the Catholic Church\rhttp://tinyurl.com/m65ttaf",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ba'al",
                           @"twitterDef":@"the son of El and most active of the gods in Canannite mythology",
                           @"definition":@"\rBa'al is a Semitic word for “Ruler”, “Husband”, or “Lord”. It became synonymous with a very popular Canaanite deity who was worshipped by ancient Israelites. According to to 2 Kings 23:4 an image of Ba'al was housed in the Temple before Josiah's Deuternomic reform.\r\rFurther Reference:\rWikipedia, “Ba'al”\rhttp://tinyurl.com/ljhlb",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Babel",
                           @"twitterDef":@"the Hebrew word meaning “confusion”;\rthe name of the tower in Genesis 11:1-9",
                           @"definition":@"\rAs an etiology, this story explains both how human language became divided as well as the geographic distribution of human populations.\r\rHebrew, בָּבֶל (babel)\r\rFurther Reference:\rCatechism of the Catholic Church, 57\rhttp://tinyurl.com/k6ljesq",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Babylon",
                           @"twitterDef":@"the empire that conquered the southern kingdom of Judah in 587 B.C.",
                           @"definition":@"\rThe Babylonians destroyed the Temple and took most of the residents of Jerusalem captive to Babylon, where they remained for 50 years.\r\rFurther Reference:\rWikipedia, “Babylon” \rhttp://tinyurl.com/q7fujw5",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ban",
                           @"twitterDef":@"the ancient Israelite practice of destroying possessions dedicated to YHWH",
                           @"definition":@"\rWhen victorious over its enemies, Israel was to place certain possessions, including people, under the Ban and completely destroy them in order to devote them anew to YHWH. Such is the case in Joshua 6 and 1 Samuel 15, which explicity command the death of women and children. See “YHWH”.\r\rHebrew, חֶרֶם (herem) “cursed”\r\rFurther Reference:\rWikipedia, “Ban”\rhttp://tinyurl.com/p7phypo",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Big Bang Theory",
                           @"twitterDef":@"the theory that the Universe expanded\rfrom an infinite singularity",
                           @"definition":@"\rThe cosmological theory, first developed by Fr. George Lemaitre, that claims that the Universe began at an infintely small and dense point of matter, energy, space, and time which then expanded over the course of time to become the observable cosmos we see today. See “Creation”.\r\rFurther Reference:\rWikipedia, “Big Bang”\rhttp://tinyurl.com/9nq4k",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessed Sacrament",
                           @"twitterDef":@"a reference to the Eucharist as Christ's\rbody and blood, soul and divinity",
                           @"definition":@"\rThe Blessed Sacrament is a term most often associated with Eucharistic Adoration. See “Eucharist”.\r\rFurther Reference:\rCatechism of Catholic Church, 1374\rhttp://tinyurl.com/q6gyoc7",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Buddhism",
                           @"twitterDef":@"the philosophy and religion based on the teachings of Siddartha Gotama",
                           @"definition":@"\rBuddhism is based on the teachings after Siddartha's claim to enlightenmnet, (ca. 500 B.C.). He taught the Four Noble Truths:\r\r1. Life is Suffering.\r2. Attachement is the root of suffering.\r3. Suffering can be overcome.\r4. The Eightfold Path.\r\rBuddhism has had increasing contact with Christianity over the last 100 years. Perhaps the most famous point of intersection was between the Trappist monk, Thomas Merton and the Dalai Lama in 1968. Buddhism claims to be offer a lifestyle that can be adapted to anu religion, although this is contested due to some of its claims.\r\rFurther Reference:\rBuddhnet, “Basic Buddhism”\rhttp://tinyurl.com/69cl",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Byzantine Rite",
                           @"twitterDef":@"the liturgical rite of\rEastern Orthodox and Catholic Churches",
                           @"definition":@"\rThe Byzantine Rite can be traced back as early as the 3rd century in Constantinople. Two of the more popular liturgies are the Liturgy of St. John Chrysostom and St. Basil the Great.\r\rFurther Reference:\rCatechism of the Catholic Church, 1203\rhttp://tinyurl.com/ndllues",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Breaking of the Bread",
                           @"twitterDef":@"a biblical phrase used to\rdescribe the Agape-Eucharist meal",
                           @"definition":@"\rThis phrase first occurs in the Acts 2:46 as part of a description of the daily lives of the first Christians.\r\rFurther Reference:\rCatechism of Catholic Church, 1329\rhttp://tinyurl.com/q6gyoc7",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Blessed Virgin Mary",
                           @"twitterDef":@"a liturgical title of the Virgin Mary",
                           @"definition":@"\rThe title Blessed Virgin Mary is based, in part, on the prediction of Mary in the Gospel of Luke 1:46: “From now on, all generations will call me blessed”.\r\rFurther Reference:\rCatechism of the Catholic Church, 971\rhttp://tinyurl.com/mtfzewa",
                           @"category":@"Systematic"}];
    
    /*
     Word *bathshebaWord = 
     bathshebaWord.@"name":@"Bathsheba";
     bathshebaWord.@"definition":@"Widow of Uriah after David orchestrated his assasination in battle; afterwards, David's favored wife and mother of Solomon";
     */
    
    [TAWord wordWithDict:@{@"name":@"Bible",
                           @"twitterDef":@"the collection of the\rOld and New Testaments",
                           @"definition":@"\rThe collection of the Old and New Testaments regarded as canonical and inspired within Catholicism. Historically, the Catholic canon of Scripture has included the Deuterocanonical books while Protestant bibles have excluded them. The Bible is a primary source for Theology. See ”Sacred Scripture” in the Overview tab.\r\rGreek, βιβλία (biblia) “scrolls”\r\rFurther Reference:\rWikipedia, “Catholic Bible”\rhttp://tinyurl.com/lkugd",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Breviary",
                           @"twitterDef":@"a book of the Liturgy of the Hours",
                           @"definition":@"\rBreviaries are books that contain the prayers and readings of the Divine Office. See “Liturgy of the Hours”.\r\rFurther Reference:\rWikipedia, “Breviary”\rhttp://tinyurl.com/yj4ycnd",
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
                           @"definition":@"\rCatechumens have been recognized as a distinct group since the earliest days of the Church.\r\rGreek, κατηχούμενος (katechoumenos) “one who hears”\r\rFurther Reference:\rWikipedia, “Catechumen”\rhttp://tinyurl.com/lqhsomc",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Candidates",
                           @"twitterDef":@"Non-Catholics who have received Baptism\rin preparation for Confirmation and Eucharist",
                           @"definition":@"\rCandidates are generally composed of the baptized who convert to Catholicism from another Christian tradition.\r\rFurther Reference:\rUnited States Confernce of Catholic Bishops, “Rite of Christian Initiation of Adults” http://tinyurl.com/mb2cv93",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cantor",
                           @"twitterDef":@"the leader of liturgical singing",
                           @"definition":@"\rCantors are an inheritance of the Church from Judaism. In conjuction with the Choir, they are responsible for leading the congregation in the singing of various responses in the Liturgy.\r\rFurther Reference:\rWikipedia, “Cantor”\rhttp://tinyurl.com/odpa6w8",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cardinal Virtues",
                           @"twitterDef":@"justice, prudence, temperance, and fortitude",
                           @"definition":@"\rThe four Cardinal Virtues are first mentioned by Plato in the Republic, Book IV as being necessary to cultural flourishing. According to the teaching of the Church, the Cardinal Virtues are rooted in the Theological Virtues of faith, hope, and love. See “Theological Virtues”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1804-1809 http://tinyurl.com/pd2yc32.",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Catechism",
                           @"twitterDef":@"a systematized summary of Catholic\rteaching regarding faith and morals",
                           @"definition":@"\rPope Paul VI called for a new Catechism to be produced from various local catechisms throughout the 20th century. The result, published under John Paul II in 1992 and revised in 1994, was the Catechism of the Catholic Church.\r\rFurther Reference:\rThe Catechism of the Catholic Church, 18\rhttp://tinyurl.com/nxgcz89",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Catechist",
                           @"twitterDef":@"a certified teacher of the Faith",
                           @"definition":@"\rCatechist are usually those who teach in religious education programs, but the title applies especially to Bishops, whose function it is to teach the Faith.\r\rFurther Reference:\rCongregation for the Clergy, “General Directory on Catechesis”\rhttp://tinyurl.com/tgju",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Catechesis",
                           @"twitterDef":@"a basic education in the Faith\rin a systematized and organic manner",
                           @"definition":@"\rCatechesis is based on the idea of handing down beliefs and practices to others by word of mouth. It is essential to mature Christian spirituality. In the Catholic tradition, it normally begins with children in preparation for Confirmation. The catechesis for adults is called the Rite of Christian Initiation of Adults. See “Confirmation”, “RCIA”.\r\rGreek, κατήχησις (katechesis) “instruction by word of mouth”\r\rFurther Reference:\rCatechism of the Catholic Church, 18\rhttp://tinyurl.com/nxgcz89",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Censer",
                           @"twitterDef":@"a vessel used for burning incense",
                           @"definition":@"Censers are not unique to Catholicism, but rather are used throughout every major, global religious tradition. In Catholicism, they hold the burning incense which symbolizes the prayers of the congregation ascending to God; also called a “Thurible”.\r\rFurther Reference:\rWikipedia, “Censer”\rhttp://tinyurl.com/p4c7brx",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Casuistic Law",
                           @"twitterDef":@"a type of law derived from individual cases rather than universal norms",
                           @"definition":@"\rCasuistic law is contrasted with apodictic law. The latter is exemplified by the 10 Commandments, while the former is found in the Covenant Code of Exodus 21-23. See “Apodictic Law”.\r\rFurther Reference:\rWikipedia, “Casuistry”\rhttp://tinyurl.com/2pntmh",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cappadocian Fathers",
                           @"twitterDef":@"Basil the Great, Gregory of Nyssa,\rand Gregory of Nazianzus",
                           @"definition":@"\rThese three fathers occupy a special place in the Eastern Orthodox tradition. They were influential in converting many Arians to orthdox belief.\r\rFurther Reference:\rWikipedia, “Cappadocian Fathers”\rhttp://tinyurl.com/zn8yn",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Catholic Social Teaching",
                           @"twitterDef":@"the teaching of the Church which applies the\rprinciples of justice to society",
                           @"definition":@"\rAccording to Pope Paul VI's encyclical, “Populorum Progressio”, Catholic Social Teaching is essential to authentic evangelization. It consists of principles of reflection, criteria of judgment, and directives for action. See “Social Justice”, “Signs of the Times”.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 85 http://tinyurl.com/kn6q5wm ",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Commutative Justice",
                           @"twitterDef":@"the aspect of justice which emphasizes\r obligations between individuals",
                           @"definition":@"\rCommutative Justice is identified in Catholic teaching as being the foundational aspect of justice that is essential for its contributive and distributive aspects.\r\rFurther Reference:\rCatechism of the Catholic Church, 2411\rhttp://tinyurl.com/6y3q4",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Contributive Justice",
                           @"twitterDef":@"the aspect of justice that emphasizes\rthe obligation of individuals toward society",
                           @"definition":@"\rContributive justice is met when the individual fulfills his responsbilities to the larger society.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Economic Justice For All”, II.b.1.b http://tinyurl.com/75hnlx3",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Canon",
                           @"twitterDef":@"the Greek word for “measuring stick”\rused to refer to a criterion or standard",
                           @"definition":@"\rSaints are canonized by the Church as standards by which Catholics may judge their lives. The Bible is referred to as the canon of the Scriptures that provide criteria for faith and practice. The earliest process at canonization of Scripture is the Muratorian Canon. In the Christian Tradition, the canon of Scripture is closed while the canon of Saints is open, and continues to grow as more Saints are canonized. See “Muratorian Canon”. See “Sacred Scripture” in the Overview tab.\r\rGreek, κανών (kanon)\r\rFurther Reference:\rCatechism of the Catholic Church, 120. http://tinyurl.com/kvc3tvq\r\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, III.B” http://tinyurl.com/2gb5dm ",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Catholic",
                           @"twitterDef":@"the quality of being universal in nature",
                           @"definition":@"\rCatholic describes the characteristic of the Church as being universal. It is one of the four marks of the Church. The term is first used by Ignatius of Antioch in his Letter to the Smyrneans ca. A.D. 110. Cyril of Jerusalem taught that the Church is “universal” in the senses that it is global in scope and differentiates the Church founded by Christ through the Apostles from heretical groups. St. Vincent of Lerins taught that Catholic was to be understood according to the rule of universality, antiquity, and consent.\r\r“We shall follow universality if we confess that one faith to be true, which the whole church throughout the world confesses; antiquity, if we in no wise depart from those interpretations which it is manifest were notoriously held by our holy ancestors and fathers; consent, in like manner, if in antiquity itself we adhere to the consentient definitions and determinations of all, or at the least of almost all priests and doctors.”\r\rGreek, καθολικός (katholikos) “according to the whole”\r\rFurther Reference:\rCatechism of the Catholic Church, 830\rhttp://tinyurl.com/c5m8w5j",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Celibacy",
                           @"twitterDef":@"a lifestyle of sexual abstinence",
                           @"definition":@"\rCelibacy is a vocation that is trans-cultural and trans-historical; people from various religious and philosophical traditions have led celibate lifestyles for varying reasons. In the Catholic tradition, celibacy is a gift and an escatological sign of the Kingdom of God. In Matthew 19, Jesus declares that those who can accept the lifestyle should do so. The current discipline of the Latin Rite is to only ordain celibate men to the priesthood, while Eastern Rite and Eastern Orthodox churches may ordain married men.\r\rFurther Reference:\rCatechism of the Catholic Church, 1579\rhttp://tinyurl.com/4hs6lso",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Chastity",
                           @"twitterDef":@"the respectful integration of sexuality\rwithin relationships",
                           @"definition":@"\rChastity is a term that has to do with more than simply virginity. It is the appropriate expression of sexuality within one's station in life (e.g. marriages are called to be chaste). It is the expression of sexuality in the recognition that all persons possess dignity. Chastity is the opposite of the objectification of sexuality. See “Dignity of the Human Person”, “Sexuality”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2337\rhttp://tinyurl.com/cz1w",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Christ",
                           @"twitterDef":@"an eschatological title of Jesus meaning\r“annointed one”",
                           @"definition":@"\rWhile Christ was originally a royal title, given to the annointed king of Israel/Judah, by the 1st century it had become a term associated with the Messiah who would usher in the End of Days and inaugurate the Messianic Age in which Israel's enemies would be defeated, peace would be established on the earth, and the righteous raised to Eternal Life. According to Acts 2:36, God installed Jesus as the Christ by virtue of his resurrection.\r\rGreek, Χριστός (christos) “annointed one”\r\rFurther Reference:\rCatechism of the Catholic Church, 436\rhttp://tinyurl.com/neqlbg7",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Christ of Faith",
                           @"twitterDef":@"the term for the risen Jesus that emphasizes his glorified existence",
                           @"definition":@"\rThe term Christ of Faith is often contrasted with the Jesus of History.\r\rFurther Reference:\rAmerica, “The Jesus Controversy”\rhttp://tinyurl.com/oh6rl7g\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Christology",
                           @"twitterDef":@"the study of the person and nature of Christ",
                           @"definition":@"\rChristology takes as its point of departure the Chalcedonian Definition of the two natures and hypostatic union in Jesus. Biblical criticism of the New Testament has distinguished between “High” and “Low” Christology, based on an emphasis on the divinity and humanity of Christ, respectively. See “Hypostesis”, “Chalcedonian Definition”.\r\rFurther Reference:\rWikipedia, “Christology”\rhttp://tinyurl.com/2b79fj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Chalcedonian Definition",
                           @"twitterDef":@"the dogmatic truth that Jesus Christ is\rone person with a divine and human nature",
                           @"definition":@"\rThe Council of Chalcedon taught that Jesus Christ is:\r\r“One and the Same Christ, Son, Lord, Only-begotten; acknowledged in Two Natures unconfusedly, unchangeably, indivisibly, inseparably; the difference of the Natures being in no way removed because of the Union, but rather the properties of each Nature being preserved, and concurring into One Person and One Hypostasis”.\r\rSee Chalcedon in the “Historcal” section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 468\rhttp://tinyurl.com/37wuaux",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Church",
                           @"twitterDef":@"the People of God",
                           @"definition":@"\rThe community belonging to the Lord, who have been called out to follow him. The Church is the community centered on the belief that Jesus of Nazraeth is the divine Savior of the world. See “Ecclesia”.\r\rFurther Reference:\rCatechism of the Catholic Church, 751\rhttp://tinyurl.com/ojrdr53",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"College of Bishops",
                           @"twitterDef":@"the group of the successors\rof the Apostles",
                           @"definition":@"\rThe College of Bishops is a concept emphasized by Vatican II. See “Apostle”.\r\rFurther Reference:\rCatechism of the Catholic Church, 880-887 http://tinyurl.com/m65ttaf",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Compline",
                           @"twitterDef":@"the traditional word for Night Prayer",
                           @"definition":@"\rSee “Night Prayer”.\r\rFurther Reference:\rWikipeida, “Compline”\rhttp://tinyurl.com/c739hq",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Communicatio Idiomatum",
                           @"twitterDef":@"the interexchange of Christ's\rdivine and human natures",
                           @"definition":@"\rThe idea of the Communicatio Idiomatum means that the properties of the human Jesus can also be predicated of the Logos and vice versa. See “Chalcedonian Definition”.\r\rFurther Reference:\rNew Advent, “Communicatio Idiomatum”\rhttp://tinyurl.com/nqusf6m",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Communion of Saints",
                           @"twitterDef":@"the unity among believers that exists in Christ",
                           @"definition":@"\rThe Communion of Saints is an article of Faith dating to the earliest days of the Church. It is specifically mentioned in the Apostle's Creed.\r\rFurther Reference:\rCatechism of the Catholic Church, 946\rhttp://tinyurl.com/pkxuudx",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Confession",
                           @"twitterDef":@"the contrite acknowledgement of sins;",
                           @"definition":@"\rConfession is a required for forgiveness. It also is another name for the the Sacrament of Reconciliation. See \r\rFurther Reference:\rCatechism of the Catholic Church, 1424\r http://tinyurl.com/l7xon9e",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Confirmation",
                           @"twitterDef":@"the Sacrament of reception\rof the Holy Spirit",
                           @"definition":@"\rThe sacrament of reception of the Holy Spirit in which the grace of Baptism is strengthened.\r\rFurther Reference:\rCatechism of the Catholic Church, 1285\rhttp://tinyurl.com/lcgw5p7",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Conversion",
                           @"twitterDef":@"the process of spiritual transformation",
                           @"definition":@"\rThe process of changing one's direction in life.\r\rFurther Reference:\rCatechism of the Catholic Church, 1989\rhttp://tinyurl.com/yaua7cc",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Cosmological Argument",
                           @"twitterDef":@"an argument for God's existence, based on Aristotle's First Cause argument",
                           @"definition":@"\rOne of the classical arguments for the existence of God, based on the First Cause argument.\r\rFurther Reference:\rSee Stanford Encyclopedia of Philosophy, “Cosmological Argument”\rhttp://tinyurl.com/8xkm72n\r\rThomas Aquinas, Summa Theologica, ST,Ia,q.2a.3co.\rhttp://tinyurl.com/my5bedq",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Contemplation",
                           @"twitterDef":@"a form of silent and meditative prayer",
                           @"definition":@"\rThis form of prayer is mystical in that it is a gaze of faith that enables a more intense communion with the Trinity. See “Trinity”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2709\rhttp://tinyurl.com/n937nqh",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Chalice",
                           @"twitterDef":@"the litugical name for a cup/rused during the Eucharist",
                           @"definition":@"\rThe 2011 new translation of the Mass refers to the cup (still called such in the Memorial Acclamation) as a chalice.\r\rFurther Reference:\rWikipedia, “Chalice”\rhttp://tinyurl.com/oqzrgjk",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Cherubim",
                           @"twitterDef":@"a class of angelic figures\rdepicted in the Bible",
                           @"definition":@"\rCherubim (plural of “cherub”) are found from as early as Genesis 3, where one guards the Tree of Life. They also feature prominently in some prophetic and apocalyptic literature.\r\rFurther Reference:\rWikipedia, “Cherub”\rhttp://tinyurl.com/3llehen",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Conscience",
                           @"twitterDef":@"that which prompts us to\rdo good and avoid evil",
                           @"definition":@"\rAccording to Church teaching, all people are morally obligated to follow the dictates of their consciences. However, the subjective nature of the conscience does not guarantee the objective correspondence with moral truth.\r\rFurther Reference:\rCatechism of the Catholic Church, 1776\rhttp://tinyurl.com/n6fjppn",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Consecration",
                           @"twitterDef":@"the act of setting someone or something\rapart for special service",
                           @"definition":@"\rConsecration usually takes the form of the consecration of the Eucharistic elements of bread and wine. The term is also used to describe the ordination to Holy Orders or dedication to Divine service.\r\rFurther Reference:\rWikipedia, “Consecration”\rhttp://tinyurl.com/p7vdt94",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Consubstantial",
                           @"twitterDef":@"having the same substance",
                           @"definition":@"\rThis term is the Latin translation of the Greek word “homoousious”. See “Homoousious”\r\rFurther Reference:\rCatechism of the Catholic Church, 242\rhttp://tinyurl.com/4tymjt",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Contrition",
                           @"twitterDef":@"repentance from sin and intention for conversion",
                           @"definition":@"\rContrition has been traditionally been categorized as perfect and inperfect.\r\rFurther Reference:\rCatechism of the Catholic Church, 1451http://tinyurl.com/l7xon9e",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Concelebration",
                           @"twitterDef":@"the celebration of the Mass\rby two or more priests",
                           @"definition":@"\rConcelebration is reserved for special celebrations.\r\rFurther Reference:\rWikipedia, “Concelebration”\rhttp://tinyurl.com/mlkeb3f",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Corpus Christi",
                           @"twitterDef":@"the liturgical feast that celebrates\rthe Eucharist",
                           @"definition":@"\rCorpus Christi is a feast day for the Church.\r\rFurther Reference:\rWikipedia, “Corpus Christi”\rhttp://tinyurl.com/yt7hu4",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Crucifixion",
                           @"twitterDef":@"a form of death by hanging\that induces asphyxiation",
                           @"definition":@"\rThe Romans aquired the practice of crucifixion from the Carthaginians. It was reserved for Roman non-citizens.\r\rFurther Reference:\rWikipedia, “Crucifixion of Jesus”\rhttp://tinyurl.com/b474qw",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Creation",
                           @"twitterDef":@"the Universe...",
                           @"definition":@"\rThe universe.\r\rFurther Reference:\rCatechism of the Catholic Church, 280\rhttp://tinyurl.com/6kvj6",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Creationism",
                           @"twitterDef":@"the belief that God created the earth & humanity as described in the book of Genesis",
                           @"definition":@"\rThe belief that God created the earth and human beings directly, with no biological predecessors as described in the book of Genesis. A 2009 conference on Evolution and Theolgoy sponsored by the Vatican did not included Creationsm proponents. See “Evolution”.\r\rFurther Reference:\rCatholic News Service, “Vatican Evolution Congress To Exclude Creationism, Intelligent Design”\rhttp://tinyurl.com/64bf49",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Creed",
                           @"twitterDef":@"a statement of faith or belief",
                           @"definition":@"\rThis word is traditionally used to refer to the historical creeds of the Church, most notably the Apostle's and Nicene creed. It may also indicate a personal belief.\r\rFurther Reference:\rCatechism of the Catholic Church, 187\rhttp://tinyurl.com/mo3f24x",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Call Narrative",
                           @"twitterDef":@"a literary form used throughout the Bible in which a prophet is called by God",
                           @"definition":@"\rCall Narratives consist of three parts: call, concern, commission. The stories of Moses, Jeremiah, and Isaiah all involve a call narrative.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Charism",
                           @"twitterDef":@"a spiritual gift that results from the experience of the Holy Spirit",
                           @"definition":@"\rAccording to the Apostle Paul, spiritual gifts accompany the Christian experience of the Holy Spirit. See 1 Corinthians 12.\r\rGreek, χαρίσμa (charisma) “gifts”.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Chesed",
                           @"twitterDef":@"a Hebrew word meaning\r“loving kindness”",
                           @"definition":@"\rChesed occurs predominantly in the Psalms, where it is used to refer to YHWH's covenant faithfulness.\r\rHebrew, חֶסֶד (chesed)\r\rFurther Reference:\rWikipedia, “Chesed”\rhttp://tinyurl.com/9b59jr",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Circumcision",
                           @"twitterDef":@"the ritual cutting of the male foreskin",
                           @"definition":@"\rCircumcision is the essential sign of the covenant according to the Priestly Source in Genesis 17.\r\rFurther Reference:\rWikipedia, “Circumcision”\rhttp://tinyurl.com/6yfbn",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Codex",
                           @"twitterDef":@"a collection of manuscripts",
                           @"definition":@"\rVarious codices make up the biblical manuscript tradition. See “Manuscript”.\r\rFurther Reference:\rCodex Sinaiticus\rhttp://tinyurl.com/5fg98l",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Covenant",
                           @"twitterDef":@"a sacred contract or agreement",
                           @"definition":@"\rCovenants are used throughout the Bible. They refer to the relationship between YHWH and Noah and all living creatures in Genesis 9; between God and Abraham in Genesis 15 and 17; between YHWH and all Israel in Exodus 25; and between God and humanity in the Gospels.\r\rFurther Reference:\rCatechism of the Catholic Church, 56, 59, 62, 73 http://tinyurl.com/pesbbq3",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Church/State",
                           @"twitterDef":@"a philosophical, theological, and legal dichotomy of religious and political entities",
                           @"definition":@"\rThe dichotomy used to express philosophical, theological, and legal differences in religious and political entities.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    /*
    
    [TAWord wordWithDict:@{@"name":@"Colonialism",
                           @"twitterDef":@"the practice of a country claiming foreign lands\ras its own",
                           @"definition":@"\rThe practice of settling foreign lands.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
     */
     
    [TAWord wordWithDict:@{@"name":@"Common Good",
                           @"twitterDef":@"the social condition in which all people\r are allowed to reach their full development",
                           @"definition":@"\rThe Common Good is not a strategy to obtain the most good for the most people. Rather, it stems from the Digntity of the Human Person. It the goal of social justice, and that which relativizes all aboslute claims to individual rights. See “Dignity of the Human Person”, “Social Justice”.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 164\rhttp://tinyurl.com/455cdw3",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Compatiblism",
                           @"twitterDef":@"the idea that human freedom is compatible with determinism",
                           @"definition":@"\rThe belief that human freedom is compatible with deterministic elements of human experience.\r\rFurther Reference:\rStandford Encyclopedia of Philosophy, “Compatibilism”\rhttp://tinyurl.com/l3aj5j.",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Council",
                           @"twitterDef":@"a gathering of the Church to settle disputed matters of Christian teaching",
                           @"definition":@"\rA gathering of the Church to settle disputed matters of Christian teaching; the prototypical council is depicted in Acts 15 in which the Church determines the requirements for Gentile membership. Later councils were local or regional; ecumenical councils, or councils of the whole Church, began in A.D. 325 at the behest of the Emperor Constantine in the city of Nicea. Seven such ecumenical councils are recognized by both the Eastern and Western Church.\r\rFurther Reference:\rCatechism of the Catholic Church, 884\rhttp://tinyurl.com/m65ttaf",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Cybertheology",
                           @"twitterDef":@"the intelligence of faith in the era of the Internet and World Wide Web",
                           @"definition":@"\rAccording to Fr. Antonio Spadaro, S.J., the term “cybertheology” refers to the intelligence of faith in the era of the Internet and World Wide Web, which arises from the recognition that, as technology changes ways of thinking, theology necessarily changes as well.\r\rFurther Reference:\rCybertelogia http://tinyurl.com/kuxll8z",
                           @"category":@"Systematic"}];
    
    ///////////////////////////D

    
    [TAWord wordWithDict:@{@"name":@"Deanery",
                           @"twitterDef":@"a smaller geographical area within a diocese",
                           @"definition":@"\rDeaneries are made up of both clergy and lay representatives from various parishes....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Dehumanization",
                           @"twitterDef":@"the process of objectifying a human being, violating his or her dignity",
                           @"definition":@"\rOne theory of dehumanization claims that it can take one of two forms: animalistic or mechanistic. The former denies uniqely human characteristics (such as civility, morality, rationality). The latter denies characteristics of human nature that are fundamental but not unique to humans (such as emotional responsiveness, individuality, interpersonalism).\r\rFurther Reference:\r“Dehumanization: An Integrative Review”\rhttp://tinyurl.com/okhuczt",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Deontology",
                           @"twitterDef":@"the study of ethics from the framework of\rmoral duties in the form of rules and laws",
                           @"definition":@"\rDeontology is a theory of morality based on what we ought to do in contrast to virtue theories, which based on the kinds of persons we should be.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Deontological Ethics”\rhttp://tinyurl.com/ya6dgay",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Dignity of the Human Person",
                           @"twitterDef":@"the sacred status of human beings derived\rfrom their creation in the Image of God",
                           @"definition":@"\rHuman dignity is based on the understanding that all people are loved unconditionally and universally and called to be in loving relationship with the Creator. Human dignity is fulfilled in this vocation and is essential to human development. It is the first principle of Catholic Social Teaching in which all others are based. See “Catholic Social Teaching”, “Human Person”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1700\rhttp://tinyurl.com/kaz99um",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Disciple",
                           @"twitterDef":@"a follower of Jesus",
                           @"definition":@"\rAccording to the Gospels, Jesus had numerous disciples; Luke records about 70. The Apostles were chosen from this larger group of disciples. In the Catholic Tradition, all Christians are called to be disciples. See “Apostles”.\r\rFurther Reference:\rFelix Just, S.J., “Disciples and Apostles in the New Testament”\rhttp://tinyurl.com/mzcbt37",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Distributive Justice",
                           @"twitterDef":@"the type of justice which emphasizes society's responsibilities to the individual",
                           @"definition":@"\rDistributive justice is an essential aspect of social justice. It is fulfilled when society meets its obligations to the individual based on his or her contribution and need.\r\rFurther Reference:\rUSCCB, “Economic Justice For All”, II.b.1.b http://tinyurl.com/75hnlx3",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Divine Liturgy",
                           @"twitterDef":@"the name of the Eucharistic celebration in\rthe Byzantine liturgical tradition",
                           @"definition":@"\rThe Liturgy of St. John Chrysostom is the litugry used most often in the Byzantine tradition, while other liturgies are used on various special occassions.\r\rFurther Reference:\rGreek Orthodox Archdiocese in America, The Divine Liturgy of Saint John Chrysostom\rhttp://tinyurl.com/nmkpnt8",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Decaon",
                           @"twitterDef":@"an ordained servant of the Church",
                           @"definition":@"\rDecaons are referred to throughout the New Testament. In the Latin Rite, they are ordained to assist bishops and priests in the celebration of the Christian Mysteries.\r\rGreek, διάκονος (diakonos) “server”\r\rFurther Reference:\rCatechism of the Catholic Church, 1570\rhttp://tinyurl.com/4hs6lso",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Deposit of Faith",
                           @"twitterDef":@"the content of the Christian faith given by God\rto the Church through the Apostolic tradition",
                           @"definition":@"\rThe Depsit of Faith is regarded as delievered once for all to the Saints by the author of the Epistle of Jude.\r\rFurther Reference:\rCatechism of the Catholic Church, 84\rhttp://tinyurl.com/bx8mnlu",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Development of Doctrine",
                           @"twitterDef":@"the idea that the teaching of the Church can faithfully develop over time",
                           @"definition":@"\rThe concept of the Development of Doctrine is first found in the writings of Vincent of Lerins and later re-emphasized by Cardinal John Henry Newman. The former was cited explicitly by the council fathers at Vatican I. Recently, Fr. Thomas Guarino has argued that his lack of representation at Vatican II was the result of a misinterpretation of Vincent's famous claim:\r\r“We hold that which has been believed everywhere, always, and by everyone.”\r\rPope Francis has recently quoted Vincent's ideas in his discussions on abortion and gay marriage.\r\rFurther Reference:\rJohn Henry Newman, “Essay on the Development of Doctrine”\rhttp://tinyurl.com/n8kpzcc\r\rFr. Thomas Guarino, “Pope Francis Looks To Vincent of Lerins”\rhttp://tinyurl.com/ogtb5ej",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Devil",
                           @"twitterDef":@"a personal, malevolent spiritual being\roppposed to the will of God",
                           @"definition":@"\rThe Devil became synonymous with the Hebrew figure of Satan in the inter-testamental years. By the writing of the Gospels, Jesus' ministry was interpreted as a spiritual conflict with the Devil.\r\rFurther Reference:\rCatechism of the Catholic Church, 391\rhttp://tinyurl.com/llux3he",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Doctrine",
                           @"twitterDef":@"a systemized body of teaching",
                           @"definition":@"\rThe word doctrine is used in Catholicism to refer to the teaching of Church in a general sense. In this regard, it is synonymous with catechesis. See “Catechesis”.\r\rFurther Reference:\rCatechism of the Catholic Church, 18\rhttp://tinyurl.com/nxgcz89",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Dogma",
                           @"twitterDef":@"the Greek word for “opinion” used for\ra doctrine that has been infallibly defined",
                           @"definition":@"\rA dogma in the Catholic tradition is a subset of Church doctrine. It refers to a divinely revealed truth that has been defined infallibly. All dogmas are doctrines, but not all doctrines are dogmas.\r\rGreek, δόγμα (dogma)\r\rFurther Reference:\rCatechism of the Catholic Church, 88\rhttp://tinyurl.com/bx8mnlu",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Decalogue",
                           @"twitterDef":@"the 10 Commandments",
                           @"definition":@"\rThe Decalogue is found in both Exodus 20 and Deuteronomy 5. In Exodus, they are part of the Mosaic theophany.\r\rGreek, δέκα λόγους (deka logous) “ten words”\r\rFurther Reference:\rCatechism of the Catholic Church, 2056\rhttp://tinyurl.com/nc86ead",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dei Verbum",
                           @"twitterDef":@"the dogmatic constitution of Vatican II\rconcerning Divine Revelation",
                           @"definition":@"\rDei Verbum is the most definitive statement on the Church's belief in Divine revelation, the Scriptures and Tradition.\r\rLatin, (dei verbum) “Word of God”\r\rFurther Reference:\rVatican II, “Dogmatic Constitution on Divine Revelation”\rhttp://tinyurl.com/3ecxu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Demythologization",
                           @"twitterDef":@"the process of separating time-conditioned myths from their underlying truths",
                           @"definition":@"\rFollowing a similar line of thought as Spinoza, Rudolph Bultmann coined this term to refer to way of interpreting the New Testament within a post-scientific worldview:\r\r“We cannot use electric lights and radios and, in the event of illness, avail ourselves of modern medical and clinical means and at the same time believe in the spirit and wonder world of the New Testament.”\r\rIn reflecting on the impact of Bultmann's thesis, Karl Rahner stated:\r\r“[Catholic theology] can share Bultmann's preoccupation to the extent that this consists simply in seeking out and expressing as adequately as possible and in the most effective way the data of faith contained in the Scripture. From this point of view, one could say that all theology embodies what is authentic in Bultmann's project.”\r\rFurther Reference:\rSacramentum Mundi, “Demythologization”\rhttp://tinyurl.com/kqj9ng5",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Didache",
                           @"twitterDef":@"the name of the earliest extra-biblical Christian document",
                           @"definition":@"\rThe Teaching of the Twelve Apostles is the first so-called “church order”; manuals for Christian living as well as public worship that would become popular in the 3rd and 4th centuries. It contains the earliest complete Christian liturgy, whose Eucharistic prayers show close similarity to the Jewish synagogue prayers.\r\rGreek, διδαχή (didache) “teaching”\r\rFurther Reference:\rChris Thomas, “The Didache: Its Origin and Significance”\rhttp://tinyurl.com/ppeydnh",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Diocese",
                           @"twitterDef":@"the administrative area of a bishop",
                           @"definition":@"\rThe concept of a diocese dates to the time of the Emperor Diocletian...\r\rFurther Reference:\r",
                           @"category":@"Historical"}];



    [TAWord wordWithDict:@{@"name":@"Deuteronomic History",
                           @"twitterDef":@"the theologized history of Israel in Joshua, Judges, 1 & 2 Samuel, and 1 & 2 Kings",
                           @"definition":@"\rThe term given to the books Joshua, Judges, 1 & 2 Samuel, and 1 & 2 Kings, based on the theology of the book of Deuteronomy, which detail the rise and fall of the Israelite monarchy, united and divided kingdom, and eventual downfall of the nation Israel.\r\rFurther Reference:\rWikipedia, “Deuteronomic History”\rhttp://tinyurl.com/poqwjxo",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deuteronomic Source",
                           @"twitterDef":@"the literary source (D) in the Torah\rconsisting primarily of the book of Deuteronomy",
                           @"definition":@"\rThe “D” source is one of the four sources which compose the Torah. According to Richard Elliot Freidman, the author of D was most likely the prophet Jeremiah. See “Documentary Hypothesis.”\r\rFurther Reference:\rWikipedia, “Deuteronomic Source”\rhttp://tinyurl.com/myayczm",
                           @"category":@"Biblical"}];
    
    /*
    [TAWord wordWithDict:@{@"name":@"Deuteronomy",
                           @"twitterDef":@"the fifth and last book of the Pentateuch",
                           @"definition":@"\rDeuteronomy is the fifth and last book of the Torah containing a second version of the Ten Commandments and various laws relating to community life in ancient Israel.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    */
    
    [TAWord wordWithDict:@{@"name":@"Diachronic",
                           @"twitterDef":@"the quality of transcending time",
                           @"definition":@"\rThe type of truth within a text which transcends time and culture.\r\rFurther Reference:\r“The Interpretation of the Bible in the Church, A” http://tinyurl.com/ymsltv",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Diaspora",
                           @"twitterDef":@"the dispersion of Jews to surrounding regions\rafter the Exile",
                           @"definition":@"\rThe type of truth within a text which transcends time and culture.\r\rFurther Reference:\r“The Interpretation of the Bible in the Church, A” http://tinyurl.com/ymsltv",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Divine Office",
                           @"twitterDef":@"the traditional word for the\rLiturgy of the Hours",
                           @"definition":@"\rSee “Liturgy of the Hours”.",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Documentary Hypothesis",
                           @"twitterDef":@"the theory that there are 4 sources which comprise the Torah: J, E, P, and D",
                           @"definition":@"\rThe theory, put into classical form by Julius Wellhausen, that there are 4 independent sources which comprise the Torah that have been edited together into its current canonical form; “Yahwist” (J), “Elohist” (E), “Priestly” (P), and “Deuteronomic” (D).\r\rAccording to Dr. Richard Elliot Freidman, there are seven arguments for its validity:\r\r1. Language\r2. Terminology\r3. Consistent Content\r4. Narrative Flow\r5. Other Biblical Connections\r6. Inter-Source Relationships\r7. Convergence of Arguments\r\rSee “Deuteronomic Source”, “Elohist Source”, “Priestly Source”, “Yahwist Source”.\r\rFurther Reference:\rPBS, “Who Wrote The Flood Story?”\rhttp://tinyurl.com/5leorc",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dynamic Equivalence",
                           @"twitterDef":@"a translation philosophy that seeks to render the text idea for idea",
                           @"definition":@"\rThe pre-2011 translation of the Mass and New American Bible were both based on a dynamic equivalence philosophy.\r\rFurther Reference:\rFelix Just, S.J., “English Translations of the Bible” http://tinyurl.com/qhfucxz\r\rWikipedia, “Dynamic and Formal Equivalence” http://tinyurl.com/lwylgtu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Deism",
                           @"twitterDef":@"the belief that God created the world but does not intervene in it",
                           @"definition":@"\rThe belief that God created the world but does not intervene in the natural course of the world.\r\rFurther Reference:\rWikipedia, “Deism”\rhttp://tinyurl.com/oc6xh",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Determinism",
                           @"twitterDef":@"the belief that all events are determined by physical phenomena",
                           @"definition":@"\rThe belief that all events, including human actions, are determined by physical phenomena, negating the concept of free-will.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Causal Determinism”\rhttp://tinyurl.com/ew8c.",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Development",
                           @"twitterDef":@"the process of enhancing the freedom and opportunity of all people to improve their lives",
                           @"definition":@"\rHuman development is a central theme in Catholic Social Teaching as it applies to the Life and Dignity of the Human Person. It has been measured by the United Nations since 1990 with the first Human Development Report.\r\rFurther Reference:\rUnited Nations Development Programme\rhttp://tinyurl.com/khsqbzk",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Docetism",
                           @"twitterDef":@"the belief that Jesus was not fully human",
                           @"definition":@"\rDocetism is a form of Gnosticism, and as such, denied the full humanity of Jesus Christ. It is alluded to in the Johonnine epistolary corpus.\r\rGreek, δοκεῖν (dokein) “to seem”\r\rFurther Reference:\rCatechism of the Catholic Church, 465\r\rWikipedia, “Docetism”\rhttp://tinyurl.com/yoalfv",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Donatism",
                           @"twitterDef":@"a schismatic Christian group that denied\rthe principle of ex opere operato",
                           @"definition":@"\rThe Donatist schism began in A.D. 311 in North Africa and flourished for about one hundred years. It began when Donatus, a bishop in the church of Carthage, was elected as a reaction against the election of Caecilian to the episcopacy. The latter had been consecrated by a traitor under the Diocletian persecution. Donatus declared all sacraments and ordinations by Caecilian to be invalid and caused a schism in Northern Africa. In 313, a local council ruled against the rigorism of Donatus.\r\rFurther Reference:\rWikipedia, “Donatism”\rhttp://tinyurl.com/o73ocyf",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Doxology",
                           @"twitterDef":@"a praise or blessing of God in prayer",
                           @"definition":@"\rDoxologies are found throughout the Bible, and are very prevalent in the Psalms. In the New Testament, Paul's letters contain numerous doxologies that center around the revelation of God's Mystery in Christ.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Dualism",
                           @"twitterDef":@"the belief that humans are composed of two substances, body and soul/mind",
                           @"definition":@"\rAlso known as substance dualism; found in the Platonic influence on Christianity and later in the writings of Descartes. Associated problems include the problem of causation and the seeming violation of the scientific law of the conservation of energy.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Dualism” http://tinyurl.com/85cdhc3",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Dulia",
                           @"twitterDef":@"the Greek word meaning\r“veneration”",
                           @"definition":@"\rIn contrast to latria, dulia refers to veneration that is appropriate for the Saints or other sources of inspiration for Christian living. The Virgin Mary is the object of hyperdulia, the highest veneration one can give to anything created.\r\rGreek, δουλεία (douleia)\r\rFurther Reference:\rNew Advent, “Dulia”\rhttp://tinyurl.com/la9btgm",
                           @"category":@"Liturgical"}];
    
    
    
    
    
    
    /////////////////////////////////////E
    
    
    
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Easter",
                           @"twitterDef":@"the liturgical celebration of\rthe resurrection of Jesus",
                           @"definition":@"\rEaster is the Feast of feasts for the Church; the holiest day of the year. The resurrection of Jesus has been celebrated from the earliest days of the Church either the actual day of week or on the first Sunday after Passover. The Quartodeciman Controversy in the 2nd century illustrated that Catholicity did not necessitate uniformity. See “Quartodeciman Controversy”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1169-1170\rhttp://tinyurl.com/l7cbxu5",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Eastern Catholic Churches",
                           @"twitterDef":@"autonomous non-Western churches in full communion with the Church of Rome",
                           @"definition":@"\rEastern Catholic Churches include Alexandrian, Antiochian, Armenian, Byzantine, and Syrian churches. They are represented in the Congregation for the Oriental Chuches.\r\rFurther Reference:\rCongregation for Oriental Churches, http://tinyurl.com/oqrrpmy",
                           @"category":@"Historical"}];

    
    [TAWord wordWithDict:@{@"name":@"Ebionites",
                           @"twitterDef":@"a sect of 1st century Jewish Christians\rwho denied the divinity of Christ",
                           @"definition":@"\rThe Ebionites are mentioned by Irenaeus. Other Church Fathers (such as Origen and Tertullian) mention them as well. They seem to have had similar characteristics as the Essenes. They respected James the Just and believed Paul of Tarsus to be a heretic.\r\rFurther Reference:\rWikipedia, “Ebionites”\rhttp://tinyurl.com/yjrqt9y",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecclesia",
                           @"twitterDef":@"the Greek word meaning\r“those who have been called out”",
                           @"definition":@"\rThe word ecclesia was originally a term used to desribe the legislature of the Athenian City-State. The Greek translators of the Septuagint and writers of the New Testament use it to refer to the Church. See “Septuagint”, “Church”.\r\rGreek, ἐκκλησία (ecclesia)\r\rFurther Reference:\rCatechism of the Catholic Church, 751\rhttp://tinyurl.com/oy6txqx",
                           @"category":@"Biblical"}];

    
    [TAWord wordWithDict:@{@"name":@"Economic Justice",
                           @"twitterDef":@"the right relationship between human beings to a given economic system",
                           @"definition":@"\rEconomic justice is based on the idea that the economy of any society should serve people, not vice versa.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Economic Justice”\rhttp://tinyurl.com/l7a4kwo",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Elevation",
                           @"twitterDef":@"the raising up of the consecrated bread and wine\at the end of the Eucharistic prayer",
                           @"definition":@"\rThe Host is elevated so that it can be venerated by the congregation. The practice can be traced back to Eudes de Sully, Bishop of Paris (1198-1208).\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “General Instruction of the Roman Missal”\rhttp://tinyurl.com/pe365cl",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Enlightenment",
                           @"twitterDef":@"the 17th-18th century cultural movement\rwhich prioritized reason over religion",
                           @"definition":@"\rThe Enlightenment was essential to the development of modern nation states, economics, and science.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Enlightenment”\rhttp://tinyurl.com/cqvbd37",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Epiclesis",
                           @"twitterDef":@"the Greek word meaning “invocation”;\rof the Holy Spirit upon the Eucharist",
                           @"definition":@"\rThe Epiclesis invites the Holy Spirit to transform the gifts of bread and wine into the body and blood of Christ.\r\rGreek, ἐπίκλησις (epiklesis)\r\rFurther Reference:\rCatechism of the Catholic Church, 1105\rhttp://tinyurl.com/oqbzkx3",
                           @"category":@"Liturgical"}];

    [TAWord wordWithDict:@{@"name":@"Episcopacy",
                           @"twitterDef":@"the third degree of Holy Orders",
                           @"definition":@"\rSee “Bishop”\r\rFurther Reference:\rCatechism of the Catholic Church, 1555\rhttp://tinyurl.com/4hs6lso",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Evolution",
                           @"twitterDef":@"a process of biological descent with modification",
                           @"definition":@"\rThe modern theory of evolution is the result of over 100 years of rigorous testing of Charles Darwin's theory of biological decent with modification. Its scientific and cultural acceptance was influential on Vatican II as seen in Gaudium et Spes, 5:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis.”\r\rFurther Reference:\rNational Center for Science Education, “Evolution”\rhttp://tinyurl.com/mbx353a",
                           @"category":@"Cultural"}];


    
    [TAWord wordWithDict:@{@"name":@"Ethics",
                           @"twitterDef":@"the study of moral systems",
                           @"definition":@"\rEthics is one of the three traditional branches of Philosophy. Christian ethics is the study of morality in the Christian tradition.\r\rGreek, ἠθικός (ethikos) “custom”\r\rFurther Reference:\rWikipedia, “Ethics”\rhttp://tinyurl.com/oqptk",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecclesiology",
                           @"twitterDef":@"the study of the Church",
                           @"definition":@"\rEcclesiology examines various aspects of the Church (authority, structure, sacraments, worship, etc.). While the pre-Conciliar model of the Church was that of the perfect community (communitas perfecta), Vatican II, in the Dogmatic Constitution on the Church “Lumen Gentium”, chose to define the Church as the People of God united in a Mystical Communion. See “Lumen Gentium”.\r\rFurther Reference:\rWikipedia, “Ecclesiology”\rhttp://tinyurl.com/5e4obj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ecumenism",
                           @"twitterDef":@"a movement that emphasizes similarities over differences",
                           @"definition":@"\rA movement which gained popularity in the 20th century that emphasized shared beliefs among various Christian churches over and against differences.\r\rFurther Reference:\rVatican II, “Unitatis Redintegratio”\rhttp://tinyurl.com/3xnyh",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Election",
                           @"twitterDef":@"the concept that Israel and the Church\rwere chosen by God to be in a covenant",
                           @"definition":@"\rElection is a concept that runs throughout both the Old and New Testaments. In the Old Testament, Israel is a nation chosen by YHWH from among other nations to be in covenant relationship. In the New Testament, Christ is referred to as the “Chosen One” and believers in him are referred to as being chosen in him.\r\rFurther Reference:\rCatechism of the Catholic Church, 762, 769 http://tinyurl.com/oy6txqx",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Eschatology",
                           @"twitterDef":@"the belief that evil and injustice will have\ran end brought about by Divine intervention",
                           @"definition":@"\rEschatology is traditionally known as the Last Things. It examines the Church doctrine on the destiny of the human race. The historic Creeds of the Church state that Christ will return to judge the living and dead at the end of time.\r\rFurther Reference:\rCatechism of the Catholic Church, 673\rhttp://tinyurl.com/n85jnew.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Essence",
                           @"twitterDef":@"a property that makes an object what it is",
                           @"definition":@"\rEssence (or substance) is contrasted with accidents.\r\rFurther Reference:\rStandford Encyclopedia of Philosophy, “Essential vs. Accidental Properties”\rhttp://tinyurl.com/olc9dv8.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Eucharist",
                           @"twitterDef":@"the Sacramental meal in which\rChristians celebrate the Pashcal Mystery",
                           @"definition":@"\rThe word Eucharist came to be associated with the bread and wine of the Eucharist which early Christians believed to be directly related to the body and blood of Jesus. The belief that Jesus is present in the Eucharist predates to the earliest years of the Church. Paul claims that bread and wine of the Eucharist are a participation in the body and blood of Christ. This belief predates any explanation (e.g. transubstantiation) as to how he is present. See “Anamnesis”.\r\rGreek εὐχαριστία (eucharistia) “good thanksgiving”\r\rFurther Reference:\rCatechism of the Catholic Church, 1322\rhttp://tinyurl.com/q6gyoc7\r\rPost-Synodal Exhortation on the Eucharist, http://tinyurl.com/nt7jj3z",
                           @"category":@"Liturgical"}];

    [TAWord wordWithDict:@{@"name":@"Euthyphro Dilemma",
                           @"twitterDef":@"does God give commands because they are good? or are they good because God commands them?",
                           @"definition":@"\rThe Euthphro Problem takes its name from Plato's Dialogue, Euthyphro, in which Socrates asks Euthyphro: Is the pious loved by the gods because it is pious, or is it pious because it is loved by the gods? In contemporary Moral Theology, the question can be framed: Does God give the Commandments because they are good, or are the Commandments good because God gives them?\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Religion and Morality”\rhttp://tinyurl.com/6wc2qkg",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Exclusivism",
                           @"twitterDef":@"the belief that outside the Church there is no salvation",
                           @"definition":@"\rThe ancient phrase “extra ecclesium nulla sallus” (outside the Church there is no salvation) has been traditionally interpreted to mean that only Catholics will be saved. The Anonymous Christian notion of Karl Rahner was influential on Vatican II and was the catalyst for a development of this teaching. See “Anonymous Christian”.\r\rFurther Reference:\rCatechism of the Catholic Church, 846\rhttp://tinyurl.com/oupb5",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Cathedra",
                           @"twitterDef":@"a teaching from the chair of Peter",
                           @"definition":@"\rWhen the Pope explicitly teaches from the chair (ex cathedra) of Peter, his teaching is considered infallible.\r\rFurther Reference:\rNew Advent, “Ex Cathedra”\rhttp://tinyurl.com/z24ta",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Nihilo",
                           @"twitterDef":@"the act of God creating from nothing",
                           @"definition":@"\rThe phrase ex nihilo is used to express the belief that God created the Universe out of nothing.\r\rLatin (ex nihilo) “from nothing”\r\rFurther Reference:\rCatechism of the Catholic Church, 296\rhttp://tinyurl.com/6kvj6.",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Opere Operato",
                           @"twitterDef":@"the idea that a Sacrament's efficacy is not related to a celebrant's personal holiness",
                           @"definition":@"\rThe Donatist Schism was initiated by a refusal of Donatus and his followers to adhere to this teaching. a Latin phrase meaning\r“from the work, worked”\r\rFurther Reference:\rCatechism of the Catholic Church, 1128\rhttp://tinyurl.com/cmes38",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ex Opere Operantis",
                           @"twitterDef":@"the idea that a Sacrament's efficacy is related to the celebrant's personal holiness",
                           @"definition":@"\rThis phrase refers to the emphasis on the subjective character of the celebrant. In the Catholic tradition, it does not affect the validity of the Sacraments. a Latin phrase meaning\rfrom the work of the worker....See Ex Opere Operato.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Excommunication",
                           @"twitterDef":@"the state of being out of visible\rcommunion with the Church",
                           @"definition":@"\rExcommunication is aluded to as early as the first century in the writings of Paul, who taught the Corinthian exclude an unrepentant member from communion. In the current Code of Canon Law, only a Pope or authorized representative can lift an excommunication\r\rFurther Reference:\rCatechism of the Catholic Church, 1463\rhttp://tinyurl.com/l7xon9e",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Exorcism",
                           @"twitterDef":@"the expulsion of evil spirits\rby the authority of Jesus Christ",
                           @"definition":@"\rDuring his ministry, Jesus is reported to have conducted exorcisms. The Acts of the Apostles also portrays the Apostles as conducting exorcisms.\r\rFurther Reference:\rCatechism of the Catholic Church, 1673\rhttp://tinyurl.com/oo3cp5p",
                           @"category":@"Systematic"}];


    [TAWord wordWithDict:@{@"name":@"Eisegesis",
                           @"twitterDef":@"intepreting a text by importing one's own presuppositions",
                           @"definition":@"\rEisegesis occurs when exegesis is neglected. See “Exegesis”.\r\rFurther Reference:\rFelix Just S.J., “Biblical Exegeis”\rhttp://tinyurl.com/k3u6rma",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"El",
                           @"twitterDef":@"the father of all the gods and husband of Asherah in Canaanite mythology",
                           @"definition":@"\rIn the Old Testament, El is referred to throughout the patriarchal sagas. See “Beth-El” in the Old Testament category of Pins on the Maps tab.\r\rFurther Reference:\rWikipedia, “El”\rhttp://tinyurl.com/3r98q89",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elohim",
                           @"twitterDef":@"the Hebrew word meaning\r“gods”, “God”, or “angels”",
                           @"definition":@"\rThe plural of “El”, “Elohim” can refer to the gods of particular peoples, such as the “Elohim of Babylon”, but came to be used as a singular term referring to the God of Israel, with accompanying singular verbs and adjectives, seemingly accompanying the rise of monotheism among the Israelites. In later Biblical usage it can also refer to “heavenly beings” such as angels.\r\rHebrew, אֱלֹהִים (elohim)\r\rFurther Reference:\rWikipedia, “Elohim”\rhttp://tinyurl.com/yv38ap",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elohist Source",
                           @"twitterDef":@"the literary source (E) in the Torah\rthat favors the northern traditions of Israel",
                           @"definition":@"\rThe “E” source uses “Elohim” as primary reference for God before the Theophany in Exodus 3. It was likely written ca. 900 BCE and favors Moses and the northern tribes of Ephraim and Joseph over Aaron and the southern tribes. It is likely related to the same school of priests responsible for the Deuteronomic Source.\r\rFurther Reference:\rWikipedia, “Elohist Source”\rhttp://tinyurl.com/2axcpau",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epistle",
                           @"twitterDef":@"a letter or note",
                           @"definition":@"\rThe New Testament contains 21 letters written from apostles or apostolic associates, but mostly from Paul. The Apostolic Fathers contain various epistles as well from Ignatius of Antioch, Polycarp, Barnabas, and Diognetus.\r\rFurther Reference:\rWikipedia, “Epistle”\rhttp://tinyurl.com/6h68vhn",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Eros",
                           @"twitterDef":@"the Greek word meaning\r“physical love”",
                           @"definition":@"\rEros is used to refer especially to physical love, or the love that passionately desires to possess.\r\rGreek, ἔρως (eros)\r\rFurther Reference:\rWikipedia, “Eros”\rhttp://tinyurl.com/mw6ea3v",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Etiology",
                           @"twitterDef":@"a traditional story that explains a contemporary situation",
                           @"definition":@"\rThe Old Testament contains numerous etiologies that explain relationships or conditions widely known by the authors' audiences. Genesis 1 contains an etiology of the Sabbath as being rooted in God's resting from creation.\r\rFurther Reference:\rWikipedia, “Etiology“\rhttp://tinyurl.com/yg6hn9",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Evangelist",
                           @"twitterDef":@"a person who spreads good news",
                           @"definition":@"\rThe word “evangelist” can be applied to any person who spreads the good news of Jesus Christ. It is usually reserved for one of the authors of the four Gospels. See “Gospel”.\r\rFurther Reference:\rWikipedia, “Four Evangelists”\rhttp://tinyurl.com/ozctv2",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exegesis",
                           @"twitterDef":@"the process of determining the meaning of a text in its original context",
                           @"definition":@"\rExegesis is a necessary element of hermeneutics. The present meaning of a text cannot be known if its past meaning is not properly understood. Exegesis uses the Historical-Critical Method to perform its essential task. See “Hermeneutics”, “Historical-Critical Method”.\r\rGreek, ἐξήγησις (exegesis) “leading out”\r\rFurther Reference:\rFelix Just S.J., “Biblical Exegeis”\rhttp://tinyurl.com/k3u6rma\r\rInterpretation of the Bible in the Church, III http://tinyurl.com/ymsltv",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exile",
                           @"twitterDef":@"the banishment of the southern kingdom of Judah to Babylon in 587 B.C.",
                           @"definition":@"\rThe Exile was the most traumatic experience in the life of ancient Israel. The prophetic literature and the revised Deuteronomic History claims that it was the result of idolatry and failure to practice social justice. Three major theological developments occured as a result of it - true Monotheism, the character of Satan, and the Resurrection of the Dead. See “Monotheism”, “Satan”, “Resurrection”.\r\rFurther Reference:\rWikipedia, “Babylonian Captivity”\rhttp://tinyurl.com/256xlc",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Exodus",
                           @"twitterDef":@"the liberation of the Israelite slaves from Egypt\runder Moses",
                           @"definition":@"\rThe Exodus is traditionally dated to ca. 1275 BCE in the reign of Ramases II. It is the foundational event of the Israelite nation; current biblical research supports the idea of a small group of slaves leaving Egypt, having a Divine revelation in Midian, and traveling to Canaan. Exodus is also the name of the second book of the Torah.\r\rFurther Reference:\rRichard Elliot Friedman, “The Exodus Based on the Sources”\rhttp://tinyurl.com/ncovf49",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Elementary Experience",
                           @"twitterDef":@"the existential set of needs and evidences\rfor truth, justice, beauty, and goodness",
                           @"definition":@"\rAccording to Fr. Luigi Giussani, the founder of the Communion and Liberation Movement, elementary experience is what drives human civilization and development It is what the Bible describes as the “heart”.\r\rFurther Reference:\rCommunion and Liberation, http://tinyurl.com/q82fzzv",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Ephraim",
                           @"twitterDef":@"a prominent northern Israelite tribe\rdescended from a son of Joseph",
                           @"definition":@"\rEphraim is mentioned in the Bible as being one of the two sons of Joseph. His descendents were alloted a northern central territory in Joshua 16. Its important religious shrines included Shechem, Shiloh, and Bethel. Ephraim became representative of the entire northern kingdom after the divided monarchy.\r\rFurther Reference:\rWikipedia, “Tribe of Ephraim”\rhttp://tinyurl.com/48drdr",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epiphany",
                           @"twitterDef":@"the liturgical celebration of the\rappearance of Jesus to the world",
                           @"definition":@"\rEpiphany is celebrated on January 6 in the Western church.\r\rFurther Reference:\rWikipedia, “Epiphany”\rhttp://tinyurl.com/8rjlf6",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Epistemology",
                           @"twitterDef":@"the study of the origin, nature, and limits of human knowledge",
                           @"definition":@"\rEpistemology is one of the three traditional subjects of Western philosophy. See “Philosophy”\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Epistemology” http://tinyurl.com/pj7qp",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Existentialism",
                           @"twitterDef":@"a philosophical movement centered upon the nature of human existence",
                           @"definition":@"\rAs a philosophical movement which gained popularity in the late 19th century, Existentialism emphasizes the virtue of authenticity as understanding the human situation.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Existentialism”\rhttp://tinyurl.com/2669u6",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Explanandum",
                           @"twitterDef":@"that which is explained by something else",
                           @"definition":@"\rIn the study of Logic, the explanandum is a given phenomenon that can always be explained by something else. It is often the conclusion of a deductive argument, the premises of which, constitute the explanans. See “Explanans”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Scientific Explanation”\rhttp://tinyurl.com/nrkj5bd",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Explanans",
                           @"twitterDef":@"that which explains something else",
                           @"definition":@"\rIn the study of Logic, the explanans always explains a given phenomenon. It is often antecedent to the explanandum in the form of premises, which, when taken in sequence, deductively establishes the explanandum. See “Explanandum”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Scientific Explanation”\rhttp://tinyurl.com/nrkj5bd",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Environmentalism",
                           @"twitterDef":@"the concern for the environment as a matter of social justice",
                           @"definition":@"\rThe movement, which gained popularity in the 1960s in the United States, that emphasizes concern for the environment as a matter of public policy and social justice.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Global Climate Change: A Plea for Dialogue, Prudence, and the Common Good”\rhttp://tinyurl.com/3smna5c",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Eucharistic Adoration",
                           @"twitterDef":@"the act of adoring Christ\rpresent in the Eucharist",
                           @"definition":@"\rThe act of adoring Christ present in the Eucharist.\r\rFurther Reference:\rCatechism of the Catholic Church, 1378\rhttp://tinyurl.com/q6gyoc7",
                           @"category":@"Liturgical"}];
    
    
    
   //////////////////////////////////////////F
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Faith",
                           @"twitterDef":@"trust or confidence;\rthe content of a religious tradition",
                           @"definition":@"\rThe importance of faith is first illustrated in Genesis 15. According to the text, after YHWH promised Abram that he would father many nations, “Abram put his faith in the LORD who attributed it to him as an act of righteousness. Habbakuk 2:4 claims “the righteous will live by faith. Paul uses both of these references in his letter to the Romans, in which he claims that salvation is by “grace through faith”. Jude 1:3 refers to the Faith as “once for all delivered to the Saints”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1814\rhttp://tinyurl.com/pd2yc32",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Fideism",
                           @"twitterDef":@"the reliance of faith rather than reason\rin the search for truth",
                           @"definition":@"\rAn early proponent of Fideism was Tertullian, who famously asked: “What has Athens to do with Jerusalem?” Other early Christian thinkers (such as Origen and Augustine) took a more integrative approach to the Church's use of Philosophy. The Catholic tradition has consistently held that both faith and reason are necessary for human flourishing. Pope John Paul II taught in his encyclical, “Fides et Ratio”:\r\r“Faith and reason are like two wings on which the human spirit rises to the contemplation of truth”.\r\rFideism is popular among certain Protestant churches that are Fundamentalist in belief. See “Faith”, “Fundamentalism”, “Philosophy”.\r\rFurther Reference:\rPope John Paul II, “Fides et Ratio”\rhttp://tinyurl.com/lelwry2",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Fallibilism",
                           @"twitterDef":@"the idea that humans can have inaccurate, yet justified beliefs about the world",
                           @"definition":@"\rFallibilism is evidenced in theology when new scientific discoveries mandate a new interpretation of the Biblical text, even though the previous interpretation was justified based on the available data.\r\rFurther Reference:\rInternet Ecyclopedia of Philosophy, “Fallibilism”\rhttp://tinyurl.com/q6we5fk",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Filioque",
                           @"twitterDef":@"a Latin phrase added to the Nicene Creed meaning\r“and the Son”",
                           @"definition":@"\rThe Filioque phrase dates to the Patristic era. It is found in the writings of Augustine of Hippo, Leo the Great, and others. It gradually became a source of contention between the Eastern and Western churches as seen in the Photian and Great Schism. See “Photian Schism”, “Great Schism”.\r\rFurther Reference:\rWikipedia, “Filioque”\rhttp://tinyurl.com/kdzp5pc",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Foreknowledge",
                           @"twitterDef":@"the knowledge future events",
                           @"definition":@"\rAs a characteristic of God, foreknowledge features prominently in post-Exilic Hebrew literature and in the New Testament. It reflects a more developed period in Israelite theology from that of the Yahwist Source, which presents a highly anthropomorphic portrayal of God. Associated philosophical problems include constraints on Free Will and the Problem of Evil. See “Free Will”, “Problem of Evil”.\r\rFurther Reference:\rCatechism of the Catholic Church, 600\rhttp://tinyurl.com/p3dfabj\r\rStanford Encylopedia of Philosophy, “Foreknowledge and Free Will”\r http://tinyurl.com/g8eze",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Free Will",
                           @"twitterDef":@"the ability to freely make a rational choice",
                           @"definition":@"\rFree will has traditionally been interpreted as a characteristic of human nature being made in the Image of God. The degree of freedom of the will is a factor in analyzing the morality of certain acts. Impediments (both virtual and habitual) can mitigate both responsibility and morality of human actions.\r\rFurther Reference:\rCatechism of the Catholic Church, 1731\rhttp://tinyurl.com/qzj6nl9",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Folio",
                           @"twitterDef":@"a page within a manuscript",
                           @"definition":@"\rIn textual criticism, folios are sometimes all that remains of a larger manuscript. See “Textual Criticism”.\r\rFurther Reference:\rWikipedia, “Folio”\rhttp://tinyurl.com/37amz3t",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Formal Eqivalence",
                           @"twitterDef":@"a translation philosophy that seeks to render the text word for word",
                           @"definition":@"\rThe New American Bible Revised Edition is a translation based on Formal Equivalence. The 2011 English translation of the Mass is also based on formal equivalence, sometimes resulting in odd sentence structure as Latin syntax works differently than that of English.\r\rFurther Reference:\r\rFelix Just, S.J., “English Translations of the Bible” http://tinyurl.com/qhfucxz\r\rWikipedia, “Dynamic and Formal Equivalence” http://tinyurl.com/lwylgtu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Form Criticism",
                           @"twitterDef":@"the analysis of the\rgenre or literary form of a text",
                           @"definition":@"\rForm Criticism is mentioned as necessary to proper exegesis in Vatican II's Dogmatic Constitution on Divine Revelation, “Dei Verbum”:\r\r“To search out the intention of the sacred writers, attention should be given, among other things, to 'literary forms'. For truth is set forth and expressed differently in texts which are variously historical, prophetic, poetic, or of other forms of discourse.”\r\rForm Criticism is one of the criticisms used by the Historical-Critical Method. See “Dei Verbum”, “Exegesis”, “Historical-Critical Method”.\r\rFurther Reference:\rVatican II, “Dei Verbum”, III.12\rhttp://tinyurl.com/3ecxu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Fundamentalism",
                           @"twitterDef":@"a fundamenalist method that exclusively uses a literalist criteron for interpretation",
                           @"definition":@"\rIn addition to describing a particular hermeneutical method, fundamentalism also refers to an anti-modern movement which emerged in American Protestantism in the late 19th century which is characterized more than anything else by the viewpoint that Scripture is Divinely Inspired and as such inerrant in all ways including historical and “scientific” - named for its self-proclaimed stress on the “fundamentals” of the Christian faith. This approach to a sacred text also extends to Judaism, Islam, and other religions. The term can also refer to a strict adherence to a given viewpoint.\r\rFurther Reference:\rWikipedia, “Fundamentalism”\rhttp://tinyurl.com/2xvbkc",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Fundamental Option",
                           @"twitterDef":@"a person's basic, spiritual orientation",
                           @"definition":@"\rThe German theologian Karl Rahner was the first to develop this concept. He taught that what the Catholic tradition has termed “mortal sin” can be understood as setting one's Fundamental Option against God. Pope John Paul II taught, in his encyclical “Veritatis Splendor”, that the Fundamental Option is always incarnated in particular human acts. Thus, one cannot commit grave sin without simultaneously engaging his Fundamental Option against God.\r\rFurther Reference:\rCatechism of the Catholic Church, 847\rhttp://tinyurl.com/oupb5",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Feminism",
                           @"twitterDef":@"the movement that seeks female liberation from patriarchal structures and norms",
                           @"definition":@"\rFeminism was widely influential in the twentieth century, and has raised a new awareness of women's concerns in hermeneutics.\r\rFurther Reference:\rWikipedia, “Feminism”\rhttp://tinyurl.com/mdu3o",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Fraction",
                           @"twitterDef":@"the breaking of consecrated bread\rfor the distrubution of Holy Communion",
                           @"definition":@"\rThe Fraction symbolizes Christ's body given up for the salvation of the world.\r\rFurther Reference:\rCongregation for Divine Worship and Discipline of the Sacraments, “General Instruction of the Roman Missal”, 83\rhttp://tinyurl.com/kmepha",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Forgiveness of Sins",
                           @"twitterDef":@"the nullification of offence or injury;\rthe primary effect of Baptism",
                           @"definition":@"\rForgiveness has many nuances. The Greek root ἄφεσις (aphesis) means “leave behind” and is also used to describe Jesus' exit from a town. In the Gospel of Luke, Jesus makes forgiveness of a brother conditional upon repentance, while he asks God to forgive those responsible for his crucifixion since they “know not what they do”. In the Nicene-Constantinopolitan Creed, Baptism is linked to the Forgiveness of Sins. See “Baptism”, “Nicene-Constantiopolitan Creed”.\r\rFurther Reference:\rCatechism of the Catholic Church, 977\rhttp://tinyurl.com/kd44r5d",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Form",
                           @"twitterDef":@"the words used in a Sacrament",
                           @"definition":@"\rAccording to the Catechism of the Council of Trent, the form of a Sacrament is one of its constituent parts. The form of a Sacrament is the word, which, when joined to the matter and intention, constitute a valid sacrament.\r\rFurther Reference:\rCatechism of the Council of Trent, Part II\rhttp://tinyurl.com/lcfwkhy",
                           @"category":@"Systematic"}];
    /*
    [TAWord wordWithDict:@{@"name":@"Franciscan",
                           @"twitterDef":@"a member of the order\rfounded by St. Francis of Assisi",
                           @"definition":@"\rThe order of Franciscans was formally recognized by Pope Honorius III\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
     */
    
    //G
    
    [TAWord wordWithDict:@{@"name":@"Grace",
                           @"twitterDef":@"unmerited Divine help\rto fulfill the Christian vocation",
                           @"definition":@"\rSacraments are the ordinary means of Grace. According to Thomas Aquinas, Grace can be either sanctifying or habitual.\r\rFurther Reference:\rCatechism of the Catholic Church, 1996\rhttp://tinyurl.com/yaua7cc",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Great Schism",
                           @"twitterDef":@"the schism between the\rEastern and Western churches in A.D. 1054",
                           @"definition":@"\rThe Great Schism was the result of a long period of estrangement between the Latin West and Greek East. Amongst the causes of the formal schism was the Filioque convtroversy. See “Filioque”.\r\rFurther Reference:\rWikipedia, “East-West Schism”\rhttp://tinyurl.com/8tyom4d",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gehenna",
                           @"twitterDef":@"a valley near Jerusalem in which devotees would sacrifice children to Molech in fire",
                           @"definition":@"\rGehenna (the Valley of Ben-Hinnom) seems to have become known as a place of the destruction of the wicked in Jewish folklore (a source which claims that it was a burning trash heap or garbage dump is disputed). It is used by Jesus to refer to a place where those who opposed the will of God would go. Thus, it came to be synonymous with “hell”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1034\rhttp://tinyurl.com/l9ha57h\r\rWikipedia, “Gehenna”\rhttp://tinyurl.com/ymbj2d",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Genre",
                           @"twitterDef":@"the literary form of a text",
                           @"definition":@"\rA French word referring to the literary form of a text. According to Dei Verbum, examination of the literary form of the text is essential for a proper interpretation. See “Form Critcism”.\r\rFurther Reference:\rWikipedia, “Genre” http://tinyurl.com/gsh83",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gnosticism",
                           @"twitterDef":@"a heretical Christian sect that\rtaught salvation through esoteric knowledge",
                           @"definition":@"\rGnosticism flourished in the second and third centuries. As a dualistic philosophy, it claimed that the material world was evil and the spirit was the only good. Various versions of Gnosticism were prevalent during the Ante-Nicene era. Irenaeus of Lyons directed his work, Against Heresies, to the Gnosticism of his day. See “Ante-Nicene Fathers” in the Fathers section of the Links tab.\r\rGreek, γνῶσις (gnosis) “knowledge”.\r\rFurther Reference:\rInternet Encyclopedia of Philosophy, “Gnosticism”\rhttp://tinyurl.com/7fw4t3w",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gospel",
                           @"twitterDef":@"the good news of and about Jesus of Narareth\rconcerning God, Israel, and the world",
                           @"definition":@"\rThe concept of the gospel first appears Isaiah 52:7, where it is connected to the good news that Israel's God is King:\r\r“How beautiful upon the mountains are the feet of the one bringing good news, announcing peace, bearing good news, announcing salvation, saying to Zion, 'Your God is King!'”\r\rNew Testament writers such as Paul use it to refer to the message about Jesus as Messiah. Later, it became a term for one of the four canonical written accounts of the life and ministry of Jesus (Matthew, Mark, Luke, and John). The synoptic gospels of Matthew, Mark, and Luke use it to refer to Jesus' message about the Kingdom of God. It was also used by Roman authors to describe the events surrounding the Emperor of Rome.\r\rGreek, εὐαγγέλιον (evangelion) “good news”\r\rFurther Reference:\rCatechism of the Catholic Church, 75\rhttp://tinyurl.com/bx8mnlu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gloria Patri",
                           @"twitterDef":@"a doxology to the Trinity in Latin",
                           @"definition":@"\r“Glory to the Father, and to the Son, and to the Holy Spirit, as it was in the beginning, is now, and ever shall be world without end. Amen.”\r\rFurther Reference:\rAdoremus, Latin Prayers\rhttp://tinyurl.com/pv5cjvr",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Glossolalia",
                           @"twitterDef":@"the speaking in new languages\rinspired by the Holy Spirit",
                           @"definition":@"\rAccording to Paul in 1 Corinthians 14, glossolalia was a spiritual gift manifested in liturgical worship. While not denying its validity, he encouraged a disciplined practice only if accompanied by a translation.\r\rFurther Reference:\rWikipedia, “Glossolalia”\rhttp://tinyurl.com/c2f7g",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"God of the Gaps",
                           @"twitterDef":@"the belief that any scientific unknowns\rare necessarily evidence of God's influence ",
                           @"definition":@"\rThis phrase is used to describe the beliefs of those who misunderstand the different domains, methods, and explanations of Theology and Science. They mistake the absence of scientific explanation for proof of a theological claim.\r\rFurther Reference:\rWikipedia, “God of the Gaps”\rhttp://tinyurl.com/7nv36",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Good Friday",
                           @"twitterDef":@"the liturigcal memorial of\rthe crucifixion of Jesus",
                           @"definition":@"\rGood Friday is the day of the Crucifixion and is part of the Triduum. See “Triduum”.\r\rFurther Reference:\rWikipedia, Good Friday”\rhttp://tinyurl.com/blzzm",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Greek Orthodox",
                           @"twitterDef":@"the Eastern churches in communion with\rthe Patriarch of Constantinople",
                           @"definition":@"\rThe Greek Orthodox Church is the communion of churches under the authority of the Patriarch of Constantinople which split from the Catholic Church in 1054. Pope John Paul II called it the “second lung” of the Universal Church. Throughout history, various efforts have been made at reunion with the East. See “Great Schism”.\r\rFurther Reference:\rWikipedia, Beneficence\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Gregorian Chant",
                           @"twitterDef":@"plainsong liturgical chant associated\rwith Pope Gregory I",
                           @"definition":@"\rGregorian Chant is characterized by a simple rhythm. The bishops of Vatican II taught that it should be given priority in liturgical services.\r\rFurther Reference:\rVatican II, “Sacrosanctum Concilium”, 116\rhttp://tinyurl.com/ay8y",
                           @"category":@"Liturgical"}];
    
    
    /////////////////////////H
    
    [TAWord wordWithDict:@{@"name":@"Habit",
                           @"twitterDef":@"a pattern of action acquired through repetition",
                           @"definition":@"\rAncient Greek philosophers identified the phenomenon and influence of habits on human behavior. Habits can mitigate the moral culpability of human acts. St. Thomas Aquinas described theological habits as being necessary for authentic theology. The British theologian, Aidan Nichols, has identified three characteristics of intellectual habits: argumentation, retention, and imagination. These three, in addition to the dimension of faith, are necessary for the study of theology.\rFurther Reference:\rWikipedia, “Habit”\rhttp://tinyurl.com/ygop72e",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hail Mary",
                           @"twitterDef":@"an invocation to the Blessed Virgin Mary\rfor her intercession",
                           @"definition":@"\rThe Haily Mary is a prayer based on the angel Gabriel's message to Mary in the Gospel of Luke:\r\r“Hail Mary, full of grace, the Lord is with thee! Blessed art thou among women, and blessed is the fruit of thy womb, Jesus. Holy Mary, Mother of God, pray for us sinners, now and at the hour of our death. Amen.”\r\rFurther Reference:\rCatechism of the Catholic Church, 2676\rhttp://tinyurl.com/k5r7clc",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hebrew",
                           @"twitterDef":@"the Semitic language of ancient Israel",
                           @"definition":@"\rThe original language of the Old Testament, with a few portions written in Aramaic.\r\rFurther Reference:\rWikipedia, “Hebrew”\rhttp://tinyurl.com/m9y9d",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Heart",
                           @"twitterDef":@"the biblical word for the needs and desires\rof human nature",
                           @"definition":@"\rAccording to the late Msgr. Luigi Guissani, what the Bible calls the “heart”, is a shorthand reference to the larger set of needs and desires of human nature; truth, goodness, beauty, and justice. Before being elected Pope, Cardinal Bergoglio claimed that most urgent task for faith today is uncovering the true desires and needs of the heart. See “Elementary Experience”.\r\rFurther Reference:\rJorge Mario Bergolgio, “For Man” in “A Generative Thought: An Introduction to the Works of Luigi Giussani”\rhttp://tinyurl.com/pkk5k6m",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hallelujah",
                           @"twitterDef":@"a Hebrew word meaning\r“Praise YHWH”",
                           @"definition":@"\rHallelujah occurs frequently throughout the Old Testament, especially in the Psalms.\r\rHebrew, הַלְּלוּיָהּ (halleluya)\r\rFurther Reference:\rWikipedia, “Hallelujah”\rhttp://tinyurl.com/5gctqe",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Heaven",
                           @"twitterDef":@"the state of complete union with God",
                           @"definition":@"\rHeaven is the state of those who willingly accept God's love for eternity.\r\rFurther Reference:\rCatechism of the Catholic Church, 1021\rhttp://tinyurl.com/k3f2f8p",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hell",
                           @"twitterDef":@"the state of complete separation from God",
                           @"definition":@"\rHell is the state of those who willingly refuse God's love for eternity.\r\rFurther Reference:\rCatechism of the Catholic Church, 1033\rhttp://tinyurl.com/k3f2f8p",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Henotheism",
                           @"twitterDef":@"the belief that many gods exist while only one is served",
                           @"definition":@"\rThe pre-exilic Israelites believed that foreign gods were real, but they only had a covenant with YHWH.\r\rFurther Reference:\rWikipedia, “Henotheism”\rhttp://tinyurl.com/chgvyn",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Heresy",
                           @"twitterDef":@"the formal denial of revealed truth",
                           @"definition":@"\rThe formal contradiction of orthodox belief.\r\rFurther Reference:\rCatechism of the Catholic Church, 2089\rhttp://tinyurl.com/lu75a9k",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hesychasm",
                           @"twitterDef":@"a silent form of prayer\rassociated with Eastern Orthodox monks",
                           @"definition":@"\rHesychasm is a mystical form of prayer with an emphasis on silence and the quieting of the physical senses in order to focus on the sense of the soul.\r\rGreek, ἡσυχία (hesychia) “silence”\r\rFurther Reference:\rWikipedia, “Hesychasm”\rhttp://tinyurl.com/5s5joa",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Theology",
                           @"twitterDef":@"the study of theology in light of historical periods, events, people, or trends",
                           @"definition":@"\rOver the last 100 years, Historical Theology has become a sub-discipline of Theology. It is usually divided into various periods in Church history:\r\rPatristic\rMedieval\rByzantine\rReformation\rModern\r\rFurther Reference:\rHistorical Theology Online\rhttp://tinyurl.com/pdverjl",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Hinduism",
                           @"twitterDef":@"the dominant polytheistic religion of India\rthat holds Brahman as the Divine Absolute",
                           @"definition":@"\rHinduism is the world's oldest recognized and third largest religion. It is characterized by a belief in the inspiration of the Vedas, reincarnation, and a Supreme Being known as Brahman.\r\rFurther Reference:\rWikipedia, “Hinduism”\rhttp://tinyurl.com/6ufnx",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Jesus",
                           @"twitterDef":@"the historical figure of Jesus\ras reconstructed by historical methodology",
                           @"definition":@"\rThe historical Jesus is a term that emphasizes what can be known about Jesus of Nazareth from historical methodology apart from theological belief. The so-called Quest for the Historical Jesus is a phrase invented by Albert Schweitzer, based on his book of the same name. There have been 3 quests over the last 200 years, with each period producing successive consensus claims.\r\rFurther Reference:\rRobert Funk, “Milestones in the Quest for the Historical Jesus”\rhttp://tinyurl.com/npp6tfr",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hierarchy of Truths",
                           @"twitterDef":@"the relative degrees of importance\rbetween various truths of the faith",
                           @"definition":@"\rThe notion of the Hierarchy of Truths is a recognition that some doctrines are more foundational to Christian identity than others.\r\rFurther Reference:\rVatican II, Decree on Ecumenism, 11\rhttp://tinyurl.com/3xnyh",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Human Rights",
                           @"twitterDef":@"the rights due to a person by virtue of his or her being a human being",
                           @"definition":@"\rA list of thirty human rights are enumerated in the United Nations Universal Declaration of Human Rights. Pope John XXIII was the first Pope to give them ecclesial sanction.\r\rFurther Reference:\rCompendium of the Social Doctrine of the Church, 152 http://tinyurl.com/qfo6bd7",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Hermeneutics",
                           @"twitterDef":@"the science of interpretation",
                           @"definition":@"\rProper understanding of the meaning of a text it the present (hermeneutics) requires proper understanding of the meaning of a text in its original context (exegesis). According to the Pontifical Biblical Commission, the Historical-Critical Method is the exegetical method that is essential for proper interpretation. The Greek root of “hermeneutics” is named after Heremes, the messenger of the gods in Greek mythology. See “Exegesis”, “Historical-Critical Method”.\r\rGreek, ἑρμηνεία (hermeneia) “interpretation”\r\rFurther Reference:\rInterpretation of the Bible in the Church, III http://tinyurl.com/ymsltv",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Hermeneutical Circle",
                           @"twitterDef":@"the dialectic relationship between\rtext and interpreter",
                           @"definition":@"\rThe hermeneutical circle begins with an interpreter and a text involved in a process of question, discovery, interpretation, which then challenges or changes the initial question.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Hermeneutics”\rhttp://tinyurl.com/mylef6",
                           @"category":@"Systematic"}];
    

    
    [TAWord wordWithDict:@{@"name":@"Historical Books",
                           @"twitterDef":@"the second of four divisions within the Old Testament",
                           @"definition":@"\rThe second of four divisions within the Old Testament; contains 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, Nehemiah, Tobit, Judith, Esther, 1 & 2 Maccabees.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical-Critical Method",
                           @"twitterDef":@"the hermeneutical method which examines the author's intent through exegetical analysis",
                           @"definition":@"\rThe hermeneutical method which seeks to uncover the intention of the author through exegetical analysis of history, language, literature, sources, and culture. According to the Pontifical Biblical Commission, it is the one essential method for Catholic hermeneutics.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, I.A”, http://tinyurl.com/2gb5dm",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Historical Criticism",
                           @"twitterDef":@"the analysis of the\rhistorical context of a text",
                           @"definition":@"\rThe type of exegetical criticism which deciphers and analyzes the historical context of a text.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church, I.A.2”, http://tinyurl.com/2gb5dm",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy",
                           @"twitterDef":@"set apart from the ordinary;\rsacred",
                           @"definition":@"\rGod is characterized as holy throughout the Catholic tradition. In the Scriptures, YHWH declares himself to be worshipped with the refrain “Holy, Holy, Holy” (Isaiah 6:3). Jesus is referred to as the Holy One (Acts 3:14). The Blessed Virgin Mary is referred to as the panhagia (all-holy). Holiness is one of the four marks of the Church.\r\rFurther Reference:\rWikipedia, “Sacred”\rhttp://tinyurl.com/pl9q2zh",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy of Holies",
                           @"twitterDef":@"the innermmost chamber in the Temple\rthat housed the Ark of the Covenant",
                           @"definition":@"\rThe Holy of Holies was the permanent resting place for the Ark of the Covenant, believed to reside in the Temple from the monarchy of Solomon until the Exile in 587 BCE. Only the High Priest was allowed to enter it once a year on the Day of Atonement. See “Day of Atonement”.\r\rFurther Reference:\rEncyclopedia Britannica, “Holy of Holies”\rhttp://tinyurl.com/lcagxrw",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Orders",
                           @"twitterDef":@"the Sacrament of Ordination\rto Apostolic ministry",
                           @"definition":@"\rThere are three degrees of Holy Orders: episcopate, presbyterate, and diaconate. See “Bishop”, “Priest”, “Deacon”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1536\rhttp://tinyurl.com/4hs6lso",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Saturday",
                           @"twitterDef":@"the liturgical memorial of\rChrist's descent into the underworld",
                           @"definition":@"\rThe Apostle's Creed states that Christ descended into “hell”. The Latin edition of the Creed uses infero (“those below”), while the original Greek of the Creed uses the word κατώτατα (“the lowest”) to refer to the place where Christ descended.\r\rFurther Reference:\rWikipedia, “Holy Saturday”\rhttp://tinyurl.com/56wj2x",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Holy Spirit",
                           @"twitterDef":@"the third person of the Trinity",
                           @"definition":@"\rThe Spirit (or breath) of God is the animating principle of creation in the Genesis creation accounts (Gen 1:1, 2:7). The Spirit of God is that which causes Moses and other prophets to utter divine oracles (Num. 11:29). The Spirit of God descends upon Jesus at his Baptism (Mark 1:10) and enables him to preform exorcisms ( Matt. 12:28). It is the promised advocate (John 14:6) given as a gift (Acts 2:38) to those who confess Jesus as Lord (1 Cor. 12:3).\r\rFurther Reference:\rCatechism of the Catholic Church, 691\rhttp://tinyurl.com/nhrp9uj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Holy Water",
                           @"twitterDef":@"the Sacramental of water\rthat signifies Baptism",
                           @"definition":@"\rHoly Water is sprinkled on worshippers during the Easter Vigil and usually available at various stations in a church building. See “Baptism”, “Sacramental”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1668\rhttp://tinyurl.com/oo3cp5p",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Homily",
                           @"twitterDef":@"a discourse based on the mysteries of faith\rand Christian life suited to the congregation",
                           @"definition":@"\rHomilies are present with Scripture itself (Luke 6, Acts 4) and always serve to build up the Church. The Homily should be based on the readings and the prayers from Lectionary.\r\rFurther Reference:\rCongregation for Divine Worship and Discipline of the Sacraments, “Homiletic Directory”\rhttp://tinyurl.com/oreb9lc",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Homoiousios",
                           @"twitterDef":@"the Greek word meaning\r“of similar substance”",
                           @"definition":@"\rThis word was used by Arius and pro-Arian bishops at Nicea to describe the relationship of the Son to the Father.\r\rGreek, ὁμοιούσιος (homoiousios)\r\rFurther Reference:\rWikipedia, “Homoiousios”\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Historical"}];

    
    [TAWord wordWithDict:@{@"name":@"Homoousios",
                           @"twitterDef":@"the Greek word meaning\r“of the same substance”",
                           @"definition":@"\rHomoousios was one of the terms used by Athanasius and other like-minded bishops at Nicea to explain the relationship of the Son to the Father.\r\rGreek, ὁμοούσιος (homoousios)\r\rFurther Reference:\rCatechism of the Catholic Church, 465\rhttp://tinyurl.com/37wuaux",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Host",
                           @"twitterDef":@"the bread reserved for Eucharistic consecration",
                           @"definition":@"\rThe Host is made of unleavened bread in the Western liturgical tradtion, while the East has historically used leavened bread. It is placed on a Paten when on the Altar. See “Altar”, “Eucharist”, “Paten”.\r\rFurther Reference:\rNew Advent, “Host”\rhttp://tinyurl.com/7p5tg75",
                           @"category":@"Liturgical"}];

    
    [TAWord wordWithDict:@{@"name":@"Human Ecology",
                           @"twitterDef":@"the environmental context of the human person in light of the truths of Creation",
                           @"definition":@"\rThe environmental context of the human person in light of the truths of Creation and the challenges posed by climate change and other developmental factors in which justice is neglected. Pope Francis has made the subject of human ecology a theme of his latest encyclical.\r\rFurther Reference:\rwww.vatican.va/....",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Human Person",
                           @"twitterDef":@"a human being with the capacity\rfor self-transcendence",
                           @"definition":@"\rAccording to the teaching of the Church, human beings are also human persons from the moment of conception. Disputed questions include the pheneomenon of twinning and the problems associated with dualism.\r\rFurther Reference:\rCatechism of the Catholic Church, 2270\rhttp://tinyurl.com/dh7r",
                           @"category":@"Systematic"}];
    
    
    
    
    ////////////////////////////////////////////////////////////I
    
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Icon",
                           @"twitterDef":@"a religious image used for veneration",
                           @"definition":@"\rIcons were approved for use in worship after the Iconoclasm controversy, settled at Nicea II, the seventh ecumenical council, in A.D. 787. See “Iconoclasm”. See “Nicea” in the Historical section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, 1159\rhttp://tinyurl.com/oa9lfkj",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Immanuel",
                           @"twitterDef":@"a Hebrew word meaning “God is with us”\rapplied to Jesus in the Gospel of Matthew",
                           @"definition":@"\rThis word is used as a name for the child (likely Hezekiah) born as a sign to King Ahaz in Isaiah 7:14 that the northern alliance between Assyria and Israel will not defeat Judah. The author of the gospel of Matthew uses it as a typology of the birth of Jesus.\r\rHebrew, עִמָּנוּאֵל (immanuel)\r\rFurther Reference:\rWikipedia, “Immanuel”\rhttp://tinyurl.com/lebacy",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Iconoclasm",
                           @"twitterDef":@"the prohibition against the veneration of Icons",
                           @"definition":@"\rIconoclasm was based on the injunction given in the first Commandment:\r\r“You shall not make for yourself a graven image.”\r\rProponents of icons argued that the Incarnation had introduced a new economy of images, since the Image of God Himself, had become visible. Iconoclasm was anathematized at Nicea II, the seventh ecumenical council, in A.D. 787.\r\rFurther Reference:\rCatechism of the Catholic Church, 2131\rhttp://tinyurl.com/lu75a9k",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Incarnation",
                           @"twitterDef":@"the uniting of the eternal Son of God\rto a human nature",
                           @"definition":@"\rThe Incarnation is described directly in John 1:14:\r\r“And the Word was made flesh and dwelt among us.”\r\rThe Church teaches that in the Incarnation, God became human so that humanity could become divinized. See “Chalcedonian Definition”, “Theosis”.\r\rFurther Reference:\rCatechism of the Catholic Church, 461\rhttp://tinyurl.com/37wuaux",
                           @"category":@"Systematic"}];

    [TAWord wordWithDict:@{@"name":@"Immaculate Conception",
                           @"twitterDef":@"the dogma that the Virgin Mary was\r conceived without the effects of Original Sin",
                           @"definition":@"\rThe dogma of the Immaculate Conception emaphsizes the pre-eminent role of the Blessed Virgin Mary in Salvation History. See “Dogma”, “Original Sin”, “Salvation History”.\r\rFurther Reference:\rCatechism of the Catholic Church, 491\rhttp://tinyurl.com/3w9q9aw",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Infallibility",
                           @"twitterDef":@"the supernatural guarantee that the Church\rcannot err in teaching revealed truth",
                           @"definition":@"\rInfallibility is exercised in three ways:\r\r-by the consent of the Faithful\r-by the Bishops together with the Pope\r-by the Pope ex cathedra\r\rFurther Reference:\rWikipedia, “Infallibility of the Church”\rhttp://tinyurl.com/n58unch",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Intercession",
                           @"twitterDef":@"a type of prayer on behalf of others",
                           @"definition":@"\rIntercessory prayers are mentioned specifically in 1 Tim. 2:1. Jesus interceded for his enemies on the Cross.\r\rFurther Reference:\rCatechism of the Catholic Church, 2634\rhttp://tinyurl.com/jwoavzg",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Invitatory Psalm",
                           @"twitterDef":@"the psalm said either before the\rOffice of Readings or Morning Prayer",
                           @"definition":@"\rthe Invitatory Psalm is often said as an antiphon. See Morning Prayer.\r\rFurther Reference:\rWikipedia, “Invitatory”\rhttp://tinyurl.com/lvw8sht",
                           @"category":@"Liturgical"}];


    [TAWord wordWithDict:@{@"name":@"Impediment",
                           @"twitterDef":@"a hiderance to humna freedom;\ractual or habitual",
                           @"definition":@"\rActual impediments are those found in the situation of the subject. Virtual impediments are those found within the character of the subject.\r\rFurther Reference:\rJames P. Hannigan, “As I Have Loved You: The Challenge of Christian Ethics”, 54-55 http://tinyurl.com/npm2vvg",
                           @"category":@"Moral"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Immanence",
                           @"twitterDef":@"the quality of being within human experience",
                           @"definition":@"\rThe Yahwist Source, more than any other literary source in the Torah, portrays God as immanent due to its prevalent use of anthropomorphism. See “Yahwist Source”, “Anthropomorphism”.\r\rFurther Reference:\rCatechism of the Catholic Church, 239\rhttp://tinyurl.com/4tymjt",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Idolatry",
                           @"twitterDef":@"the bestowal of ultimate value on that which is not ultimate",
                           @"definition":@"\rPope Francis has repeatedly condemned the idolatry of money, prevalent in wealthy nations.\r\rFurther Reference:\rCatechism of the Catholic Church, 2113\rhttp://tinyurl.com/lu75a9k",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Inclusivism",
                           @"twitterDef":@"the belief that those who respond to the truth they have receieved will experience salvation",
                           @"definition":@"\rInclusivism is a soteriology developed by Karl Rahner in the mid-twentieth century. He claimed that all people possess a fundamental option for or against God. See “Fundamental Option”.\r\rFurther Reference:\rCatechism of the Catholic Church, 847\rhttp://tinyurl.com/oupb5",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Inspiration",
                           @"twitterDef":@"that which provides the “breath of life”\ror motivation behind a course of action",
                           @"definition":@"\rDivine Inspiration is understood to mean that God has provided the “breath of life” or motivation for a course of action - from the Latin word for both “spirit” and “breath”.\r\rFurther Reference:\rVatican II, Dei Verbum, 11\rhttp://tinyurl.com/3ecxu",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Interpretation",
                           @"twitterDef":@"the process of determining the meaning,\rsignificance, and relevance of a text",
                           @"definition":@"\rInterpretation of any text, especially the Bible, requires knowing the context of the writing. This, in turn, requires efforts to know the author's intent, which is partly discerned by studying the text's literary form. See “Exegesis”, “Hermeneutics”, “Sitz Em Laben“.\r\rFurther Reference:\rPontifical Biblical Commission, “The Interpretation of the Bible in the Church”\rhttp://tinyurl.com/2gb5dm",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Israel",
                           @"twitterDef":@"the Hebrew name given to Jacob meaning\r“struggles with God”",
                           @"definition":@"\rAccording to the stories in Genesis, Jacob was the son of Isaac and father of twelve sons whose decendants became the twelve tribes of Israel.\r\rHebrew, יִשְׂרָאֵל (yisrael)\r\rFurther Reference:\rCatechism of the Catholic Church, 62\rhttp://tinyurl.com/pesbbq3",
                           @"category":@"Biblical"}];
    
    
    
    //////////////////////////////J
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Jesus of Nazareth",
                           @"twitterDef":@"the first-century Jewish prophet who proclaimed the Kingdom of God",
                           @"definition":@"\rThe first-century Jewish prophet who proclaimed the Kingdom of God, was executed by the Roman govenor Pontius Pilate, and whom the early Christians believed to raised from dead as the Christ and Son of God.\r\rFurther Reference:\rCatechism of the Catholic Church, 423\rhttp://tinyurl.com/m2a65kl",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Justification",
                           @"twitterDef":@"the act of being put into a just relationship",
                           @"definition":@"\rPaul uses this legal term to describe those who have faith in Jesus Christ.\r\rFurther Reference:\rCatechism of the Catholic Church, 1990\rhttp://tinyurl.com/yaua7cc",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Justice",
                           @"twitterDef":@"the state of right relationships between individuals and groups in society",
                           @"definition":@"\rAccording the Social Doctrine of the Church, there are three aspects to Justice: Commutatitve, Contributive, and Distributive.\r\rFurther Reference:\rCatechism of the Catholic Church, 1807\rhttp://tinyurl.com/pd2yc32",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Jus Ad Bellum",
                           @"twitterDef":@"a set of criteria used to determine if war is justified in a given situation",
                           @"definition":@"\rJus Ad Bellum criteria include: just cause, comparative justice, competent authority, right intention, probability of success, last resort, proportionality. See “Just War Theory”.\r\rLatin, “justice to war” \r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “War” http://tinyurl.com/84c2ppg",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Jus Im Bello",
                           @"twitterDef":@"a set of criteria used to determine if the methods of war are justified",
                           @"definition":@"\rJus Im Bello criteria include: distinction, proportionality, military necessity; see “Just War Theory”.\r\rLatin, “justice in war”\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “War” http://tinyurl.com/84c2ppg",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Just War Theory",
                           @"twitterDef":@"the set of criteria for determining the justice of both the conditions and methods of war",
                           @"definition":@"\rThe theory first developed by Augustine and later refined by Aquinas which consists of criteria for determining the justice of both the conditions and methods of war; see “Jus Ad Bellum” and “Jus Im Bello”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2309\rhttp://tinyurl.com/dh7r\r\rStanford Encyclopedia of Philosophy, “War” http://tinyurl.com/84c2ppg",
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
                           @"definition":@"\rThe term “Jew” became synonymous with “Israelite” after the Exile, in part, because most of the captives from the southern kingdom were from the tribe of Judah. See “Exile”.\r\rFurther Reference:\rWikipedia, “Jew”\rhttp://tinyurl.com/dh7r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Jubilee",
                           @"twitterDef":@"a year dedicated to the\rforgiveness of debts and liberation of property",
                           @"definition":@"\rThe biblical description of Jubilee is found in Levicticus 25:8-13. Every 50th year was to be a Jubilee year in which slaves were freed, debts were forgiven, and land was not sowed or plowed in order to replenish the soil.\r\rFurther Reference:\rVatican, “What Is A Holy Year?”\rhttp://tinyurl.com/4urhj",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Judah",
                           @"twitterDef":@"the fourth son and tribe of Israel;\rthe southern Israelite kingdom",
                           @"definition":@"\rThe tribe of Judah enjoyed a priviledged status during the united monarchy, especially under Solomon. Judah was exempt from his policies of taxation and forced labor. Captives from the kingdom of Judah were taken to Babylon during the Exile in 587 B.C. See “Jew”, “Exile”.\r\rFurther Reference:\rWikipedia, “Judah”\rhttp://tinyurl.com/k7mdc7y",
                           @"category":@"Biblical"}];
    
    /////////////////////////////////K
    
    [TAWord wordWithDict:@{@"name":@"Kataphatic",
                           @"twitterDef":@"language which makes postiive claims about God",
                           @"definition":@"\rKataphatic theology emphasizes the idea that God can be known through Revelation. See “Revelation”.\r\rFurther Reference:\rWikipedia, “Kataphatic”\rhttp://tinyurl.com/lghxwjd",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Kenosis",
                           @"twitterDef":@"a Greek word meaning\r“the process of emptying”",
                           @"definition":@"\rPaul uses the root of this word in his letter to the Philippians to describe the self-sacrifice of Jesus.\r\rFurther Reference:\rCatechism of the Catholic Church, 472\rhttp://tinyurl.com/37wuaux",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ketuv'im",
                           @"twitterDef":@"the Hebrew word meaning\r“writings”",
                           @"definition":@"\rThe Ketuv'im is the third of three sections in the Tanak. See “Tanak”.\r\rHebrew, כְּתוּבִים (tanak)\r\rFurther Reference:\rWikipedia, “Ketuv'im”\rhttp://tinyurl.com/6os5ny",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kosher",
                           @"twitterDef":@"foods that are appropriate to eat or sacrifice to YHWH",
                           @"definition":@"\rThe classification of some foods as “kosher” is unique to the Priestly Source. Leviticus 11 gives a detailed list of foods that are considered by the P author to be unclean. See “Priestly Source”.\r\rFurther Reference:\rWikipedia, “Kosher Foods”\rhttp://tinyurl.com/druwv",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kerygma",
                           @"twitterDef":@"a Greek word meaning “proclamation”;\rthe Apostolic proclamation of the Gospel",
                           @"definition":@"\rThe New Testament uses this word to describe the Apostolic proclamation of the the Gospel.\r\rGreek, κήρυγμα (kerygma)\r\rFurther Reference:\rWikipedia, “Kerygma”\rhttp://tinyurl.com/llks24m",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Koinonia",
                           @"twitterDef":@"a Greek word meaning\r“communion” or “participation”",
                           @"definition":@"\rSt. Paul uses this word to describe the spiritual unity that exists between Christians and Christ as well as the spiritual nature of Jesus body and blood made present during the Eucharist. See “Body of Christ”, “Eucharist”.\r\rFurther Reference:\rCatechism of the Catholic Church, 948\rhttp://tinyurl.com/pkxuudx\r\rWikipedia, “Koinonia”\rhttp://tinyurl.com/yl32y6a",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Kyrie Eleison",
                           @"twitterDef":@"a Greek phrase used in the Liturgy\rmeaning “Lord, have mercy.”",
                           @"definition":@"\rThe Kyrie dates back to the Old Testament as it appears in many of Psalms. It is mentioned explicitly as being part of the Liturgy in the Apostolic Constitutions of the 4th century. It is part of the Penetential Rite of the Roman Liturgy. See “Penitential Rite”.\r\rGreek, Κύριε, ἐλέησον (kyrie eleison)\r\rFurther Reference:\rWikipedia, “Kyrie”\rhttp://tinyurl.com/2do63jo",
                           @"category":@"Biblical"}];

    
    ///////////////////////////////////////////////////////L
    
    [TAWord wordWithDict:@{@"name":@"Last Rites",
                           @"twitterDef":@"Penance, Annointing of the Sick, Eucharist\radministered to a person near death",
                           @"definition":@"\rLast Rites are given in preparation for the final journey of the believer into eternal life.\r\rFurther Reference:\rCatechism of the Catholic Church, 1524-1525\rhttp://tinyurl.com/n3lyve9",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Last Supper",
                           @"twitterDef":@"the final meal of Jesus with his\r disciples before his crucifixion",
                           @"definition":@"\rAll four Gospels portray Jesus sharing a last meal with his disciples. However, the Synoptics claim that it was a Passover seder meal, while the Gospel of John claims it was a regular meal before the beginning of Passover. See “Eucharist”, “Lord's Supper”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1323.\rhttp://tinyurl.com/m88dbjl",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Laity",
                           @"twitterDef":@"non-ordained members of the Church",
                           @"definition":@"\rThe Laity are called to share in the kingly, prophetic, and priestly office of Christ. They manifest the Sensus Fidei (sense of the faith), which has at times, according to Cardinal John Henry Newman, preserved the faith of the Church and prevented the Magisterium from teaching error. See “Three-fold Ministry”, “Sensus Fidelium”.\r\rFurther Reference:\rCatechism of the Catholic Church, 897\rhttp://tinyurl.com/m65ttaf",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Latria",
                           @"twitterDef":@"a Greek word meaning\r“worship of God”",
                           @"definition":@"\rIn contrast to dulia (veneration) given to creation, latria refers to worship of God alone. See “Dulia”.\r\rFurther Reference:\rWikipedia, “Latria”\rhttp://tinyurl.com/mv9sqf",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Law of Moses",
                           @"twitterDef":@"the first five books of the Pentateuch",
                           @"definition":@"\rThe phrase “Law of Moses” is referred to in many places in the Hebrew Bible as a single scroll. Deuteronomy in particular presents itself as the “Law/Teaching of Moses“. The single word “Law” (Torah) is used as a shorthand for the entire Torah in the New Testament. The Law contains various commandments and regulations regarding morality and community life for the Israelites; from the Hebrew, תֹּורַת מֹשֶׁה (torat moshe) “Law of Moses”. See “Torah”, “Pentateuch”.\r\rFurther Reference:\rWikipedia, “Law of Moses”\rhttp://tinyurl.com/cgyff",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lector",
                           @"twitterDef":@"a member of the laity who leads\rthe congretation in reading or prayers",
                           @"definition":@"\rThe ministry of Lector is a service in the Liturgy through the reading of the Scriptures and and the Prayer of the Faithful. It is open to qualified members of the Laity. See “Prayer of the Faithful”, “Laity”.\r\rFurther Reference:\rCatechism of the Catholic Church, 903\rhttp://tinyurl.com/m65ttaf",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lecturn",
                           @"twitterDef":@"see Ambo",
                           @"definition":@"\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lectio Divina",
                           @"twitterDef":@"the prayerful reading of Sacred Scripture",
                           @"definition":@"\rLectio Divina is part of the larger practice of Meditation, which the Church encourages on a regular basis. Lectio Divina increases attentiveness to ibrethe Word of God, which is active the life of the believer.\r\rLatin, (lectio divina) “Divine reading”\r\rFurther Reference:\rCatechism of the Catholic Church, 2708",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lectionary",
                           @"twitterDef":@"the schedule of biblical passages\rread throughout the liturgical year",
                           @"definition":@"\rThe Church's Lectionary for Sundays is a three-year cycle of Scripture readings; the first reading from the Old Testament, a responsorial Psalm, a second reading from the New Testament (often an epistle), and a third reading from the Gospel. The weekday cycle is the first reading and Psalm every two years with the Gospel every year. See “Lector”, “Liturgy”\r\rFurther Reference:\rWikipedia, “Lectionary”\rhttp://tinyurl.com/2wrttu",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lent",
                           @"twitterDef":@"the 40 day period of repentance\before the celebration of Easter”",
                           @"definition":@"\rLent developed gradually in the Church. Irenaeus evidences its various observances. Gregory the Great it was seen as a tithe of days at 36. The later practice of 40 days became standardized throughout the Church\r\rFurther Reference:\rCongregation for Divine Worship and the Discipline of the Sacraments, “Paschalis Sollemnitatis”, 1\rhttp://tinyurl.com/mw2jk6h",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Levite",
                           @"twitterDef":@"a member of the Israelite tribe of Levi",
                           @"definition":@"\rAccording to the Elohist Source in Exodus 32:29, the Levites were set apart to serve YHWH as a reward for their faithfulness after rallying with Moses. Later in Deuteronomy 18:1-8, the Levites were specifically chosen as being the priests of YHWH. This view is in contrast to that of the Priestly Source, which only allows the sons of Aaron to serve as priests. See “Priestly Source”.\r\rFurther Reference:\r\rWikipedia, “Levite”\rhttp://tinyurl.com/2boql2c",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lex Orandi, Lex Credendi",
                           @"twitterDef":@"a Latin phrase meaning\r“law of prayer is the law of belief”",
                           @"definition":@"\rThis idea makes the connection between belief and practice explicit.\r\rLatin, (lex orandi, lex credendi) “law of prayer, law of belief”\r\rFurther Reference:\rCatechism of the Catholic Church, 1124\rhttp://tinyurl.com/cmes38",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Litany",
                           @"twitterDef":@"a petitionary prayer led by a lector",
                           @"definition":@"\rThe Litany of Saints of the Easter Vigil includes is an invocation of various Saints of the Church for their intercession.\r\rGreek, λιτανεία (litaneia) “supplication”\r\rFurther Reference:\rWikipedia, “Litany”\rhttp://tinyurl.com/l92sqgg",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Literary Criticism",
                           @"twitterDef":@"the analysis of the\rliterary characteristics of a text",
                           @"definition":@"\rthe type of exegetical criticism that deciphers and analyzes the literary characteristics of a text, including form, setting, plot, characterization, denouement, theme, and climax.\r\rFurther Reference:\rWikipedia, “Literary Criticism”\rhttp://tinyurl.com/kw5x5",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"LXX",
                           @"twitterDef":@"the numerical symbol for the Septuagint",
                           @"definition":@"\rSee “Septuagint”.",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Liberation Theology",
                           @"definition":@"\rthe theological movement associated with the idea that the gospel is only authentic in the face of radical poverty.\r\rFurther Reference:\rCongregation For The Doctrine Of The Faith, “Instruction On Certain Aspects Of The Theology Of Liberation”\rhttp://tinyurl.com/27d23",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Liturgy",
                           @"twitterDef":@"the participation of the Church\rin the Paschal Mystery",
                           @"definition":@"\rThe Liturgy of the Church is not limited to its public worship. Rather, it includes works of charity as well as the proclamation of the Gospel. It is an “exercise of the priestly office of Jesus Christ”.\r\rFurther Reference:\rCatechism of the Catholic Church, 1069\rhttp://tinyurl.com/opjnz9x",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Eucharist",
                           @"twitterDef":@"the central celebration of the Mass",
                           @"definition":@"\rThe Liturgy of the Eucharist, preceded by the Liturgy of the Word, includes the following elements:\r\r-Thanksgiving\r-Acclamation\r-Epiclesis\r-Words of Institution\r-Anamnesis\r-Oblation\r-Intercessions\r-Doxology\r\rSee “Liturgy of the Word”, “Epiclesis”, “Anamnesis”, “Words of Institution”, “Doxology”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Liturgy of the Eucharist”\rhttp://tinyurl.com/lleofmh",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Word",
                           @"twitterDef":@"the public reading and hearing of\rSacred Scripture at Mass",
                           @"definition":@"\rThe Liturgy of the Word, the Church listens to the Word of God from the Scriptures and is exhorted to Christian living in the homily. It concludes with the Prayer of the Faithful. See “Homily”, “Prayer of the Faithful”.\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Liturgy of the Word”\rhttp://tinyurl.com/lzxk5e8",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Liturgy of the Hours",
                           @"twitterDef":@"the cycle of daily prayer offered by the Church\rthroughout the liturgical year",
                           @"definition":@"\rThe Liturgy of the Hours is an ancient practice that dates back to the earliest days of the Church, which inhereited from Judaism the custom of praying at set times during the day. The Divine Office is the public prayer of the Church, which is offered continuously by both clergy and laity; also called “The Divine Office”.\r\rCatechism of the Catholic Church, 1174\rhttp://tinyurl.com/p9382z5",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Law of Non-Contradiction",
                           @"twitterDef":@"A and ~A cannot both be true at the same time in the same way",
                           @"definition":@"\rThis principle is first found in the writings of Aristotle, in his fourth book on Metaphysics. There he claims that without this principle, no learning could be possible.\r\rStanford Encyclopedia of Philosophy, “Aristotle on Non-Contradiction”\rhttp://tinyurl.com/yvzfdk",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Living Wage",
                           @"twitterDef":@"A form of income that is enables a worker to support his or her family",
                           @"definition":@"\rThe concept of a living wage in modern Catholic Social Teaching dates back to 1891 with Leo XII's encyclical, Rerum Novarum. More recently, Benedict XVI addressed the issue again in his encyclical Caritas En Veritate.\r\rFurther Reference:\rLeo XIII, Rerum Novarum, 45\rhttp://tinyurl.com/lv5y76v\r\rBenedict XVI, “Caritas En Veritate”, 63\rhttp://tinyurl.com/lpqbs8v",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Logic",
                           @"twitterDef":@"the science of reasoning",
                           @"definition":@"\rThe principles of logic are a necessary component of rationality itelf. They are so fundamental to human reasoning that, in order to deny them, one must make use of them.\r\rFurther Reference:\rUniversity of Oxford, “The Logic Web”\rhttp://tinyurl.com/y8lr2lh.\r\rWikipedia, “Logic”\rhttp://tinyurl.com/q2uqv3x",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Logos",
                           @"twitterDef":@"the Greek word meaning\r“reason” or “word”",
                           @"definition":@"\rThis term dates back the pre-Socratic Greek philosopher Heraclitus. It is used the Gospel of John to refer to the eternal Son of the Father who became incarnate in Jesus of Nazareth. See “Incarnation”.\r\rGreek, λόγος (logos)\r\rFurther Reference:\rWikipedia, “Logos”\rhttp://tinyurl.com/om4rp",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"LORD",
                           @"twitterDef":@"a symbolic transliteration of the Tetragrammaton\rיהוה‎",
                           @"definition":@"\rMost contemporary English bibles render the Divine Name as the LORD to indicate that the underlying Hebrew name of God. See “Tetragrammaton”",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lord's Prayer",
                           @"twitterDef":@"the exemplary prayer that Jesus taught his disciples",
                           @"definition":@"\rThe Lord's Prayer occurs in only two places in the New Testament, Matthew 6:9-13 and Luke 11:2-4. Luke's version was likely given as rubric, allowing for contextual customization, while Matthew's version was used in early Christian liturgies. The Matthean version also reflects that found in the Didache. See “Our Father”, “Didache”.\r\rCatechism of the Catholic Church, 2759\rhttp://tinyurl.com/m8f77wr",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Lord's Supper",
                           @"twitterDef":@"see Last Supper",
                           @"definition":@"\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    
    
    /////////////////////////////M
    
    
    
    [TAWord wordWithDict:@{@"name":@"Magnificat",
                           @"twitterDef":@"the prayer of the Virgin Mary\rat the Annunciation",
                           @"definition":@"\rThe Magnificat is a part of Morning Prayer in the Liturgy of the Hours. It is based on the prayer of Hannah in 1 Samuel. See “Annunciation”.\r\rFurther Reference:\rWikipedia, “Magnificat”\rhttp://tinyurl.com/yljmjjd",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Manicheism",
                           @"twitterDef":@"a heresy taught by Manes that\rmatter is evil and the spirit is the only good",
                           @"definition":@"\rSt. Augustine of Hippo was a follower of Manicheism until his conversion.\r\rFurther Reference:\rWikipedia, “Manicheism”\rhttp://tinyurl.com/ysvrjs",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Maranatha",
                           @"twitterDef":@"an Aramaic phrase meaning\r“Our Lord, come.”",
                           @"definition":@"\rThis word is referenced by Paul in 1 Corinthians 16:22 as a common expression used by early Christians to invoke the return of the Lord Jesus. An alternative translation renders this phrase as a declarative statement: “Our Lord has come”.\r\rAramaic, מרנא תא (marana tha)\r\rFurther Reference:\rWikipedia, “Maranatha”\rhttp://tinyurl.com/yv4vcj",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Marcionism",
                           @"twitterDef":@"the teaching of Marcion that\rrejects Israelite scritpures and theology",
                           @"definition":@"\rMarcionism led to the creation of the first canon of Scripture during the time of Irenaeus, who identified 4 authentic gospels. See “Canon”.\r\rFurther Reference:\rWikipedia, “Marcionism”\rhttp://tinyurl.com/yo3bp6",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Marriage",
                           @"twitterDef":@"the Sacrament in which a\rman and woman become one flesh",
                           @"definition":@"\rMarriage as human institution has evolved in conjunction with human society. As a sacrament, Marriage reflects the nuptial identity of the human person.to...and faces new questions as .\r\rFurther Reference:\rCatechism of the Catholic Church, 1601\rhttp://tinyurl.com/ykptlg",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Martyr",
                           @"twitterDef":@"a witness to the faith\rto the point of death",
                           @"definition":@"\rA famous quote from Tertullian sums up the importance of Martyrs for evangelization:\r\r“The blood of the Marytrs is the seed of the Church”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2473\rhttp://tinyurl.com/3bfbm27",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Mass",
                           @"twitterDef":@"the liturgy of the weekly Christian gathering",
                           @"definition":@"\rThe Mass is composed of two parts: the Liturgy of the Word and Liturgy of the Eucharist. See Liturgy of the Word, Liturgy of the Eucharist.\r\rFurther Reference:\rCatechism of the Catholic Church, 1332\rhttp://tinyurl.com/m88dbjl",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Matins",
                           @"twitterDef":@"the traditional term for morning prayer",
                           @"definition":@"\rSee “Morning Prayer”.",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Maundy Thursday",
                           @"twitterDef":@"the celebration of the institution\rof the Lord's Supper",
                           @"definition":@"\rThis term derives from the Latin “mandatum”, and John 13:34, in which Jesus says: a new commmandment I give you; that you love one another as I have loved you.\r\rFurther Reference:\rWikipedia, Maundy Thursday\rhttp://tinyurl.com/37sy85",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Memorial Acclamation",
                           @"twitterDef":@"the response of the congregation\rafter the Words of Institution",
                           @"definition":@"\rThe Memorial Acclamation is introduced with the phrase chanted by the celebrant: “the mystery of faith”. See “Words of Institution”.\r\rFurther Reference:\rWikipedia, “Memorial Acclamation”\rhttp://tinyurl.com/mjgllzr",
                           @"category":@"Liturgical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Miracle",
                           @"twitterDef":@"a supernatural event which defies scientific explanation",
                           @"definition":@"\rIn common parlance, miracles are events which violate the laws of nature. While biblical authors did not share that perspective, the Bible is nevertheless full of claims about God's “mighty deeds” of power.\r\rFurther Reference:\rInterdisciplinary Encyclopedia of Religion and Science, “Miracle”\rhttp://tinyurl.com/mmev2qy",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Monotheism",
                           @"twitterDef":@"the belief in only one God",
                           @"definition":@"\rMonotheism was slow to develop in ancient Israel. After the Exile, the belief in only one God becomes a defining characteristic of the Jews, whereas in pre-Exilic times, Israel accepted the existence of other gods. See “Henotheism”.\r\rFurther Reference:\rWikipedia, “Monotheism”\rhttp://tinyurl.com/neuju",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Morality",
                           @"twitterDef":@"customary norms of behavior considered good or evil",
                           @"definition":@"\rcustomary norms of behavior considered good or evil, right or wrong in a given system.\r\rFurther Reference:\rCatechism of the Catholic Church, 1749-1756\rhttp://tinyurl.com/lxslc7r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Mystery",
                           @"twitterDef":@"that which transcends human comprehension and explanation",
                           @"definition":@"\rIn the Catholic tradition, God is ultimately Mystery and can only be partially known through Divine Revelation. See “Revelation”.\r\rFurther Reference:\rNew Advent, “Mystery”\rhttp://tinyurl.com/35fsmo",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Manuscript",
                           @"twitterDef":@"a hand-written copy of a text",
                           @"definition":@"\rNo original writings of the Bible survive. Throughout history, scribes have made copies of the originals, which themselves were the basis for further copies, and so on. The earliest manuscript of the complete New Testament that exists is Codex Sinaiticus, which dates to the 4th century A.D.\r\rFurther Reference:\rCodex Sinaiticus\rhttp://tinyurl.com/5fg98l\r\rWikipedia, “Manuscript”\rhttp://tinyurl.com/jwb5dhp",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Messiah",
                           @"twitterDef":@"the Hebrew equivalent title to “Christ”",
                           @"definition":@"\rChrist was used by the early Christians to refer to the divinely designated status of Jesus of Nazareth - from the Hebrew for “annointed one”.\r\rFurther Reference:\rCatechism of the Catholic Church, 436\rhttp://tinyurl.com/neqlbg7",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ministry",
                           @"twitterDef":@"service in the name of Christ",
                           @"definition":@"\rMinistry derives from the Latin, ...\r\rFurther Reference:\rCatechism of the Catholic Church, 874\rhttp://tinyurl.com/m65ttaf",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Mishnah",
                           @"twitterDef":@"the written redaction of the\roral commentary on the Torah",
                           @"definition":@"\rThe Mishnah was the first major work of Rabbinic Judaism which contains oral commentary on the Torah that dates back to the Second Temple Period. It is arranged topically, rather than canonically.\r\rFurther Reference:\rWikipedia, “Mishnah”\rhttp://tinyurl.com/zdndh",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Missal",
                           @"twitterDef":@"a book used to celebrate the Eucharist",
                           @"definition":@"\rThe 2011 new translation of the Mass was based on the Missal used in Rome.\r\rFurther Reference:\rCongregation for Divine Worship and Discipline of the Sacraments, “General Instruction on the Roman Missal”\rhttp://tinyurl.com/kmepha",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Missionary",
                           @"twitterDef":@"one sent on a mission\rto proclaim the Gospel",
                           @"definition":@"\rMissionaries date back to the earliest age of the Church. The Apostles were all missionaries. Missionary bishops were those sent to help evangelize a unchurched region. Today, certain Catholic apostolates send missionaries to aid in evangelization.\r\rFurther Reference:\rWikipedia, “Missionary”\rhttp://tinyurl.com/kkyzo",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Mitre",
                           @"twitterDef":@"a liturgical hat worn by bishops",
                           @"definition":@"\rMitres are worn by bishops and other prelates of the Church and symbolize the flame of the Holy Spirit.\rFurther Reference:\rNew Advent, “Mitre”\rhttp://tinyurl.com/5fdro",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Modernism",
                           @"twitterDef":@"the 19th century movement that embraced\r modern advances in science, history, and philosophy",
                           @"definition":@"\rModernism was initially condemned by Pope Leo XIII, but its affects reached into the twentieth century at Vatican II.\r\rFurther Reference:\rWikipedia, “Modernism”\rhttp://tinyurl.com/mafqt",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Monarchianism",
                           @"twitterDef":@"the belief that God is merely\rmanifested in three different forms",
                           @"definition":@"\rMonarchianism was popular during the second and third centuries. It denied that the Father, Son, and Holy Spirit were three distinct persons. Instead, it claimed that God was one person manifested in three forms. See “Sabellianism”.\r\rFurther Reference:\rWikipedia, “Monarchianism”\rhttp://tinyurl.com/28a82l",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monasticism",
                           @"twitterDef":@"the practice of religious vows\rlived in community",
                           @"definition":@"\rMonastics tace their origin to the third century with Abba Anthony of Egypt.\r\rFurther Reference:\rWikipedia, “Monasticism”\rhttp://tinyurl.com/n7kl2y",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Monophysitism",
                           @"twitterDef":@"the teaching that Christ had a single, divine\rnature which absorbed his human nature",
                           @"definition":@"\rMonophysitism was rejected at the Council of Ephesus in 451 A.D.\r\rFurther Reference:\rWikipedia, “Monophysitism”\rhttp://tinyurl.com/2ve4jf7",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monothelitism",
                           @"twitterDef":@"the teaching that Christ had a single, divine\rwill which absorbed his human will",
                           @"definition":@"\rMonothelitism flourished in the seventh century....\r\rFurther Reference:\rWikipedia, “Monothelitism”\rhttp://tinyurl.com/ojzevrh",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Myth",
                           @"twitterDef":@"a story that cannot be historically verified",
                           @"definition":@"\ra story that cannot be historically verified.\r\rFurther Reference:\rWikipedia, “Creation Myth”\rhttp://tinyurl.com/33adt4",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Monstrance",
                           @"twitterDef":@"a frame for displaying the consecrated\rbread of the Eucharist for adoration",
                           @"definition":@"\rMonstrances were used as early as the 13th century and are still used today. They are usually reserved for Eucharstic Adoration.\r\rFurther Reference:\rWikipedia, “Monstrance”\rhttp://tinyurl.com/2evkwxg",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Montanism",
                           @"twitterDef":@"a second-century charismatic heretical\r group based on the teachings of Montanus",
                           @"definition":@"\rMontanus taught that the Holy Spirit, promised by Jesus, had incarnated himself in Montanus, who demanded his followers adopt a strict lifestyle...\r\rFurther Reference:\rWikipedia, “Montanism”\rhttp://tinyurl.com/dnms5r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Moral Theology",
                           @"twitterDef":@"the theology of moral norms and their application to human experience",
                           @"definition":@"Moral theology was identified by St. Thomas Aquinas as ...has developed into a definite sub-discipline of Theology.\r\rFurther Reference:\rNew Advent, “Moral Theology”\rhttp://tinyurl.com/bwhw6lf",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Morning Prayer",
                           @"twitterDef":@"the first hour of the\rLiturgy of the Hours",
                           @"definition":@"\rMorning prayer is the beginning of the Divine Office.See “Liturgy of the Hours”.\r\rFurther Reference:\rWikipedia, “Liturgy of the Hours”\rhttp://tinyurl.com/c8tnn5",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Metaphysics",
                           @"twitterDef":@"the study of the fundamental\rnature of reality",
                           @"definition":@"\rMetaphysics is a highly contested area of inquiry that has including a variation of topics throughout history since the time of Aristotle. More generally, it is teh study of being as such. Theology is a metaphysical discipline insofar as theology makes claims about the fundamental nature of reality, which, in the Catholic Tradition, is known as God.\r\rFurther Reference:\rRoutledge Encyclopedia of Philosophy, “Metaphysics” http://tinyurl.com/mydu3hx",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Muratorian Fragment",
                           @"twitterDef":@"the earliest extant canonical\rindex of Scriptures",
                           @"definition":@"\rThe Muratorian Canon dates to as early as A.D. 170. The formation of the canon of Scripture was occassioned by the Marcionism heresy. The Muratorian Fragment was discovered and published in 1740 by Fr. Ludavico Muratori in the Ambrosian Library. See “Canon”, “Marcionism”.\r\rFurther Reference:\rWikipedia, “Muratorian Fragment”\rhttp://tinyurl.com/ampawp",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Mystagogy",
                           @"twitterDef":@"the catechetical intiation into\rthe sacramental mysteries",
                           @"definition":@"\rMystagogy was renewed and emphasized as part of the adult baptismal initiation rite based on the practice of the early Church. It is emphasized by apostolate groups such as the Neo-Catechumenical Way.\r\rFurther Reference:\rPope Benedict XVI, Sacramentum Caritatis, 64\rhttp://tinyurl.com/nn8bpbh",
                           @"category":@"Liturgical"}];
    
    
    /////////////////////////////////N
    
    
    
    [TAWord wordWithDict:@{@"name":@"Natural Law",
                           @"twitterDef":@"the universal moral standard, accessible by human reason",
                           @"definition":@"\rThe concept of natural law dates back to the early Greek philosophers. It is alluded to in St. Paul's epistle to the Romans 1:21. It is treated extensively by St. Thomas Aquinas in the Summa Theologica.\r\rFurther Reference:\rCatechism of the Catholic Church, 1954\rhttp://tinyurl.com/yla3tgm",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Natural Theology",
                           @"twitterDef":@"the study of God by inference from the facts of the physical world",
                           @"definition":@"\rNatural Theology is the attempt to examine the concept of God from the natural world, apart from any special revelation. See Revelation.\r\rFurther Reference:\rInternet Encyclopedia of Philosophy, “Natural Theology”\rhttp://tinyurl.com/7ckb5tz",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Nevi'im",
                           @"twitterDef":@"the Hebrew word meaning\r“prophets”",
                           @"definition":@"\rThe Nevi'im is the second of the three sections of the Tanak. Isaiah, Jeremiah, and Ezekiel are the major prophets, while others are considered minor prophets, due to the length of their books. See “Tanak”.\r\rHebrew, נְבִיאִים (neviim).\r\rFurther Reference:\rWikipedia, “Nevi'im”\rhttp://tinyurl.com/qyks6kh",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"New Testament",
                           @"twitterDef":@"the 27 books dealing with the life of Jesus of Nazareth and his followers",
                           @"definition":@"\rThe New Testament contains the 4 gospels, the Acts of the Apostles, numerous epistles, and the Apocalypse. See “Gospel”, “Epistle”, “Apocalypse”.\r\rFurther Reference:\rCatechism of the Catholic Church, 124-127\rhttp://tinyurl.com/kvc3tvq",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Nestorianism",
                           @"twitterDef":@"the heresy that Christ was two persons joined together... ",
                           @"definition":@"\rThe teaching of Nestorius was condemned at the Council of Ephesus 431. St. Cyril argued persuasively against his teaching.\r\rFurther Reference:\rCatechism of the Catholic Church, 466\rhttp://tinyurl.com/37wuaux",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"New Covenant",
                           @"twitterDef":@"the Christian covenant based on the life, death, and resurrection of Jesus",
                           @"definition":@"\rThe concept of a new covenant occurs for the first time in Jeremiah 31:31-34:\r\r“Behold, the days are coming, declares the Lord, when I will make a new covenant with the house of Israel and the house of Judah, not like the covenant that I made with their fathers on the day when I took them by the hand to bring them out of the land of Egypt, my covenant that they broke, though I was their husband, declares the Lord. For this is the covenant that I will make with the house of Israel after those days, declares the Lord: I will put my law within them, and I will write it on their hearts. And I will be their God, and they shall be my people. And no longer shall each one teach his neighbor and each his brother, saying, ‘Know the Lord,’ for they shall all know me, from the least of them to the greatest, declares the Lord. For I will forgive their iniquity, and I will remember their sin no more.”\r\rJesus of Nazareth alluded to this passage during the Last Supper in which he declared the cup to be the cup of the New Covenant.\r\rFurther Reference:\rWikipedia, “New Covenant”\rhttp://http://tinyurl.com/6klzmk",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Nicene-Constantiopolitan Creed",
                           @"twitterDef":@"the creed from Constantinople in A.D. 381,\rbased on the Nicene Creed in A.D. 325",
                           @"definition":@"\r“We believe in one God, the Father, the Almighty, maker of heaven and earth, of all that is, seen and unseen.\r\rWe believe one Lord, Jesus Christ, the only Son of God, eternally begotten of the Father, God from God, Light from Light, true God from true God, begotten, not made, one in Being with the Father. Through Him all things were made. For us men and for our salvation, He came down from heaven: by the power of the Holy Spirit He was born of the Virgin Mary, and became Man. For our sake He was crucified under Pontius Pilate. He suffered, died, and was buried. On the third day He rose again in fulfillment of the Scriptures; He ascended into heaven, and is seated at the right hand of the Father. He will come again in glory to judge the living and the dead, and His kingdom will have no end. \r\rWe believe in the Holy Spirit, the Lord, the Giver of life, Who proceeds from the Father and the Son. With the Father and the Son He is worshiped and glorified. He has spoken through the prophets.\r\rWe believe in one, holy, catholic, and apostolic Church. We acknowledge one Baptism for the forgiveness of sins. We look for the resurrection of the dead, and the life of the world to come. Amen.”\r\rSee “Nicea” in the Historical section of the Maps tab.\r\rFurther Reference:\rCatechism of the Catholic Church, Sec. II\rhttp://tinyurl.com/2dszf5",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Numinous",
                           @"twitterDef":@"experience of the Holy that includes\rboth terrifying and fascinating aspects",
                           @"definition":@"\rAccording to Rudolf Otto, in his seminal work, “The Idea of the Holy”, religious experience is an encounter with the Holy this is totally Other and numinous. Such experiences are mysteriously terrifying (mysterium tremendum) and mysteriously fascinating (mysterium fascinans).\r\rFurther Reference:\rWikipedia, “Numinous”\rhttp://tinyurl.com/q2nys8u",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Naturalism",
                           @"twitterDef":@"the belief that the visible world\rof nature is all that exists",
                           @"definition":@"\rNaturalism can be traced to the writings of the pre-Socratic philosopher Thales. It experienced a surge during the Enlightenment, being promoted by thinkers such as Voltaire. In the 20th century, naturalism was held by such thinkers as John Dewey. Understood in an ontological sense, Naturalism denies the existence of a supernatural Creator, distinct from the natural world.\rFurther Reference:\rWikipedia, “Naturalism”\rhttp://tinyurl.com/ynzpwh",
                           @"category":@"Cultural"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Nunc Dimittis",
                           @"twitterDef":@"the prayer of Simeon\rin Luke 2:29-32",
                           @"definition":@"\rLuke portrays Simeon as offering this extemporaneous prayer after being led by the Holy Spirit to see the infant Jesus.\r\rFurther Reference:\rWikipedia, “Nunc Dimittis”\rhttp://tinyurl.com/o7mejxw",
                           @"category":@"Liturgical"}];
    
    //////////////////////////O
    
    [TAWord wordWithDict:@{@"name":@"Octave",
                           @"twitterDef":@"the celebration of a feast over eight days",
                           @"definition":@"\rThe Catholic Church only celebrates two Octaves: Christmas and Easter.\r\rFurther Reference:\rWikipedia, “Octave”\rhttp://tinyurl.com/d5u8q5v",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Offertory",
                           @"twitterDef":@"the prayer said after the presentation of the Gifts to the celebrant...",
                           @"definition":@"\rThe Roman Missal includes several options for the Offertory...\r\rFurther Reference:\rCatechism of the Catholic Church, 1350\rhttp://tinyurl.com/m88dbjl",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnibenevolence",
                           @"twitterDef":@"the quality of being all-loving",
                           @"definition":@"\rOmnibenevolence is a traditional characteristic of God that is emphasized in the New Testament and throughout the Catholic tradition. Together with Omnipotence and Omniscience, it is a consideration in the Problem of Evil.\r\rFurther Reference:\rWikipedia, “Omnibenevolence”\rhttp://tinyurl.com/qhrwnk3",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnipotence",
                           @"twitterDef":@"the quality of being all-powerful",
                           @"definition":@"\rOmnipotence is a traditional characteristic of God that is emphasized throughout the Scriptures. Together with Omnibenevolence and Omniscience, it is a consideration in the Problem of Evil. See “Problem of Evil”.\r\rFurther Reference:\rInternet Encyclopedia of Philosophy, “Omnipotence”\rhttp://tinyurl.com/p7h67uq",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omnipresence",
                           @"twitterDef":@"the quality of being all-present",
                           @"definition":@"\rOmnipresence was a development from the teaching that God is Spirit.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Omnipresence”\rhttp://tinyurl.com/3s7r2sz",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Omniscience",
                           @"twitterDef":@"the quality of being all-knowing",
                           @"definition":@"\rOmniscience poses a philosophical obstacle to the concept of free-will. Together with Omnibenevolence and Omniscience, it is a consideration in the Problem of Evil. See “Foreknowledge”, “Problem of Evil”.\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Omniscience”\rhttp://tinyurl.com/o3qhjr2",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ontological Argument",
                           @"twitterDef":@"the argument that states God, as the greatest possible Being, is necessary",
                           @"definition":@"\rThe argument, first formulated by Anselm of Canterburry, that states God, as the greatest possible Being, is a necessary Being:\r\r1. By definition, God is a being than which none greater can be imagined.\r2. A being that necessarily exists in reality is greater than a being that does not necessarily exist.\r3. Thus, by definition, if God exists as an idea in the mind but does not necessarily exist in reality, then we can imagine something that is greater than God.\r4. But we cannot imagine something that is greater than God.\r5. Thus, if God exists in the mind as an idea, then God necessarily exists in reality.\r6. God exists in the mind as an idea.\r7. Therefore, God necessarily exists in reality.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Ontological Arguments”\rhttp://tinyurl.com/5z59lw",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ontology",
                           @"twitterDef":@"the study of Being",
                           @"definition":@"\rOntology is closely related to Metaphysics and concerns the question of the categories of existence.\r\rFurther Reference:\rWikipedia, “Ontology”\rhttp://tinyurl.com/fg4zh",
                           @"category":@"Cultural"}];
    /*
    [TAWord wordWithDict:@{@"name":@"Open Theism",
                           @"twitterDef":@"a theological movement characterized by the belief that there are logical limits on God's power and knowledge",
                           @"definition":@"\ra theological movement characterized by the belief that there are logical limits on God's power and knowledge.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    */
    
    [TAWord wordWithDict:@{@"name":@"Ordinary",
                           @"twitterDef":@"bishop or other prelate\rwho has authority to govern",
                           @"definition":@"\rThe Ordinary is used to distinguish the diocesan bishop from an assistant or coadjutor.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ordinary Time",
                           @"twitterDef":@"the liturgical time between\rEaster and Advent",
                           @"definition":@"\rOrdinary Time is divided into two segments; from the Baptism of the Lord to Ash Wednesday and from Pentecost to Advent. During the Ordinary Time, the readings in the Lectionary are not chosen topically.\rFurther Reference:\rWikipedia, “Ordinary Time”\rhttp://tinyurl.com/6xzoaj",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Ordination",
                           @"twitterDef":@"the reception of the Sacrament\rof Holy Orders",
                           @"definition":@"\rOrdination dates from the earliest years of the Church. It involves the laying on of hands and initiation into an ordo or society. There are three such ordos in the Church; Bishops, Priests, and Deacons.\r\rFurther Reference:\rCatechism of the Catholic Church, 1357\rhttp://tinyurl.com/4hs6lso",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Original Sin",
                           @"twitterDef":@"the sin of the first humans;\rthe corruptible condition of humanity",
                           @"definition":@"\rOriginal Sin, while not named as such, is alluded to by St. Paul in Romans 5:12. St. Augustine coined the term in his dispute with the Pelagians. In the traditional teaching of the Church, Original Sin can be understood as both the explanans and explanandum. As explananas it explains the human condition of evil, suffering, and death. As explanandum, it is the human condition which requires explanation.\r\rFurther Reference:\rCatechism of the Catholic Church, Article I, Paragraph 7\rhttp://tinyurl.com/llux3he",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Orthodox",
                           @"twitterDef":@"straight or correct belief",
                           @"definition":@"\r\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Orthopraxis",
                           @"twitterDef":@"straight or correct practice",
                           @"definition":@"\ra Greek word meaning 'straight practice.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Old Testament",
                           @"twitterDef":@"the 46 books dealing with the people of Israel",
                           @"definition":@"\rthe 46 books dealing with the people of Israel; contains the Pentateuch, Historical Books, Wisdom Books, and Prophetic Books. The Church teaches that the Old Testament prefigures the New Testament through Typology. The Old Testament is based on the Hebrew Bible, which only includes 39 books. See “Tanak”, “Typology”.\r\rFurther Reference:\rWikipedia, “Old Testament”\rhttp://en.wikipedia.org/wiki/Old_Testament",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Oracle",
                           @"twitterDef":@"\a Divine utterance\ror location of Divine utterances",
                           @"definition":@"The phenomenon of oracles as was widespread in the ancient world. The Oracle at Delphi was Pythia, who was associated with the Greek god Apollo. In the biblical tradition, oracles were messages of God spoken by humans. St. Paul speaks of the nation of Israel as having been entrusted with the Oracles of God (Rom. 3:2).\r\rFurther Reference:\rNew Advent, “Oracle”\rhttp://tinyurl.com/nfok5xv",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Oral Tradition",
                           @"twitterDef":@"the transmission of stories and beliefs by word of mouth",
                           @"definition":@"\rBefore the writing of any biblical text, their stories were transmitted orally. The book of Deuteronomy dictates that the commandments of the Torah be passed down orally from parents to children. Eventually, written sources were made in order to establish an official record of the beginnings of the Israelite nation (most likely during the Davidic or Solomonic monarchies). Variations on a common story indicate an oral narrative core around which various authors tailored their writing. For example, in the Old Testament there was an oral tradition that circulated about the patriarch Abraham and his covenant with YHWH. This tradition was retold with different details based on the narrator's audience, as evidenced in its Yahwist, Elohist, and Priestly accounts. In the New Testament, the words of Jesus were passed down orally before the composition of any of the 4 gospels, which were occassioned by the destruction of the Temple and consequent delay of the Parousia. Oral traditions that were recorded but not contained in the gospels illustrate the predominance of the oral tradition in 1st century Palestine. The oral commentary on the Torah (Mishnah) is regarded as equally authortative as the written Torah in modern Judaism. See “Mishnah”, “Parousia”.\r\rFurther Reference:\rWikipedia, “Oral Gospel Traditions”\rhttp://tinyurl.com/nqnawkg",
                           @"category":@"Biblical"}];
    
    //////////////////////////////////////////P
    
    [TAWord wordWithDict:@{@"name":@"Pacifism",
                           @"twitterDef":@"the total rejection of violence\rin any form",
                           @"definition":@"\rPacifism has its roots in the early Christian intepretation of the words of Jesus in the Sermon on the Mount. Early Christian writers such as Justin Martyr, Origen, Clement of Alexandria, Irenaeus, and Tertullian claimed that Christians did not shed blood in war. While the limited reach of Christianity to army-eligible Romans is somewhat a factor in this, it remains the case that pacifism was the earliest response of the Church to war. Origen grounds the pacifism of all Christians in their participation in the priestly office of Christ. As Christianity developed and expanded, and after its legalization by Constantine in A.D. 313, the Church faced a new situation as it slowly acquired the same political power that was used to crucify its Founder. St. Augustine was instrumental in the development of the Just War Theory, which begins with a presumption against violence that can only be overriden if specific criteria are met. Vatican II praised pacifist objection to war so long as additional rights are not violated. See “Just War Theory”.\r\rFurther Reference:\rVatican II, Gaudium et Spes, 78\rhttp://tinyurl.com/34xrhq\r\rWikipedia, “Pacifism”\rhttp://tinyurl.com/yo2ulo",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Pantheism",
                           @"twitterDef":@"the belief that everything is God",
                           @"definition":@"\rPantheism is popular in New Age forms of spirituality and in some Eastern religious traditions.\r\rFurther Reference:\rWikipedia, “Pantheism”\rhttp://tinyurl.com/yrkp3c",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Panentheism",
                           @"twitterDef":@"the belief that everything exists within God",
                           @"definition":@"\rPanentheism is examplified in Acts 17:28 in which St. Paul claims that God gives everything life; “in him we live, move, and have our being”. Both modern theologians and philosophers have claimed a panentheistic model of the God-World relationship. According to Alfred North Whitehead, in a panentheistic worldview, God has both necessary and contigent properties. See “Process Theology”.\r\rFurther Reference:\rStanford Encyclopedia of Philosophy, “Panentheism”\rhttp://tinyurl.com/5e8c62",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Parousia",
                           @"twitterDef":@"a Greek word meaning “presence”;\rthe presence of the glorified Christ",
                           @"definition":@"\rParousia is a term used by St. Paul in the New Testament to refer to the second coming of Christ.\r\rGreek, παρουσία (parousia)\r\rFurther Reference:\rWikipedia, “Parousia”\rhttp://tinyurl.com/6rwp6r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Paschal Mystery",
                           @"twitterDef":@"the experience of salvation\rthrough, with, and in Jesus Christ",
                           @"definition":@"\rThe Paschal Mystery is based in the the death and resurrection of Jesus. It is a transcendent event that participates in the Divine, and, as such, its affects are not limited to the constraints of time and space.\r\rFurther Reference:\rCatechism of the Catholic Church, 1085\rhttp://tinyurl.com/oqbzkx3",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Passion of the Lord",
                           @"twitterDef":@"the salvific suffering of Jesus\rin the hours before his death",
                           @"definition":@"\rAccording to the teaching of the Church, the Passion of Christ merits salvation for the human race according to the plan and foreknowledge of God.\r\rFurther Reference:\rCatechism of the Catholic Church, 607\rhttp://tinyurl.com/p3dfabj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Pastor",
                           @"twitterDef":@"a priest or bishop responsible\r for the Christian Faithful",
                           @"definition":@"\rPastors are tasked with the administration of the Sacraments and care of the Christian congregation. The Petrine Ministry has always been viewed as the pastoral role par excellence in the Catholic Tradition. See “Petrine Ministry”.\r\rFurther Reference:\rCongregation for the Doctrine of the Faith, “The Primacy of the Successor of Peter in the Mystery of the Church”\rhttp://tinyurl.com/ms5hgvj",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Paten",
                           @"twitterDef":@"a small plate used to hold the Eucharist",
                           @"definition":@"\ra human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pater Noster",
                           @"twitterDef":@"a Latin phrase meaning\rOur Father",
                           @"definition":@"\rSee Lord's Prayer.\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Patripassianism",
                           @"twitterDef":@"the belief that the Father suffered\rin the Son",
                           @"definition":@"\rPatripassianism was a heresy that was consequent to Modalism.\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Patristics",
                           @"twitterDef":@"the study of the Church Fathers",
                           @"definition":@"\rPatristics is essential for the study of theology....\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pelagianism",
                           @"twitterDef":@"the heresy of Pelagius\rthat salvation is possible without grace",
                           @"definition":@"\ra human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    [TAWord wordWithDict:@{@"name":@"Penance",
                           @"twitterDef":@"the act of making restitution\rfor one's sins",
                           @"definition":@"\ra human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];

    
    [TAWord wordWithDict:@{@"name":@"Petrine Ministry",
                           @"twitterDef":@"the ministry of service to the Church\rexercised by the Bishop of Rome",
                           @"definition":@"\ra human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Palm Sunday",
                           @"twitterDef":@"the Sunday before Easter that commemorates\rthe final entry of Jesus into Jerusalem",
                           @"definition":@"\rPalm Sunday was celebrated as early as....\r\rFurther Reference:\r",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Personhood",
                           @"twitterDef":@"a human being capable of self-transcendence",
                           @"definition":@"\ra human being capable of self-transcendence.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Pluralism",
                           @"twitterDef":@"the belief that all religous claims are equally valid",
                           @"definition":@"\rthe belief that all religous claims are equally valid.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Polytheism",
                           @"twitterDef":@"the belief that many gods exist",
                           @"definition":@"\rthe belief that many gods exist.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Predestination",
                           @"twitterDef":@"the belief that God has fixed the destiny of certain nations or peoples",
                           @"definition":@"\rthe belief that God has fixed the destiny of certain individuals.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Principle of Double Effect",
                           @"twitterDef":@"the principle which states...",
                           @"definition":@"\rthe principle which states.\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Process Theology",
                           @"twitterDef":@"the theological school of thought that views the basic structure of the Universe as process instead of substance",
                           @"definition":@"\rProcess theology is named after the thought of Alfred North Whitehead.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Protestant",
                           @"twitterDef":@"the theological objection to the authority of the Pope in the Church; the Protestant Reformation",
                           @"definition":@"\rthe theological objection to the authority of the Pope in the Church; the Protestant Reformation.\r\rFurther Reference:\r",
                           @"category":@"Ecclesial"}];
    
    [TAWord wordWithDict:@{@"name":@"Parable",
                           @"twitterDef":@"a fable-like story that makes a theological claim",
                           @"definition":@"\ra fable-like story that makes a theological claim; used frequently by Jesus in the synoptic gospels.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Papyrus",
                           @"twitterDef":@"a type of paper in the ancient world used for writing created from a plant",
                           @"definition":@"\ra type of paper used for writing created from a plant.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Passover",
                           @"twitterDef":@"the feast that commemorates the Exodus of the Israelites from slavery in Egypt",
                           @"definition":@"\rthe feast that commemorates the exodus of the Israelites from slavery in Egypt.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pentateuch",
                           @"twitterDef":@"another term for the first five books of the Old Testament, the Torah",
                           @"definition":@"\ranother term for the first five books of the Old Testament, the Torah - from the Greek for “five scrolls”.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pericope",
                           @"twitterDef":@"a given section of a larger text...",
                           @"definition":@"\ra given section of a larger text.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Pharisees",
                           @"twitterDef":@"a Jewish group of laymen in the first century devoted to Torah-observance",
                           @"definition":@"\rA Jewish group of laymen in the first century.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Priestly Source",
                           @"twitterDef":@"the literary source in the Torah\r that is concerned with priestly categories",
                           @"definition":@"\rThe Priestly, or “P” tradition in the Torah can be dated to the time of Hezekiah (ca. 700 B.C.) and shows a major concern for order, numbers, and categories of holiness and cleanliness, especially in the book of Leviticus. The Priestly material is centered on the sacrificial cult in Jerusalem and regards all other sacrifices as improper or “profane”; this source, along with the Elohist and Deuteronomic Sources, does not accept the revelation of the name YHWH before the Mosaic epiphany in Exodus 3.\r\rThe Hebrew of the Priestly author reflects a later stage in its development but earlier than that of the Deuteronomic author. Notably, the P source never uses the word “compassionate” to describe God and forgiveness requires atonement (e.g. the Day of Atonement is a ritual exclusive to the Priestly author).\r\rFurther Reference:\rWikipeida, “Priestly Source”\rhttp://tinyurl.com/yq83pf",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Primeval History",
                           @"twitterDef":@"\rThe mythological stories of Genesis 1 - 11",
                           @"definition":@"Genesis chapters 1 - 11.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Prophet",
                           @"twitterDef":@"one who speaks in the place of God",
                           @"definition":@"\rThis term is used in the Old Testament to refer to either a court prophet (such as Nathan) or an independent prophet (such as Amos).\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Prophetic Books",
                           @"twitterDef":@"the fourth of four sections in the Old Testament",
                           @"definition":@"\rThe fourth of four sections in the Old Testament.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Philosophy",
                           @"twitterDef":@"the critical examination of human thought;\rthe love of wisdom",
                           @"definition":@"rthe critical examination of human thought; the love of wisdom.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Physicalism",
                           @"twitterDef":@"The belief that phenemena traditionally attributed to the soul can be more simply explained by the functioning of a brain",
                           @"definition":@"\rPhysicalism has received from support from modern neuroscience. Various Christian philosophers, such as Nancy Murphy, are advocates of a non-reductive, physicalist anthropology.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Problem of Evil",
                           @"twitterDef":@"the philosophical problem of belief in God and the experience of evil",
                           @"definition":@"\rThe philosophical problem that results from belief in Divine omniscience, omnipotence, and omnibenevolence and the experience of suffering and evil in the world.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    
    ///////////////////////////Q
    
    
    
    
    [TAWord wordWithDict:@{@"name":@"Q Source",
                           @"twitterDef":@"the hypothetical written source that lies behind similar passages in Matthew and Luke",
                           @"definition":@"\rThe hypothetical written source that lies behind the similar passages, exclusive to Matthew and Luke, which contain various teachings of Jesus; from the German word “quelle' - “source”.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Quintessence",
                           @"twitterDef":@"a term meaning “fifth essence”; used by Aristotle to refer to a substance higher than the four of earth, wind, water, and fire",
                           @"definition":@"\rA term meaning “fifth essence”; used by Aristotle to refer to a substance higher than the four on earth.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Quartodeciman Controversy",
                           @"twitterDef":@"a 2nd century liturgical dispute\rover the celebration of Easter",
                           @"definition":@"\rLeviticus 23:5 regulates the celebration of Passover to the fourteenth day of Nisan. Asiatic Christians celebrated the Resurrection of Jesus on that exact day, while Roman Christians celebrated Easter on the first Sunday after the Nisan 14. Irenaeus of Lyons persuaded Anicetus, the Bishop of Rome at the time, not to excommunicate the Asiatic churches over such a difference.\r\rFurther Reference:\r",
                           @"category":@"Historical"}];
    
    //R
    
    [TAWord wordWithDict:@{@"name":@"Redaction Criticism",
                           @"twitterDef":@"the analysis of the various stages\rof the redaction of a text",
                           @"definition":@"\rthe type of criticism that seeks to decipher and analyze\rthe various stages of redaction of a text\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Redemption",
                           @"definition":@"\rthe process of exchanging the economic value of an object.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Repentance",
                           @"twitterDef":@"the changing of one's thinking or spiritual orientation",
                           @"definition":@"\rRepentance is necessary when one's relationship with God is impaired by sin. It is a theme of the Hebrew prophets in the Old Testament. In the New Testament, repentance is linked to the forgiveness of sins in Baptism. See “Baptism”.\r\rGreek, μετάνοια (metanoia) “after thought”\r\rFurther Reference:\rCatechism of the Catholic Church, 1431\rhttp://tinyurl.com/l7xon9e",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Ressourcement",
                           @"twitterDef":@"a French term meaning “to return to the sources”",
                           @"definition":@"\rtThis term is used by some theologians as the preferred interpretation of the purpose of Vatican II; that being a return to the Patristic sources of the Church. It was given the French designation, La Nouvelle Theologie (The New Theology) by its critics who accused the movement of being, instead of true return to the sources, the invention of a new theology which was too accommodating to the errors of Modernism.\r\rSee “Aggiornomento”, “Modernism”.\r\rFurther Reference:\rLa Nouvelle Theologie, Ressourcement\rhttp://tinyurl.com/lt3ph7g",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Resurrection",
                           @"twitterDef":@"God's raising the righteous dead into eternal life",
                           @"definition":@"\rThe belief in resurrection developed in post-Exilic Judaism, in part, as an answer the question of the persecution of the righteous. The early Christians believed that Jesus of Nazareth was raised from the dead and thus, demonstrated to be the Messiah and Lord. Paul claims that the resurrection of Jesus was the “firstfruits” of the general resurrection that inaugurated the eschaton. Pierre Teilhard de Chardin interpreted the Resurrection as a pre-figuring of the endpoint of human evolution, which he termed the “Omega Point”. See 1 Corinthians 15.\r\rFurther Reference:\rCatechism of the Catholic Church, 638-655\rhttp://tinyurl.com/nrt2f6g",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Religious Naturalism",
                           @"twitterDef":@"a movement within naturalism that emphasizes scientific knowledge as a foundational mythos",
                           @"definition":@"\rA movement within naturalism which emphasizes the scientific history of the universe as a core mythos around which revolve interpretive, spiritual, and moral axes.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Rerum Novarum",
                           @"twitterDef":@"the encyclical of Pope Leo XIII that laid the foundations of modern Catholic Social Teaching",
                           @"definition":@"\rThe encyclical of Pope Leo XIII in 1891 which responded to the after effects of the Industrial Revolution in Europe by teaching that private property is relative to the Common Good and that workers have a right to unionized and to a living wage.\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Rosary",
                           @"twitterDef":@"a movement within naturalism that emphasizes scientific knowledge as a foundational mythos",
                           @"definition":@"\rA movement within naturalism which emphasizes the scientific history of the universe as a core mythos around which revolve interpretive, spiritual, and moral axes.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    
    
    //////////////////////////////////////S
    
    
    
    [TAWord wordWithDict:@{@"name":@"Sacramental",
                           @"twitterDef":@"sacred signs that signify\rthe effects of Sacraments",
                           @"definition":@"\rSacramentals dispose the Faithful to receive the grace of the Sacraments. They are instituted for the sanctification of various circumstances in the Christian vocation.\r\rFurther Reference:\rCatechism of the Catholic Church, 1667-1676\rhttp://tinyurl.com/oo3cp5p",
                           @"category":@"Liturgical"}];
    
    [TAWord wordWithDict:@{@"name":@"Salvation",
                           @"twitterDef":@"the experience of being saved from sin and eventually death",
                           @"definition":@"\rThe experience of being saved from sin and eventually death.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Schism",
                           @"twitterDef":@"the Greek word meaning “division”; a split in visible unity of the Church",
                           @"definition":@"\rSchisms are not necessarily heresies; they are the result of a failure in discipline, which may include matters of belief. Schisms may result from non-doctrinal matters. Paul mentions a local schism in the church at Corinth. While every heresy necessarily involvesa schism, not every schism necessarily involves a heresy. See “Heresy”.\r\rFurther Reference:\rCatechism of the Catholic Church, 2089\rhttp://tinyurl.com/lu75a9k",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Selucid",
                           @"twitterDef":@"the descendants of Alexander the Great that ruled in Syria",
                           @"definition":@"\rthe descendants of Alexander the Great.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Social Justice",
                           @"twitterDef":@"the type of justice which prioritizes the common good with a preferential option for the poor and marginalized",
                           @"definition":@"\rAccording to Pope Paul VI, social justice is an essential aspect to the proclamation of the gospel.\r\rFurther Reference:\r",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Soteriology",
                           @"twitterDef":@"the study of salvation; a particular framework of salvation",
                           @"definition":@"\rthe study of salvation; a particular framework of salvation.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Sadducees",
                           @"twitterDef":@"the elite class of Jerusalem-based Temple scribes that mediated with the Roman occupation",
                           @"definition":@"\rthe elite class of Jerusalem-based Temple scribes.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Satan",
                           @"twitterDef":@"the adversarial being found in post-Exilic Hebrew literature that serves to represent evil events...",
                           @"definition":@"\rthe adversarial being found in post-Exilic Hebrew literature that serves to represent evil events.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Septuagint",
                           @"twitterDef":@"the Greek translation of the Old Testament made at the request of Alexander the Great",
                           @"definition":@"\rthe Greek translation of the Old Testament made at the request of Alexander the Great.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Source Criticism",
                           @"twitterDef":@"the analysis of the\runderlying source of a text",
                           @"definition":@"\rthe exegetical criticism that seeks to decipher and analyze the underlying source of a text.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synagogue",
                           @"twitterDef":@"The local place of weekly assembly for Jews during the Exile in Babylon",
                           @"definition":@"\rThe local place of weekly assembly for Jews during the Exile in Babylon; carried over into post-Exilic Judaism - from the Greek “to go together“.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synchronic",
                           @"twitterDef":@"the type of truth that is relative to the time of a text's composition",
                           @"definition":@"\rthe type of truth that is relative to the time of a text's composition, usually relating to the worldview of the author.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Synoptic",
                           @"twitterDef":@"a Greek term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity",
                           @"definition":@"\ra term meaning “to see together”; used to refer to the gospels of Matthew, Mark, and Luke due to their similarity of narrative and Christology contrasted with the gospel of John; from the Greek word συν (syn) - “together” and οπσις (opsis) - “appearance”.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Semiotics",
                           @"twitterDef":@"the study of signs and symbols used as elements of communication",
                           @"definition":@"\rthe study of signs and symbols used as elements of communication.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Sociology",
                           @"twitterDef":@"The study of society",
                           @"definition":@"\rThe study of society.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Solidarity",
                           @"twitterDef":@"the fundamental unity of human beings which should be a criteria for determining justice",
                           @"definition":@"\rSolidarity is a basic principle of Catholic Social Teaching.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Spirituality",
                           @"twitterDef":@"the conscious process of integration of one's life toward Ultimate value",
                           @"definition":@"\rthe conscious process of integration of one's life toward Ultimate value.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Structuralism",
                           @"definition":@"\rthe anthropological movement based on the work of Levi Strauss.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    [TAWord wordWithDict:@{@"name":@"Supernormal Allurements",
                           @"twitterDef":@"the attraction to concentrated quantities of substances that allowed hu;manity to evolve and flourish, such as sugar, salt, and sex",
                           @"definition":@"\rthe attraction to concentrated quantities of substances that allowed hu;manity to evolve and flourish, such as sugar, salt, and sex.\r\rFurther Reference:\r",
                           @"category":@"Cultural"}];
    
    
    ////////////////////////////////T
    
    
    
    [TAWord wordWithDict:@{@"name":@"Theodicy",
                           @"twitterDef":@"the question of God's justice in the face of suffering and evil",
                           @"definition":@"\rThe question of God's justice in the face of suffering and evil.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theological Notes",
                           @"twitterDef":@"qualifications of different Church teachings\ras having different levels of authority",
                           @"definition":@"\rTheological Notes are given to clarify the level of authority of a particular doctrine. Not every doctrine is, of itself, infallible. Noninfallible teaching, while believed to be definitive, is nevertheless subject to revision. The International Theological Commission distinguished between common doctrines of the Church and faith of the Church:\r\r“The fact that tradition is a really live reality explains why there are so many declarations by the Magisterium of varying importance and varying degrees of obligation. To gauge these exactly and to interpret them, theology has worked out the doctrine of theological qualifications or notes, which, to some extent, the Magisterium has adopted. In recent times, this approach has unfortunately been more or less forgotten. But it is useful in the interpretation of dogma and should therefore be repristinated and developed further.”\r\rTo illustrate this point, the doctrine of Limbo, even though taught by Popes and the Magisterium as part of the common doctrine of the Church, nevertheless was never infallibly defined as being a part of Divine Revelation. As such, it was qualified as being theological opinion and not of the Faith in 2007 by the International Theological Commission.\r\rFurther Reference:\rInternational Theological Commission, “The Interpretation of Dogma”\rhttp://tinyurl.com/md9yco5",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theologoumenon",
                           @"twitterDef":@"a theological opinion on a disputable matter that has not been defined in Church teaching",
                           @"definition":@"\rA theological opinion on a disputable matter that has not been defined in Church teaching.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theology",
                           @"twitterDef":@"the study of God",
                           @"definition":@"\rThe study of God.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Theosis",
                           @"twitterDef":@"the process of becoming like God, emphasized in the Easter Orthodox tradition",
                           @"definition":@"\rThe process of becoming like God, emphasized in the Easter Orthodox tradition.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Tradition",
                           @"twitterDef":@"the process of handing over beliefs and practices",
                           @"definition":@"\rthe process of handing over beliefs and practices.\r\rFurther Reference:\r\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Transcendence",
                           @"twitterDef":@"the quality of going beyond human experience",
                           @"definition":@"\rthe quality of going beyond human experience.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Transubstantiation",
                           @"twitterDef":@"the Thomistic concept that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist",
                           @"definition":@"\rthe belief, formulated by Thomas Aquinas, that the substance of the bread and wine change into the substance of the body and blood of Christ in the Eucharist.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Trinity",
                           @"twitterDef":@"the existence of God in three persons; Father, Son, and Holy Spirit",
                           @"definition":@"\rThe belief that God exists in three persons.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Tabernacle",
                           @"twitterDef":@"the pre-Solomonic temporary dwelling place of YHWH in Israel",
                           @"definition":@"\rThe Tabernacle was initially housed at Shiloh.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Tanak",
                           @"twitterDef":@"an acronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im",
                           @"definition":@"\rAcronymic term to describe the Hebrew Bible: T = Torah, N = Nevi'im, K = Ketuv'im. Since Hebrew has no vowels, those are added.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Tax Collectors",
                           @"twitterDef":@"a class of Jews who collected provincial taxes for the Roman Empire",
                           @"definition":@"\rJews who collected provincial taxes for the Roman Empire; frequently referenced in the gospels due to their presence at numerous border crossings throughout Israel. They were reviled as traitors, likely cheats, and possible idolators. Jesus includes one such person (Matthew) in his inner circle of disciples.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Temple",
                           @"twitterDef":@"the permanent dwelling place of YHWH in Israel",
                           @"definition":@"\rThe dwelling place of YHWH.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Textual Criticism",
                           @"twitterDef":@"the analysis of the\roriginal language of a text",
                           @"definition":@"\rThe exegetical criticism that deciphers and analyzes the original language of a text.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Theophany",
                           @"twitterDef":@"an appearance of God to a human being in which Divine communication occurs",
                           @"definition":@"\rAn appearance of God to a human being. Numerous theophanies are recorded throughout the Bible with the account of Moses being paradigmatic.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Torah",
                           @"twitterDef":@"the first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy",
                           @"definition":@"\rThe first five books and first section of the Tanak; Genesis, Exodus, Leviticus, Numbers, and Deuteronomy.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Typology",
                           @"twitterDef":@"a way of interpreting the Old Testament through a Christological hermeneutic",
                           @"definition":@"\rA way of reading the Old Testament.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    

    ////////////////////////////////////U
    
    
    
    [TAWord wordWithDict:@{@"name":@"Universal Destination of Goods",
                           @"twitterDef":@"the idea that the goods of the earth are intended to be justly distributed",
                           @"definition":@"\rThe idea that the goods of the earth are intended to be justly distributed among its inhabitants according to the will of the Creator.\r\rFurther Reference:\rThe Compendium of the Social Doctrine of the Church, 171",
                           @"category":@"Moral"}];
    
    [TAWord wordWithDict:@{@"name":@"Universalism",
                           @"twitterDef":@"the belief that all of humanity will ultimately experience salvation",
                           @"definition":@"\rThe belief that all of humanity will ultimately experience salvation.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    //V
    
    [TAWord wordWithDict:@{@"name":@"Virginal Conception",
                           @"twitterDef":@"the belief that Jesus of Nazareth was conceived by the Holy Spirit",
                           @"definition":@"\rBoth the gospels of Matthew and Luke claim that Jesus was concieved by a virgin mother. Later tradition would develop the idea of Mary's perpetual viriginity although this idea was not univerally accepted.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Vocation",
                           @"twitterDef":@"the calling by God of someone to a particular way of life",
                           @"definition":@"\rThe calling by God of someone to a particular way of life.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    //W
    
    [TAWord wordWithDict:@{@"name":@"Wisdom Literature",
                           @"twitterDef":@"a genre of literature in the Old Testament that contains wise sayings and philosophical reflections on life",
                           @"definition":@"\ra type of literature that contains wise sayings and philosophical reflections on life.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Poetic",
                           @"twitterDef":@"the third of four sections in the Old Testament, it contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach",
                           @"definition":@"\rThe third of four sections in the Old Testament; it consists mainly of various writings; contains Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    
    [TAWord wordWithDict:@{@"name":@"Word of God",
                           @"twitterDef":@"the saving message of God in which humans trust for salvation",
                           @"definition":@"\rThe saving message of God in which humans trust.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    [TAWord wordWithDict:@{@"name":@"Will of God",
                           @"twitterDef":@"The ultimate desire of God for creation",
                           @"definition":@"\rThe ultimate desire of God for creation.\r\rFurther Reference:\r",
                           @"category":@"Systematic"}];
    
    
    //X
    
    [TAWord wordWithDict:@{@"name":@"Xenophobia",
                           @"twitterDef":@"the fear of foreigners",
                           @"definition":@"\rThe fear of foreigners. The ministry of the historical Jesus can be seen, partly, as a movement against the xenophobic nationalism of the religious elite in Second Temple Judaism.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    //Y
    
    [TAWord wordWithDict:@{@"name":@"Yahwist Source",
                           @"twitterDef":@"the “J” Source...",
                           @"definition":@"\rThe “J” Source...\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"YHWH",
                           @"twitterDef":@"the personal name\rof the God of the Israelites",
                           @"definition":@"\rThe four letter personal name of the God of the Israelites, also called the 'Tetragrammaton'; it was likely pronounced 'Yah-WEY”; according to the E and P sources, this name was not known before it was revealed to Moses in Exodus chapter 3, the J source, however, uses it throughout Genesis, which is one argument for the Documentary Hypothesis.\r\rHebrew, יְהוָ֨ה (YHWH) ?\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Yom Kippur",
                           @"twitterDef":@"a Hebrew phrase meaning “Day of Atonement”",
                           @"definition":@"\rAccording to Leviticus 16, Yom Kippur is a day set aside on the Jewish calendar dedicated to bringing about personal and national reconciliation with YHWH.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    //Z
    
    [TAWord wordWithDict:@{@"name":@"Zealots",
                           @"twitterDef":@"a Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces",
                           @"definition":@"\rA Jewish revolutionary group that used violence in an effort to repel Roman Imperial forces.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [TAWord wordWithDict:@{@"name":@"Zion",
                           @"twitterDef":@"a synonym for the Temple Mount in Jerusalem or for the city of Jerusalem itself",
                           @"definition":@"\rA synonym for the Temple mountain in Jerusalem or for the city of Jerusalem itself.\r\rFurther Reference:\r",
                           @"category":@"Biblical"}];
    
    [[TADataStore sharedStore] saveContext];
}

@end
