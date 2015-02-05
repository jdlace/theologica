//
//  TAWord.m
//  theologica
//
//  Created by Jim Schultz on 2/4/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import "TAWord.h"
#import "TADataStore.h"

@implementation TAWord

@dynamic name;
@dynamic definition;
@dynamic bookmarked;
@dynamic twitterDef;
@dynamic category;

+ (instancetype)word
{
    TADataStore *instance = [TADataStore sharedStore];
    return [NSEntityDescription insertNewObjectForEntityForName:@"TAWord" inManagedObjectContext:instance.managedObjectContext];
}

+ (instancetype)wordWithDict:(NSDictionary *)dict
{
    TAWord *word = nil;
    if ([dict isKindOfClass:[NSDictionary class]]) {
        NSString *name = dict[@"name"];
        if (name) {
            word = [[TADataStore sharedStore] findWordWithName:name];
            if (!word) {
                word = [[self class] word];
            }
            [word updateWithDict:dict];
        }
    }
    
    return word;
}

- (NSString *)firstLetter
{
    return [[self.name substringToIndex:1] uppercaseString];
}

- (void)updateWithDict:(NSDictionary *)dict
{
    if ([dict isKindOfClass:[NSDictionary class]]) {
        for (NSString *key in [dict allKeys]) {
            id value = dict[key];
            if (value != [NSNull null]) {
                [self setValue:value forKey:key];
            }
        }
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"CLASS: %@ KEY: %@ VALUE: %@", [self class], key, value);
}

- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
}

@end
