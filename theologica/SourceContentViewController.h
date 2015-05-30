//
//  SourceContentViewController.h
//  theologica
//
//  Created by Jonathan Lace on 5/23/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Source.h"
#import "SourcesDetailViewController.h"
#import "AboutViewController.h"
#import "TAWord.h"

@interface SourceContentViewController : UIViewController

@property NSUInteger pageIndex;


-(IBAction)magisteriumButton:(id)sender;
-(IBAction)scriptureButton:(id)sender;
-(IBAction)fathersButton:(id)sender;
-(IBAction)creedsButton:(id)sender;
-(IBAction)liturgyButton:(id)sender;
-(IBAction)councilsButton:(id)sender;

- (IBAction)theologicaButton:(id)sender;




@end
