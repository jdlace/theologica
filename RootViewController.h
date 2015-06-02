//
//  RootViewController.h
//  theologica
//
//  Created by Jonathan Lace on 5/25/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PageViewController.h"
#import "SourceContentViewController.h"
#import "SignContentViewController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;

- (IBAction)aboutButton:(id)sender;
- (IBAction)infoButton:(id)sender;


@end
