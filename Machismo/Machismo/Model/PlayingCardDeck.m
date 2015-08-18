//
//  PlayingCardDeck.m
//  Machismo
//
//  Created by Enrique Campita II on 8/15/15.
//  Copyright © 2015 Enrique Campita II. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck


- (instancetype)init
{
    self = [super init];
    if (self ) {
        for (NSString *suits in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suits;
                [self addCard:card];
                
                
            }
        }
        
        
    }
    return self;
}















@end
