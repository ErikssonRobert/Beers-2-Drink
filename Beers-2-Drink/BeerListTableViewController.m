//
//  BeerListTableViewController.m
//  Beers-2-Drink
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "BeerListTableViewController.h"

@interface BeerListTableViewController ()
@end

@implementation BeerListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.beerListModel = [[DictionaryModel alloc] init];
    [self initialize];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    [self saveBeerArray];
}

- (void)initialize {
    [self getSavedBeerArray];
    [self.tableView reloadData];
}

- (void)saveBeerArray {
    NSLog(@"Spara array1");
    [self.beerListModel saveBeerArray:self.title];
}

- (void)getSavedBeerArray {
    NSLog(@"Hämta array1");
    [self.beerListModel getSavedBeerArray:self.title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.beerListModel getNumberOfRows:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"beers" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0) {
        NSLog(@"section 1");
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.text = self.beerListModel.beers[indexPath.row];
        for (int i = 0; i < self.beerListModel.importantBeer.count; i++) {
            if ([self.beerListModel.beers[indexPath.row] isEqualToString:self.beerListModel.importantBeer[i]]) {
                cell.backgroundColor = [UIColor colorWithRed:0.5f green:0.5f blue:1.0f alpha:1.0f];
            }
        }
    } else if (indexPath.section == 1) {
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.textLabel.text = self.beerListModel.testedBeers[indexPath.row];
    }
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        if (indexPath.section == 0) {
            [self.beerListModel.beers removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self saveBeerArray];
            [self.tableView reloadData];
        }
        else if (indexPath.section == 1) {
            [self.beerListModel.testedBeers removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self saveBeerArray];
            [self.tableView reloadData];
        }
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"Details"]) {
        UITableViewCell *cell = sender;
        BeerDetailsViewController *details = [segue destinationViewController];
        details.title = cell.textLabel.text;
        details.beers = self.beerListModel.beers;
        details.testedBeers = self.beerListModel.testedBeers;
        details.importantBeer = self.beerListModel.importantBeer;
    } else if ([segue.identifier isEqualToString:@"Add"]) {
        AddToListViewController *addBeer = [segue destinationViewController];
        addBeer.title = @"Lägg till öl";
        addBeer.beers = self.beerListModel.beers;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Måste smaka";
    }
    else
        return @"Har smakat";
}



@end
