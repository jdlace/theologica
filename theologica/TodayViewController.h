//
//  TodayViewController.h
//  Theologica
//
//  Created by Jonathan Lace on 10/27/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController : UIViewController <NCWidgetProviding>

@property (strong, nonatomic) IBOutlet UILabel *wordLabel;

@end
