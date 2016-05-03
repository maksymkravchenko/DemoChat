//
//  PointerView.h
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger
{
	kIncomingPointerPosition = 0,
	kOutcomingPointerPosition
} PointerPosition;

IB_DESIGNABLE

@interface PointerView : UIView

@property (nonatomic) IBInspectable PointerPosition pointerPosition;
@property (nonatomic) IBInspectable UIColor *opaqueBackgroundColor;

@end
