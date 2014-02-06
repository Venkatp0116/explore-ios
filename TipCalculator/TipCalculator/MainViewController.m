//
//  MainViewController.m
//  TipCalculator
//
//  Created by Brandon Linton on 1/25/14.
//  Copyright (c) 2014 Brandon. All rights reserved.
//

#import "MainViewController.h"
#import "TipCalculator.h"

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UITextField *billAmount;
@property (strong, nonatomic) IBOutlet UITextField *tipPercent;
@property (strong, nonatomic) IBOutlet UILabel *TipAmount;
@property (strong, nonatomic) IBOutlet UILabel *TotalAmount;
@property BOOL shouldRoundTotalToNearestDollar;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculateTip:(id)sender
{
    [_tipPercent endEditing:YES];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    TipCalculator *tipCalculator = [[TipCalculator alloc] init];
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    NSLog(@"Calculate that tip!");
    NSLog(@"BillAmount=%@;TipPercent=%@", _billAmount.text, _tipPercent.text);
    
    double billAmountDecimal = [[numberFormatter numberFromString:_billAmount.text] doubleValue];
    double tipPercentDecimal = [[numberFormatter numberFromString:_tipPercent.text] doubleValue];
    
    NSLog(@"Tip decimal values:");
    NSLog(@"BillAmount=%f;TipPercent=%f", billAmountDecimal, tipPercentDecimal);
    
    double tipAmount = [tipCalculator getTipForAmount:billAmountDecimal tipPercent:tipPercentDecimal];
    
    double totalAmount = tipAmount + billAmountDecimal;
    
    if (self.shouldRoundTotalToNearestDollar)
    {
        long totalRoundedUp = ceil(totalAmount);
        tipAmount = totalRoundedUp - billAmountDecimal;
        totalAmount = tipAmount + billAmountDecimal;
        
        _tipPercent.text = [currencyFormatter stringFromNumber: [NSNumber numberWithDouble:tipAmount]];
    }
    
    NSLog(@"Tip amount is %f", tipAmount);
    NSLog(@"Total amount is %f", totalAmount);
    
    _TipAmount.text = [currencyFormatter stringFromNumber: [NSNumber numberWithDouble: tipAmount]];
    _TotalAmount.text = [currencyFormatter stringFromNumber: [NSNumber numberWithDouble:totalAmount]];
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    }
    
    self.shouldRoundTotalToNearestDollar = controller.roundToDollarSwitch.on;
    NSLog(@"Switch Value = %d", self.shouldRoundTotalToNearestDollar);
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
            self.flipsidePopoverController = popoverController;
            popoverController.delegate = self;
        }
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
