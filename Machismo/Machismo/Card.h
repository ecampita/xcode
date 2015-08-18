//
//  Card.h
//  Machismo
//
//  Created by Enrique Campita II on 8/15/15.
//  Copyright © 2015 Enrique Campita II. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end
