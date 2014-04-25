//
//  ViewController.m
//  CardGame
//
//  Created by Zihang Li on 4/19/14.
//  Copyright (c) 2014 Zihang Li. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "ThreeCardMatchingGame.h"

@interface ViewController ()
@property(strong,nonatomic) Deck* deck;
@property(strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;


@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@end

@implementation ViewController


- (CardMatchingGame *)game
{
    
    if(!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[[PlayingCardDeck alloc] init]];
    
    return _game;
}




- (IBAction)touchCardButton:(UIButton *)sender
{
    
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject: sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}
- (IBAction)touchResetButton:(UIButton *)sender
{
    _game = nil;
    [self updateUI];
}


- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle: [self titleForCard: card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage: [self backgroundImageForCard: card]
                    forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat: @"Score: %ld", self.game.score];
    }
}

- (NSString *) titleForCard: (Card*) card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard: (Card*) card
{
    return [UIImage imageNamed: card.isChosen ? @"cardFront" : @"cardBack"];
}


- (Deck*) deck
{
    if(!_deck){
        _deck = [[PlayingCardDeck alloc]init];
    }
    return _deck;
}


@end
