//
//  Message.h
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Account;

@interface Message : NSObject

@property (nonatomic, copy) Account *account;
@property (nonatomic, copy) NSDate *timestamp;
@property (nonatomic, copy) NSString *text;

- (instancetype)initWithAccount:(Account *)account timestamp:(NSDate *)timestamp andMessage:(NSString *)text NS_DESIGNATED_INITIALIZER;

@end
