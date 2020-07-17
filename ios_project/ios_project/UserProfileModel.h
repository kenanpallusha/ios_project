//
//  UserProfileModel.h
//  ios_project
//
//  Created by Kenan Pallusha on 17/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserProfileModel : NSObject
@property (nonatomic, copy) NSString* name;
@property (nonatomic, copy) NSString* surname;
@property (nonatomic, copy) NSString* email;
@property (nonatomic, copy) NSData* image;
@end

NS_ASSUME_NONNULL_END
