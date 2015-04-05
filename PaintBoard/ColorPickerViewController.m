//
//  ColorPickerViewController.m
//  PaintBoard
//
//  Created by Changkun Zhao on 4/3/15.
//  Copyright (c) 2015 Changkun Zhao. All rights reserved.
//

#import "ColorPickerViewController.h"
#import "FCColorPickerViewController.h"



@interface ColorPickerViewController ()<FCColorPickerViewControllerDelegate>

@property (nonatomic, copy) UIColor *color;

@end

@implementation ColorPickerViewController

- (void)viewDidLoad {
  
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickColor:(id)sender {
    FCColorPickerViewController *colorPicker = [FCColorPickerViewController colorPickerWithColor:self.color
                                                                                        delegate:self];
    colorPicker.tintColor = [UIColor whiteColor];
    [colorPicker setModalPresentationStyle:UIModalPresentationFormSheet];
    [self presentViewController:colorPicker
                       animated:YES
                     completion:nil];

    }

- (void)colorPickerViewController:(FCColorPickerViewController *)colorPicker
                   didSelectColor:(UIColor *)color
{
    self.color = color;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)colorPickerViewControllerDidCancel:(FCColorPickerViewController *)colorPicker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setColor:(UIColor *)color
{
    _color = [color copy];
    [self.view setBackgroundColor:_color];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
