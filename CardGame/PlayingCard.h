//
//  PlayingCard.h
//  Matchismo
//
//  Created by Kelv on 03/12/2013.
//  Copyright (c) 2013 Kelv. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
