//
//  CardMatchingGame.m
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/14/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card
@property (nonatomic) NSString *moveText;


@end

@implementation CardMatchingGame

-(NSMutableArray *) cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if(self){
        for(int i = 0; i< count; i++){
            Card *card = [deck drawRandomCard];
            if(card) {
                [self.cards addObject:card];
            }
            else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 10;
static const int COST_TO_CHOSE = 1;

-(NSString *) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    self.moveText = [NSString stringWithFormat:@"%@",card.contents];
    if(!card.isMatched){ // If the card is not matched
        if (card.isChosen) { // if the card is already chosen
            card.chosen = NO;
            self.moveText = [NSString stringWithFormat:@"%@", card.contents];
        } else { // if the card is not currently chosen
            // Match against other cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore* MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                        self.moveText = [NSString stringWithFormat:@"%@ matches %@",card.contents,otherCard.contents];
                    }else{
                        otherCard.chosen = NO;
                        self.score -= MISMATCH_PENALTY;
                        self.moveText = [NSString stringWithFormat:@"%@ does not match %@",card.contents,otherCard.contents];
                    }
                }
            }
            self.score -= COST_TO_CHOSE;
            card.chosen = YES;
        }
    }
    return self.moveText;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index]:nil;
}

-(instancetype) init
{
    return nil;
}

@end
