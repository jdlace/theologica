//
//  SourcesWebViewController.m
//  theologica
//
//  Created by Jonathan Lace on 6/25/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "SourcesWebViewController.h"

@interface SourcesWebViewController ()

@end

@implementation SourcesWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadWebViewRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadWebViewRequest
{

NSURL *url = [[NSURL alloc] initWithString:self.urlString];

NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];

[self.sourcesWebView loadRequest:request];
}

- (IBAction)close:(id)sender {
   
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];

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
