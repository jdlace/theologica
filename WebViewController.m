//
//  WebViewController.m
//  theologica
//
//  Created by Jonathan Lace on 1/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "WebViewController.h"
#import "LinksTableViewController.h"

@interface WebViewController ()

@property (strong, nonatomic) UIBarButtonItem *back;
@property (strong, nonatomic) UIBarButtonItem *forward;
@property (strong, nonatomic) UIBarButtonItem *refresh;
@property (strong, nonatomic) UIBarButtonItem *share;


@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self loadWebViewRequest];
    
    
    self.back = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backButton"] style:UIBarButtonItemStylePlain target:self action:@selector(backButton)];
    
    self.forward = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"forwardButton"] style:UIBarButtonItemStylePlain target:self action:@selector(forwardButton)];

        //self.refresh = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"repeat"] style:UIBarButtonItemStylePlain target:self action:@selector(refreshButton)];
    //self.share = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(selector)];
    
    self.navigationItem.rightBarButtonItems = [[NSArray alloc] initWithObjects:_forward, _back,   nil];
    
    self.forward.enabled = NO;
    self.back.enabled = NO; 
    
    self.theBool = false;
    
    
    
    
}
/*
-(void) viewWillAppear:(BOOL)animated
{
    if (self.presentingViewController != nil) {
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(close:)];
        }
}
 */
-(void) backButton
{
    [self.webView goBack];
}

-(void) forwardButton
{
    [self.webView goForward]; 
}


-(void) refreshButton
{
    [self loadWebViewRequest];
}

-(void) webViewDidFinishLoad:(UIWebView *)webView
{
    if (self.webView.canGoForward)
        {
            self.forward.enabled = YES;
        }
    else
        {
            self.forward.enabled = NO;
        }
    
    
    if (self.webView.canGoBack)
        {
            self.back.enabled = YES;
        }
    else
        {
            self.back.enabled = NO;
        }
    
    self.refresh.enabled = YES;
    
    [self.activityIndicator stopAnimating];
}

-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    self.refresh.enabled = NO;
    [self.activityIndicator startAnimating];
    
    return YES;
}

-(void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
    [self.activityIndicator stopAnimating];
    self.refresh.enabled = YES;
    NSLog(@"Whoops"); 
}

-(void) loadWebViewRequest
{
    NSURL *url = [[NSURL alloc] initWithString:self.urlString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    [self.webView loadRequest:request];
}

- (IBAction)close:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
- (IBAction)share:(UIBarButtonItem *)sender
{
    
    
  
    NSArray *activityItems;
    activityItems = @[self.urlString];

    
    //NSArray *activityActions;
    
    
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems: activityItems applicationActivities:nil];
    [self presentViewController:activityController
                       animated:YES completion:nil];
}
*/

@end
