//
//  Card.h
//  matchismo
//
//  Created by vennim on 2/13/13.
//  Copyright (c) 2013 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString * contents;
@property (nonatomic, getter = isFaceUp) BOOL faceup;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;
-(int) match:(NSArray *) otherCards;

@end
