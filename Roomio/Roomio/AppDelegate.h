//
//  AppDelegate.h
//  Roomio
//
//  Created by Roman Jaquez on 7/6/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "Utilities.h"
#import <KinveyKit/KinveyKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) HomeViewController *viewController;

-(void) sessionStateChanged:(FBSession*) session state:(FBSessionState)state error:(NSError*) error;

@end
