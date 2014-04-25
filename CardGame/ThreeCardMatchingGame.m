//
//  ThreeCardMatchingGame.m
//  CardGame
//
//  Created by Zihang Li on 4/21/14.
//  Copyright (c) 2014 Zihang Li. All rights reserved.
//

#import "ThreeCardMatchingGame.h"

@interface ThreeCardMatchingGame()


@end

@implementation ThreeCardMatchingGame


- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super initWithCardCount: count usingDeck: deck];
    return self;
    
}
- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else{
            NSMutableArray *chosenCards = [[NSMutableArray alloc] init];
            for(Card *chosenCard in self.cards){
                if(chosenCard.isChosen && !chosenCard.isMatched)
                    [chosenCards addObject: chosenCard];
            }
            if([chosenCards count]==1){
                self.score -= 1;
                card.chosen = YES;
                return;
            }
            int matchScore = [card match: chosenCards];
            if (matchScore){
                self.score += matchScore;
                for (Card *chosenCard in chosenCards){
                    chosenCard.matched = YES;
                }
                card.matched = YES;
            }else{
                self.score -= 2;
                for (Card *chosenCard in chosenCards){
                    chosenCard.chosen = NO;
                }
            }
            self.score -= 1;
            card.chosen = YES;
            
        }
    }
}
@end
