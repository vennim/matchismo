//
//  GameResultViewController.m
//  matchismo
//
//  Created by vennim on 2/15/13.
//  Copyright (c) 2013 cs. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameResult.h"

@interface GameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;

@end

@implementation GameResultViewController

-(void) updateUI
{
    NSString *displayText = @"";
    for (GameResult *result in [GameResult AllGameResults]){
        displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %0g\n",result.score, result.end, round(result.duration)];
    }
    self.display.text= displayText;
                            
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void) setup
{
    // initialization that cant wait till viewdidload
}
- (void) awakeFromNib
{
    [self setup];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
