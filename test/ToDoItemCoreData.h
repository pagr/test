//
//  ToDoItemCoreData.h
//  test
//
//  Created by Paul on 29/01/14.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ToDoItemCoreData : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSNumber * isCompleted;

@end
