//
//  xyzToDoItemViewController.h
//  test
//
//  Created by Sami Purmonen on 2014-01-29.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xyzToDoItem.h"

@interface xyzToDoItemViewController : UIViewController


@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSDate * creationDate;
@property (nonatomic, retain) NSNumber * completed;


@end
