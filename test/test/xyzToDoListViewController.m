//
//  xyzToDoListViewController.m
//  test
//
//  Created by Sami Purmonen on 2014-01-29.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import "xyzToDoListViewController.h"
#import "xyzAddToDoItemViewController.h"
#import "xyzToDoItemViewController.h"
#import "xyzToDoItem.h"
#import "xyzAppDelegate.h"

@interface xyzToDoListViewController ()

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@end

@implementation xyzToDoListViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        UITableViewCell *cell = (UITableViewCell *) sender;
        UITableView *view = (UITableView *) [[cell superview] superview];
        int index = [[view indexPathForCell:cell] row];
        xyzToDoItemViewController *controller = (xyzToDoItemViewController *) segue.destinationViewController;
#warning raden under är nog viktig
        //controller.toDoItem = [self.toDoItems objectAtIndex:index];
    }
}


- (void) addItem:(NSString *)name{
    xyzToDoItem *item1 = [NSEntityDescription insertNewObjectForEntityForName:@"ToDoItem"inManagedObjectContext:self.managedObjectContext];
    item1.itemName = name;
    item1.creationDate = [NSDate date];
    item1.completed = NO;
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error adding items: %@", [error localizedDescription]);
    }
}
- (void) loadInitialData {
    
    //[self addItem:@"Program some Apps!"];
    //[self addItem:@"SHOW OFF some labs!"];
    
    [super viewDidLoad];
    xyzAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    
    // Fetching Records and saving it in "fetchedRecordsArray" object
    
    
    
    [self.tableView reloadData];
}



- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    xyzAddToDoItemViewController *source = (xyzAddToDoItemViewController *) segue.sourceViewController;
    if (source.addText) {
        [self addItem:source.addText];
    }
    [self.tableView reloadData];
}

- (IBAction)updateItem:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
}

- (IBAction)deleteItem:(UIStoryboardSegue *)segue {
    xyzToDoItemViewController *source = (xyzToDoItemViewController *) segue.sourceViewController;
#warning Funktionen är temporärt borta
    //[self.toDoItems removeObject:[source toDoItem]];
    [self.tableView reloadData];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //get the instance of the managedObjectContext and store it locally in this class
    xyzAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    [self loadInitialData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    
    // Prepare to get list of data
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItem"inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    //execute the request and return
    NSError* error;
    return [self.managedObjectContext countForFetchRequest:fetchRequest error:&error];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Prepare cell
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    xyzToDoItem* item=[self getSingleRow:indexPath.row];
    
    //set values to cell
    cell.textLabel.text = item.itemName;
    cell.accessoryType = item.completed ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

-(xyzToDoItem*) getSingleRow:(int)index{
    //prepare request one row of data
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItem"inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setFetchOffset:index];
    [fetchRequest setFetchLimit:1];
    [fetchRequest setEntity:entity];
    
    //Request of row of data
    NSError* error;
    NSArray *oneItemArray = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    return [oneItemArray objectAtIndex:0];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
