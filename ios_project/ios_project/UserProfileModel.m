//
//  UserProfileModel.m
//  ios_project
//
//  Created by Kenan Pallusha on 17/07/2020.
//  Copyright © 2020 Kenan Pallusha. All rights reserved.
//

#import "UserProfileModel.h"

@implementation UserProfileModel

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.surname forKey:@"surname"];
    [encoder encodeObject:self.email forKey:@"email"];
    [encoder encodeObject:self.image forKey:@"image"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.name = [decoder decodeObjectForKey:@"name"];
        self.surname = [decoder decodeObjectForKey:@"surname"];
        self.email = [decoder decodeObjectForKey:@"email"];
        self.image = [decoder decodeObjectForKey:@"image"];
    }
    return self;
}

@end
