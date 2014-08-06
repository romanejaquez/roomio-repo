//
//  CompatibilityQuestionViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Enums.h"
#import "QuestionCompletedDelegate.h"

@interface CompatibilityQuestionViewController : UIViewController<QuestionCompletedDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *choicesContainer;
@property (nonatomic, strong) IBOutlet UIButton *nextBtn;

-(IBAction) onNextPage:(id)sender;
@end
