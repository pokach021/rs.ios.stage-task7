//
//  RSViewController.m
//  ios.stage-task
//
//  Created by Andrew Pokachailo on 7/1/21.
//

#import "RSViewController.h"

#define UIColorFromRGB(rgbValue, alph) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha: alph]



@interface RSViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *autorizeButton;
@property (weak, nonatomic) IBOutlet UIView *verificationView;
@property (strong, nonatomic) UILabel *resultLabel;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    colors
    UIColor *blackCoral = UIColorFromRGB(0x4C5C68, 1.0);
    UIColor *littleBoyBlue = UIColorFromRGB(0x80A4ED, 1.0);
    
    
    // MARK: Text fields
    
    self.loginTextField.layer.borderWidth = 1.5;
    self.loginTextField.layer.cornerRadius = 5;
    self.loginTextField.layer.borderColor = blackCoral.CGColor;
    
    self.passwordTextField.layer.borderWidth = 1.5;
    self.passwordTextField.layer.cornerRadius = 5;
    self.passwordTextField.layer.borderColor = blackCoral.CGColor;
    
    // MARK: Authorize button
    
    UIImage *personImage = [UIImage imageNamed:@"person"];
    UIImage *personFillImage = [UIImage imageNamed:@"person-fill"];
    
    [self.autorizeButton setImage:personImage forState:UIControlStateNormal];
    [self.autorizeButton setImage:personFillImage forState:UIControlStateHighlighted];
    
    self.autorizeButton.layer.borderWidth = 2;
    self.autorizeButton.layer.cornerRadius = 10;
    self.autorizeButton.layer.borderColor = littleBoyBlue.CGColor;
    [self.autorizeButton addTarget:self action:@selector(autorizeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    // MARK: Verification view
    
    [self.view addSubview:self.verificationView];
    self.verificationView.hidden = YES;
    self.verificationView.layer.borderWidth = 2;
    self.verificationView.layer.borderColor = UIColor.whiteColor.CGColor;
    self.verificationView.layer.cornerRadius = 10;
    
    //    Result label
    UIFont *labelFont = [UIFont fontWithName:@"SF Pro Text Semibold" size:18];
    self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(93, 15, 50, 18)];
    self.resultLabel.font = labelFont;
    self.resultLabel.textAlignment = NSTextAlignmentCenter;
    self.resultLabel.text = @"";
    
    //    Buttons
    UIFont *buttonFont = [UIFont fontWithName:@"SF Pro Text Semibold" size:24];
    
    //    Button one
    UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonOne.frame = CGRectMake(23, 45, 50, 50);
    buttonOne.layer.cornerRadius = 50 / 2;
    buttonOne.layer.borderWidth = 1.5;
    buttonOne.layer.borderColor = littleBoyBlue.CGColor;
    buttonOne.titleLabel.font = buttonFont;
    [buttonOne setTitle:@"1" forState:UIControlStateNormal];
    [buttonOne setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [buttonOne addTarget:self action:@selector(verificationButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    //    Button two
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonTwo.frame = CGRectMake(93, 45, 50, 50);
    buttonTwo.layer.cornerRadius = 50 / 2;
    buttonTwo.layer.borderWidth = 1.5;
    buttonTwo.layer.borderColor = littleBoyBlue.CGColor;
    buttonTwo.titleLabel.font = buttonFont;
    [buttonTwo setTitle:@"2" forState:UIControlStateNormal];
    [buttonTwo setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [buttonTwo addTarget:self action:@selector(verificationButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    //    Button three
    UIButton *buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonThree.frame = CGRectMake(163, 45, 50, 50);
    buttonThree.layer.cornerRadius = 50 / 2;
    buttonThree.layer.borderWidth = 1.5;
    buttonThree.layer.borderColor = littleBoyBlue.CGColor;
    buttonThree.titleLabel.font = buttonFont;
    [buttonThree setTitle:@"3" forState:UIControlStateNormal];
    [buttonThree setTitleColor:littleBoyBlue forState:UIControlStateNormal];
    [buttonThree addTarget:self action:@selector(verificationButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.verificationView addSubview:buttonOne];
    [self.verificationView addSubview:buttonTwo];
    [self.verificationView addSubview:buttonThree];
    [self.verificationView addSubview:self.resultLabel];
    [self.verificationView bringSubviewToFront:buttonOne];
    [self.verificationView bringSubviewToFront:buttonTwo];
    [self.verificationView bringSubviewToFront:buttonThree];
    [self.verificationView bringSubviewToFront:self.resultLabel];
    
    //    hiding keyboard
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    UIGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];

}

// MARK: Methods

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (void)autorizeButtonTapped:(UIButton *)sender {
    NSString *login = self.loginTextField.text;
    NSString *password = self.passwordTextField.text;
    UIColor *venetianRed = UIColorFromRGB(0xC20114, 1.0);
    UIColor *turquoiseGreen = UIColorFromRGB(0x91C7B1, 1);
    UIColor *turquoiseGreenDis = UIColorFromRGB(0x91C7B1, 0.5);
    
    if ([login  isEqual: @"username"]) {
        self.loginTextField.layer.borderColor = turquoiseGreen.CGColor;
    } else {
        self.loginTextField.layer.borderColor = venetianRed.CGColor;
    }
    if ([password isEqual:@"password"]) {
        self.passwordTextField.layer.borderColor = turquoiseGreen.CGColor;
    } else {
        self.passwordTextField.layer.borderColor = venetianRed.CGColor;
    }
    
    if ([login  isEqual: @"username"] & [password isEqual:@"password"])   {
        self.loginTextField.layer.borderColor = turquoiseGreenDis.CGColor;
        self.passwordTextField.layer.borderColor = turquoiseGreenDis.CGColor;
        self.verificationView.hidden = NO;
        self.autorizeButton.enabled = NO;
        self.loginTextField.enabled = NO;
        self.passwordTextField.enabled = NO;
    }
}

- (void) verificationButtonTap:(UIButton*) sender {
    self.verificationView.layer.borderColor = UIColor.whiteColor.CGColor;
    self.resultLabel.text = [NSString stringWithFormat:@"%@%@", self.resultLabel.text, sender.titleLabel.text];
    
    UIColor *turquoiseGreen = UIColorFromRGB(0x91C7B1, 1.0);
    UIColor *venetianRed = UIColorFromRGB(0xC20114, 1.0);
    UIColor *blackCoral = UIColorFromRGB(0x4C5C68, 1.0);
    
    if (self.resultLabel.text.length == 3) {
        if ([self.resultLabel.text isEqual:@"132"]) {
            self.verificationView.layer.borderColor = turquoiseGreen.CGColor;
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome" message:@"You are successfuly authorized!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                self.loginTextField.text = @"";
                self.loginTextField.layer.borderColor = blackCoral.CGColor;
                self.passwordTextField.text = @"";
                self.passwordTextField.layer.borderColor = blackCoral.CGColor;
                self.verificationView.hidden = YES;
                self.autorizeButton.enabled = YES;
                self.loginTextField.enabled = YES;
                self.passwordTextField.enabled = YES;
                self.verificationView.layer.borderColor = UIColor.whiteColor.CGColor;
                self.resultLabel.text = @"";
            }];
            [alert.view setTintColor:UIColor.redColor];
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        } else {
            self.verificationView.layer.borderColor = venetianRed.CGColor;
            self.resultLabel.text = @"-";
        }
    }
    if ([self.resultLabel.text  isEqual:@"-"]) {
        self.resultLabel.text = @"";
    }
}

// MARK: - Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    UIColor *blackCoral = UIColorFromRGB(0x4C5C68, 1.0);
    textField.layer.borderColor = blackCoral.CGColor;
}




@end
