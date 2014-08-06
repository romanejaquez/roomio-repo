//
//  RoomEditPanelDelegate.h
//  Roomio
//
//  Created by Roman Jaquez on 7/23/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RoomEditPanelDelegate <NSObject>

-(void) deleteRoom:(NSString*) guidAsString;
-(void) editRoom:(NSString*) guidAsString;

@end
