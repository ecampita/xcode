//
//  Deck.h
//  Machismo
//
//  Created by Enrique Campita II on 8/15/15.
//  Copyright © 2015 Enrique Campita II. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject


- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
