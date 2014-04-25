//
//  CardMatchingGame.m
//  CardGame
//
//  Created by Zihang Li on 4/21/14.
//  Copyright (c) 2014 Zihang Li. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@end

@implementation CardMatchingGame

- (NSMutableArray*)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck
{
    self = [super init];
    
    if(self){
        for(int i=0; i<count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return index<[self.cards count] ? self.cards[index] : nil;
}

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card * card = [self cardAtIndex:index];
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else{
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= 2;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
        }
        self.score -= 1;
        card.chosen = YES;
    }
}





@end
