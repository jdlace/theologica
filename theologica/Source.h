//
//  Source.h
//  theologica
//
//  Created by Jonathan Lace on 1/1/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Source : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *comment;
@property (copy, nonatomic) NSString *twitterDef;
@property (strong, nonatomic) UIImage *image;

@end
