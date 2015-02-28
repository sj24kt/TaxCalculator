//
//  ViewController.m
//  TaxCalculator
//
//  Created by Sherrie Jones on 2/27/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) IBOutlet UITextField *priceTextField;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@property double caTax;
@property double chiTax;
@property double nyTax;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.priceTextField.delegate = self;
    //self.priceTextField.clearButtonMode = UITextFieldViewModeWhileEditing;

    CGRect frame= self.segmentedControl.frame;
    [self.segmentedControl setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 100)];

    self.caTax = .075;
    self.chiTax = .0925;
    self.nyTax = .045;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    self.priceTextField.placeholder = @"0.00";
    self.resultLabel.text = @"sales tax";
    [self.priceTextField resignFirstResponder];
    return YES;
}

- (IBAction)onCalculateButtonTapped:(UIButton *)sender {

    NSString *enteredText = self.priceTextField.text;
    double enteredValue = enteredText.intValue;

    if (self.segmentedControl.selectedSegmentIndex == 0)
    {
        double result = enteredValue * self.caTax;
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", result];
    }
    else if (self.segmentedControl.selectedSegmentIndex == 1)
    {
        double result = enteredValue * self.chiTax;
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", result];
    }
    else
    {
        double result = enteredValue * self.nyTax;
        self.resultLabel.text = [NSString stringWithFormat:@"%.2f", result];
    }

}


@end
