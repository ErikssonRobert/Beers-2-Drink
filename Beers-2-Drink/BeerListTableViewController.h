//
//  BeerListTableViewController.h
//  Beers-2-Drink
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddToListViewController.h"
#import "BeerDetailsViewController.h"
#import "DictionaryModel.h"

@interface BeerListTableViewController : UITableViewController

@property (nonatomic) DictionaryModel *beerListModel;

@end
