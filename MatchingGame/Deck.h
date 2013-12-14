//
//  Deck.h
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/14/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end

