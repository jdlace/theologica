//
//  WebViewController.m
//  theologica
//
//  Created by Jonathan Lace on 1/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://www.bible.com/bible/463/gen.1.nabre"];
    //https://www.bible.com/bible/463/gen.1.nabre
    //http://www.biblicalarchaeology.org/category/daily/biblical-topics/bible-interpretation/
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request]; 
    
    // Do any additional setup after loading the view.
    
    
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

@end
