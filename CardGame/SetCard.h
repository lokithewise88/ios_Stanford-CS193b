//
//  SetCard.h
//  CardGame
//
//  Created by Zihang Li on 4/25/14.
//  Copyright (c) 2014 Zihang Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface SetCard : Card
@property (strong,nonatomic)NSString *shape;
@property (strong,nonatomic)UIColor *color;
@property (strong,nonatomic)UIColor *strokeColor;
@property (strong,nonatomic)NSString *num;

+ (NSArray*) validShape;
+ (NSArray*) validColor;
+ (NSArray*) validStrokeColor;
+ (NSArray*) validNumber;

@end
