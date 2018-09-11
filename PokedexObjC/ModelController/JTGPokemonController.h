//
//  JTGPokemonController.h
//  PokedexObjC
//
//  Created by Jason Goodney on 9/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTGPokemon.h"

@interface JTGPokemonController : NSObject

// _Nullable - allows ObjC to handle Swift optionals when bridging
+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm
                       completion:(void (^_Nullable)(JTGPokemon * _Nullable))completion;

@end
