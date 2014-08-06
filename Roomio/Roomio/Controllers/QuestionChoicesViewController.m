//
//  QuestionChoicesViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "QuestionChoicesViewController.h"
#import "RadioButtonChoiceViewController.h"
#import "CheckboxChoiceViewController.h"


@interface QuestionChoicesViewController ()
{
    QuestionModel *currentQuestion;
    NSMutableArray *choicesControllers;
}
@end

@implementation QuestionChoicesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Question:(QuestionModel*) question
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        currentQuestion = question;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.questionTitle.text = currentQuestion.Title;
    
    if (currentQuestion.Choices != nil && currentQuestion.Choices.count > 0) {
        
        switch(currentQuestion.Type) {
            case YesNo:
            {
                int choiceOffset = 0;
                choicesControllers = [[NSMutableArray alloc] initWithCapacity:currentQuestion.Choices.count];
                
                for(ChoiceModel *currentChoice in currentQuestion.Choices){
                    
                    RadioButtonChoiceViewController *radioBtnChoice = [[RadioButtonChoiceViewController alloc] initWithNibName:@"RadioChoiceView" bundle:nil Choice:currentChoice];
                    
                    radioBtnChoice.delegate = self;
                    [choicesControllers addObject:radioBtnChoice];
                    
                    [self.choicesContainer addSubview:radioBtnChoice.view];
                    
                    radioBtnChoice.view.frame = CGRectMake(0, choiceOffset, radioBtnChoice.view.frame.size.width, radioBtnChoice.view.frame.size.height);
                    choiceOffset += radioBtnChoice.view.frame.size.height;
                }
            }
                break;
            case MultipleChoice:
            {
                int choiceOffset = 0;
                choicesControllers = [[NSMutableArray alloc] initWithCapacity:currentQuestion.Choices.count];
                
                for(ChoiceModel *currentChoice in currentQuestion.Choices){
                    
                    CheckboxChoiceViewController *ckBtnChoice = [[CheckboxChoiceViewController alloc] initWithNibName:@"CheckboxChoiceView" bundle:nil Choice:currentChoice];
                    
                    ckBtnChoice.delegate = self;
                    [choicesControllers addObject:ckBtnChoice];
                    
                    [self.choicesContainer addSubview:ckBtnChoice.view];
                    
                    ckBtnChoice.view.frame = CGRectMake(0, choiceOffset, ckBtnChoice.view.frame.size.width, ckBtnChoice.view.frame.size.height);
                    choiceOffset += ckBtnChoice.view.frame.size.height;
                }
            }
                break;
            case SingleChoice:
            {
                int choiceOffset = 0;
                choicesControllers = [[NSMutableArray alloc] initWithCapacity:currentQuestion.Choices.count];
                
                for(ChoiceModel *currentChoice in currentQuestion.Choices){
                    
                    RadioButtonChoiceViewController *radioBtnChoice = [[RadioButtonChoiceViewController alloc] initWithNibName:@"RadioChoiceView" bundle:nil Choice:currentChoice];
                    
                    radioBtnChoice.delegate = self;
                    [choicesControllers addObject:radioBtnChoice];
                    
                    [self.choicesContainer addSubview:radioBtnChoice.view];
                    
                    radioBtnChoice.view.frame = CGRectMake(0, choiceOffset, radioBtnChoice.view.frame.size.width, radioBtnChoice.view.frame.size.height);
                    choiceOffset += radioBtnChoice.view.frame.size.height;
                }
            }
            break;
        }
    }
}

-(void) onChoiceSelected:(int) selectedOptionId {
    
    BOOL isSelected = true;
    
    if (currentQuestion.Type == YesNo || currentQuestion.Type == SingleChoice) {
        
        for(RadioButtonChoiceViewController *radioBtn in choicesControllers) {
            
            [radioBtn checkButton:(radioBtn.Model.Id == selectedOptionId)];
        }
    }
    else {
        
        isSelected = false;
        
        for(BaseChoiceViewController *baseChoice in choicesControllers) {
            
            if (baseChoice.IsChecked) {
                isSelected = true;
                break;
            }
        }
    }
    
    if (self.delegate != nil) {
        [self.delegate questionCompleted:isSelected];
    }
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
