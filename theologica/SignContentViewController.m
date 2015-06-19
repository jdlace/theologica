//
//  SignContentViewController.m
//  theologica
//
//  Created by Jonathan Lace on 5/23/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "SignContentViewController.h"

@interface SignContentViewController ()

@end

@implementation SignContentViewController

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
    
    if ([segue.identifier isEqualToString:@"scienceDetail"])
        {
        Source *scienceSource = [[Source alloc] init];
        scienceSource.name = @"Science";
        scienceSource.twitterDef = @"Knowlege of the Physical World";
        scienceSource.comment = @"\rAs a separate but related domain of knowledge, Science is akin to Theology in that it involves a specific methodology designed to answer a specific set of questions about human experience. Science is a specific and limited discipline that posits natural explanations for physical phenomena using empirical methods of analysis. Science originated as part of the broader quest for wisdom in the form of ancient Philosophy. In relation to Aristotle's Four Types of Causation, Science would be equivalent to the study of efficient causation. Science necessarily limits its explanations to natural causes in order to ensure testability by using the Scientific Method.\r\rScience is a Sign of the Times because it provides ever-increasing knowledge about the created order, and this knowledge directly affects how Theology understands the God-World relationship. In a letter to the then-director of the Vatican Observatory in 1998, Pope John Paul II claimed that in order to be authentic and relevant Theology must incorporate the findings of Science:\r\r“Theology will have to call on the findings of science to one degree or another as it pursues its primary concern for the human person, the reaches of freedom, the possibilities of Christian community, the nature of belief and the intelligibility of nature and history. The vitality and significance of theology for humanity will in a profound way be reflected in its ability to incorporate these findings.”\r\rSince Vatican II, the Church has recognized the impact of scientific findings on Theology. In “Gaudium et Spes: Dogmatic Constitution on the Church in the Modern World”, the Council fathers specifically mentioned that scientific findings had been among recent challenges in the larger context of the Signs of the Times:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis...The recent studies and findings of science, history and philosophy raise new questions which effect life and which demand new theological investigations.”\r\rThat acknowledgement launched over half a century of renewed theological engagement with the sciences. While science has its own autonomy, the proper incorporation of Science into Theology contextualizes scientific findings in the larger perspective of the work of the Creator. As Dr. John Haught claims:\r\r“We live in an age of science, astrophysics, evolutionary biology, and information. These cumulatively have given us an entirely new picture, or story, of the universe, and we are obliged to treat the notion of revelation in terms that relate it to these developments. The perennial human questions concerning what this universe is all about are being raised in a new and striking way today. Does cosmic evolution have any direction to it? How does our species fit into the evolutionary picture? How are we to understand our own existence now that it has become clearer than ever that we too are part of an evolving world? What sense can we make of the apparent randomness, struggle, and impersonal natural selection that seem to be the main ingredients of evolution? Why did the universe take fifteen billion years to bring forth conscious beings here on earth? What sense can we possibly make of the immense size of the universe, in which so far we have no evidence that other intelligent life exists? And what if intelligent or spiritual life does exist elsewhere? Then what is the meaning of Israel’s election or of the redemptive significance of Jesus of Nazareth with respect to these hypothetical cosmological conjectures?\r\rScientifically informed people are asking such questions today, and their inquiries should not remain off-limits to our theologies of revelation. Working along with science, theology is obliged at least to attempt some response to them from the point of view of whatever intelligibility is discerned by faith in revelation. From the beginning, Christians have been called upon to give an account of their faith in terms of contemporary modes of thought (for example, 1 Peter 3:15). Questions about the universe and our place in it enchant more and more people today, but revelation theology remains pretty much mute with respect to them. Yet if our theologies of revelation cannot respond -- in some fashion at least -- to the big questions of our time, then they will quite rightly be ignored by contemporary culture.”\r\rThe International Theological Commission published “Communion and Stewardship: Human Persons Created in the Image of God” in 2004. In paragraph 62, the Commission stated that:\r\r“...Christians have the responsibility to locate the modern scientific understanding of the universe within the context of the theology of creation. The place of human beings in the history of this evolving universe, as it has been charted by modern sciences, can only be seen in its complete reality in the light of faith.”\r\rSee “Divine Revelation”, “Evolution” in the Dictionary tab.\r\rFurther Reference:\rPope John Paul II\r“Letter to Rev. George Coyne, 6.1.1998”\rhttp://tinyurl.com/ouxn3ht\r\rDr. John Haught\r“Mystery and Promise: A Theology Of Revelation”\rhttp://tinyurl.com/nhbus5c\r\r\r";
        scienceSource.bigPic = [UIImage imageNamed:@"station"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = scienceSource;
        }
    
    else if ([segue.identifier isEqualToString:@"philosophyDetail"])
        {
        Source *philosophySource = [[Source alloc] init];
        philosophySource.name = @"Philosophy";
        philosophySource.twitterDef = @"The Love of Wisdom";
        philosophySource.comment = @"\rPhilosophy is a product of the human quest to know reality. As such, it has a unique relation to Theology among other Signs of the Times in that it offers conceptual framework upon which Theology has been built. Thus, Theology makes philosophical claims precisely because it makes truth claims about the nature of reality; specifically, Theology makes metaphysical claims about God. As a result, Philosophy necessarily affects Theology. However, apart from its theological appropriation, Philosophy also has an authentic independence which is exercised in the search for truth. The most extensive Magisterial treatment of the relationship between Theology and Philosophy was Pope John Paul II's 1998 encyclical, Fides Et Ratio (Faith and Reason). In that document, the Pope claimed that questions give rise to philospohical inquiry:\r\r“Moreover, a cursory glance at ancient history shows clearly how in different parts of the world, with their different cultures, there arise at the same time the fundamental questions which pervade human life: Who am I? Where have I come from and where am I going? Why is there evil? What is there after this life? These are the questions which we find in the sacred writings of Israel, as also in the Veda and the Avesta; we find them in the writings of Confucius and Lao-Tze, and in the preaching of Tirthankara and Buddha; they appear in the poetry of Homer and in the tragedies of Euripides and Sophocles, as they do in the philosophical writings of Plato and Aristotle. They are questions which have their common source in the quest for meaning which has always compelled the human heart. In fact, the answer given to these questions decides the direction which people seek to give to their lives.”\r\rPhilosophy is a Sign for Theology because it concerns itself precisely with these existential, ultimate questions that give rise to theological reflection as part of the lifelong search for truth and meaning as well as provides a conceptual framework in Theology can make meaningful claims.\r\r“Philosophy emerges...as one of noblest of human tasks. According to its Greek etymology, the term philosophy means 'love of wisdom'. Born and nurtured when the human being first asked questions about the reason for things and their purpose, philosophy shows in different modes and forms that the desire for truth is part of human nature itself. It is an innate property of human reason to ask why things are as they are, even though the answers which gradually emerge are set within a horizon which reveals how the different human cultures are complementary.” -Fides et Ratio, 1,3\r\rFurther Reference:\rPope John Paul II, “Fides et Ratio”\rhttp://tinyurl.com/qfqndk3\r\r\r";
        philosophySource.bigPic = [UIImage imageNamed:@"thinker"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = philosophySource;
        }
    
    else if ([segue.identifier isEqualToString:@"technologyDetail"])
        {
        
        Source *technologySource = [[Source alloc] init];
        technologySource.name = @"Technology";
        technologySource.twitterDef = @"Tools of Human Development";
        technologySource.comment = @"\rSince it coincided with and enabled the evolution of human beings, technology has always influenced and been an expression of human creativity. Technology is a Sign for Theology precisely because it represents the humanity's desire to transcend its limits:\r\r“Technology — it is worth emphasizing — is a profoundly human reality, linked to the autonomy and freedom of man. In technology we express and confirm the hegemony of the spirit over matter. The human spirit, 'increasingly free of its bondage to creatures, can be more easily drawn to the worship and contemplation of the Creator'. Technology enables us to exercise dominion over matter, to reduce risks, to save labour, to improve our conditions of life. It touches the heart of the vocation of human labour: in technology, seen as the product of his genius, man recognizes himself and forges his own humanity. Technology is the objective side of human action whose origin and raison d'etre is found in the subjective element: the worker himself. For this reason, technology is never merely technology. It reveals man and his aspirations towards development, it expresses the inner tension that impels him gradually to overcome material limitations. Technology, in this sense, is a response to God's command to till and to keep the land (cf. Gen 2:15) that he has entrusted to humanity, and it must serve to reinforce the covenant between human beings and the environment, a covenant that should mirror God's creative love.” -Caritas En Veritate, 69\r\rFr. Antonio Spadaro, S.J. has produced the first popular theological engagement with technology in his recent publications. Echoing Pope Benedict, he recounts a comment made by Pope Paul VI and claims that technology is a sign for our desire for God:\r\r“In 1964, Pope Paul VI described the ‘Automation Center of the Aloisianum of Gallarate’ with words of staggering beauty. The Center, at that time, was developing an electronic analysis of the Summa Theologiae by St. Thomas Aquinas and of the biblical text itself. Paul VI described this process as ‘Science and technology becoming brothers once more, not only offering us this marvel, but also providing us with a glimpse of new mysteries. It is enough for us to appreciate how this very modern service is being put to the use of Culture; as though the mechanical brain is coming to the aid of the spiritual brain; and the more it is able to express itself in its own language, the more it seems to enjoy being relied upon. Have you not begun to use it on the text of the Latin Bible? What is the outcome? Has the holy text been reduced to an account of heroic feats like any other ordinary text because of this automated process? Or is it not this effort to infuse mechanical instruments with the semblance of spiritual functions that has made them more noble and exalted by a task that touches the sacred? Is the spirit a prisoner of matter, or is it not matter, already tamed and forced to follow the laws of the spirit that offers that very spirit sublime devotion? It is at this point that our Christian ear can hear the groans that St Paul spoke of (Romans 8:22); of human creatures in search of a higher form of spirituality.’\r\rThe central claim posits that the ‘mechanical brain comes to the aid of the spiritual brain.’ What follows is an implicit theological definition of technology: the ‘effort to infuse mechanical instruments with the semblance of spiritual functions.’ Paul VI heard from homo tecnologicus a cry of aspiration for a higher level of spirituality. The technological man is the spiritual man...New technologies not only shape the way we live, but also the way we orient and express our spirit and our relationship with God...these ‘machines’ are increasingly assuming a value that impacts man’s higher dimensions: thought, self expression, communication and understanding. Our task, as Christians, is to look at technology and its products with new eyes, and to ask ourselves what meaning and value they have in God’s plan for the world.” -Cybergrace, 1\r\rFurther Reference:\rPope Benedict XVI, “Cartias En Veritate”\rhttp://tinyurl.com/qeoq74p\r\rRev. Antonio Spadaro, “Cybergrace”\rhttp://tinyurl.com/qgnqntf\r\r\r";
        technologySource.bigPic = [UIImage imageNamed:@"tech1"];
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = technologySource;
        
        }
    
    else if ([segue.identifier isEqualToString:@"economicsDetail"])
        {
        Source *economicsSource = [[Source alloc] init];
        economicsSource.name = @"Economics";
        economicsSource.twitterDef = @"Material Goods and Services";
        economicsSource.bigPic = [UIImage imageNamed:@"stock"];
        economicsSource.comment = @"\rHuman development is includes an economic aspect.\r\r\r";
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = economicsSource;
        
        }
    else if ([segue.identifier isEqualToString:@"artsDetail"])
        {
        Source *artsSource = [[Source alloc] init];
        artsSource.name = @"The Arts";
        artsSource.twitterDef = @"The Heart in Motion";
        artsSource.bigPic = [UIImage imageNamed:@"arts"];
        artsSource.comment = @"\rHumans have always expressed their hopes, dreams, fears, frustrations, and questions through the Arts; they are as old as humanity itself. The Arts are traditionally categoriezed as literary, performing, culinary, media, and visual.\r\rThe earliest recorded art was paintings on cave walls. Early humans depicted those phenomena that provoked reflection, from their fears of and conquests over animals to the wonder at the natural world and night sky. The development of agrarian societies brought about the development of song, dance, and drama.\r\r\r";
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:nil
                                                                      action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = artsSource;
        }
    else if ([segue.identifier isEqualToString:@"politicsDetail"])
        {
        Source *politicsSource = [[Source alloc] init];
        politicsSource.name = @"Politics";
        politicsSource.twitterDef = @"The Affairs of the People";
        politicsSource.bigPic = [UIImage imageNamed:@"capitol2"];
        politicsSource.comment = @"\rThe regulation of human society is essential to its survival and development. From the earliest days of the Christian movement, politics have played a vital role in both its growth and resistance. The earliest days of the Church occured in the context of political oppression. Given their Jewish roots, most early Christians were not Roman citizens. After the political and theological division between Messianic and non-Messianic Jews, Christians came to include more Gentiles until they came to predominance by the end of the 1st century. As the Faith continued to spread into the larger Greco-Roman world, Christianity slowly penetrated the upper ranks of citzenry. Christianity was considered a religio illicita until A.D. 313, when Constantine issued the Edict of Toleration, granting legal status to the Faith. Theodosius made Christianity the official religion of the Roman Empire in A.D. 380. With the growth of modern nation states out of Christendom, politics was slowly influenced by Christian ideals culminating with the Modern period and the eventual recognition of human rights.\r\rCatholic teaching on the relationship between the Church and State has developed significantly in certain respects, while certain principles have remained unchanged from its earliest days. According to the Compendium of the Social Doctrine of the Church, the political community is derived from and ordered toward the development of the human person:\r\r“The human person is the foundation and purpose of political life. Endowed with a rational nature, the human person is responsible for his own choices and able to pursue projects that give meaning to life at the individual and social level. Being open both to the Transcendent and to others is his characteristic and distinguishing trait. Only in relation to the Transcendent and to others does the human person reach the total and complete fulfilment of himself. This means that for the human person, a naturally social and political being, 'social life is not something added on' but is part of an essential and indelible dimension.The political community originates in the nature of persons, whose conscience 'reveals to them and enjoins them to obey' the order which God has imprinted in all his creatures: 'a moral and religious order; and it is this order — and not considerations of a purely extraneous, material order — which has the greatest validity in the solution of problems relating to their lives as individuals and as members of society, and problems concerning individual States and their interrelations'. This order must be gradually discovered and developed by humanity. The political community, a reality inherent in mankind, exists to achieve an end otherwise unobtainable: the full growth of each of its members, called to cooperate steadfastly for the attainment of the common good, under the impulse of their natural inclinations towards what is true and good.”\r\r\r";
        
        SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
        
        sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = politicsSource;
        
        }
}

- (IBAction)theologicaButton:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"The Signs of the Times"  message:@"The Signs of the Times are those aspects of modern culture that affect the worldview of human beings in any given time, and therefore, affect the manner in which Theology communicates the Christian message. While not exhaustive, these 6 cultural indicators are essential to any coherent and relevant presentation of the Gospel." preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Amen" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
