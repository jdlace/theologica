//
//  RootViewController.m
//  theologica
//
//  Created by Jonathan Lace on 5/25/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "RootViewController.h"
#import "SourceContentViewController.h"
#import "SignContentViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationNone] forKey:UIPageViewControllerOptionInterPageSpacingKey];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource  = self;
    
    [self setupView];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)setupView
{
    
    
    [self.pageViewController setViewControllers: @[[self.storyboard instantiateViewControllerWithIdentifier:@"SourceContentViewController"]] direction: UIPageViewControllerNavigationDirectionForward  animated: NO completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view insertSubview:self.pageViewController.view belowSubview:self.pageControl];
    [self.pageViewController didMoveToParentViewController:self]; 
    
}

//////////////////////////////////////added after talking to Gennady///////////////////////

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    UIViewController *vC = nil;
    if ([viewController isKindOfClass:[SourceContentViewController class]])  {
        vC = nil;
    } else if ([viewController isKindOfClass:[SignContentViewController class]]) {
        vC = [self.storyboard instantiateViewControllerWithIdentifier:@"SourceContentViewController"];
    }
    
    self.pageControl.currentPage = 0;
    
    return vC;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    
    UIViewController *vC = nil;
    if ([viewController isKindOfClass:[SignContentViewController class]])  {
        vC = nil;
    } else if ([viewController isKindOfClass:[SourceContentViewController class]]) {
        vC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignContentViewController"];
    }
    
    self.pageControl.currentPage = 1;

    
    return vC;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)aboutButton:(id)sender
{
    AboutViewController *aboutDetail = [[self storyboard]
                                        instantiateViewControllerWithIdentifier:@"AboutViewController"];
    
    [aboutDetail view];
    
    aboutDetail.textView.text =  @"\r\r\r\r\r\r\rTheologica is the simple, yet comprehensive Catholic theological resource for the iPhone. Drawing from the rich treasures of the intellectual tradition of the Church, from the 1st to the 21st century, this app is curated and designed to be an essential study tool for both students and teachers of Theology as well as for anyone who desires to “think faith”. Theologica features 5 tabs: Overview, Reference, Dictionary, Maps, and Explorations, which enable its users to enhance their knowledge of Theology in multiple contexts.\r\rOverview\r\rThe Overview tab presents a wide-angle view of Theology as a dialectical enterprise that continuously seeks to better understand the Faith of the Church in a given historical situation. To fulfill that vocation, Theology draws on various Sources in order to faithfully interpret the Signs of the Times. The primary Sources are: The Magisterium, Sacred Scripture, Church Fathers, Ecumenical Councils, Creeds, and Liturgy. All of these Sources, though distinct, are organically related to the life of the Church. Theology is always practiced in a particular historical and cultural context. Thus, cultural trends and indicators of the worldview of modern men and women necessarily affect the way in which the Faith of the Church is understood. It is therefore vital for Theology to pay attention to these Signs in order to fulfill its vocation. These Signs include: Philosophy, Science, Technology, Politics, Economics, and the Arts. While not exhaustive, these aspects of life in the 21st century are the primary factors which affect the thinking of people everywhere.\r\rReference\r\rThe Reference tab features a curated list of live links for each category in the Overview tab along with those sites that feature Theology in action. Most of these sites contain significant documents which are referenced in the Dictionary.\r\rDictionary\r\rThe Dictionary tab includes a list of over 500 of the most commonly used theological terms in both high school and college classrooms, grouped by the categories: Systematic, Historical, Moral, Biblical, Liturgical, and Cultural.  Definitions contain relevant links to the Conciliar Documents, the Catechism of the Catholic Church, the Compendium of the Social Doctrine of the Church, Papal Encyclicals, Pontifical Commission Documents, or other curated links, publicly available online.\r\rMaps\r\rThe Maps tab includes over 40 custom pin locations grouped by the categories: Old Testament, New Testament, Church History, and Social Justice. Each location includes a detail page with additional information on the given site as well as links for more information or direct action. Theology is practiced in ancient, historical, and modern contexts, and this is most clearly expressed geographically.\r\rExplorations\r\rThe Explorations tab features in-depth analysis of specific questions in Theology, which are generated by the dialectic it has with modern culture. This tab also includes periodic interviews with contemporary theologians and other cultural influencers who are actively engaged in shaping the various contexts of Theology. This tab features various such explorations on a regular basis.\r\rTheologica began as an idea for an iPhone app that could serve as a comprehensive study aid for students as well as an instructional tool for teachers. It was inspired by the sequence and scope of instruction in the Department of Theology at Seton Hall Preparatory School in West Orange, NJ. Special thanks to Melissa Lace, Jim Schultz, Gennady Burokovich, and the Theology Faculty at Seton Hall Preparatory School.";
    
    aboutDetail.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:aboutDetail animated:YES completion:nil];
    

    
}
- (IBAction)infoButton:(id)sender
{
    
    AboutViewController *infoDetail = [[self storyboard] instantiateViewControllerWithIdentifier: @"AboutViewController"];
    
    [infoDetail view];
    
    infoDetail.textView.text = @"\r\r\rThank you for purchasing Theologica; the simple, yet comprehensive, Catholic theological resource for the iPhone. If you have content suggestions for any of the its features or if you have specific questions regarding future updates, please do not hesitate to reach out. If you find Theologica an aid to the study and/or teaching of Theology, please kindly rate it in the App Store.\r\rFollow @theologica_ on Twitter\rhttps://twitter.com/theologica_\r\rFor questions, concerns, or comments please email techrament@icloud.com\r\r";
    infoDetail.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:infoDetail animated:YES completion:nil];
    
}

@end
