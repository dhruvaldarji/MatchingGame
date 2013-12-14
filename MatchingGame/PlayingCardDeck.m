//
//  PlayingCardDeck.m
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/14/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import "PlayingCardDeck.h"


@interface Deck()

@end


@implementation PlayingCardDeck

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        for(NSString *suit in [PlayingCard validSuits])
        {
            for (NSUInteger rank =1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
