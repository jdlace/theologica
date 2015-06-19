//
//  SourceContentViewController.m
//  theologica
//
//  Created by Jonathan Lace on 5/23/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "SourceContentViewController.h"

@interface SourceContentViewController ()

@end

@implementation SourceContentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"scriptureDetail"])
        {
        Source *scriptureSource = [[Source alloc] init];
        scriptureSource.name = @"Sacred Scripture";
        scriptureSource.twitterDef = @"The Word of God in Human Language";
        scriptureSource.comment = @"\rThroughout the history of the Catholic tradition, the canon of Scripture has always played a central and dialectic role in the community life of the Church. The Dogmatic Constitution on Divine Revelation (Dei Verbum) from Vatican II contains the most authoritative statement on the Church's belief about Sacred Scripture:\r\r“Those divinely revealed realities which are contained and presented in Sacred Scripture have been committed to writing under the inspiration of the Holy Spirit. For holy mother Church, relying on the belief of the Apostles (see John 20:31; 2 Tim. 3:16; 2 Peter 1:19-20, 3:15-16), holds that the books of both the Old and New Testaments in their entirety, with all their parts, are sacred and canonical because written under the inspiration of the Holy Spirit, they have God as their author and have been handed on as such to the Church herself. In composing the sacred books, God chose men and while employed by Him they made use of their powers and abilities, so that with Him acting in them and through them, they, as true authors, consigned to writing everything and only those things which He wanted.” (Dei Verbum, 11).\r\rThe Hebrew Bible is the foundation of the Biblical tradition.\r\rThe Old Testament\r\rConsisting of the Hebrew canon plus seven additional books of the Apocrypha, the Old Testament contains the story of the people of Israel. It is divided into the Pentateuch, Historical Books, Novellas, Prophetic Books, and Wisdom Books.\r\rThe Pentateuch contains the 5 books of the Torah: Genesis, Exodus, Leviticus, Numbers, and Deuteronomy. The Historical Books contain Joshua, Judges, Ruth, 1 & 2 Samuel, 1 & 2 Kings, 1 & 2 Chronicles, Ezra, and Nehemiah. The Novellas are Tobit, Judith, Esther, and 1 & 2 Maccabees. The Prophetic Books consist of Isaiah, Jeremiah, Lamentations, Baruch, Ezekiel, Daniel, Hosea, Joel, Amos, Obadiah, Jonah, Micah, Nahum, Habakkuk, Zephaniah, Haggai, Zechariah, and Malachi. The Wisdom Books contain Job, Psalms, Proverbs, Ecclesiastes, Song of Songs, Wisdom, and Sirach.\r\rThe New Testament\r\rThe gospels of Matthew, Mark, Luke, and John narrate the life of Jesus through the perspective of faith in his divine sonship. These are followed by the Acts of the Apostles, which describes the birth and growth of the nacent Church “...in Jerusalem, throughout all Judea and Samaria, and the uttermost parts of the world” (Acts 1:8). The letters of St. Paul follow next with Romans, 1 & 2 Corinthians, Galatians, Ephesians, Philippians, Colossians, 1 & 2 Thessalonians, 1 & 2 Timothy, Titus, and Philemon. Then follow the so-called General letters - Hebrews, James, 1 & 2 Peter, 1 - 3 John, and Jude. The book of Revelation concludes the New Testament.\r\rManuscripts\r\rThe manuscript tradition of the New Testament contains over 3,000 extant fragments and complete copies of the canonical 27 books. Codex Sinaiticus is the oldest extant complete copy of the New Testament (dating back to the 4th century) and papyrus fragment 52 is the oldest piece of the New Testament (dating back as early as A.D. 120).\r\rFurther Reference:\rWikipedia, “New Testament”\rhttp://tinyurl.com/sxnv4\r\r\r";
        scriptureSource.bigPic = [UIImage imageNamed:@"codex"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = scriptureSource;
        }
    else if ([segue.identifier isEqualToString:@"magisteriumDetail"])
        {
        Source *catechismSource = [[Source alloc] init];
        catechismSource.name = @"Magisterium";
        catechismSource.twitterDef = @"The Teaching Authority of the Church";
        catechismSource.comment = @"\rThe Magisterium represents the teaching authority of the Church which derives from the prophetic office of Christ. The Church formulates its teaching from the Deposit of Faith, which it constantly interprets and which it has received from the Apostles. In the hierarchy of the Church, the Bishops are seen as the successors of the Apostles and the primary responsibles for teaching the Faith. The Magisterium shares in the Infallibility of the Church when it teaches in communion with the Bishop of Rome, the Pope. The Bishop of Rome (the Pope) is the visible sign of unity of the Bishops and the Church. According to the Catechism of the Catholic Church, 85:\r\r“The task of giving an authentic interpretation of the Word of God, whether in its written form or in the form of Tradition, has been entrusted to the living teaching office of the Church alone. Its authority in this matter is exercised in the name of Jesus Christ. This means that the task of interpretation has been entrusted to the Bishops in communion with the successor of Peter, the Bishop of Rome.”\r\rAs a Source for Theology, the Magisterium exists in a vital and faithful tension with Theologians due to their respective vocations and roles in the Church.\r\r“The exercise of their tasks by the Magisterium and theologians often gives rise to a certain tension. But this is not surprising, nor should one expect that such tension will ever be fully resolved here on earth. On the contrary, wherever there is genuine life, tension also exists. Such tension need not be interpreted as hostility or real opposition, but can be seen as a vital force and an incentive to a common carrying out of the respective tasks by way of dialogue.” -“The Magisterium and Theology”, II.9\r\rThe Faithful also have a role to play in the the Magisterium of the Church via the Sensus Fidelium insofar as they have, at times, maintained orthodox Catholic belief during times of heretical Bishops, particularly in the Patristic period.\r\rFurther Reference:\rInternational Theological Commision\r“The Magisterium and Theology”\rhttp://tinyurl.com/ppvgwef\r\rCatechism of the Catholic Church, 85-95\rhttp://tinyurl.com/bx8mnlu\r\r\r";
        catechismSource.bigPic = [UIImage imageNamed:@"peter"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = catechismSource;
        //[((SourcesDetailViewController *)segue.destinationViewController) p
        }
    else if ([segue.identifier isEqualToString:@"fathersDetail"])
        {
        Source *fathersSource = [[Source alloc] init];
        fathersSource.name = @"Church Fathers";
        fathersSource.twitterDef = @"Stewards of the Faith";
        fathersSource.comment = @"\rThe Fathers of the Church occupy a special place in the Catholic Tradition. The Fathers were the earliest intepreters of the Faith against heresies and controversies through the first eight centuries of the Church. As such, they are an essential source for Theology. The age of the Fathers ususally is dated from the end of the 2nd century through the the end of the 8th century. The most frequently used organization of the Fathers is made in reference to the Nicene Council:\r\r-Ante-Nicene\r-Nicene\r-Post-Nicene\r\rAnte-Nicene Fathers\r\rThe Ante-Nicene fathers include writers such as St. Clement of Rome, St. Ignatius of Antioch, St. Justin Martyr, St. Irenaeus of Lyon, Origen of Alexandria, St. Clement of Alexandria, Tertullian of Carthage, St. Hippolytus of Rome, and St. Polycarp of Smyrna.\r\rNicene & Post-Nicene Fathers\r\rThe Nicene & Post-Nicene Fathers include writers such as St. Athanasius, St. Gregory of Nazianzus, Basil of Caesarea, St. Gregory of Nyssa, St. Jerome, St. Augustine of Hippo, St. Vincent of Lerins, St. Cyril of Alexandria, and St. Maximus the Confessor.\r\rThe Second Vatican Council drew heavily upon Patristic thought as seen in the French term “ressourcement” (a return to the sources) which was one of two major emphases at Vatican II. See the Fathers section of the Reference tab.\r\rFurther Reference:\rWikipedia, “Church Fathers”\rhttp://tinyurl.com/2efb7l\r\r\r";
        fathersSource.bigPic = [UIImage imageNamed:@"fathers"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources" style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = fathersSource;
        }
    
    else if ([segue.identifier isEqualToString:@"liturgyDetail"])
        {
        Source *liturgySource = [[Source alloc] init];
        liturgySource.name = @"Liturgy";
        liturgySource.twitterDef = @"The Church in Worship";
        liturgySource.comment = @"\rIn its broadest sense, Liturgy is the participation of the Church in the Paschal Mystery. More colloquially, the public worship of the Church is commonly referred to as Liturgy. The Sunday Mass is composed of the Liturgy of the Word and the Liturgy of the Eucharist. The former celebrates the Word of God and the latter celebrates the mystery of Christ's death and resurrection. The daily worship of the Church is known as the Liturgy of the Hours. In each of these, the Church expresses what it believes. This is known as the principle of Lex Orandi-Lex Credendi (“the law of prayer is the law of belief”). Liturgy is a source for Theology for precisely this reason.\r\rThe Dogmatic Constitution on the Sacred Liturgy, promulgated by the Second Vatican Council, is the most authoritative teaching by the Church on the Liturgy. Paragraph 2 states that the Liturgy,:\r\r“...through which the work of our redemption is accomplished, most of all in the divine sacrifice of the Eucharist, is the outstanding means whereby the faithful may express in their lives, and manifest to others, the mystery of Christ and the real nature of the true Church.”\r\rOne of the major reforms of Vatican II was the inclusion of the Liturgy in the vernacular, as opposed to Latin exclusively. The 1970 Novus Ordo was the basis of subsequent vernacular translations. Most recently, in 2011, the U.S. Bishops published a revised version of the Roman Missal, based on a formal correspondence translation philosophy.\r\rFurther Reference:\rCatechism of the Catholic Church, 1136-1199\rhttp://tinyurl.com/oa9lfkj\r\r\r";
        liturgySource.bigPic = [UIImage imageNamed:@"liturgy7"];
        //liturgySource.scrollPic = [UIImage imageNamed:@"stainedColor"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = liturgySource;
        
        }
    
    else if ([segue.identifier isEqualToString:@"councilsDetail"])
        {
        Source *councilsSource = [[Source alloc] init];
        councilsSource.name = @"Ecumenical Councils";
        councilsSource.twitterDef = @"The Church Seeking Discernment";
        councilsSource.comment = @"\rEcumenical Councils are called to settle matters of faith and practice. In the Catholic Tradition, there have been 21 such Councils. They are:\r\r1. Nicea, 325\r2. Constantinople, 381\r3. Ephesus, 431\r4. Chalcedon, 451\r5. Constantinople II, 553\r6. Constantinople III, 680-681\r7. Nicea II, 787\r8. Constantinople IV, 869-870\r9. Lateran I, 1123\r10. Lateran II, 1139\r11. Lateran III, 1179\r12. Lateran IV, 1215\r13. Lyon I, 1245\r14. Lyon II, 1274\r15. Vienne, 1311-1312\r16. Constance, 1414-1418\r17. Florence, 1431-1445\r18. Lateran V, 1512-1517\r19. Trent, 1545-1563\r20. Vatican I, 1870\r21. Vatican II, 1962-1965\r\rThe most recent Council, Vatican, II, was called by Pope John XXIII in 1962 and held session until 1965. Its proceedings were approved by Pope Paul VI. Vatican II produced four Dogmatic Constitutions, which are teachings that carry the highest authority within Magisterial statements. See the Historical category of pins in the Maps tab.\r\r\r";
        councilsSource.bigPic = [UIImage imageNamed:@"vaticanII"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = councilsSource;
        
        }
    
    else if ([segue.identifier isEqualToString:@"creedsDetail"])
        {
        Source *creedsSource = [[Source alloc] init];
        creedsSource.name = @"Creeds";
        creedsSource.twitterDef = @"Statements of Faith";
        creedsSource.comment = @"\rThe Creeds of the Church give expression to the Faith of the Church. Instead of interpreting them as exhaustive statements of the Faith, it is more helpful to view the historic Creeds as a set of parameters against which Catholic orthodoxy is determined. The earliest creed was simply Jesus is Lord, which was used by the early Christians as evidenced in St. Paul's letters. As time passed, the need arose to continously define the Faith of the Church against various heresies that threatened to deny some aspect of the Apostolic Tradition:\r\rThrough the centuries many professions or symbols of faith have been articulated in response to the needs of the different eras: the creeds of the different apostolic and ancient Churches (e.g., the Quicumque, also called the Athanasian Creed); the professions of faith of certain Councils, such as Toledo, Lateran, Lyons, Trent; or the symbols of certain Popes (e.g., the Fides Damasi or the Credo of the People of God of Paul VI). None of the creeds from the different stages in the Church's life can be considered superseded or irrelevant. They help us today to attain and deepen the faith of all times by means of the different summaries made of it. Among all the creeds, two occupy a special place in the Church's life: The Apostles' Creed is so called because it is rightly considered to be a faithful summary of the apostles' faith. It is the ancient baptismal symbol of the Church of Rome. Its great authority arises from this fact: it is the 'Creed of the Roman Church, the See of Peter the first of the apostles, to which he brought the common faith'. The Niceno-Constantinopolitan or Nicene Creed draws its great authority from the fact that it stems from the first two ecumenical Councils (in 325 and 381). It remains common to all the great Churches of both East and West to this day.“ - Catechism, 192-195\r\rThe Apostles' Creed\r\rIn the 2nd century, the Apostles' Creed came to prominence in the Church of Rome around the year A.D. 150. This was an early statement of faith, that reflected an age in which the Church was just beginning to make significant contact with the larger Greco-Roman culture.\r\r“I believe in God, the Father almighty, Creator of heaven and earth, and in Jesus Christ, his only Son, our Lord, who was conceived by the Holy Spirit, born of the Virgin Mary, suffered under Pontius Pilate, was crucified, died and was buried; he descended into hell; on the third day he rose again from the dead; he ascended into heaven, and is seated at the right hand of God the Father almighty; from there he will come to judge the living and the dead. I believe in the Holy Spirit, the holy catholic Church, the communion of saints, the forgiveness of sins, the resurrection of the body, and life everlasting. Amen.”\r\rThe Nicene Creed\r\rAs the Church felt the need to define particular aspects of teaching, so also did the creeds become more specific. Thus, in order to clarify the Catholic belief in God as opposed to the Gnostic view of the Demiurge, the opening statement declares God to be the Creator of all things both visible and invisible. In order to combat Arianism, the Nicene Creed gives an extensive treatment of the nature of the Son and his relationship to the Father. The original Nicene Creed only contained a brief mention of the Holy Spirit. The Council of Constantinople in A.D. 381 developed the teaching on the Spirit in terms of procession and the inspiration of the Prophets. Finally, the Nicene Creed states that the Church itself is an article of Faith. For these reasons, the Creeds are a Source for Theology.\r\r“We believe in one God, the Father, the Almighty, maker of heaven and earth, of all that is, seen and unseen.\r\rWe believe one Lord, Jesus Christ, the only Son of God, eternally begotten of the Father, God from God, Light from Light, true God from true God, begotten, not made, one in Being with the Father. Through Him all things were made. For us men and for our salvation, He came down from heaven: by the power of the Holy Spirit He was born of the Virgin Mary, and became Man. For our sake He was crucified under Pontius Pilate. He suffered, died, and was buried. On the third day He rose again in fulfillment of the Scriptures; He ascended into heaven, and is seated at the right hand of the Father. He will come again in glory to judge the living and the dead, and His kingdom will have no end.\r\rWe believe in the Holy Spirit, the Lord, the Giver of life, Who proceeds from the Father and the Son. With the Father and the Son He is worshiped and glorified. He has spoken through the prophets.\r\rWe believe in one, holy, catholic, and apostolic Church. We acknowledge one Baptism for the forgiveness of sins. We look for the resurrection of the dead, and the life of the world to come. Amen.”\r\r\r";
        creedsSource.bigPic = [UIImage imageNamed:@"creed2"];
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Sources"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = creedsSource;
        }
    
    
}



- (IBAction)theologicaButton:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"The Sources of Theology"  message:@"The Sources of Theology are those elements of the Christian Tradition which are essential to the life of the Church and to reflection upon the Faith. They are all inter-related as expressions of the human attempt to interpret Divine Revelation in all aspects of human experience." preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Amen" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}//
@end
