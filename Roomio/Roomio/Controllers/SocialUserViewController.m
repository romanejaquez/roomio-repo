//
//  SocialUserViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/17/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "SocialUserViewController.h"
#import "CompatibilityQuestionViewController.h"

@interface SocialUserViewController ()
{
    SocialMediaUser *currentUser;
}

@end

@implementation SocialUserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil User:(SocialMediaUser*)user;
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        currentUser = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.createProfileBtn.layer.cornerRadius = 10.0;
    
    // populate user
    self.nameLabel.text = currentUser.Name;
    self.genderLabel.text = currentUser.Gender;
    self.bioLabel.text = currentUser.Bio;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:currentUser.ImageData]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            self.pic.image = [UIImage imageWithData:imageData];
            self.pic.layer.cornerRadius = self.pic.frame.size.height /2;
            self.pic.layer.masksToBounds = YES;
            self.pic.layer.borderWidth = 0;
        });
    });
}

-(IBAction) onCreateProfile:(id)sender {
    
    CompatibilityQuestionViewController *compVC = [[CompatibilityQuestionViewController alloc] initWithNibName:@"CompatibilityQuestionView" bundle:nil];
    
    [self.navigationController pushViewController:compVC animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
