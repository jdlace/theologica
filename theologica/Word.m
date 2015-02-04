//
//  Word.m
//  theologica
//
//  Created by Jonathan Lace on 10/28/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import "Word.h"

@implementation Word

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.twitterDef forKey:@"twitterDef"];
    [encoder encodeObject:self.definition forKey:@"definition"];
    [encoder encodeObject:self.category forKey:@"category"];
    [encoder encodeBool:self.bookmarked forKey:@"bookmarked"];
    
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if( self != nil )
        {
        self.name  = [decoder decodeObjectForKey:@"name"];
        self.twitterDef = [decoder decodeObjectForKey:@"twitterDef"];
        self.definition = [decoder decodeObjectForKey:@"definition"];
        self.category = [decoder decodeObjectForKey:@"category"];
        self.bookmarked = [decoder decodeBoolForKey:@"bookmarked"];
        }
    
    return self; 
}

@end
