//
//  CreateAccountViewController.m
//  ios_project
//
//  Created by Kenan Pallusha on 17/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import "CreateAccountViewController.h"

@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.is_update == YES){
        UserProfileModel* usr = [self loadCustomObjectWithKey:@"user"];
        
        if( usr.name != nil){
            self.name.text = usr.name;
            self.surname.text = usr.surname;
            self.email.text = usr.email;
            UIImage *image = [UIImage imageWithData:usr.image];
            self.image.image = image;
        }
        self.is_update = NO;
        
        self.headerLbl.text = @"Update Account";
        self.navigationItem.title = @"Update";
    } else {
        self.headerLbl.text = @"Create Account";
        self.navigationItem.title = @"Register";
    }
        
}

- (IBAction)selectImageBtnTouched:(UIButton *)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        self.imagePicker = [[UIImagePickerController alloc]init];
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    // Do something with picked image
    self.image.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)saveBtnTouched:(UIButton *)sender {
    if ([self.name.text  isEqual: @""]){
        [self presentAlert:@"Please Write Your Name!"];
    } else if ([self.surname.text  isEqual: @""]){
        [self presentAlert:@"Please Write Your Surname!"];
    } else {
        NSLog(@"Save");
        NSData *imgData = UIImageJPEGRepresentation(self.image.image, 1);

        UserProfileModel* user = [UserProfileModel new];
        user.name = self.name.text;
        user.surname = self.surname.text;
        user.email = self.email.text;
        user.image = imgData;
        
        
        [self saveCustomObject:user key:@"user"];
        
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
        ViewController *vc =
        [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
        [self.navigationController pushViewController:vc animated:YES];

    }
    
}

- (void)saveCustomObject:(UserProfileModel *)object key:(NSString *)key {
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:object];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
    
}

- (UserProfileModel *)loadCustomObjectWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    UserProfileModel *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}



- (void) presentAlert: (NSString*) message{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              [[self navigationController] popViewControllerAnimated:NO];
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
