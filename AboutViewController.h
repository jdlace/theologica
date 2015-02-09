//
//  AboutViewController.h
//  theologica
//
//  Created by Jonathan Lace on 2/8/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textView;

- (IBAction)close:(id)sender;
@end
