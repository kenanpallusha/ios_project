//
//  DetailsViewController.h
//  ios_project
//
//  Created by Kenan Pallusha on 14/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (nonatomic, assign) NSString* note_details;

@property (weak, nonatomic) IBOutlet UILabel *category;


@property (weak, nonatomic) IBOutlet UITextView *text;

@end

NS_ASSUME_NONNULL_END
