//
//  SetDeck.m
//  CardGame
//
//  Created by Zihang Li on 4/25/14.
//  Copyright (c) 2014 Zihang Li. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"
@implementation SetDeck

- (instancetype) init
{
    self = [super init];
    if(self){
        for (UIColor *color in [SetCard validColor]){
            for (UIColor *strokColor in [SetCard validStrokeColor]){
                for (NSString *num in [SetCard validNumber]){
                    for (NSString *shape in [SetCard validShape]){
                        SetCard *card = [[SetCard alloc] init];
                        card.color = color;
                        card.strokeColor = strokColor;
                        card.shape = shape;
                        card.num = num;
                        [self addCard: card];
                    }
                }
            }
        }
    }
    return self;
}
@end
