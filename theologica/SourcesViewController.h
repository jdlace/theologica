//
//  SourcesViewController.h
//  theologica
//
//  Created by Jonathan Lace on 12/29/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Source.h"

@interface SourcesViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *sourceView;
@property (weak, nonatomic) IBOutlet UIView *signView;


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


- (IBAction)startButton:(id)sender;



@end
