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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, copy) NSString *urlString;
@property (nonatomic, assign) BOOL canAutoRotate;



@property(nonatomic) BOOL theBool;

-(void) loadWebViewRequest;




@end
