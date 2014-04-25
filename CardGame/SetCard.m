//
//  SetCard.m
//  CardGame
//
//  Created by Zihang Li on 4/25/14.
//  Copyright (c) 2014 Zihang Li. All rights reserved.
//

#import "SetCard.h"




@implementation SetCard


+ (NSArray*) validShape
{
    return @[@"▲",@"■",@"●"];
}

+ (NSArray*) validColor
{
    return @[[UIColor blackColor],[UIColor blueColor],[UIColor greenColor]];
}

+ (NSArray*) validStrokeColor
{
    return @[[UIColor redColor],[UIColor purpleColor],[UIColor yellowColor]];
}

+ (NSArray*) validNumber
{
    return @[@"1",@"2",@"3"];
}

- (int) match:(NSArray *)otherCards
{
    if ([otherCards count] == 2){
        SetCard *firstCard = [otherCards objectAtIndex:0];
        SetCard *secondCard = [otherCards objectAtIndex:1];
        if ([self.shape isEqualToString: firstCard.shape]
            && [firstCard.shape isEqualToString: secondCard.shape])
            return 2;
        if ([self.color isEqual: firstCard.color]
            && [self.color isEqual: secondCard.color])
            return 2;
        if ([self.strokeColor isEqual: firstCard.strokeColor]
            && [self.strokeColor isEqual: secondCard.strokeColor])
            return 2;
        if ([self.num isEqualToString: firstCard.num]
            && [firstCard.num isEqualToString: secondCard.num])
            return 2;
        if (![self.shape isEqualToString: firstCard.shape]
            && ![firstCard.shape isEqualToString: secondCard.shape]
            && ![self.shape isEqualToString: secondCard.shape])
            return 2;
        if (![self.color isEqual: firstCard.color]
            && ![self.color isEqual: secondCard.color]
            && ![firstCard.color isEqual: secondCard.color])
            return 2;
        if (![self.num isEqualToString: firstCard.num]
            && ![firstCard.num isEqualToString: secondCard.num]
            && ![self.num isEqualToString: secondCard.num])
            return 2;
        if (![self.strokeColor isEqual: firstCard.strokeColor]
            && ![self.strokeColor isEqual: secondCard.strokeColor]
            && ![firstCard.strokeColor isEqual: secondCard.strokeColor])
            return 2;
    }
    return 0;
}

@end
