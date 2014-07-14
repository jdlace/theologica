//
//  SocialDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialDetail.h"

@interface SocialDetailViewController : UIViewController

@property (strong, nonatomic) SocialDetail *currentSocialDetail;

@property (strong, nonatomic) IBOutlet UILabel *socialName;
@property (strong, nonatomic) IBOutlet UILabel *socialDescription;

@end
