//
//  SocialUserViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/17/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocialMediaUser.h"

@interface SocialUserViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel *bioLabel;
@property (nonatomic, strong) IBOutlet UIImageView *pic;
@property (nonatomic, strong) IBOutlet UILabel *genderLabel;
@property (nonatomic, strong) IBOutlet UIButton *createProfileBtn;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil User:(SocialMediaUser*)user;
-(IBAction) onCreateProfile:(id)sender;
@end
