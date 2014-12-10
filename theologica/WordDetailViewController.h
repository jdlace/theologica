//
//  SystematicDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Social.h"
#import "MobileCoreServices.h"
#import "Word.h"

@interface WordDetailViewController : UIViewController <UIScrollViewDelegate >

@property (strong, nonatomic) Word *currentWordDetail;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;

- (IBAction)share:(UIBarButtonItem *)sender;


@end
