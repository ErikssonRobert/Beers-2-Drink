//
//  SavedListsModel.h
//  Beers-2-Drink
//
//  Created by lösen är 0000 on 2018-01-29.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SavedListsModel : NSObject
@property (nonatomic) NSMutableArray *beers;
@property (nonatomic) NSMutableArray *testedBeers;
@property (nonatomic) NSMutableArray *importantBeer;

- (void)saveBeerToList:(NSArray*)beerName Title:(NSString*)title;

- (NSArray*)getBeerArray:(NSString*)title;

@end
