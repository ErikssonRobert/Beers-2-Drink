//
//  DictionaryModel.h
//  Beers-2-Drink
//
//  Created by Robert on 2018-02-01.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SavedListsModel.h"

@interface DictionaryModel : NSObject

//@property (nonatomic) NSMutableArray *beers;
@property (nonatomic) NSMutableArray *beers;
@property (nonatomic) NSMutableArray *testedBeers;
@property (nonatomic) NSMutableArray *importantBeer;

- (unsigned long)getNumberOfRows:(NSInteger)section;
- (void)saveBeerArray:(NSString*)title;
- (void)getSavedBeerArray:(NSString*)title;

@end
