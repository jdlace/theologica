//
//  Verbatim.m
//  theologica
//
//  Created by Jonathan Lace on 2/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "VerbatimViewController.h"
#import "AppDelegate.h"

@interface VerbatimViewController ()

@end

@implementation VerbatimViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self loadWebViewRequest];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [self.activityIndicator startAnimating];
    
    return YES;
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    
    [self.activityIndicator stopAnimating];
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    [self.activityIndicator stopAnimating];
    NSLog(@"Whoops");
}

-(void) loadWebViewRequest
{
    NSURL *url = [[NSURL alloc] initWithString:self.urlString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [self.webView loadRequest:request];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
