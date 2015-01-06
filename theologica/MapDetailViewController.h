//
//  MapDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 12/18/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"


@interface MapDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *locationLabel;
@property (strong, nonatomic) IBOutlet UITextView *locationDescription;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@property (strong, nonatomic) Word *currentWordDetail;




@end
