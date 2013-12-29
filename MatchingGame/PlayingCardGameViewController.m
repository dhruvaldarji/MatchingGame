//
//  PlayingCardGameViewController.m
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/28/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

-(Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
