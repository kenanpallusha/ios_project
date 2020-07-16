//
//  CategoriesViewController.m
//  ios_project
//
//  Created by Kenan Pallusha on 15/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import "CategoriesViewController.h"

@interface CategoriesViewController ()

@end

@implementation CategoriesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *tableIdentifier = @"categoriesCell";
    
    CategoriesTableViewCell *cell = (CategoriesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    NSString *category = self.categories[indexPath.row];
    
    cell.category.text = category;
    
    return cell;
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch* touch = [touches anyObject];
    CGPoint touchpoint = [touch locationInView:self.view];
    
    if (!CGRectContainsPoint(_menuView.frame, touchpoint)) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)allNotesBtnTouched:(UIButton *)sender {
    NSLog(@"All Notes touched");
}

- (IBAction)recycleBinBtnTouched:(UIButton *)sender {
    NSLog(@"Recycle bin touched");
}


@end
