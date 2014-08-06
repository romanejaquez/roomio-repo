//
//  OptionViewCell.h
//  Roomio
//
//  Created by Roman Jaquez on 7/8/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OptionViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIButton *toggleBtn;
@property (nonatomic, weak) IBOutlet UILabel *optionLabel;

-(IBAction) onToggleBtn:(id)sender;

@end
