//
//  MoralDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Social.h"
#import "Word.h"

@interface MoralDetailViewController : UIViewController

@property (strong, nonatomic) Word *currentWordDetail;

@property (strong, nonatomic) IBOutlet UILabel *moralName;
@property (strong, nonatomic) IBOutlet UITextView *moralDescription;

- (IBAction)share:(UIBarButtonItem *)sender;

@end
