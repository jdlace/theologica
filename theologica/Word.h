//
//  Word.h
//  theologica
//
//  Created by Jonathan Lace on 10/28/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *definition;
@property (copy, nonatomic) NSString *category;
@property (weak, nonatomic) UIImage *image; 
@property (nonatomic) BOOL bookmarked; 

@end
