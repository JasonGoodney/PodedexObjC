//
//  JTGPokemon.m
//  PokedexObjC
//
//  Created by Jason Goodney on 9/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

#import "JTGPokemon.h"

@implementation JTGPokemon

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities {
    if (self = [super init]) {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation JTGPokemon (JSONConvertible)

static NSString * const NameKey = @"name";
static NSString * const IdentifierKey = @"id";
static NSString * const AbilitiesKey = @"abilities";
static NSString * const AbilityKey = @"ability";
static NSString * const AbilityNameKey = @"name";

- (instancetype) initWithDictionary:(NSDictionary<NSString *, id> *)dictionary {
    NSString *name = dictionary[NameKey];
    NSInteger identifier = [dictionary[IdentifierKey] integerValue];
    NSArray *abilitiesDictionaries = dictionary[AbilitiesKey];
    
    if (![name isKindOfClass:[NSString class]] ||
         ![abilitiesDictionaries isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in abilitiesDictionaries) {
        NSString *abilityName = dictionary[@"ability"][@"name"];
        if (!abilityName) { continue; }
        [abilities addObject:abilityName];
    }
    
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
