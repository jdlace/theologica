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

@end
