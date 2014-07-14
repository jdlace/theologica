//
//  BiblicalDetailViewController.h
//  theologica
//
//  Created by Jonathan Lace on 7/17/13.
//  Copyright (c) 2013 techrament. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BiblicalDetail.h"

@interface BiblicalDetailViewController : UIViewController


@property (strong, nonatomic) BiblicalDetail *currentBiblicalDetail;

@property (strong, nonatomic) IBOutlet UILabel *biblicalName;
@property (strong, nonatomic) IBOutlet UILabel *biblicalDescription;


@end
