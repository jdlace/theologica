//
//  SourcesViewController.h
//  theologica
//
//  Created by Jonathan Lace on 12/29/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Source.h"
#import "AboutViewController.h"

@interface SourcesViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *sourceView;
@property (weak, nonatomic) IBOutlet UIView *signView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;




-(IBAction) pageControlTapped:(id)sender; 
- (IBAction)scriptureButton:(id)sender;
- (IBAction)fathersButton:(id)sender;
- (IBAction)catechismButton:(id)sender;
- (IBAction)liturgyButton:(id)sender;
- (IBAction)councilsButton:(id)sender;

- (IBAction)scienceButton:(id)sender;
- (IBAction)artsButton:(id)sender;
- (IBAction)mediaButton:(id)sender;
- (IBAction)politicsButton:(id)sender;
- (IBAction)philosophyButton:(id)sender;
- (IBAction)theologicaButton:(id)sender;


- (IBAction)aboutButton:(id)sender;
- (IBAction)infoButton:(id)sender;



@end
