//
//  HomeViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/6/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsDismissDelegate.h"

@interface HomeViewController : UIViewController<OptionsDismissDelegate>

-(IBAction) onCreateAccountAction:(id)sender;

@property (nonatomic, strong) IBOutlet UIButton *fbBtn;
@property (nonatomic, strong) IBOutlet UIButton *twBtn;
@property (nonatomic, strong) IBOutlet UIButton *gplusBtn;
@property (nonatomic, strong) IBOutlet UIButton *inBtn;
@property (nonatomic, strong) IBOutlet UIButton *rBtn;

@property (nonatomic, strong) IBOutlet UIButton *createAcctBtn;

-(IBAction) onSelectedSocialMediaType:(id)sender;

@end
