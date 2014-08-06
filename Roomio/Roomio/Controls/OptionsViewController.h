//
//  OptionsViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/8/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsDismissDelegate.h"

@interface OptionsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *optionsTable;
@property (nonatomic, strong) NSArray *optionsCollection;
@property (nonatomic, assign) id<OptionsDismissDelegate> delegate;

@end
