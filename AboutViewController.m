//
//  AboutViewController.m
//  theologica
//
//  Created by Jonathan Lace on 2/8/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
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

- (IBAction)close:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tweetTapped:(id)sender {
    
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
            {
            SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweetSheet setInitialText:@"@theologica_"];
            [self presentViewController:tweetSheet animated:YES completion:nil];
            }
        else
            {
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"Truly, truly I say unto you..."
                                      message:@"If anyone would tweet from Theologica, let him verify his data connection, have a Twitter account registered in Settings, and try again."
                                      delegate:self
                                      cancelButtonTitle:@"Amen"
                                      otherButtonTitles:nil];
            [alertView show];
            }
}
@end
