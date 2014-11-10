//
//  SystematicDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface SystematicDetailViewController : UIViewController <UIScrollViewDelegate >

@property (strong, nonatomic) Word *currentWordDetail;

@property (strong, nonatomic) IBOutlet UILabel *systematicName;
@property (strong, nonatomic) IBOutlet UITextView *systematicDescription;



@end
