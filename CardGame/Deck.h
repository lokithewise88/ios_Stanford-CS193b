//
//  Deck.h
//  Matchismo
//
//  Created by Kelv on 03/12/2013.
//  Copyright (c) 2013 Kelv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
