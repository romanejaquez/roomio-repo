//
//  CompatibilityQuestionViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "CompatibilityQuestionViewController.h"
#import "QuestionModel.h"
#import "ChoiceModel.h"
#import "QuestionChoicesViewController.h"
#import "Utilities.h"

@interface CompatibilityQuestionViewController ()
{
    NSMutableArray *compQuestions;
    NSMutableArray *choiceControllers;
    NSMutableArray *allquestionsControllers;
    int currentPage;
}
@end

@implementation CompatibilityQuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    currentPage = 0;
    
    NSURL *questionsUrl = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/6984734/questions.json"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:questionsUrl];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // parse data here
        NSError *jsonError;
        NSArray *questions = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
        
        if (questions) {
            
            compQuestions = [[NSMutableArray alloc] initWithCapacity:questions.count];
            
            for (int i = 0; i < questions.count; i++) {
                NSDictionary *jsonQuestion = (NSDictionary*) [questions objectAtIndex:i];
                
                QuestionModel *singleQuestion = [[QuestionModel alloc] init];
                singleQuestion.Id = [NSString stringWithFormat:@"%@", [jsonQuestion objectForKey:@"Id"]].intValue;
                singleQuestion.Title = [jsonQuestion objectForKey:@"Title"];
                singleQuestion.Type = [Utilities GetChoiceTypeFromString:[jsonQuestion objectForKey:@"Type"]];
                
                NSArray *choices = [jsonQuestion objectForKey:@"Options"];
                
                if (choices) {
                    
                    singleQuestion.Choices = [[NSMutableArray alloc] initWithCapacity:choices.count];
                    choiceControllers = [[NSMutableArray alloc] initWithCapacity:choices.count];
                    
                    for (int c = 0; c < choices.count; c++) {
                        
                        NSDictionary *jsonChoice = (NSDictionary*) [choices objectAtIndex:c];
                        ChoiceModel *choice = [[ChoiceModel alloc] init];
                        choice.Id = [NSString stringWithFormat:@"%@", [jsonChoice objectForKey:@"Id"]].intValue;
                        choice.Title = [jsonChoice objectForKey:@"Title"];
                        
                        [singleQuestion.Choices addObject:choice];
                    }
                }
                
                // add all questions
                [compQuestions addObject:singleQuestion];
            }
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self processQuestions];
            });
        }
    }];
}

-(void) processQuestions {
    
    if (compQuestions != nil && compQuestions.count > 0) {
        
        allquestionsControllers = [[NSMutableArray alloc] initWithCapacity:compQuestions.count];
        self.choicesContainer.contentInset = UIEdgeInsetsZero;
        self.choicesContainer.contentSize = CGSizeMake(self.choicesContainer.frame.size.width, self.choicesContainer.frame.size.height);
        
        CGFloat questionOffset = 0.0;
        
        for(QuestionModel *question in compQuestions) {
            
            QuestionChoicesViewController *questionChoices = [[QuestionChoicesViewController alloc] initWithNibName:@"QuestionChoicesView" bundle:nil Question:question];
            
            questionChoices.delegate = self;
            
            // hold on to the question choices view controller
            [allquestionsControllers addObject:questionChoices];
            
            // add every question panel to the scrollview
            [self.choicesContainer addSubview:questionChoices.view];
            
            CGFloat questionChoiceViewWidth = questionChoices.view.frame.size.width;
            questionChoices.view.frame = CGRectMake(questionOffset, 0.0, questionChoiceViewWidth, questionChoices.view.frame.size.height);
            
            // increment the offset by each question panel's width
            questionOffset += questionChoiceViewWidth;
        }
        
        // change the content size of the scroll; the cummulative size of all question panels together,
        // placed horizontally (questionOffset)
        self.choicesContainer.contentSize = CGSizeMake(questionOffset, self.choicesContainer.frame.size.height);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) questionCompleted:(BOOL)isQuestionValid {
    
    [self.nextBtn setEnabled:isQuestionValid];
}

-(IBAction) onNextPage:(id)sender {
    
    currentPage++;
    
    CGRect frame;
    frame.origin.x = self.choicesContainer.frame.size.width * currentPage;
    frame.origin.y = 0.0;
    frame.size = self.choicesContainer.frame.size;
    [self.choicesContainer scrollRectToVisible:frame animated:YES];
    
    [self.nextBtn setEnabled:NO];
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
