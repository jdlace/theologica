//
//  SystematicDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "SourcesWebViewController.h"


@class TAWord;

@interface WordDetailViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate>

@property (nonatomic, copy) NSString *urlString;
@property (strong, nonatomic) TAWord *word;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *twitterLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *textViewHeightConstraint;


- (IBAction)share:(UIBarButtonItem *)sender;

@end
