//
//  CategoriesViewController.h
//  ios_project
//
//  Created by Kenan Pallusha on 15/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoriesTableViewCell.h"
#import "ViewController.h"
#import "UserProfileModel.h"
#import "CreateAccountViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CategoriesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (nonatomic, strong) NSMutableArray *categories;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *noteLbl;

@end

NS_ASSUME_NONNULL_END
