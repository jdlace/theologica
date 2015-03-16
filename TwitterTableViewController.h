//
//  TwitterTableViewController.h
//  theologica
//
//  Created by Jonathan Lace on 3/15/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TwitterKit/TwitterKit.h>

@interface TwitterTableViewController : UITableViewController <TWTRTweetViewDelegate>

-(IBAction)close:(id)sender;

@end
