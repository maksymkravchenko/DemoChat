//
//  AccountManager.m
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import "AccountManager.h"
#import "Account.h"
#import "Message.h"

@interface AccountManager ()

@property (copy, nonatomic, readwrite) NSArray <Account *> *accounts;

@end

@implementation AccountManager

- (NSArray *)accounts
{
	if (_accounts == nil)
	{
		NSInteger index = 0;
		NSMutableArray *mutableAccounts = [NSMutableArray new];
		for (; index < 20; index++)
		{
			Account *account = [[Account alloc] initWithName:[NSString stringWithFormat:@"%@%lu", @"Buster Keaton", index] andAvatar:[UIImage imageNamed:@"keaton"]];
			[mutableAccounts addObject:account];
		}
		
		_accounts = [mutableAccounts copy];
	}
	
	return _accounts;
}

- (void)addMessageFromRandomAccount:(NSString *)text
{
	if (self.messages == nil)
	{
		self.messages = [NSMutableArray new];
	}
	NSInteger randomIndex = arc4random_uniform((int)self.accounts.count);
	Message *message = [[Message alloc] initWithAccount:self.accounts[randomIndex] timestamp:[NSDate date] andMessage:text];
	[self.messages addObject:message];
}

@end
