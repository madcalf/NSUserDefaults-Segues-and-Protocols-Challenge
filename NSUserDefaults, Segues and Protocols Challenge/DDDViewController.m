//
//  DDDViewController.m
//  NSUserDefaults, Segues and Protocols Challenge
//
//  Created by DDD on 2013-11-10.
//  Copyright (c) 2013 DDD. All rights reserved.
//

#import "DDDViewController.h"
#import "DDDCreateAccountViewController.h"

@interface DDDViewController ()

@end

@implementation DDDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // use currentAccount to load data from NSUserDefaults and display here
    // do we really need to read it from defaults. Can't we just pass it in from the loginVC once it's verified?
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.usernameValueLabel.text = [defaults objectForKey:USER_NAME];
    self.passwordValueLabel.text = [defaults objectForKey:USER_PASSWORD];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(UIButton *)sender {
    // dismiss this view. Calling it from here will still cause whoever created it to dismiss it, according to the docs.
    // NOTE: This is a hack. Not the best way to do this cuz if we return to the source controller, we'd really would want that controller to know when we return so it can do any reloading or resetting of values. That doesn't happen if we just dismiss here without any back talk to the other controller.
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
