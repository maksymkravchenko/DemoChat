//
//  IncomingTableViewCell.h
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IncomingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timestampLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextView *messageTextField;
@property (weak, nonatomic) IBOutlet UIImageView *accountAvatar;

@end
