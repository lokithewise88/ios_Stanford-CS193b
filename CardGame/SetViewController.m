//
//  SetViewController.m
//  CardGame
//
//  Created by Zihang Li on 4/25/14.
//  Copyright (c) 2014 Zihang Li. All rights reserved.
//

#import "SetViewController.h"
#import "SetDeck.h"
#import "ThreeCardMatchingGame.h"
#import "SetCard.h"
@interface SetViewController ()

@property(strong,nonatomic) Deck* deck;
@property(strong,nonatomic) CardMatchingGame *game;
//@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;


@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@end

@implementation SetViewController

- (CardMatchingGame *)game
{
    
    if(!_game) _game = [[ThreeCardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[[SetDeck alloc] init]];
    
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
        [cardButton setAttributedTitle:[self titleForCard: card] forState: UIControlStateNormal];
        [cardButton setBackgroundImage: [self backgroundImageForCard: card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
       // self.scoreLabel.text = [NSString stringWithFormat: @"Score: %ld", self.game.score];
    }
}

- (NSAttributedString *) titleForCard: (Card*) card
{
    SetCard* setcard = (SetCard*)card;
    NSMutableAttributedString *cardContent= [[NSMutableAttributedString alloc] initWithString: [setcard.num stringByAppendingString:setcard.shape]];
    
    [cardContent addAttributes: @{NSForegroundColorAttributeName: setcard.color,
                                  NSStrokeColorAttributeName:setcard.strokeColor,
                                  NSStrokeWidthAttributeName:@-5}
                         range: NSMakeRange(0, 2)];
    return card.isChosen ? cardContent : nil;
}

- (UIImage *)backgroundImageForCard: (Card*) card
{
    return [UIImage imageNamed: card.isChosen ? @"cardFront" : @"cardBack"];
}


- (Deck*) deck
{
    if(!_deck){
        _deck = [[SetDeck alloc]init];
    }
    return _deck;
}

@end
