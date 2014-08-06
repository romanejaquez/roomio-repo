//
//  RoomProvileViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/23/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RoomEditPanelDelegate.h"
#import "OptionsDismissDelegate.h"

@interface RoomProvileViewController : UIViewController<RoomEditPanelDelegate, OptionsDismissDelegate>

@property (nonatomic, strong) IBOutlet UIButton *addPlusBtn;
@property (nonatomic, strong) IBOutlet UIButton *addBtnLabel;
@property (nonatomic, strong) IBOutlet UIView *roomPanelsContainer;

-(IBAction) onAddRoom:(id)sender;
@end
