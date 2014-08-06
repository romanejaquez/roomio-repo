//
//  LoginViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/9/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField *usernameTxt;
@property (nonatomic, strong) IBOutlet UITextField *pwdTxt;
@property (nonatomic, strong) IBOutlet UIButton *loginBtn;

@end
