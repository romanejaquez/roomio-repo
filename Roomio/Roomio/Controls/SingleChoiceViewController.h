//
//  SingleChoiceViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChoiceModel.h"

@interface SingleChoiceViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *choiceLabel;
@property (nonatomic, strong) IBOutlet UIButton *choiceBtn;
@property (nonatomic) BOOL IsSelected;
@property (nonatomic) int ChoiceControlHeight;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Choice:(ChoiceModel*) model;
-(IBAction) onCheckOption:(id)sender;
@end
