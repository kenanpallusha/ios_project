//
//  CategoriesViewController.h
//  ios_project
//
//  Created by Kenan Pallusha on 15/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoriesTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CategoriesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *menuView;

@end

NS_ASSUME_NONNULL_END
