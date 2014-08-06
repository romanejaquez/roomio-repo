//
//  RoomPickerViewController.m
//  Roomio
//
//  Created by Roman Jaquez on 7/22/14.
//  Copyright (c) 2014 Roman Jaquez. All rights reserved.
//

#import "RoomPickerViewController.h"
#import "Utilities.h"

@interface RoomPickerViewController ()
{
    UIImageView *currentImgView;
}
@end

@implementation RoomPickerViewController

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
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(popToBack)];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    self.navigationItem.leftBarButtonItem.tintColor=[UIColor colorWithRed:125.0/255.0 green:90.0/255.0 blue:146.0/255.0 alpha:1];
    [leftBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [Utilities GetGreenColor],  NSForegroundColorAttributeName,[UIFont fontWithName:@"Avenir" size:14], NSFontAttributeName, nil] forState:UIControlStateNormal];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(doneSelection)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    self.navigationItem.rightBarButtonItem.tintColor=[UIColor colorWithRed:125.0/255.0 green:90.0/255.0 blue:146.0/255.0 alpha:1];
    [rightBarButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [Utilities GetGreenColor],  NSForegroundColorAttributeName, [UIFont fontWithName:@"Avenir" size:14], NSFontAttributeName, nil] forState:UIControlStateNormal];
}

-(void) popToBack {
    
}

-(void) onCheckboxChecked:(id)sender {
    
    UIButton *checkbox = (UIButton*) sender;
    [checkbox setSelected:![checkbox isSelected]];
}

-(void) doneSelection {
    if (self.delegate != nil) {
        [self.delegate dismissPresentedOptions];
    }
}

-(IBAction) onSliderChange:(id)sender {
    
    UISlider *rentSlider = (UISlider*)sender;
    
    [rentSlider setValue:((int)((rentSlider.value + 2.5) / 5) * 5) animated:NO];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setMaximumFractionDigits:0];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    NSString *numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithFloat:round(rentSlider.value)]];
    self.rentAmountLabel.text = numberAsString;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) onPickImage:(id)sender {
    
    int btnTag = (int) ((UIButton*)sender).tag;
    
    switch(btnTag) {
        case 1:
            currentImgView = self.img1;
            break;
        case 2:
            currentImgView = self.img2;
            break;
        case 3:
            currentImgView = self.img3;
            break;
            
    }
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    currentImgView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

-(IBAction) onStepperChanged:(id)sender {
    
    UIStepper *stepperControl = (UIStepper*) sender;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:0];
    
    switch (stepperControl.tag) {
        case 0: // min stepper
        {
            self.minLabel.text = [formatter stringFromNumber:
                                  [NSNumber numberWithDouble:stepperControl.value]];
        }
        break;
        case 1: // max stepper
        {
            self.maxLabel.text = [formatter stringFromNumber:
                                  [NSNumber numberWithDouble:stepperControl.value]];
        }
       break;
        default:
            break;
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
