//
//  ViewController.h
//  ios_project
//
//  Created by Kenan Pallusha on 14/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllNotesTableViewCell.h"
#import "DetailsViewController.h"
#import "CategoriesViewController.h"
#import "AppDelegate.h"
@import CoreData;
@class AppDelegate;

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSArray <Notes*>*notes;
@property (nonatomic) NSManagedObjectContext *context;
@property (nonatomic, weak) AppDelegate *delegate;
@property (weak, nonatomic) IBOutlet UITableView *notesTableView;
@property (weak, nonatomic) IBOutlet UILabel *noNotesLbl;
@property (nonatomic) NSString* to_show;
@end

