//
//  Card.m
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/14/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card


-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents])
            // self means this
        {
            score = 1;
        }
    }
    
    return score;
    
}


@end
