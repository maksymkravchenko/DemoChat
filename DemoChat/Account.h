//
//  Account.h
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Account : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) UIImage *avatar;

- (instancetype)initWithName:(NSString *)name andAvatar:(UIImage *)image NS_DESIGNATED_INITIALIZER;

@end
