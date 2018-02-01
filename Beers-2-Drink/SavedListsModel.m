//
//  SavedListsModel.m
//  Beers-2-Drink
//
//  Created by Robert on 2018-01-29.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "SavedListsModel.h"

@implementation SavedListsModel

- (void)saveBeerToList:(NSArray*)beerArray Title:(NSString*)title {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:beerArray forKey:title];
    NSLog(@"Sparar %@", [defaults objectForKey:title
                  ]);
    [defaults synchronize];
}

- (NSArray*)getBeerArray:(NSString*)title {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"Hämtar %@", [defaults objectForKey:title
                  ]);
    
    return [defaults objectForKey:title];
}

@end
