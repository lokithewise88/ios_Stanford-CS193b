//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Zihang Li on 4/21/14.
//  Copyright (c) 2014 Zihang Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card*)cardAtIndex:(NSUInteger)index;

@property(nonatomic,readwrite) NSInteger score;
@property(nonatomic,strong) NSMutableArray* cards;
@end
