//
//  SourcesDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 12/29/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SourcesWebViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;

- (void)loadRequestFromString:(NSString*)urlString;


@end
