//
//  DDDViewController.h
//  NSUserDefaults, Segues and Protocols Challenge
//
//  Created by DDD on 2013-11-10.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DDDViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *usernameValueLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordValueLabel;
- (IBAction)backButtonPressed:(UIButton *)sender;
@end
