//
//  RoomEditPanelViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/23/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomEditPanelDelegate.h"

@interface RoomEditPanelViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *roomNameLabel;
@property (nonatomic, strong) IBOutlet UIButton *editRoomBtn;
@property (nonatomic, strong) IBOutlet UIButton *deleteRoomBtn;
@property (nonatomic, assign) id<RoomEditPanelDelegate> delegate;

-(IBAction) onEditRoomClick:(id)sender;
-(IBAction) onDeleteRoomClick:(id)sender;

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil RoomName:(NSString*)roomName;

@end
