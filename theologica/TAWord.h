//
//  TAWord.h
//  theologica
//
//  Created by Jim Schultz on 2/4/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TAWord : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * definition;
@property (nonatomic, retain) NSNumber * bookmarked;
@property (nonatomic, retain) NSString * twitterDef;
@property (nonatomic, retain) NSString * category;

+ (instancetype)word;
+ (instancetype)wordWithDict:(NSDictionary *)dict;

- (void)updateWithDict:(NSDictionary *)dict;

@end
