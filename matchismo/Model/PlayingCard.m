//
//  PlayingCard.m
//  matchismo
//
//  Created by vennim on 2/13/13.
//  Copyright (c) 2013 cs. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int) match:(NSArray *) otherCards
{
    int score=0;
    if (otherCards.count==1)
    {
        id newCard = [otherCards lastObject];
        if ([newCard isKindOfClass:[PlayingCard class]])
        {
            PlayingCard *otherCard=(PlayingCard *) newCard;
            if ([otherCard.suit isEqualToString:self.suit]) {
                score=1;
            } else if (otherCard.rank==self.rank)
            {
                score=4;
            }
        }
    }
    
    return score;
}

- (NSString *)contents
{
    int index = self.rank-1;
    
    if (index >= [PlayingCard rankStrings].count)
        return @"??";
    return [[PlayingCard rankStrings] [index] stringByAppendingString:self.suit];
}
@synthesize suit = _suit;

+ (NSArray *) validSuits
{
    static NSArray *validSuits=nil;
    if(!validSuits) validSuits=@[@"♣",@"♥",@"♦",@"♠"];
    return validSuits;
}
- (void) setSuit:(NSString *)suit
{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit=suit;
    }
}

- (NSString *) suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankStrings
{
    static NSArray *rankStrings=nil;
    if (!rankStrings){
        rankStrings=@[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    }
    return rankStrings;
}
+ (NSUInteger)maxRank
{
    return PlayingCard.rankStrings.count;
}

@end
