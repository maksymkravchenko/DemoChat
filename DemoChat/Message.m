//
//  Message.m
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import "Message.h"

@implementation Message

- (instancetype)initWithAccount:(Account *)account timestamp:(NSDate *)timestamp andMessage:(NSString *)text{
	self = [super init];
	if (self != nil)
	{
		_account = account;
		_timestamp = timestamp;
		_text = text;
	}
	return self;
}

- (instancetype)init
{
	return [self initWithAccount:nil timestamp:nil andMessage:nil];
}

@end
