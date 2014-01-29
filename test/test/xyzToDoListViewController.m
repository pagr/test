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

@interface xyzToDoListViewController ()

@property (nonatomic) NSMutableArray *toDoItems;

@end

@implementation xyzToDoListViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        UITableViewCell *cell = (UITableViewCell *) sender;
        UITableView *view = (UITableView *) [[cell superview] superview];
        int index = [[view indexPathForCell:cell] row];
        xyzToDoItemViewController *controller = (xyzToDoItemViewController *) segue.destinationViewController;
        controller.toDoItem = [self.toDoItems objectAtIndex:index];
    }
}

- (NSMutableArray *)toDoItems {
    if (!_toDoItems) _toDoItems = [[NSMutableArray alloc] init];
    return _toDoItems;
}

- (void) loadInitialData {
    xyzToDoItem *item1 = [[xyzToDoItem alloc] init];
    item1.itemName = @"Program some Apps!";
    item1.creationDate = [NSDate date];
    item1.completed = NO;

    
    xyzToDoItem *item2 = [[xyzToDoItem alloc] init];
    item2.itemName = @"SHOW OFF some labs!";
    item2.creationDate = [NSDate date];
    item2.completed = NO;
    
    [self.toDoItems addObject:item1];
    [self.toDoItems addObject:item2];
}



- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    xyzAddToDoItemViewController *source = (xyzAddToDoItemViewController *) segue.sourceViewController;
    if (source.toDoItem) {
        [self.toDoItems addObject:source.toDoItem];
        [self.tableView reloadData];
    }
}

- (IBAction)updateItem:(UIStoryboardSegue *)segue {
    [self.tableView reloadData];
}

- (IBAction)deleteItem:(UIStoryboardSegue *)segue {
    xyzToDoItemViewController *source = (xyzToDoItemViewController *) segue.sourceViewController;
    
    [self.toDoItems removeObject:[source toDoItem]];
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
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    xyzToDoItem *item = [self.toDoItems objectAtIndex:indexPath.row];
    //cell.textLabel.text =[item.itemName stringByAppendingString:[item.creationDate description]];
    cell.textLabel.text = item.itemName;

    // Configure the cell...
    
    cell.accessoryType = item.completed ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
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
