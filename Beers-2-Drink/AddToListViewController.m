//
//  AddToListViewController.m
//  Beers-2-Drink
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "AddToListViewController.h"
#import "BeerListTableViewController.h"

@interface AddToListViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textBeerName;
@property (nonatomic) BeerListTableViewController *beerList;

@end

@implementation AddToListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)buttonAddBeerPressed:(id)sender {
    [self.beers addObject:self.textBeerName.text];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
