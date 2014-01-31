//
//  TipCalculator.h
//  TipCalculator
//
//  Created by Brandon Linton on 1/30/14.
//  Copyright (c) 2014 Brandon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipCalculator : NSObject

- (double) getTipForAmount:(double)amount tipPercent:(double)tipPercent;

@end
