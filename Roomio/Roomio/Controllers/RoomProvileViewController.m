//
//  RoomProvileViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/23/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "RoomProvileViewController.h"
#import "RoomEditPanelViewController.h"
#import "RoomPickerViewController.h"

#define ROOM_PANEL_HEIGHT 64.0
#define MAX_ROOMS_ALLOWED 5

@interface RoomProvileViewController ()
{
    NSMutableArray *addedRoomPanels;
}
@end

@implementation RoomProvileViewController

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
    
    // initializations
    addedRoomPanels = [[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) onAddRoom:(id)sender {
    
    RoomEditPanelViewController *roomPanelVC = [[RoomEditPanelViewController alloc] initWithNibName:@"RoomEditPanelView" bundle:nil
            RoomName:[NSString stringWithFormat:@"Room #%d",(int)(addedRoomPanels.count + 1)]];
    
    roomPanelVC.delegate = self;
    
    
    // add panel to container
    [self.roomPanelsContainer addSubview:roomPanelVC.view];
    
    // adjust subview in its required position
    roomPanelVC.view.frame = CGRectMake(0, (addedRoomPanels.count * ROOM_PANEL_HEIGHT), roomPanelVC.view.frame.size.width, roomPanelVC.view.frame.size.height);
    
    [addedRoomPanels addObject:roomPanelVC];
    
    if (addedRoomPanels.count == MAX_ROOMS_ALLOWED) {
        [self.addBtnLabel setEnabled:NO];
        [self.addPlusBtn setEnabled:NO];
    }
}

-(void) adjustRoomPanelsInContainer {
    
    CGFloat shiftedYOffset = 0.0;
    
    for(RoomEditPanelViewController *roomPanel in addedRoomPanels) {
        
        // adjust subview in its required position
        roomPanel.view.frame = CGRectMake(0, (shiftedYOffset * ROOM_PANEL_HEIGHT),
                                          roomPanel.view.frame.size.width, roomPanel.view.frame.size.height);
        
        shiftedYOffset++;
    }
}

-(void) editRoom:(NSString *)guidAsString {
    
    RoomPickerViewController *roomPicker = [[RoomPickerViewController alloc] initWithNibName:@"RoomPickerView" bundle:nil];
     roomPicker.title = @"Room #1 - Options";
     roomPicker.delegate = self;
     
     UINavigationController *optionsNavController =
     [[UINavigationController alloc] initWithRootViewController:roomPicker];
    
    [optionsNavController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor], NSFontAttributeName:[UIFont fontWithName:@"Avenir" size:16.0]}];
    
    [optionsNavController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    optionsNavController.navigationBar.shadowImage = [UIImage new];
    optionsNavController.navigationBar.translucent = NO;
    optionsNavController.view.backgroundColor = [UIColor whiteColor];
    
    [self presentViewController:optionsNavController animated:YES completion:nil];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

-(void) deleteRoom:(NSString *)guidAsString {
    
    UIAlertView *alertMsg = [[UIAlertView alloc] initWithTitle:@"Delete Room" message:@"Are you sure you want to delete this room?" delegate:nil cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    
    [alertMsg show];
}

-(void) dismissPresentedOptions {
    [self dismissViewControllerAnimated:YES completion:nil];
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
