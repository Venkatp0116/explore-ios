//
//  TipCalculator.m
//  TipCalculator
//
//  Created by Brandon Linton on 1/30/14.
//  Copyright (c) 2014 Brandon. All rights reserved.
//

#import "TipCalculator.h"

@implementation TipCalculator : NSObject

- (double) getTipForAmount:(double)amount tipPercent:(double)tipPercent
{
    if (tipPercent > 1)
        tipPercent = tipPercent / 100;
    
    return tipPercent * amount;
}

@end