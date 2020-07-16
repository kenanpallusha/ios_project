//
//  DetailsViewController.h
//  ios_project
//
//  Created by Kenan Pallusha on 14/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Notes+CoreDataClass.h"
#import "AppDelegate.h"
#import "SelectExistingCategoryViewController.h"

@import CoreData;
@class AppDelegate;
@protocol categoryDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController <categoryDelegate>

@property (nonatomic, assign) Notes* note_details;

@property (nonatomic, assign) BOOL is_update;
@property (nonatomic, assign) BOOL is_deleted;

@property (weak, nonatomic) IBOutlet UITextField *category;
@property (weak, nonatomic) IBOutlet UITextField *noteTitle;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveBtn;

@property (nonatomic) NSManagedObjectContext *context;

@property (nonatomic, weak) AppDelegate *delegate;
@end

NS_ASSUME_NONNULL_END
