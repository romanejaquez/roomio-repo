//
//  BaseChoiceViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/18/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "BaseChoiceViewController.h"

@interface BaseChoiceViewController ()
{
    ChoiceModel *currentChoice;
}
@end

@implementation BaseChoiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil Choice:(ChoiceModel *)choice
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.Model = choice;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.choiceLabel.text = self.Model.Title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) onCheckedOption:(id)sender {
    
    self.IsChecked = !self.IsChecked;
    
    [self.choiceBtn setSelected:self.IsChecked];
    
    if (self.delegate != nil) {
        [self.delegate onChoiceSelected:self.Model.Id];
    }
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
