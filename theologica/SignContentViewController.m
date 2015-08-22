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
            scienceSource.comment = @"\rAs a separate but related domain of knowledge, science is akin to theology in that it involves a specific methodology designed to answer a specific set of questions about human experience. Science is a specific and limited discipline that posits natural explanations for physical phenomena using empirical methods of analysis. Science originated as part of the broader quest for wisdom in the form of ancient philosophy. In relation to Aristotle's four types of causation, science would be equivalent to the study of efficient causation. Science necessarily limits its explanations to natural causes in order to ensure testability by using the scientific method.\r\rScience is a sign of the times because it provides ever-increasing knowledge about the created order, and this knowledge directly affects how theology understands the God-World relationship. A key principle in the science-theology dialectic was formulated by Pope Leo XIII in 1893:\r\r“...nothing can be proved either by physical science or archaeology which can really contradict the Scriptures. If, then, apparent contradiction be met with, every effort should be made to remove it. Judicious theologians and commentators should be consulted as to what is the true or most probable meaning of the passage in discussion, and the hostile arguments should be carefully weighed. Even if the difficulty is after all not cleared up and the discrepancy seems to remain, the contest must not be abandoned; truth cannot contradict truth, and we may be sure that some mistake has been made either in the interpretation of the sacred words, or in the polemical discussion itself...”\r-Providentissimus, 23\r\rThis logic would guide future popes to state the necessity of a scientifically-informed theology. In a letter to the then-director of the Vatican Observatory in 1998, Pope John Paul II claimed that necessity in terms of evangelistic relevance:\r\r“Theology will have to call on the findings of science to one degree or another as it pursues its primary concern for the human person, the reaches of freedom, the possibilities of Christian community, the nature of belief and the intelligibility of nature and history. The vitality and significance of theology for humanity will in a profound way be reflected in its ability to incorporate these findings.”\r-Letter\r\r<img>\r\rSince Vatican II, the Church has recognized the impact of scientific findings on Theology. The Council fathers specifically mentioned that scientific findings had been among recent challenges in the larger context of the signs of the times:\r\r“...the human race has passed from a rather static concept of reality to a more dynamic, evolutionary one. In consequence there has arisen a new series of problems, a series as numerous as can be, calling for efforts of analysis and synthesis...The recent studies and findings of science, history and philosophy raise new questions which effect life and which demand new theological investigations.”\r-Gaudium, 5, 62\r\rThat acknowledgement launched over half a century of renewed theological engagement with the sciences. While science has its own autonomy, the proper incorporation of science into theology contextualizes scientific findings in the larger perspective of the work of the Creator. As Pope John Paul II asked:\r\r“If the cosmologies of the ancient Near Eastern world could be purified and assimilated into the first chapters of Genesis, might not contemporary cosmology have something to offer to our reflections upon creation? Does an evolutionary perspective bring any light to bear upon theological anthropology, the meaning of the human person as the imago Dei, the problem of Christology – and even upon the development of doctrine itself? What, it any, are the eschatological implications of contemporary cosmology, especially in light of the vast future of our universe? Can theological method fruitfully appropriate insights from scientific methodology and the philosophy of science? Questions of this kind can be suggested in abundance. Pursuing them further would require the sort of intense dialogue with contemporary science that has, on the whole, been lacking among those engaged in theological research and teaching. ”\r-Letter\r\rIn 2004, the International Theological Commission stated that:\r\r“...Christians have the responsibility to locate the modern scientific understanding of the universe within the context of the theology of creation. The place of human beings in the history of this evolving universe, as it has been charted by modern sciences, can only be seen in its complete reality in the light of faith.”\r-Communion, 62\rSee “Divine Revelation”, “Evolution” in the Dictionary tab.\r\rFurther Reference:\rPope Leo XIII, “Providentissimus Deus”\rhttp://tinyurl.com/qc9gg96\r\rPope John Paul II\r“Letter to Rev. George Coyne, 6.1.1998”\rhttp://tinyurl.com/ps2up2e\r\rVatican II, “Gaudium et Spes”\rhttp://tinyurl.com/34xrhq\r\rInternational Theological Commission\r“Communion & Stewardshp”\rhttp://tinyurl.com/c37p5\r\r\r";
        scienceSource.bigPic = [UIImage imageNamed:@"station"];
        scienceSource.scrollPic = [UIImage imageNamed:@"darwinshot"];
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
        philosophySource.comment = @"\rPhilosophy is a product of the human quest to know reality. As such, it has a unique relation to theology among other cultural indicators in that it provides the conceptual frameworks upon which Theology has been built and is practiced. Thus, theology makes philosophical claims precisely because it makes truth claims about the nature of reality; specifically, theology makes metaphysical claims about God. As a result, philosophy necessarily affects theology. However, apart from its theological appropriation, philosophy also has an authentic independence which is exercised in the search for truth.\r\rThe most extensive magisterial treatment of the relationship between theology and philosophy was Pope John Paul II's 1998 encyclical, “Fides Et Ratio” (Faith and Reason). In that document, the Pope claimed that existential questions give rise to philospohical inquiry:\r\r“Moreover, a cursory glance at ancient history shows clearly how in different parts of the world, with their different cultures, there arise at the same time the fundamental questions which pervade human life: Who am I? Where have I come from and where am I going? Why is there evil? What is there after this life? These are the questions which we find in the sacred writings of Israel, as also in the Veda and the Avesta; we find them in the writings of Confucius and Lao-Tze, and in the preaching of Tirthankara and Buddha; they appear in the poetry of Homer and in the tragedies of Euripides and Sophocles, as they do in the philosophical writings of Plato and Aristotle. They are questions which have their common source in the quest for meaning which has always compelled the human heart. In fact, the answer given to these questions decides the direction which people seek to give to their lives.”\r-Fides, 1\r\r<img>\r\rPhilosophy is a sign for theology because it concerns itself precisely with these existential, ultimate questions that give rise to theological reflection as part of the lifelong search for truth and meaning as well as provides a conceptual framework in which theology can make meaningful claims.\r\r“Philosophy emerges...as one of noblest of human tasks. According to its Greek etymology, the term philosophy means 'love of wisdom'. Born and nurtured when the human being first asked questions about the reason for things and their purpose, philosophy shows in different modes and forms that the desire for truth is part of human nature itself. It is an innate property of human reason to ask why things are as they are, even though the answers which gradually emerge are set within a horizon which reveals how the different human cultures are complementary.”\r-Fides 1, 3\r\rFurther Reference:\rPope John Paul II, “Fides et Ratio”\rhttp://tinyurl.com/oyvsfl6\r\r\r";
        philosophySource.bigPic = [UIImage imageNamed:@"thinker"];
        philosophySource.scrollPic = [UIImage imageNamed:@"quote"];
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
        technologySource.comment = @"\rSince it coincided with and enabled the evolution of human beings, technology has always influenced and been an expression of human creativity. Technology is a sign for theology precisely because it represents the humanity's desire to transcend its limits:\r\r“Technology — it is worth emphasizing — is a profoundly human reality, linked to the autonomy and freedom of man. In technology we express and confirm the hegemony of the spirit over matter. The human spirit, 'increasingly free of its bondage to creatures, can be more easily drawn to the worship and contemplation of the Creator'. Technology enables us to exercise dominion over matter, to reduce risks, to save labour, to improve our conditions of life. It touches the heart of the vocation of human labour: in technology, seen as the product of his genius, man recognizes himself and forges his own humanity. Technology is the objective side of human action whose origin and raison d'etre is found in the subjective element: the worker himself. For this reason, technology is never merely technology. It reveals man and his aspirations towards development, it expresses the inner tension that impels him gradually to overcome material limitations. Technology, in this sense, is a response to God's command to till and to keep the land (cf. Gen 2:15) that he has entrusted to humanity, and it must serve to reinforce the covenant between human beings and the environment, a covenant that should mirror God's creative love.”\r-Caritas En Veritate, 69\r\r<img>\r\rThe Pope later emphasized the existential context of digital technology:\r\r“The accessibility of mobile telephones and computers, combined with the global reach and penetration of the internet, has opened up a range of means of communication that permit the almost instantaneous communication of words and images across enormous distances and to some of the most isolated corners of the world; something that would have been unthinkable for previous generations. Young people, in particular, have grasped the enormous capacity of the new media to foster connectedness, communication and understanding between individuals and communities, and they are turning to them as means of communicating with existing friends, of meeting new friends, of forming communities and networks, of seeking information and news, and of sharing their ideas and opinions...While the speed with which the new technologies have evolved in terms of their efficiency and reliability is rightly a source of wonder, their popularity with users should not surprise us, as they respond to a fundamental desire of people to communicate and to relate to each other. This desire for communication and friendship is rooted in our very nature as human beings and cannot be adequately understood as a response to technical innovations.”\r-Address\r\rFr. Antonio Spadaro, S.J. has produced the first popular theological engagement with technology in his recent publications. Echoing Pope Benedict, he claims that technology is a sign for our desire for God:\r\r“The technological man is the spiritual man...New technologies not only shape the way we live, but also the way we orient and express our spirit and our relationship with God...these ‘machines’ are increasingly assuming a value that impacts man’s higher dimensions: thought, self expression, communication and understanding. Our task, as Christians, is to look at technology and its products with new eyes, and to ask ourselves what meaning and value they have in God’s plan for the world.”\r-Spadaro, 1\r\rFurther Reference:\rPope Benedict XVI, “Cartias En Veritate”\rhttp://tinyurl.com/qyjmshd\r\rMessage for 43rd World Communications Day\rhttp://tinyurl.com/o79kqfs\r\rRev. Antonio Spadaro, “Cybergrace”\r\r\r";
        technologySource.bigPic = [UIImage imageNamed:@"tech1"];
        technologySource.scrollPic = [UIImage imageNamed:@"davincishot"];
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
        economicsSource.twitterDef = @"Production & Consumption of Resources";
        economicsSource.bigPic = [UIImage imageNamed:@"stock"];
        economicsSource.scrollPic = [UIImage imageNamed:@"wage"];
        economicsSource.comment = @"\rThroughout its history, the Catholic tradition has spoken to the human activity of producing and consuming resources; from the Biblical tradition's demand for economic justice to various patristic writer's insistence that the poor have a a claim on superfluous riches. It was the publication of Leo XIII's 1891 encyclical, “Rerum Novarum”, however, that marked the beginning of Church teaching on the economics in a post-capitalist context. Since then, the body of modern Catholic Social Teaching has been enhanced by Papal encyclicals, relevant Conciliar documents, the work of Papal commissions, and statements from various Bishops' conferences. Economics is a sign for theology because it is a measure of human development; of the degree to which theological values affect material well-being.\r\r“Every perspective on economic life that is human, moral, and Christian must be shaped by three questions: What does the economy do for people? What does it do to people? And how do people participate in it? The economy is a human reality: men and women working together to develop and care for the whole of God's creation. All this work must serve the material and spiritual well-being of people. It influences what people hope for themselves and their loved ones. It affects the way they act together in society. It influences their very faith in God.”\r-Economic Justice For All, 1\r\rThe Church's teaching on the economy can be summarized in the following points:\r\rThe Universal Destination of Goods\r\r“In the beginning God entrusted the earth and its resources to the common stewardship of mankind to take care of them, master them by labor, and enjoy their fruits...The right to private property, acquired or received in a just way, does not do away with the original gift of the earth to the whole of mankind. The universal destination of goods remains primordial, even if the promotion of the common good requires respect for the right to private property and its exercise. The goods of creation are destined for the whole human race. However, the earth is divided up among men to assure the security of their lives, endangered by poverty and threatened by violence.”\r-Catechism, 2402-2403\r\rRight and Dignity of Work\r\r“Work is a fundamental right and a good for mankind, a useful good, worthy of man because it is an appropriate way for him to give expression to and enhance his human dignity. The Church teaches the value of work not only because it is always something that belongs to the person but also because of its nature as something necessary. Work is needed to form and maintain a family, to have a right to property, to contribute to the common good of the human family.” -Compendium, 287\r\r<img>\r\rA Living Wage\r\r“...a man's labor necessarily bears two notes or characters. First of all, it is personal, inasmuch as the force which acts is bound up with the personality and is the exclusive property of him who acts, and, further, was given to him for his advantage. Secondly, man's labor is necessary; for without the result of labor a man cannot live, and self-preservation is a law of nature, which it is wrong to disobey. Now, were we to consider labor merely in so far as it is personal, doubtless it would be within the workman's right to accept any rate of wages whatsoever; for in the same way as he is free to work or not, so is he free to accept a small wage or even none at all. But our conclusion must be very different if, together with the personal element in a man's work, we consider the fact that work is also necessary for him to live: these two aspects of his work are separable in thought, but not in reality. The preservation of life is the bounden duty of one and all, and to be wanting therein is a crime. It necessarily follows that each one has a natural right to procure what is required in order to live, and the poor can procure that in no other way than by what they can earn through their work.”\r-Rerum Novarum, 44\r\r Economics Decisions Are Moral Actions\r\r“The Church's social doctrine has always maintained that justice must be applied to every phase of economic activity, because this is always concerned with man and his needs. Locating resources, financing, production, consumption and all the other phases in the economic cycle inevitably have moral implications. Thus every economic decision has a moral consequence.”\r-Caritas en Veritate, 37\r\rEconomic Justice\r\r“In a climate of mutual trust, the market is the economic institution that permits encounter between persons, inasmuch as they are economic subjects who make use of contracts to regulate their relations as they exchange goods and services of equivalent value between them, in order to satisfy their needs and desires. The market is subject to the principles of so-called commutative justice, which regulates the relations of giving and receiving between parties to a transaction. But the social doctrine of the Church has unceasingly highlighted the importance of distributive justice and social justice for the market economy, not only because it belongs within a broader social and political context, but also because of the wider network of relations within which it operates...Economic life undoubtedly requires contracts, in order to regulate relations of exchange between goods of equivalent value. But it also needs just laws and forms of redistribution governed by politics, and what is more, it needs works redolent of the spirit of gift.”\r-Caritas en Veritate, 35\r\rSee “Catholic Social Teaching”, “Distributive Justice”, “Economic Justice” in the Dictionary tab.\r\rFurther Reference:\rPope Leo XII, “Rerum Novarum”\rhttp://tinyurl.com/lv5y76v\r\rPope Benedict XVI, “Caritas en Veritate”\rhttp://tinyurl.com/lpqbs8v\r\rCompendium of the Social Doctrine of the Church, 287. http://tinyurl.com/o6scpuy\r\rCatechism of the Catholic Church, 2402-2403\rhttp://tinyurl.com/6y3q4\r\rUnited States Conference of Catholic Bishops\r“Economic Justice For All”\rhttp://tinyurl.com/75hnlx3\r\r\r";
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
        artsSource.bigPic = [UIImage imageNamed:@"phonograph"];
        artsSource.scrollPic = [UIImage imageNamed:@"mask"];
        artsSource.comment = @"\rHumans have always expressed their hopes, dreams, fears, frustrations, and questions through the arts; they are as old as humanity itself. The arts are traditionally categoriezed as literary, performing, culinary, media, and visual.\r\rThe Catholic tradition has always shaped and been shaped by the arts at large. The most obvious example of this mutual influence is religious iconography. The arts are a sign for theology because the express the human heart in all its vicisitudes.\r\rIn 2011 General Audience, Pope Benedict XVI claimed that the Arts were transformative:\r\r“It may have happened on some occasion that you paused before a sculpture, a picture, a few verses of a poem or a piece of music that you found deeply moving, that gave you a sense of joy, a clear perception, that is, that what you beheld was not only matter, a piece of marble or bronze, a painted canvas, a collection of letters or an accumulation of sounds, but something greater, something that 'speaks', that can touch the heart, communicate a message, uplift the mind. A work of art is a product of the creative capacity of the human being who in questioning visible reality, seeks to discover its deep meaning and to communicate it through the language of forms, colour and sound. Art is able to manifest and make visible the human need to surpass the visible, it expresses the thirst and the quest for the infinite. Indeed it resembles a door open on to the infinite, on to a beauty and a truth that go beyond the daily routine. And a work of art can open the eyes of the mind and of the heart, impelling us upward.” -General Audience\r\r<img>\r\rPreviously, the Pope had addressed the Meeting with Artists, in which he stated:\r\r“In this regard, one may speak of a via pulchritudinis, a path of beauty which is at the same time an artistic and aesthetic journey, a journey of faith, of theological enquiry...The way of beauty leads us, then, to grasp the Whole in the fragment, the Infinite in the finite, God in the history of humanity. Simone Weil wrote in this regard: 'In all that awakens within us the pure and authentic sentiment of beauty, there, truly, is the presence of God. There is a kind of incarnation of God in the world, of which beauty is the sign. Beauty is the experimental proof that incarnation is possible. For this reason all art of the first order is, by its nature, religious.'” -Address to Artists\r\rFurther Reference:\rPope Benedict XVI, General Audience, 8.31.2011\rhttp://tinyurl.com/p26n78n\r\rAddress to Artists, 11.21.2009\rhttp://tinyurl.com/p26n78n\r\r\r";
        
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
        politicsSource.scrollPic = [UIImage imageNamed:@"vote"]; 
        politicsSource.comment = @"\rThe regulation of human society is essential to its survival and development. As stated by the United States Conference of Catholic Bishops:\r\r“How we organize our society—in economics and politics, in law and policy— directly affects the common good and the capacity of individuals to develop their full potential. Every person and association has a right and a duty to participate actively in shaping society and to promote the well-being of all, especially the poor and vulnerable.”\r-Faithful Citzenship, 47\r\rFrom the earliest days of the Christian movement, politics have played a vital role in both its cultural and geographical expansion. Catholic teaching on the relationship between the Church and the State has developed significantly in certain respects, while certain principles have remained unchanged from its earliest days.\r\r    <img>\r\rAccording to the Compendium of the Social Doctrine of the Church, the political community is derived from and ordered toward the development of the human person:\r\r“The human person is the foundation and purpose of political life. Endowed with a rational nature, the human person is responsible for his own choices and able to pursue projects that give meaning to life at the individual and social level. Being open both to the Transcendent and to others is his characteristic and distinguishing trait. Only in relation to the Transcendent and to others does the human person reach the total and complete fulfilment of himself. This means that for the human person, a naturally social and political being, 'social life is not something added on' but is part of an essential and indelible dimension.The political community originates in the nature of persons, whose conscience 'reveals to them and enjoins them to obey' the order which God has imprinted in all his creatures: 'a moral and religious order; and it is this order — and not considerations of a purely extraneous, material order — which has the greatest validity in the solution of problems relating to their lives as individuals and as members of society, and problems concerning individual States and their interrelations'. This order must be gradually discovered and developed by humanity. The political community, a reality inherent in mankind, exists to achieve an end otherwise unobtainable: the full growth of each of its members, called to cooperate steadfastly for the attainment of the common good, under the impulse of their natural inclinations towards what is true and good.”\r-Compendium, 384\r\rFurther Reference:\rUnited States Conference of Catholic Bishops, “Faithful Citizenship”. http://tinyurl.com/4x2yp2p\r\r“Compendium of the Social Doctrine of the Church”. http://tinyurl.com/nue4nxw\r\r\r";
        
        SourcesDetailViewController *sourcesDetailViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SourcesDetailViewController"];
        
        sourcesDetailViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Signs"
                                                                       style:UIBarButtonItemStylePlain target:nil action:nil];
        self.navigationItem.backBarButtonItem = backButton;
        ((SourcesDetailViewController *)segue.destinationViewController).currentSourceDetail = politicsSource;
        
        }
}

- (IBAction)theologicaButton:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"The Signs of the Times"  message:@"The signs of the times are those aspects of modern culture that affect the worldview of human beings in any given time, and therefore, affect the manner in which Theology communicates the Christian message. While not exhaustive, these 6 cultural indicators are essential to any coherent and relevant presentation of the Gospel." preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Amen" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
