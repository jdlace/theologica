//
//  WordDataSource.h
//  theologica
//
//  Created by Jonathan Lace on 11/11/14.
//  Copyright (c) 2014 techrament. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Word;

@interface WordDataSource : NSObject

- (NSInteger)numberOfSectionsInDataSourceCategory:(NSString *)category;

- (NSInteger)numberOfRowsInSection:(NSInteger)section forCategory:(NSString *)category;

- (Word *)wordForRowAtIndexPath:(NSIndexPath *)indexPath forCategory:(NSString *)category;

- (NSString *)titleForHeaderInSection:(NSInteger)section forCategory:(NSString *)category;

- (NSArray *)sectionIndexTitlesForCategory:(NSString *)category;

- (NSInteger)sectionForSectionIndexTitle:(NSString *)title forCategory:(NSString *)category;

- (void) saveData; 

@end
