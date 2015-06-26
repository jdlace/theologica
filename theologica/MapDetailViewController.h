//
//  MapDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 12/18/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"
#import "SourcesWebViewController.h"



@interface MapDetailViewController : UIViewController <UIScrollViewDelegate, UITextViewDelegate>

@property (nonatomic, copy) NSString *urlString;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationSubtitle;
@property (weak, nonatomic) IBOutlet UITextView *locationDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *textViewHeightConstraint;
 


@property (strong, nonatomic) Word *currentWordDetail;
- (IBAction)share:(UIBarButtonItem *)sender;




@end
