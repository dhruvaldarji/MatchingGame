//
//  Deck.m
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/14/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end

@implementation Deck

-(NSMutableArray *)cards
{
    // if array doesnt exist (is nil) then create a new array
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    NSLog(@"Deck: method: cards");
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    
    if(atTop)
    {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
    
}

- (void)addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

- (Card *) drawRandomCard
{
    // reasonable default initializer
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        // get random index from self.cards
        unsigned index = arc4random() % [self.cards count];
        
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}


@end