//
//  MoralDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoralDetail.h"

@interface MoralDetailViewController : UIViewController

@property (strong, nonatomic) MoralDetail *currentMoralDetail;

@property (strong, nonatomic) IBOutlet UILabel *moralName;
@property (strong, nonatomic) IBOutlet UILabel *moralDescription;


@end
