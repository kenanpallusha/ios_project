//
//  CreateAccountViewController.h
//  ios_project
//
//  Created by Kenan Pallusha on 17/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "UserProfileModel.h"
#import "ViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface CreateAccountViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *headerLbl;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *surname;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (nonatomic, assign) BOOL is_update;
@property (nonatomic, retain) UIImagePickerController *imagePicker;
@end

NS_ASSUME_NONNULL_END
