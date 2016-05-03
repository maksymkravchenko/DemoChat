//
//  PointerView.m
//  DemoChat
//
//  Created by Maksym Kravchenko on 5/2/16.
//  Copyright © 2016 Max. All rights reserved.
//

#import "PointerView.h"

static CGFloat const kPointerVeiwPointerWidth = 8.0;
static CGFloat const kPointerVeiwPointerHeight = 16.0;
static CGFloat const kPointerVeiwPointerYShift = 12.0;

static CGFloat const kPointerVeiwCornerRadius = 8.0;

@interface PointerView ()

@end

@implementation PointerView

- (void)drawRect:(CGRect)rect
{
	[self.opaqueBackgroundColor setFill];
	UIBezierPath *boundsPath = [UIBezierPath bezierPathWithRect:rect];
	[boundsPath fill];
	
	CGRect correctedRect = rect;
	if (self.pointerPosition == kIncomingPointerPosition)
	{
		correctedRect.origin.x += kPointerVeiwPointerWidth;
	}
	correctedRect.size.width -= kPointerVeiwPointerWidth;

	UIBezierPath *drawingPath = [UIBezierPath bezierPathWithRoundedRect:correctedRect cornerRadius:kPointerVeiwCornerRadius];
	
	UIBezierPath *pointerPath = [UIBezierPath bezierPath];
	
	if (self.pointerPosition == kIncomingPointerPosition)
	{
		CGPoint startPoint = CGPointMake(correctedRect.origin.x, CGRectGetMaxY(rect) - kPointerVeiwPointerYShift);
		[pointerPath moveToPoint:startPoint];
		[pointerPath addLineToPoint:CGPointMake((pointerPath.currentPoint.x - kPointerVeiwPointerWidth), pointerPath.currentPoint.y)];
		[pointerPath addLineToPoint:CGPointMake((pointerPath.currentPoint.x + kPointerVeiwPointerWidth), (pointerPath.currentPoint.y - kPointerVeiwPointerHeight))];
		[pointerPath closePath];
	}
	//TODO: outcoming
	[drawingPath appendPath:pointerPath];
	[self.backgroundColor setFill];
	[drawingPath fill];
}

@end
