//
//  xyzAddToDoItemViewController.m
//  test
//
//  Created by Sami Purmonen on 2014-01-29.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import "xyzAddToDoItemViewController.h"

@interface xyzAddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation xyzAddToDoItemViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *text = self.textField.text;
    if (sender == self.doneButton && text.length) {
        
        self.toDoItem = [[xyzToDoItem alloc] init];
        self.toDoItem.itemName = text;
        self.toDoItem.completed = NO;
        self.toDoItem.creationDate = [NSDate date];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
