//
//  WebViewController.h
//  theologica
//
//  Created by Jonathan Lace on 1/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, copy) NSString *urlString;

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property(nonatomic) BOOL theBool;

-(void) loadWebViewRequest;

//-(void) timerCallBack;


@end
