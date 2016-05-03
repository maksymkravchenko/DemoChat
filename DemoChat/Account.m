//
//  Account.m
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import "Account.h"

@implementation Account

- (instancetype)initWithName:(NSString *)name andAvatar:(UIImage *)image
{
	self = [super init];
	if (self != nil)
	{
		_name = name;
		_avatar = image;
	}
	return self;
}

- (instancetype)init
{
	return [self initWithName:nil andAvatar:nil];
}

@end
