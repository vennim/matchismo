//
//  PlayingCard.h
//  matchismo
//
//  Created by vennim on 2/13/13.
//  Copyright (c) 2013 cs. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (strong,nonatomic) NSString * suit;
@property (nonatomic) NSUInteger rank;
+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;
+ (NSArray *) rankStrings;
@end
