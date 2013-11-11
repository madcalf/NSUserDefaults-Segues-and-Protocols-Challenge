//
//  DDDSignInViewController.h
//  NSUserDefaults, Segues and Protocols Challenge
//
//  Created by DDD on 2013-11-10.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDDCreateAccountViewController.h"

@interface DDDSignInViewController : UIViewController <DDDCreateAccountViewControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginButtonPressed:(UIButton *)sender;
- (IBAction)createAccountBarButtonItemPressed:(UIBarButtonItem *)sender;
@end
