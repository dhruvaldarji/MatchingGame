//
//  CardGameViewController.m
//  MatchingGame
//
//  Created by Dhruval's MacBook on 12/13/13.
//  Copyright (c) 2013 Dhruval Darji. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UITextView *movesHistoryTextView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *gameModeLabel;
@property (weak, nonatomic) IBOutlet UIButton *resetGameButton;

@end

@implementation CardGameViewController

-(CardMatchingGame *)game
{
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck // abstract
{
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    NSString *text = @"";
    int cardIndex = [self.cardButtons indexOfObject:sender];
    text = [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
    [self printToGame:text];
    
}

- (IBAction)gameModeSelected:(UISegmentedControl *)sender
{
    if (self.gameModeSegmentedControl.selectedSegmentIndex == 0) {
        self.game.cardMatchingMode = 2;
    }
    
    if (self.gameModeSegmentedControl.selectedSegmentIndex == 1) {
        self.game.cardMatchingMode = 3;
    }
    
    self.gameModeLabel.text = [NSString stringWithFormat:@"Game Mode: %d cards", self.game.cardMatchingMode];
}

- (IBAction)reset:(UIButton *)sender
{
    self.game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    for (UIButton *cardButton in self.cardButtons) {
        [cardButton setTitle:@"" forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[UIImage imageNamed:@"AppleBack"] forState:UIControlStateNormal];
        [cardButton setEnabled:YES];
    }
    self.scoreLabel.text = @"Score: 0";
    self.movesHistoryTextView.text = @"";
}

-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}

-(NSString *)titleForCard:(Card*) card
{
    
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen ? @"Image" : @"AppleBack"];
}

-(void) printToGame: (NSString *) message
{
    NSString *text = self.movesHistoryTextView.text;
    self.movesHistoryTextView.text = [NSString stringWithFormat:@"%@ \n%@",message,text];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
