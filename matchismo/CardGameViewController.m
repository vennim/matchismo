//
//  CardGameViewController.m
//  matchismo
//
//  Created by vennim on 2/11/13.
//  Copyright (c) 2013 cs. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "GameResult.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong,nonatomic) GameResult * gameResult;
@end

@implementation CardGameViewController

- (GameResult *)gameResult
{
    if (!_gameResult) _gameResult=[[GameResult alloc] init];
    return _gameResult;
}

- (CardMatchingGame *) game
{
    if (!_game) _game=[[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (void) setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}
- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        Card *card=[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        UIImage *img=[[UIImage alloc] initWithContentsOfFile:@"cardbackred.png"];
        [cardButton setImage:img forState:UIControlStateSelected];
                      
    }
    self.scoreLabel.text=[NSString stringWithFormat:@"Score: %d",self.game.score];
}

- (void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d",self.flipCount];
    self.gameResult.score=self.game.score;
    NSLog(@"Flips updated to %d",self.flipCount);
}
- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
   self.flipCount++;
    [self updateUI];
}

- (IBAction)deal {
    self.game = nil;
    self.gameResult = nil;
    self.flipCount = 0;
    [self updateUI];
}


@end
