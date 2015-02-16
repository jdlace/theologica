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
    
    self.theBool = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    self.progressBar.progress = 0;
    self.theBool = false;
    //0.01667 is roughly 1/60, so it will update at 60 FPS
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.04000 target:self selector:@selector(timerCallBack) userInfo:nil repeats:YES];
    
    
}

-(void) timerCallBack
{
    if (!self.theBool)
        {
        
        if (self.progressBar.progress == 1.0)
            {
            self.progressBar.hidden = true;
            [self.timer invalidate];
            }
        else
            {
            self.progressBar.progress += 0.1;
            }
        }
    else
        {
        self.progressBar.progress += 0.05;
        if (self.progressBar.progress >= 0.95)
            {
            self.progressBar.progress = 0.95;
            self.progressBar.hidden = false;
            }
        }
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
