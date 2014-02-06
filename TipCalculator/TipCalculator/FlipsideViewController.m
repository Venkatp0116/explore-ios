//
//  FlipsideViewController.m
//  TipCalculator
//
//  Created by Brandon Linton on 1/25/14.
//  Copyright (c) 2014 Brandon. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()
@property (strong, nonatomic) IBOutlet UISwitch *roundToDollarSwitch;
@end

@implementation FlipsideViewController

- (void)awakeFromNib
{
    self.preferredContentSize = CGSizeMake(320.0, 480.0);
    [super awakeFromNib];
}

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

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
