//
//  EcclesialDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EcclesialDetail.h"

@interface EcclesialDetailViewController : UIViewController

@property (strong, nonatomic) EcclesialDetail *currentEcclesialDetail; 

@property (strong, nonatomic) IBOutlet UILabel *ecclesialName;
@property (strong, nonatomic) IBOutlet UILabel *ecclesialDescription;
@end
