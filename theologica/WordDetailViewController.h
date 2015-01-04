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

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView; 
@property (strong, nonatomic) UIImage *image;

- (IBAction)share:(UIBarButtonItem *)sender;


@end
