//
//  SystematicDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystematicDetail.h"

@interface SystematicDetailViewController : UIViewController

@property (strong, nonatomic) SystematicDetail *currentSystematicDetail;

@property (strong, nonatomic) IBOutlet UILabel *systematicName;
@property (strong, nonatomic) IBOutlet UILabel *systematicDescription;

@end
