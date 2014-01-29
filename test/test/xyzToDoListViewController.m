//
//  xyzToDoListViewController.m
//  test
//
//  Created by Sami Purmonen on 2014-01-29.
//  Copyright (c) 2014 Paul. All rights reserved.
//

#import "xyzToDoListViewController.h"
#import "xyzAddToDoItemViewController.h"


#import "xyzToDoItem.h"

#import "ToDoItemCoreData.h"
#import "xyzAppDelegate.h"

@interface xyzToDoListViewController ()

@property (nonatomic) NSArray *toDoItems;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end

@implementation xyzToDoListViewController

- (NSArray *)toDoItems {
    if (!_toDoItems) _toDoItems = [[NSArray alloc] init];
    return _toDoItems;
}

- (void) loadInitialData {
    
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ToDoItemCoreData" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    self.toDoItems = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    //Create a new object and sync it with database
    ToDoItemCoreData *item=[NSEntityDescription insertNewObjectForEntityForName:@"ToDoItemCoreData" inManagedObjectContext:self.managedObjectContext];
    item.name=@"test";
    item.isCompleted=NO;
    item.creationDate=[NSDate date];
    [self.managedObjectContext save:&error];

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
    
    
    
    //Skaffa en referens
    xyzAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    //för att hämta vår objekthanterare
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self loadInitialData];
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
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ToDoItemCoreData *item = [self.toDoItems objectAtIndex:indexPath.row];
    //cell.textLabel.text =[item.itemName stringByAppendingString:[item.creationDate description]];
    cell.textLabel.text = item.name;

    // Configure the cell...
    
    cell.accessoryType = item.isCompleted ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
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
