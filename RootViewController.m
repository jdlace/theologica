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
    
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationNone] forKey:UIPageViewControllerOptionInterPageSpacingKey];
    
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
    
    aboutDetail.textView.text =  @"\r\r\rThank you for purchasing Theologica; the simple, yet comprehensive, Catholic theological resource for the iPhone. Drawing from the rich treasures of the intellectual tradition of the Church, from the 1st to the 21st century, this is app is designed to be an essential study tool for both students and teachers of Theology as well as anyone who is called to “think faith”.\r\rThe app features 5 tabs: Home, Reference, Dictionary, Maps, and People.\r\rThe Home tab presents a wide-angle view of both the traditional Sources of Theology (Magisterium, Scripture, Fathers, Councils, Creeds, and Liturgy) and the Signs of the Times (Philosophy, Science, Technology, Politics, Economics, and the Arts).\r\rTheology is a dialectical enterprise that continuously seeks to better understand the Faith of the Church in a given historical situation. To fulfill that vocation, Theology draws on various Sources in order to faithfully interpret the Signs of the Times.\r\r The primary Sources are:\r\rThe Magisterium\rSacred Scripture\rThe Church Fathers\rEcumenical Councils\rCreeds\rThe Liturgy\r\rAll of these Sources, though distinct, are organically related to the life of the Church.\r\rTheology is always practiced in a particular historical and cultural context. Thus, cutlural trends and indicators of the worlview of modern men and women necessarily affect the way in which the Faith of the Church is understood. It is therefore vital for Theology to pay attention to these Signs in order to fulfill its vocation. These Signs include:\r\rPhilosophy\rScience\rTechnology\rPolitics\rEconomics\rThe Arts\r\rWhile not exhaustive, these aspects of life in the 21st century are areas which affect the thinking of people everwhere.\r\rThe Links tab features a table of live links for each category in the Home tab along with those to sites that feature Theology in action.\r\rThe Glossary tab includes over 500 of the most commonly used theologial terms in both high school and college classrooms, along with relevant links to the Conciliar Documents, the Catechism of the Catholic Church, the Compendium of the Social Doctrine of the Church, Papal Encyclicals, Pontifical Commission Documents, and other curated links available online.\r\rThe Maps tab includes custom pin annotations for the Old Testament, New Testament, Historical Sites, and Social Justice sites of interest.\r\rThe People tab features interviews with contemporary theologians who are actively engaged in making Theology relevant to the larger culture.\r\rTheologica started out as an idea for a simple dictionary app and slowly evolved (over 3 years) into what you have in your hands. It was inspired by the sequence and scope of instruction in the Department of Theology at Seton Hall Preparatory School in West Orange, NJ. Every aspect of the app has been thoughtfully considered/obsessed over in order to create a tool that enables its users to enhance their knowledge of Theology.\r\rSpecial thanks to Melissa Lace, Jim Schultz, and the Theology Faculty at Seton Hall Prepraratory School.";
    
    aboutDetail.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:aboutDetail animated:YES completion:nil];
    

    
}
- (IBAction)infoButton:(id)sender
{
    
    AboutViewController *infoDetail = [[self storyboard] instantiateViewControllerWithIdentifier: @"AboutViewController"];
    
    [infoDetail view];
    
    infoDetail.textView.text = @"\r\r\rThank you for purchasing Theologica; the simple, yet comprehensive, Catholic theological resource for the iPhone. Drawing from the rich treasures of the intellectual tradition of the Church, from the 1st to the 21st century, this is app is designed to be an essential study tool for both students and teachers of Theology as well as anyone who is called to “think faith”.\r\rFollow @theologica_ on Twitter\rhttps://twitter.com/theologica_\r\rFor questions, concerns, or comments please email techrament@icloud.com\r\r";
    infoDetail.modalPresentationStyle = UIModalPresentationPopover;
    
    [self.navigationController presentViewController:infoDetail animated:YES completion:nil];
    
}

@end
