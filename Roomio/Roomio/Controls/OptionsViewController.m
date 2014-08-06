//
//  OptionsViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/8/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "OptionsViewController.h"
#import "OptionViewCell.h"
#import "Utilities.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
        self.title = @"Available Options";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(popToBack)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor colorWithRed:125.0/255.0 green:90.0/255.0 blue:146.0/255.0 alpha:1];
    [leftBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [Utilities GetGreenColor],  NSForegroundColorAttributeName,[UIFont fontWithName:@"Avenir" size:14], NSFontAttributeName, nil] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneSelection)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor colorWithRed:125.0/255.0 green:90.0/255.0 blue:146.0/255.0 alpha:1];
    [rightBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [Utilities GetGreenColor],  NSForegroundColorAttributeName, [UIFont fontWithName:@"Avenir" size:14], NSFontAttributeName, nil] forState:UIControlStateNormal];

    
    self.optionsCollection = @[@"Bathroom", @"Balcony", @"Grill", @"Pool", @"Garage"];
    
    [self.optionsTable registerNib:[UINib nibWithNibName:@"OptionViewCell" bundle:nil] forCellReuseIdentifier:@"OptionCell"];
}

-(void) popToBack {
    if (self.delegate != nil) {
        [self.delegate dismissPresentedOptions];
    }
}

-(void) doneSelection {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.optionsCollection.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* cellIdentifier = @"OptionCell";
    
    OptionViewCell *cell = (OptionViewCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (cell != nil) {
        cell.optionLabel.text = (NSString*)[self.optionsCollection objectAtIndex:indexPath.row];
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
