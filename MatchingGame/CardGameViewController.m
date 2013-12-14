//
//  CardGameViewController.m
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/13/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *pDeck;
@property (strong, nonatomic) PlayingCard *pCard;

@end

@implementation CardGameViewController

-(void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount = %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"AppleBack"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        
        self.pCard = [self.pDeck drawRandomCard];
        NSUInteger rank = self.pCard.rank;
        NSString *suit = self.pCard.suit;
        
        NSString *title = [NSString stringWithFormat:@"%lu %@", (unsigned long)rank, suit];
        
        [sender setBackgroundImage:[UIImage imageNamed:@"Image"] forState:UIControlStateNormal];
        [sender setTitle:title forState:UIControlStateNormal];
    }
    self.flipCount++;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pDeck = [[PlayingCardDeck alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
