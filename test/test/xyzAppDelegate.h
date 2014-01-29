//
//  xyzAppDelegate.h
//  test
//
//  Created by Paul on 29/01/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface xyzAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;

@end
