//
//  RSViewController.m
//  ios.stage-task
//
//  Created by Andrew Pokachailo on 7/1/21.
//

#import "RSViewController.h"

@interface RSViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *autorizeButton;
@property (weak, nonatomic) IBOutlet UIView *verificationView;

@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
        
    
    //    text fields
    enum textFieldsStatements {active, error, success};
    
    self.loginTextField.layer.borderWidth = 1.5;
    self.loginTextField.layer.cornerRadius = 5;
    
    
    
    self.passwordTextField.layer.borderWidth = 1.5;
    self.passwordTextField.layer.cornerRadius = 5;
    
    
    //    autorize button
    self.autorizeButton.layer.borderWidth = 2;
    self.autorizeButton.layer.cornerRadius = 10;
    [self.autorizeButton addTarget:self action:@selector(autorizeButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // verification view
    
   
    [self.view addSubview:self.verificationView];
    self.verificationView.layer.borderWidth = 2;
    self.verificationView.layer.borderColor = UIColor.blackColor.CGColor;
    self.verificationView.layer.cornerRadius = 10;
    
    UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(93, 15, 50, 10)];
    
    
    UIFont *buttonFont = [UIFont fontWithName:@"SF Pro Text Semibold" size:24];
    
    UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonOne.frame = CGRectMake(23, 45, 50, 50);
    buttonOne.layer.cornerRadius = 50 / 2;
    buttonOne.layer.borderWidth = 1.5;
    buttonOne.layer.borderColor = UIColor.blueColor.CGColor;
    buttonOne.titleLabel.font = buttonFont;
    [buttonOne setTitle:@"1" forState:UIControlStateNormal];
    [buttonOne setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonTwo.frame = CGRectMake(93, 45, 50, 50);
    buttonTwo.layer.cornerRadius = 50 / 2;
    buttonTwo.layer.borderWidth = 1.5;
    buttonTwo.layer.borderColor = UIColor.blueColor.CGColor;
    [buttonTwo setTitle:@"2" forState:UIControlStateNormal];
    [buttonTwo setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    
    UIButton *buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonThree.frame = CGRectMake(163, 45, 50, 50);
    buttonThree.layer.cornerRadius = 50 / 2;
    buttonThree.layer.borderWidth = 1.5;
    buttonThree.layer.borderColor = UIColor.blueColor.CGColor;
    [buttonThree setTitle:@"3" forState:UIControlStateNormal];
    [buttonThree setTitleColor:UIColor.blueColor forState:UIControlStateNormal];

    [self.verificationView addSubview:buttonOne];
    [self.verificationView addSubview:buttonTwo];
    [self.verificationView addSubview:buttonThree];
    [self.verificationView addSubview:resultLabel];
    [self.verificationView bringSubviewToFront:buttonOne];
    [self.verificationView bringSubviewToFront:buttonTwo];
    [self.verificationView bringSubviewToFront:buttonThree];
    [self.verificationView bringSubviewToFront:resultLabel];
    
    
    
    
    
    //    hiding keyboard
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    UIGestureRecognizer *tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
    
    
    
}

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (void)autorizeButtonTapped:(UIButton *)sender {
    NSString *login = self.loginTextField.text;
    NSString *password = self.passwordTextField.text;
    
    if ([login  isEqual: @"username"]) {
        self.loginTextField.layer.borderColor = UIColor.greenColor.CGColor;
    } else {
        self.loginTextField.layer.borderColor = UIColor.redColor.CGColor;
    }
    
    if ([password isEqual:@"password"]) {
        self.passwordTextField.layer.borderColor = UIColor.greenColor.CGColor;
    } else {
        self.passwordTextField.layer.borderColor = UIColor.redColor.CGColor;
    }
    NSLog(@"Save tapped");
}

- (void)autorizeButtonDissabled:(UIButton *)sender {
    
}

// MARK: - Delegates

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}





@end
