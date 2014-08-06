//
//  RoomPickerViewController.h
//  Roomio
//
//  Created by Roman Jaquez on 7/22/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsDismissDelegate.h"

@interface RoomPickerViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) IBOutlet UIImageView *img1;
@property (nonatomic, strong) IBOutlet UIImageView *img2;
@property (nonatomic, strong) IBOutlet UIImageView *img3;

@property (nonatomic, strong) IBOutlet UIButton *btn1;
@property (nonatomic, strong) IBOutlet UIButton *btn2;
@property (nonatomic, strong) IBOutlet UIButton *btn3;

@property (nonatomic, strong) IBOutlet UIStepper *minStepper;
@property (nonatomic, strong) IBOutlet UIStepper *maxStepper;
@property (nonatomic, strong) IBOutlet UILabel *minLabel;
@property (nonatomic, strong) IBOutlet UILabel *maxLabel;

@property (nonatomic, strong) IBOutlet UIButton *checkbox1;
@property (nonatomic, strong) IBOutlet UIButton *checkbox2;
@property (nonatomic, strong) IBOutlet UIButton *checkbox3;

@property (nonatomic, strong) IBOutlet UILabel *rentAmountLabel;
@property (nonatomic, strong) IBOutlet UISlider *rentSliderChanger;
@property (nonatomic, assign) id<OptionsDismissDelegate> delegate;

-(IBAction) onPickImage:(id)sender;
-(IBAction) onSliderChange:(id)sender;
-(IBAction) onCheckboxChecked:(id)sender;

-(IBAction) onStepperChanged:(id)sender;


@end
