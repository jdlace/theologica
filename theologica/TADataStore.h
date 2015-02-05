//
//  TADataStore.h
//  theologica
//
//  Created by Jim Schultz on 2/4/15.
//  Copyright (c) 2015 techrament. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TAWord;

@interface TADataStore : NSObject

+ (TADataStore *)sharedStore;

- (TAWord *)searchForWord:(NSString *)name;

#pragma mark - CORE DATA STACK
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
