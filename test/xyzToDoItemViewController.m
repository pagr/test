//
//  xyzToDoItemViewController.m
//  test
//
//  Created by Sami Purmonen on 2014-01-29.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import "xyzToDoItemViewController.h"
#import "xyzToDoListViewController.h"

@interface xyzToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UISwitch *completedSwitch;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *deleteButton;

@end

@implementation xyzToDoItemViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender == self.deleteButton) {
        self.toDoItem = nil;
    }
}

- (IBAction)completedChanged:(UISwitch *)sender {
    self.toDoItem.completed = sender.isOn;
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
    self.label.text = self.toDoItem.itemName;
    self.completedSwitch.on = self.toDoItem.completed;
    self.dateLabel.text = [self.toDoItem.creationDate description];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
