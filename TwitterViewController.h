//
//  TwitterViewController.h
//  theologica
//
//  Created by Jonathan Lace on 2/27/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)close:(id)sender;
@end
