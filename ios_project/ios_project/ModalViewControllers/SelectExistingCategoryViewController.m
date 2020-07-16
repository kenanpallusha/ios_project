//
//  SelectExistingCategoryViewController.m
//  ios_project
//
//  Created by Kenan Pallusha on 16/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import "SelectExistingCategoryViewController.h"

@interface SelectExistingCategoryViewController ()

@end

@implementation SelectExistingCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.context = self.delegate.persistentContainer.viewContext;
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Notes"];
    self.notes = [self.context executeFetchRequest:request error:nil];
    
    NSMutableArray *catArr = [NSMutableArray array];
    
    for(Notes *note in self.notes) {
        if (![catArr containsObject:note.category]){
            [catArr addObject:note.category];
        }
        self.categories = catArr;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.categories.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *category = self.categories[row];
    return category;
}

//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//
//    NSLog(@"Clicked");
//}

- (IBAction)saveBtnTouched:(UIButton *)sender {
    NSString *titleYouWant = [_pickerView.delegate pickerView:_pickerView titleForRow:[_pickerView selectedRowInComponent:0] forComponent:0];
   
    [self.categoryDelegateObject updateCategory:titleYouWant];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
