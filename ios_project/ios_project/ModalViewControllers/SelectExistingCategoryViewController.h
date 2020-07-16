//
//  SelectExistingCategoryViewController.h
//  ios_project
//
//  Created by Kenan Pallusha on 16/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Notes+CoreDataClass.h"
#import "DetailsViewController.h"
@import CoreData;
@class AppDelegate;


NS_ASSUME_NONNULL_BEGIN

@protocol categoryDelegate <NSObject>
- (void)updateCategory:(NSString *)category;
@end

@interface SelectExistingCategoryViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic) id <categoryDelegate> categoryDelegateObject;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (nonatomic) NSArray <Notes*>*notes;
@property (nonatomic) NSManagedObjectContext *context;
@property (nonatomic, weak) AppDelegate *delegate;
@property (nonatomic, strong) NSMutableArray *categories;

@end

NS_ASSUME_NONNULL_END
