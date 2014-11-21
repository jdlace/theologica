//
//  BiblicalDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Social.h"
#import "Word.h"

@interface BiblicalDetailViewController : UIViewController <UIScrollViewDelegate>


@property (strong, nonatomic) Word *currentWordDetail;

@property (strong, nonatomic) IBOutlet UILabel *biblicalName;
@property (strong, nonatomic) IBOutlet UITextView *biblicalDescription;



- (IBAction)share:(UIBarButtonItem *)sender;

@end
