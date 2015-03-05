//
//  SystematicTableViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SourcesDetailViewController.h" 


@interface DictionaryTableViewController : UITableViewController <UISearchDisplayDelegate>

- (IBAction)termsButton:(id)sender;
- (IBAction)savedButton:(id)sender;

@end
