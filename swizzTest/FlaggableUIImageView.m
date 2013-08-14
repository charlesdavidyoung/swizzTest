//
//  subclassUIImageView.m
//  subclassUIImageView
//
//  Created by C David Young on 8/12/13.
//  Copyright (c) 2013 C David Young. All rights reserved.
//

#import "FlaggableUIImageView.h"

@implementation FlaggableUIImageView

// the following is called for xib objects
- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    NSLog(@"In FlaggableUIImageView initWithCoder");
    if (self) {
    }
    return self;
}

// this is called from other places in code
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    NSLog(@"In FlaggableUIImageView initWithFrame");
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
