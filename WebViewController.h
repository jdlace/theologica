//
//  WebViewController.h
//  theologica
//
//  Created by Jonathan Lace on 1/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>


@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, copy) NSString *urlString;

@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) NSTimer *timer;

@property(nonatomic) BOOL theBool;

//-(void) timerCallBack;


@end
