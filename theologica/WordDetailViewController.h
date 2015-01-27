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
#import "Word.h"

@interface WordDetailViewController : UIViewController <UIScrollViewDelegate >

@property (strong, nonatomic) Word *currentWordDetail;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *twitterLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)share:(UIBarButtonItem *)sender;


@end
