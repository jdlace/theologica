//
//  MoralDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface MoralDetailViewController : UIViewController

@property (strong, nonatomic) Word *currentWordDetail;

@property (strong, nonatomic) IBOutlet UILabel *moralName;
@property (strong, nonatomic) IBOutlet UILabel *moralDescription;

@property (strong, nonatomic) IBOutlet UIScrollView *textScroll;

@end
