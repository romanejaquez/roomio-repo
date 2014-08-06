//
//  RoomEditPanelViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/23/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "RoomEditPanelViewController.h"

@interface RoomEditPanelViewController ()
{
    NSString *initialRoomName;
}
@end

@implementation RoomEditPanelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil RoomName:(NSString *)roomName
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        initialRoomName = roomName;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.roomNameLabel.text = initialRoomName;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        [self.view setAlpha:1.0];
    } completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) onDeleteRoomClick:(id)sender {
    
    if (self.delegate != nil) {
        [self.delegate deleteRoom:@"dfasd"];
    }
}

-(void) onEditRoomClick:(id)sender {
    
    if (self.delegate != nil) {
        [self.delegate editRoom:@"DFSDFDS"];
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
