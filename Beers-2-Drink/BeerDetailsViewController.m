//
//  BeerDetailsViewController.m
//  Beers-2-Drink
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "BeerDetailsViewController.h"
#import "BeerListTableViewController.h"

@interface BeerDetailsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *switchHaveTried;
@property (weak, nonatomic) IBOutlet UISwitch *switchImportant;
@property (nonatomic) BOOL isImportant;
@end

@implementation BeerDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setHaveTriedSwitch];
    [self setImportantSwitch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImportantSwitch {
    for (int i = 0; i < self.importantBeer.count; i++) {
        if ([self.importantBeer[i] isEqualToString:self.title]) {
            [self.switchImportant setOn:YES];
            self.isImportant = YES;
            return;
        }
    }
}

- (void)setHaveTriedSwitch {
    for (int i = 0; i < self.beers.count; i++) {
        if ([self.beers[i] isEqualToString:self.title]) {
            [self.switchHaveTried setOn:NO];
            return;
        }
    }
}

- (IBAction)buttonSaveDetails:(id)sender {
    [self setTestedAndNotTestedArrays];
    [self setImportantAndNotImportantArrays];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTestedAndNotTestedArrays {
    if (self.switchHaveTried.isOn) {
        for (int i = 0; i < self.beers.count; i++) {
            if ([self.beers[i] isEqualToString:self.title]) {
                [self.testedBeers addObject:self.beers[i]];
                [self.beers removeObjectAtIndex:i];
            }
        }
    }
    else {
        for (int i = 0; i < self.testedBeers.count; i++) {
            if ([self.testedBeers[i] isEqualToString:self.title]) {
                [self.beers addObject:self.testedBeers[i]];
                [self.testedBeers removeObjectAtIndex:i];
            }
        }
    }
}

- (void)setImportantAndNotImportantArrays {
    if (self.switchImportant.isOn && !self.isImportant) {
        for (int i = 0; i < self.beers.count; i++) {
            if ([self.beers[i] isEqualToString:self.title]) {
                [self.importantBeer addObject:self.beers[i]];
            }
        }
    }
    else if (!self.switchImportant.isOn && self.isImportant){
        for (int i = 0; i < self.importantBeer.count; i++) {
            if ([self.importantBeer[i] isEqualToString:self.title]) {
                [self.importantBeer removeObjectAtIndex:i];
            }
        }
    }
    else {
        return;
    }
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
