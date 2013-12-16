//
//  Card.h
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/14/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
// Nonatamic means that the setter and getter for this property is simple.
// Strong means that the pointer exists as long

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;


@end
