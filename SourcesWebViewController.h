//
//  SourcesWebViewController.h
//  theologica
//
//  Created by Jonathan Lace on 6/25/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SourcesDetailViewController.h" 

@interface SourcesWebViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *sourcesWebView;
@property (nonatomic, copy) NSString *urlString;

-(void) loadWebViewRequest;
- (IBAction)close:(id)sender;



@end
