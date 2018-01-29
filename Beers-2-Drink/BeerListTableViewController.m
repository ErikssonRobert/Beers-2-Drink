//
//  BeerListTableViewController.m
//  Beers-2-Drink
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "BeerListTableViewController.h"

@interface BeerListTableViewController ()
@property (nonatomic) NSMutableArray *beers;
@end

@implementation BeerListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.beers = [self getBeerArray].mutableCopy;
}

- (NSArray*)getBeerArray {
    if ([self.title isEqualToString:@"Lager"]) {
        NSArray *beerArray = @[@"Falcon", @"Corona"];
        return beerArray;
    } else if ([self.title isEqualToString:@"IPA"]) {
        NSArray *beerArray = @[@"Bäss", @"Lite kiss i burk"];
        return beerArray;
    } else if ([self.title isEqualToString:@"Ale"]) {
        NSArray *beerArray = @[@"piss", @"Lite kiss i burk"];
        return beerArray;
    } else if ([self.title isEqualToString:@"Vete öl"]) {
        NSArray *beerArray = @[@"puss", @"Lite kiss i burk"];
        return beerArray;
    } else if ([self.title isEqualToString:@"Stout"]) {
        NSArray *beerArray = @[@"päss", @"Lite kiss i burk"];
        return beerArray;
    }
    NSArray *beerArray = @[@"Något", @"Gick fel!"];
    return beerArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.beers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Beers" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.beers[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"Details"]) {
        UITableViewCell *cell = sender;
        UITableViewController *details = [segue destinationViewController];
        details.title = cell.textLabel.text;
    } else if ([segue.identifier isEqualToString:@"Add"]) {
        UIViewController *addBeer = [segue destinationViewController];
        addBeer.title = @"Lägg till öl";
    }
}

@end
