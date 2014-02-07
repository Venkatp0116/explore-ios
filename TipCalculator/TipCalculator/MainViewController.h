//
//  MainViewController.h
//  TipCalculator
//
//  Created by Brandon Linton on 1/25/14.
//  Copyright (c) 2014 Brandon. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UIPopoverControllerDelegate, UITextFieldDelegate>

- (IBAction)calculateTip:(id)sender;
- (IBAction)textFieldDidChange :(UITextField *)theTextField;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
