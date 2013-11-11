//
//  DDDSignInViewController.m
//  NSUserDefaults, Segues and Protocols Challenge
//
//  Created by DDD on 2013-11-10.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDDSignInViewController.h"
#import "DDDViewController.h"
#import "DDDCreateAccountViewController.h"

@interface DDDSignInViewController ()

@end

@implementation DDDSignInViewController

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
    
    // clear any values aready in these fields
    self.usernameTextField.text = @"";
    self.passwordTextField.text = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"[SignInVC prepareForSegue]");
    if ([segue.destinationViewController isKindOfClass:[DDDCreateAccountViewController class]]) {
        DDDCreateAccountViewController *controller = segue.destinationViewController;
        controller.delegate = self;
    }
}

#pragma mark - interaction

- (IBAction)loginButtonPressed:(UIButton *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *storedUsername = [defaults objectForKey:USER_NAME];
    NSString *storedPassword = [defaults objectForKey:USER_PASSWORD];
    
    // verify entered data against stored data
    if ([self.usernameTextField.text isEqualToString:storedUsername] && [self.passwordTextField.text isEqualToString:storedPassword]) {
        // segue to ViewController
        [self performSegueWithIdentifier:@"toViewController" sender:sender];
    } else {
        NSString *errorMessage = @"Login Failed. Invalid username or password!";
        NSLog(@"%@", errorMessage);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:errorMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction)createAccountBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
}

#pragma mark - DDDCreateAccountViewControllerDelegate
-(void)didCreateAccount {
    NSLog(@"[DDDCreateAccountVC didCreateAccount]");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCancel {
    NSLog(@"[DDDCreateAccountVC didCancel]");
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
