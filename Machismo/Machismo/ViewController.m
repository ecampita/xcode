//
//  ViewController.m
//  Machismo
//
//  Created by Enrique Campita II on 8/15/15.
//  Copyright © 2015 Enrique Campita II. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UISwitch *modeSwitch;
@property (weak, nonatomic) IBOutlet UILabel *modeLabel;

@end

@implementation ViewController
- (IBAction)touchDealButton:(id)sender
{
    [self updateUI];
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                      usingDeck:[self createDeck]];
    self.detailsLabel.text = @"Dealling now!";

}

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
    
}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (IBAction)touchCard:(UIButton *)sender {
    
//    [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}


- (void)updateUI;
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle: [self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
        self.detailsLabel.text = [NSString stringWithFormat:@"Card touched is %@", [self titleForCard:card]];
    }
}


- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


- (IBAction)modeSwitch:(id)sender {
    
    if ([self.modeLabel.text  isEqual: @"2-card match mode"]) {
        self.modeLabel.text = @"3-card match mode";
    } else if ([self.modeLabel.text isEqual: @"3-card match mode"]) {
        self.modeLabel.text = @"2-card match mode";
    }

}







@end
