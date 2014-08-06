//
//  HomeViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/6/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "HomeViewController.h"
#import "CreateAccountViewController.h"
#import "OptionsViewController.h"
#import "Utilities.h"
#import "LoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"
#import "SocialMediaUser.h"
#import "SocialUserViewController.h"

#import "RoomPickerViewController.h"
#import "RoomProvileViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Home";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.createAcctBtn.layer.cornerRadius = 10.0;
}

-(IBAction) onCreateAccountAction:(id)sender {
    
    CreateAccountViewController *createAccountController = [[CreateAccountViewController alloc] initWithNibName:@"CreateAccountView" bundle:nil];
    
    self.navigationController.navigationBar.tintColor = [Utilities GetGreenColor];
    [self.navigationController pushViewController:createAccountController animated:YES];
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // set the background transparent
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* delegates */
-(void) dismissPresentedOptions {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction) onSelectedSocialMediaType:(id)sender {
    
    int tag = (int) ((UIButton*) sender).tag;
    self.navigationController.navigationBar.tintColor = [Utilities GetGreenColor];
    
    switch(tag) {
        case 0: // roomio
        {
            LoginViewController *loginToRoomioController =
            [[LoginViewController alloc] initWithNibName:@"LoginView" bundle:nil];
            
            [self.navigationController pushViewController:loginToRoomioController animated:YES];
        }
            break;
        case 1: // facebook
        {
            if (FBSession.activeSession.state == FBSessionStateOpen || FBSession.activeSession.state == FBSessionStateOpenTokenExtended) {
                
                [self retrieveFacebookUserInfo];
            }
            else {
                [self performSocialLogin];
            }
        }
            break;
        case 2: // twitter
        {
            RoomProvileViewController *roomProfileView = [[RoomProvileViewController alloc] initWithNibName:@"RoomProfileView" bundle:nil];
            
            [self.navigationController pushViewController:roomProfileView animated:YES];

        }
            break;
        case 3: // google +
            break;
        case 4: // linked in
            break;
    }
}

-(void) performSocialLogin {
    
    [FBSession openActiveSessionWithReadPermissions:@[@"public_profile"] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState status, NSError *error) {
        AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        [appDelegate sessionStateChanged:session state:status error:error];
        
        [self retrieveFacebookUserInfo];
    }];

}

-(void) retrieveFacebookUserInfo {
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // Success! Include your code to handle the results here
            NSLog(@"user info: %@", result);
            
            NSString *username = [result objectForKey:@"name"];
            NSString *bio = [result objectForKey:@"bio"];
            NSString *gender = [result objectForKey:@"gender"];
            
            /*NSString *userInfo = [NSString stringWithFormat:@"Name: %@, Bio: %@, Gender: %@", username, bio, gender];*/
            
            NSString *facebookProfilePath = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", (NSString*)[result objectForKey:@"id"]];
            
            SocialMediaUser *user = [[SocialMediaUser alloc] init];
            user.Name = username;
            user.Bio = bio;
            user.Gender = gender;
            user.ImageData = facebookProfilePath;
            
            SocialUserViewController *socialUserViewController =
            [[SocialUserViewController alloc] initWithNibName:@"SocialUserView" bundle:nil User:user];
            
            [self.navigationController pushViewController:socialUserViewController animated:YES];
            
            /*UIAlertView *userAlert = [[UIAlertView alloc] initWithTitle:@"Facebook User Info" message:userInfo delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
             
             [userAlert show];*/
            
        } else {
            // An error occurred, we need to handle the error
            // See: https://developers.facebook.com/docs/ios/errors
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
