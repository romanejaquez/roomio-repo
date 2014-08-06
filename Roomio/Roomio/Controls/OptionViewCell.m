//
//  OptionViewCell.m
//  Roomio
//
//  Created by Roman Jaquez on 7/8/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "OptionViewCell.h"

@implementation OptionViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

-(IBAction) onToggleBtn:(id)sender {
    UIButton *btn = (UIButton*) sender;
    
    [btn setSelected:![btn isSelected]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
