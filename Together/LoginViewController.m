//
//  LoginViewController.m
//  Together
//
//  Created by Isaac Rosenberg on 6/8/15.
//  Copyright (c) 2015 irosenb. All rights reserved.
//

#import "LoginViewController.h"
#import <OAuthiOS/OAuthiOS.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Parse/Parse.h>
#import "ViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([FBSDKAccessToken currentAccessToken]) {
        ViewController *controller = [[ViewController alloc] init];
        [self presentViewController:controller animated:YES completion:nil];
    }
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    loginButton.delegate = self; 
    [self.view addSubview:loginButton];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)buttonTapped:(id)sender {
    
}

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    PFObject *user = [PFObject objectWithClassName:@"User"];
    user[@"token"] = result.token;
    user[@"email"];
    
    ViewController *controller = [[ViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
