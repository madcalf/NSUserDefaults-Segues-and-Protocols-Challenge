//
//  DDDCreateAccountViewController.h
//  NSUserDefaults, Segues and Protocols Challenge
//
//  Created by DDD on 2013-11-10.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <UIKit/UIKit.h>

#define USER_NAME @"USER_NAME"
#define USER_PASSWORD @"PASSWORD"

@protocol DDDCreateAccountViewControllerDelegate<NSObject>

@required
-(void)didCreateAccount;
-(void)didCancel;

@end


@interface DDDCreateAccountViewController : UIViewController

@property (weak, nonatomic) id<DDDCreateAccountViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)createAccountButtonPressed:(UIButton *)sender;

@end
