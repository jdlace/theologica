//
//  ExplorationsTableViewController.h
//  theologica
//
//  Created by Jonathan Lace on 6/23/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExplorationsTableViewController : UITableViewController

@property (strong, nonatomic) NSDictionary *explorations;
@property (strong, nonatomic) NSArray *explorationKeys;

@property (strong, nonatomic) NSArray *presentations;
@property (strong, nonatomic) NSArray *interviews; 



@end
