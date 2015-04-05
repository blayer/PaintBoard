//
//  MainSelectionViewController.m
//  PaintBoard
//
//  Created by Changkun Zhao on 4/2/15.
//  Copyright (c) 2015 Changkun Zhao. All rights reserved.
//

#import "MainSelectionViewController.h"
#import "DrawPageViewController.h"
#import "ActivityHub.h"
#import "PBColors.h"


@interface MainSelectionViewController ()
@property UIImage *backgroundImage;


@end

@implementation MainSelectionViewController

- (void)viewDidLoad {
    [self.loadImageButton.layer setMasksToBounds:YES];
    [self.loadImageButton.layer setCornerRadius:80.0f];
    [self.emptyImageButton.layer setMasksToBounds:YES];
    [self.emptyImageButton.layer setCornerRadius:80.0f];
    
    [self.emptyImageButton setBackgroundColor:PBRobotGreen];
    [self.loadImageButton setBackgroundColor:PBRobotGreen];
    
    self.backgroundImage=[[UIImage alloc] init];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 600.0f, 800.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)imagePickerController:(UIImagePickerController *)picker
        didFinishPickingImage:(UIImage *)image
                  editingInfo:(NSDictionary *)editingInfo
{
    
    // Dismiss the image selection, hide the picker and
    
    //show the image view with the picked image
    
    [picker dismissModalViewControllerAnimated:YES];
    self.backgroundImage=image;
    [self performSegueWithIdentifier: @"mainSelectSegue" sender: self];
    
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [segue.identifier isEqualToString:@"mainSelectSegue"])
    {
        DrawPageViewController *drawPage=segue.destinationViewController;
        drawPage.image=self.backgroundImage;
    }
    }


- (IBAction)emptyButtonClicked:(id)sender {
    
    UIImage *image=[self imageWithColor:PBWhite];
    self.backgroundImage=image;
    [self performSegueWithIdentifier: @"mainSelectSegue" sender: self];

}

- (IBAction)loadButtionClicked:(id)sender {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentModalViewController:imagePickerController animated:YES];
    
}
@end
