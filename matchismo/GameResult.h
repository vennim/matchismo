//
//  GameResult.h
//  matchismo
//
//  Created by vennim on 2/15/13.
//  Copyright (c) 2013 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject
+ (NSArray *) AllGameResults;
@property (readonly,nonatomic) NSDate *start;
@property (readonly,nonatomic) NSDate *end;
@property (readonly,nonatomic) NSTimeInterval duration;
@property (nonatomic) int score;

@end
