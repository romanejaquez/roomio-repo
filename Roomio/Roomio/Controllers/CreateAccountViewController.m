//
//  CreateAccountViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/7/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "CreateAccountViewController.h"
#import "OptionsViewController.h"

@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController

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
    
     self.usernameTxt.delegate = self;
     self.emailTxt.delegate = self;
     self.pwdTxt.delegate = self;
    
    self.createAcctBtn.layer.cornerRadius = 10.0;
    
     CGPoint scrollPoint = CGPointMake(0, 64);
     [self.outerScrollView setContentOffset:scrollPoint animated:NO];
     
     // add tapping on the view (you tap anywhere outside in the view, should dismiss the keyboard)
     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
     initWithTarget:self
     action:@selector(dismissKeyboard)];
     
     [self.view addGestureRecognizer:tap];
}

// dismisses the keyboard
-(void)dismissKeyboard {
    [self.usernameTxt resignFirstResponder];
    [self.emailTxt resignFirstResponder];
    [self.pwdTxt resignFirstResponder];
}

// when clicking on "Return" in the iPhone keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// events for interpreting when user has focus on any of the text fields
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y - 200);
    [self.outerScrollView setContentOffset:scrollPoint animated:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.outerScrollView setContentOffset:CGPointZero animated:YES];
}

-(IBAction) onCreateAccount:(id)sender {
    
     OptionsViewController *optionsCtrl = [[OptionsViewController alloc] initWithNibName:@"OptionsView" bundle:nil];
     optionsCtrl.title = @"Available Options";
     optionsCtrl.delegate = self;
     
     UINavigationController *optionsNavController =
     [[UINavigationController alloc] initWithRootViewController:optionsCtrl];
     
     [optionsNavController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor], NSFontAttributeName:[UIFont fontWithName:@"Avenir" size:16.0]}];
     
     [optionsNavController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
     optionsNavController.navigationBar.shadowImage = [UIImage new];
     optionsNavController.navigationBar.translucent = NO;
     optionsNavController.view.backgroundColor = [UIColor whiteColor]; //[UIColor clearColor];
     
     [self presentViewController:optionsNavController animated:YES completion:nil];
     [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

/* delegates */
-(void) dismissPresentedOptions {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    CGPoint scrollPoint = CGPointMake(0, 0);
    [self.outerScrollView setContentOffset:scrollPoint animated:NO];
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
