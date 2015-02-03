//
//  Verbatim.h
//  theologica
//
//  Created by Jonathan Lace on 2/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerbatimViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) NSTimer *timer;

@property(nonatomic) BOOL theBool;



@end
