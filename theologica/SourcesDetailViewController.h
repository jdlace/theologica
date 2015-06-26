//
//  SourcesDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 1/7/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>
#import "Source.h"
#import "TAWord.h"
#import "SourcesWebViewController.h"
#import "WebViewController.h"


@interface SourcesDetailViewController : UIViewController <UITextViewDelegate>

@property (strong, nonatomic) Source *currentSourceDetail;
@property (weak, nonatomic) TAWord *word;
@property (nonatomic, copy) NSString *urlString;




@property (weak, nonatomic) IBOutlet UILabel *sourceName;
@property (weak, nonatomic) IBOutlet UILabel *sourceSubtitle;
@property (weak, nonatomic) IBOutlet UIImageView *scrollPic;
@property (weak, nonatomic) IBOutlet UITextView *sourceInformation;
@property (weak, nonatomic) IBOutlet UIImageView *sourcesPic;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *textViewHeightConstraint;


- (IBAction)shareButton:(id)sender;

@end
