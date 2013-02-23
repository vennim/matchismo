//
//  Deck.h
//  matchismo
//
//  Created by vennim on 2/13/13.
//  Copyright (c) 2013 cs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void) addCard:(Card *) card atTop:(BOOL)atTop;
- (Card *) drawRandomCard;

@end
