//
//  LinksTableViewController.h
//  theologica
//
//  Created by Jonathan Lace on 1/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LinksTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *hierarchy;
@property (strong, nonatomic) NSArray *scripture;
@property (strong, nonatomic) NSArray *fathers; 
@property (strong, nonatomic) NSArray *councils;
@property (strong, nonatomic) NSArray *creeds;
@property (strong, nonatomic) NSArray *catechism;
@property (strong, nonatomic) NSArray *liturgy;
@property (strong, nonatomic) NSArray *history;
@property (strong, nonatomic) NSArray *ethics;
@property (strong, nonatomic) NSArray *philosophy;
@property (strong, nonatomic) NSArray *arts;
@property (strong, nonatomic) NSArray *science;
@property (strong, nonatomic) NSArray *economics;

@end
