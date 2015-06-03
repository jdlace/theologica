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
        scienceSource.comment = @"\rAs a separate but related domain of knowledge, science is akin to theology in that it involves a specific methodology designed to answer a specific set of questions about human experience. Science is a specific and limited discipline that posits natural explanations for physical phenomena using empirical methods of analysis. Science originated as part of the broader quest for wisdom in the form of ancient Philosophy. In relation to Aristotle's Four Types of Causation, Science would be equivalent to efficient causation. Science necessarily limits its explanations to natural causes in order to ensure testability by using the Scientific Method.\r\rScience is a Sign of the Times because it provides ever-increasing knowledge about the created order, and this knowledge directly affects how Theology understands the God-World relationship. In a letter to the then-director of the Vatican Observatory in 1998, Pope John Paul II claimed that in order to be authentic and relevant Theology must incorporate the findings of Science:\r\r“Theology will have to call on the findings of science to one degree or another as it pursues its primary concern for the human person, the reaches of freedom, the possibilities of Christian community, the nature of belief and the intelligibility of nature and history. The vitality and significance of theology for humanity will in a profound way be reflected in its ability to incorporate these findings.”\r\rSince Vatican II, the Church has recognized the impact of scientific findings on Theology. In Gaudium et Spes, Dogmatic Constitution on the Church in the Modern World, the Council fathers specifically mentioned that scientific findings had been among recent challenges in the larger context of the Signs of the Times:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis...The recent studies and findings of science, history and philosophy raise new questions which effect life and which demand new theological investigations.”\r\rThat acknowledgement launched over half a century of renewed theological engagement with the sciences. While science has its own autonomy, the proper incorporation of Science into Theology contextualizes scientific findings in the larger perspective of the work of the Creator. As Dr. John Haught claims:\r\r“We live in an age of science, astrophysics, evolutionary biology, and information. These cumulatively have given us an entirely new picture, or story, of the universe, and we are obliged to treat the notion of revelation in terms that relate it to these developments. The perennial human questions concerning what this universe is all about are being raised in a new and striking way today. Does cosmic evolution have any direction to it? How does our species fit into the evolutionary picture? How are we to understand our own existence now that it has become clearer than ever that we too are part of an evolving world? What sense can we make of the apparent randomness, struggle, and impersonal natural selection that seem to be the main ingredients of evolution? Why did the universe take fifteen billion years to bring forth conscious beings here on earth? What sense can we possibly make of the immense size of the universe, in which so far we have no evidence that other intelligent life exists? And what if intelligent or spiritual life does exist elsewhere? Then what is the meaning of Israel’s election or of the redemptive significance of Jesus of Nazareth with respect to these hypothetical cosmological conjectures?\r\rScientifically informed people are asking such questions today, and their inquiries should not remain off-limits to our theologies of revelation. Working along with science, theology is obliged at least to attempt some response to them from the point of view of whatever intelligibility is discerned by faith in revelation. From the beginning, Christians have been called upon to give an account of their faith in terms of contemporary modes of thought (for example, 1 Peter 3:15). Questions about the universe and our place in it enchant more and more people today, but revelation theology remains pretty much mute with respect to them. Yet if our theologies of revelation cannot respond -- in some fashion at least -- to the big questions of our time, then they will quite rightly be ignored by contemporary culture.”\r\rThe International Theological Commission published Communion and Stewardship: Human Persons Created in the Image of God in 2004. In paragraph 62, the Commission stated that:\r\r“...Christians have the responsibility to locate the modern scientific understanding of the universe within the context of the theology of creation. The place of human beings in the history of this evolving universe, as it has been charted by modern sciences, can only be seen in its complete reality in the light of faith.”\r\rSee “Divine Revelation”, “Evolution” in the Dictionary tab.\r\rFurther Reference:\r\r";
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
        philosophySource.comment = @"\rPhilosophy is a product of the human quest to know reality. As such, it has a unique relation to Theology among other Signs of the Times in that it offers a set of rational tools that Theology uses to better understand the Faith. However, apart from its theological appropriation, Philosophy also has an authentic independence which is exercised in the search for truth. The most extensive Magisterial treatment of the relationship between Theology and Philosophy was Pope John Paul II's 1998 encyclical, Fides Et Ratio (Faith and Reason).\r\r";
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
        technologySource.comment = @"\rSince it coincided with and enabled the evolution of homo sapiens, technology has always influenced and been an expression of human creativity.";
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
        economicsSource.comment = @"\rHuman development is includes an economic aspect.";
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
        artsSource.name = @"Arts";
        artsSource.twitterDef = @"The Heart in Motion";
        artsSource.bigPic = [UIImage imageNamed:@"arts"];
        artsSource.comment = @"\rHumans have always expressed their hopes, dreams, fears, frustrations, and questions through the Arts; they are as old as humanity itself. The Arts are traditionally categoriezed as literary, performing, culinary, media, and visual.\r\rThe earliest recorded art was paintings on cave walls. Early humans depicted those phenomena that provoked reflection, from their fears of and conquests over animals to the wonder at the natural world and night sky. The development of agrarian societies brought about the development of song, dance, and drama. ";
        
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
        politicsSource.comment = @"\rThe regulation of human society is essential to its survival and development. From the earliest days of the Christian movement, politics have played a vital role in both its growth and resistance. The earliest days of the Church occured in the context of political oppression. Given their Jewish roots, most early Christians were not Roman citizens. After the political and theological division between Messianic and non-Messianic Jews, Christians came to include more Gentiles until they came to predominance by the end of the 1st century. As the Faith continued to spread into the larger Greco-Roman world, Christianity slowly penetrated the upper ranks of citzenry. Christianity was considered a religio illicita until A.D. 313, when Constantine issued the Edict of Toleration, granting legal status to the Faith. Theodosius made Christianity the official religion of the Roman Empire in A.D. 380. With the growth of modern nation states out of Christendom, politics was slowly influenced by Christian ideals culminating with the Modern period and the eventual recognition of human rights.\r\rCatholic teaching on the relationship between the Church and State has developed significantly in certain respects, while certain principles have remained unchanged from its earliest days.";
        
        SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
        
        sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = politicsSource;
        
        }
}


@end
