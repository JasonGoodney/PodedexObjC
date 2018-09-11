//
//  JTGPokemonController.m
//  PokedexObjC
//
//  Created by Jason Goodney on 9/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import "JTGPokemonController.h"

@implementation JTGPokemonController

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon";

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(JTGPokemon * _Nullable))completion {
    
    // Ensure the completion is not nil
    if (!completion) {
        completion = ^(JTGPokemon *p) {};
    }
    
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error in %s: %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (response) {
            NSLog(@"%@", response);
        }
        
        if (data) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
                NSLog(@"Error parsing the json: %@", error);
                completion(nil);
                return;
            }
            
            JTGPokemon *pokemon = [[JTGPokemon alloc] initWithDictionary:dictionary];
            
            completion(pokemon);
        }
    }] resume];
    
}

@end
