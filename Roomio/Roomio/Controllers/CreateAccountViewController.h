//
//  CreateAccountViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/7/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsDismissDelegate.h"

@interface CreateAccountViewController : UIViewController<UITextFieldDelegate, OptionsDismissDelegate>

@property (nonatomic, strong) IBOutlet UITextField *usernameTxt;
@property (nonatomic, strong) IBOutlet UITextField *emailTxt;
@property (nonatomic, strong) IBOutlet UITextField *pwdTxt;
@property (nonatomic, strong) IBOutlet UIButton *createAcctBtn;

@property (nonatomic, strong) IBOutlet UIScrollView *outerScrollView;

-(IBAction) onCreateAccount:(id) sender;

@end
