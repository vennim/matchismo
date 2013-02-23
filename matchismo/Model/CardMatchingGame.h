//
//  CardMatchingGame.h
//  matchismo
//
//  Created by vennim on 2/14/13.
//  Copyright (c) 2013 cs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "deck.h"

@interface CardMatchingGame : NSObject
- (id) initWithCardCount:(NSUInteger)cardCount
               usingDeck:(Deck *) deck;
- (void) flipCardAtIndex:(NSUInteger)index;
-(Card *) cardAtIndex:(NSUInteger)index;
@property (nonatomic,readonly) int score;

@end
