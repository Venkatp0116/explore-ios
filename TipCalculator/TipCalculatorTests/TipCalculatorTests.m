//
//  TipCalculatorTests.m
//  TipCalculatorTests
//
//  Created by Brandon Linton on 1/25/14.
//  Copyright (c) 2014 Brandon. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TipCalculator : NSObject

- (double) getTipForAmount:(double)amount tipPercent:(double)tipPercent;

@end

@implementation TipCalculator : NSObject

- (double) getTipForAmount:(double)amount tipPercent:(double)tipPercent
{
    if (tipPercent > 1)
        tipPercent = tipPercent / 100;
    
    return tipPercent * amount;
}

@end

@interface TipCalculatorTests : XCTestCase

@end

@implementation TipCalculatorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCanDeriveTipFromBillAmount
{
    double billAmount = 20;
    double tipPercentage = 20;
    TipCalculator* calculator = [[TipCalculator alloc] init];
    
    double result = [calculator getTipForAmount:billAmount tipPercent:tipPercentage];

    XCTAssertEqual((double)4, result, @"Tip should have been 4 dollars");
}

- (void)testCanCalculate100PercentTip
{
    double billAmount = 20;
    double tipPercentage = 100;
    
    TipCalculator* calculator = [[TipCalculator alloc] init];
    
    double result = [calculator getTipForAmount:billAmount tipPercent:tipPercentage];
    
    XCTAssertEqual((double)20, result, @"Tip should have been 20 dollars");
}

- (void)testZeroTipOnZeroBillAmount
{
    double billAmount = 0;
    double tipPercentage = 100;
    
    TipCalculator* calculator = [[TipCalculator alloc] init];
    
    double result = [calculator getTipForAmount:billAmount tipPercent:tipPercentage];
    
    XCTAssertEqual((double)0, result, @"Tip should have been 0 dollars");
}

@end


