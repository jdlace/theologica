//
//  BiblicalDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"

@interface BiblicalDetailViewController : UIViewController <UIScrollViewDelegate>


@property (strong, nonatomic) Word *currentWordDetail;

@property (strong, nonatomic) IBOutlet UILabel *biblicalName;
@property (strong, nonatomic) IBOutlet UILabel *biblicalDescription;
@property (strong, nonatomic) IBOutlet UIScrollView *textScroll;


@end
