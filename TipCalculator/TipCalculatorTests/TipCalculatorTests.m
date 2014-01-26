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
    return 0;
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

    XCTAssertEqual((double)2, result, @"Tip should have been 2 dollars");
}

- (void)testErrorOnNegativeAmount
{
    
}

- (void)testZeroTipOnZeroBillAmount
{
    
}



@end


