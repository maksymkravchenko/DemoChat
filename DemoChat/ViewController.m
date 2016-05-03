//
//  ViewController.m
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import "ViewController.h"
#import "IncomingTableViewCell.h"
#import "AccountManager.h"
#import "Account.h"
#import "Message.h"

static CGFloat const kDefaultAnimationDuration = 0.4;
static NSString * const kIncomingCellID = @"incomingMessageCell";


@interface ViewController () <UITextViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) AccountManager *accountManager;
@property (nonatomic) CGFloat keyboardHeight;
@property (nonatomic) CGFloat viewDefaultHeight;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.accountManager = [AccountManager new];
	
	self.tableView.estimatedRowHeight = 80.0;
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	self.viewDefaultHeight = self.view.frame.size.height;
	
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	[defaultCenter addObserver:self selector:@selector(keyboardFrameDidChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
	[defaultCenter addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)dealloc
{
	NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
	[defaultCenter removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
	[defaultCenter removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
}

#pragma mark - Keyboar Changes

- (void)keyboardFrameDidChange:(NSNotification *)notification
{
	CGRect keyboardFrame = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

	[UIView animateWithDuration:kDefaultAnimationDuration animations:^
	{
		self.bottomConstraint.constant = self.viewDefaultHeight - keyboardFrame.origin.y;
		[self updateMessageTextFieldHeightContraint];
	}];
}

- (void)deviceOrientationDidChange:(NSNotification *)notification
{
	self.viewDefaultHeight = self.view.frame.size.height;
	[self updateMessageTextFieldHeightContraint];
}

#pragma mark - UITextViewDelegate

- (void)updateMessageTextFieldHeightContraint
{
	CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

	CGFloat constant = self.viewDefaultHeight - statusBarHeight - self.bottomConstraint.constant - 16.0;
	self.bottomViewHeightConstraint.constant = constant;
}

- (void)textViewDidChange:(UITextView *)textView
{
	if (textView == self.messageTextView)
	{
		BOOL scrollEnabled = NO;
		CGFloat intrinsicTextViewHeight = textView.intrinsicContentSize.height;
		if (textView.frame.size.height == self.bottomViewHeightConstraint.constant
			&& intrinsicTextViewHeight >= self.bottomViewHeightConstraint.constant
			)
		{
			scrollEnabled = YES;
		}
		textView.scrollEnabled = scrollEnabled;
	}
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.accountManager.messages.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	IncomingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kIncomingCellID forIndexPath:indexPath];
	
	Message *message = self.accountManager.messages[indexPath.row];
	cell.timestampLabel.text = [self stringFromTime:message.timestamp];
	cell.messageTextField.text = message.text;
	cell.nameLabel.text = message.account.name;
	
	Account *account = self.accountManager.accounts[indexPath.row];
	cell.accountAvatar.image = account.avatar;
	
	return cell;
}

- (IBAction)onMainAction:(id)sender
{
	UITextView *messageTextView = self.messageTextView;
	if (![messageTextView.text isEqualToString:@""])
	{
		[self.accountManager addMessageFromRandomAccount:messageTextView.text];
		messageTextView.text = nil;
		
		[self.tableView reloadData];
		[self scrollToLastRow];
	}
}

- (void)scrollToLastRow
{
	NSIndexPath *lastRowIndexPath = [NSIndexPath indexPathForRow:(self.accountManager.messages.count - 1) inSection:0];
	[self.tableView scrollToRowAtIndexPath:lastRowIndexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma makr - utils

- (NSString *)stringFromTime:(NSDate *)date
{
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	dateFormatter.timeZone = [NSTimeZone localTimeZone];
	dateFormatter.dateStyle = NSDateFormatterShortStyle;
	dateFormatter.timeStyle = NSDateFormatterShortStyle;
	return [dateFormatter stringFromDate:date];
}

@end
