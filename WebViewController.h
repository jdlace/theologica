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

@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *close;

@property(nonatomic) BOOL theBool;

-(void) loadWebViewRequest;
- (IBAction)done:(id)sender;

//-(void) timerCallBack;


@end
