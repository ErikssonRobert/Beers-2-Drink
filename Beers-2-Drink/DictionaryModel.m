//
//  DictionaryModel.m
//  Beers-2-Drink
//
//  Created by lösen är 0000 on 2018-02-01.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "DictionaryModel.h"

@implementation DictionaryModel

- (unsigned long)getNumberOfRows:(NSInteger)section {
    if (section == 0) {
        return self.beers.count;
    }
    else {
        return self.testedBeers.count;
    }
}

- (void)saveBeerArray:(NSString*)title {
    SavedListsModel *save = [[SavedListsModel alloc] init];
    [save saveBeerToList:self.beers Title:title];
    [save saveBeerToList:self.testedBeers Title:[title stringByAppendingString:@"tested"]];
    [save saveBeerToList:self.importantBeer Title:[title stringByAppendingString:@"important"]];
}

- (void)getSavedBeerArray:(NSString*)title {
    NSLog(@"Hämta array2");
    SavedListsModel *save = [[SavedListsModel alloc] init];
    if ([save getBeerArray:[title stringByAppendingString:@"tested"]] == NULL){
        NSLog(@"Tested = tom");
        self.testedBeers = @[].mutableCopy;
    } else {
        self.testedBeers = [save getBeerArray:[title stringByAppendingString:@"tested"]].mutableCopy;
    }
    if ([save getBeerArray:[title stringByAppendingString:@"important"]] == NULL) {
        NSLog(@"Important = tom");
        self.importantBeer = @[].mutableCopy;
    } else {
        self.importantBeer = [save getBeerArray:[title stringByAppendingString:@"important"]].mutableCopy;
    }
    if ([save getBeerArray:title] == NULL){
        NSLog(@"Beers = tom");
        self.beers = @[].mutableCopy;
    } else {
        self.beers = [save getBeerArray:title].mutableCopy;
    }
}

@end
