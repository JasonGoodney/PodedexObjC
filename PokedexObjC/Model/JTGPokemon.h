//
//  JTGPokemon.h
//  PokedexObjC
//
//  Created by Jason Goodney on 9/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTGPokemon : NSObject

// copy - object isn't referenced
// readonly - can't write to

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly, copy) NSArray<NSString *> *abilities;

- (instancetype) initWithName:(NSString *)name identifier:(NSInteger)identifier
                    abilities:(NSArray<NSString *> *)abilities;
@end

@interface JTGPokemon (JSONConvertible)

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end
