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

@class TAWord;

@interface WordDetailViewController : UIViewController <UIScrollViewDelegate >

@property (strong, nonatomic) TAWord *word;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *twitterLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
-(NSString *) filePath;


- (IBAction)share:(UIBarButtonItem *)sender;
-(void) saveToPlist;
-(void) saveBookmark;

@end
