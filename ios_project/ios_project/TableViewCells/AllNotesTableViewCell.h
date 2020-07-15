//
//  AllNotesTableViewCell.h
//  ios_project
//
//  Created by Kenan Pallusha on 14/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AllNotesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UILabel *modified;



@end

NS_ASSUME_NONNULL_END
