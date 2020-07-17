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
    UserProfileModel* user = [self loadCustomObjectWithKey:@"user"];
    self.noteLbl.text = [NSString stringWithFormat:@"%@'s Notes", user.name];
    UIImage *image = [UIImage imageWithData:user.image];
    self.image.image = image;

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
    NSString *category = self.categories[indexPath.row];
    UINavigationController *nvgcont = self.presentingViewController;
    ViewController *vc = nvgcont.topViewController;
    vc.to_show = category;
    [vc viewWillAppear:NO];
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch* touch = [touches anyObject];
    CGPoint touchpoint = [touch locationInView:self.view];
    
    if (!CGRectContainsPoint(_menuView.frame, touchpoint)) {
        //
        UINavigationController *nvgcont = self.presentingViewController;
        ViewController *vc = nvgcont.topViewController;
        vc.to_show = @"ALL";
        [vc viewWillAppear:NO];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)allNotesBtnTouched:(UIButton *)sender {
    NSLog(@"All Notes touched");
    UINavigationController *nvgcont = self.presentingViewController;
    ViewController *vc = nvgcont.topViewController;
    vc.to_show = @"ALL";
    [vc viewWillAppear:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)recycleBinBtnTouched:(UIButton *)sender {
    NSLog(@"Recycle bin touched");
    UINavigationController *nvgcont = self.presentingViewController;
    ViewController *vc = nvgcont.topViewController;
    vc.to_show = @"BIN";
    [vc viewWillAppear:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)editBtnTouched:(UIButton *)sender {
    
    CreateAccountViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"createAccount"];
    vc.is_update = YES;
    
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController: vc];
    [self presentModalViewController:nav animated:YES];
}


- (UserProfileModel *)loadCustomObjectWithKey:(NSString *)key {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    UserProfileModel *object = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return object;
}

@end
