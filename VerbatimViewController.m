//
//  Verbatim.m
//  theologica
//
//  Created by Jonathan Lace on 2/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "VerbatimViewController.h"

@interface VerbatimViewController ()

@end

@implementation VerbatimViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    NSURL *url = [[NSURL alloc] initWithString:@"https://vimeo.com/119703749"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [self.webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
}

-(void) timerCallBack
{
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
