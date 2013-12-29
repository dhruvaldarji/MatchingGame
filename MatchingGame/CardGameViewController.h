//
//  CardGameViewController.h
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/13/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//
// Abstract Class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

// protected
// for subclasses
-(Deck *)createDeck; // abstract

@end
