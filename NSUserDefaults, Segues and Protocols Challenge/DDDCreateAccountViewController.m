//
//  DDDCreateAccountViewController.m
//  NSUserDefaults, Segues and Protocols Challenge
//
//  Created by DDD on 2013-11-10.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDDCreateAccountViewController.h"

@interface DDDCreateAccountViewController ()

@end

@implementation DDDCreateAccountViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)createAccountButtonPressed:(UIButton *)sender {
    // verify the account information entered
    NSString *username = self.usernameTextField.text;
    //    BOOL usernameIsValid = (username && username.length > 0);
    BOOL usernameIsValid = ![username isEqualToString: @""];
    BOOL passwordsMatch = [self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text];
    
    // Set this up so we get specific messages for each problem
    NSString *errorMessage;
    if (usernameIsValid) {
        if (passwordsMatch) {
            // save data it to disk via NSUserDefaults. Don't send it back to the delegate
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:self.usernameTextField.text forKey:USER_NAME];
            [defaults setObject:self.passwordTextField.text forKey:USER_PASSWORD];
            [defaults synchronize];
            [self.delegate didCreateAccount];

        } else {
            errorMessage = @"Passwords don't match";
        }
    } else {
        errorMessage = @"Please enter a username!";
    }
    
    // NOTE the above doesn't account for empty password field. Fix that!
    // display the alert
    if ([errorMessage length] !=0) {
        NSLog(@"%@",errorMessage);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }

}

@end
