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


@property (strong, nonatomic) IBOutlet UILabel *sourceName;
@property (strong, nonatomic) IBOutlet UILabel *sourceSubtitle;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextView *sourceInformation;
@property (strong, nonatomic) IBOutlet UIImageView *sourcesPic;

@end
