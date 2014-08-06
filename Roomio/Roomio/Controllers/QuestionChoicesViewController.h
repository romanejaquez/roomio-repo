//
//  QuestionChoicesViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Enums.h"
#import "ChoiceModel.h"
#import "QuestionModel.h"
#import "ChoiceSelectedDelegate.h"
#import "QuestionCompletedDelegate.h"

@interface QuestionChoicesViewController : UIViewController<ChoiceSelectedDelegate>

@property (nonatomic, strong) IBOutlet UILabel *questionTitle;
@property (nonatomic, strong) IBOutlet UIView *choicesContainer;
@property (nonatomic, assign) id<QuestionCompletedDelegate> delegate;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Question:(QuestionModel*) question;
@end
