//
//  SourcesDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 1/7/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Source.h"


@interface SourcesDetailViewController : UIViewController

@property (strong, nonatomic) Source *currentSourceDetail;


@property (weak, nonatomic) IBOutlet UILabel *sourceName;
@property (weak, nonatomic) IBOutlet UILabel *sourceSubtitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *sourceInformation;
@property (weak, nonatomic) IBOutlet UIImageView *sourcesPic;
@property (strong, nonatomic) IBOutlet UIImageView *scrollPic;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView; 

@end
