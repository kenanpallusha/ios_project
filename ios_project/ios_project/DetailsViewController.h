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
@import CoreData;
@class AppDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, assign) Notes* note_details;

@property (nonatomic, assign) BOOL is_update;


@property (weak, nonatomic) IBOutlet UITextField *category;
@property (weak, nonatomic) IBOutlet UITextField *noteTitle;
@property (weak, nonatomic) IBOutlet UITextView *text;

@property (nonatomic) NSManagedObjectContext *context;

@property (nonatomic, weak) AppDelegate *delegate;
@end

NS_ASSUME_NONNULL_END
