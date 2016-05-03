//
//  AccountManager.h
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Account;
@class Message;

@interface AccountManager : NSObject

@property (copy, nonatomic, readonly) NSArray <Account *> *accounts;
@property (nonatomic) NSMutableArray <Message *>*messages;

- (void)addMessageFromRandomAccount:(NSString *)message;

@end
