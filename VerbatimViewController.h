//
//  Verbatim.h
//  theologica
//
//  Created by Jonathan Lace on 2/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerbatimViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property(nonatomic) BOOL theBool;



@end
