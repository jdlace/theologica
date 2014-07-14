//
//  BiblicalTableViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BiblicalTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *biblicalTerms;
@property (strong, nonatomic) NSMutableArray *biblicalDetails;

@end
