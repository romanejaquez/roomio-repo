//
//  BaseChoiceViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChoiceModel.h"
#import "ChoiceSelectedDelegate.h"

@interface BaseChoiceViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *choiceBtn;
@property (nonatomic, strong) IBOutlet UILabel *choiceLabel;
@property (nonatomic, assign) id<ChoiceSelectedDelegate> delegate;
@property (nonatomic) BOOL IsChecked;
@property (nonatomic, strong) ChoiceModel *Model;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Choice:(ChoiceModel*) choice;

@end
