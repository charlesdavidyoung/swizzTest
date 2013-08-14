//
//  swizzUIImageView.m
//
//  Created by C David Young on 8/12/13.
//  Copyright (c) 2013 C David Young. All rights reserved.
//

#import "UIImageView+interceptInit.h"
#import "Swizz.h"

@implementation UIImageView(interceptInit)

static Method origImageNamedMethod = nil;
// Load gets called on every object that has it. Off Thread, before application start.
+ (void) load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        origImageNamedMethod = class_getClassMethod(self, @selector(initWithCoder:));
        method_exchangeImplementations(origImageNamedMethod,
                                       class_getClassMethod(self, @selector(initWithCoderIntercept:)));
        origImageNamedMethod = class_getClassMethod(self, @selector(initWithFrame:));
        method_exchangeImplementations(origImageNamedMethod,
                                       class_getClassMethod(self, @selector(initWithFrameIntercept:)));
    });
}

//+ (void)initialize {
//    origImageNamedMethod = class_getClassMethod(self, @selector(initWithCoder:));
//    method_exchangeImplementations(origImageNamedMethod,
//                                   class_getClassMethod(self, @selector(initWithCoderIntercept:)));
//    origImageNamedMethod = class_getClassMethod(self, @selector(initWithFrame:));
//    method_exchangeImplementations(origImageNamedMethod,
//                                   class_getClassMethod(self, @selector(initWithFrameIntercept:)));
//}

//// Alternatively you can use the +(void)load method on the class to achieve the same thing.
//- (void)swizzInit{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Swizz([UITableViewCell class], @selector(initWithCoder), @selector(initWithCoderIntercept));
//        Swizz([UITableViewCell class], @selector(initWithFrame), @selector(initWithFrameIntercept));
//    });
//}

// the following is called for xib objects
- (id)initWithCoderIntercept:(NSCoder *)decoder {
    self = [self initWithCoderIntercept:decoder]; // Calls the Original method
    NSLog(@"In UIImageView(interceptInit) initWithCoder");
    if (self) {
    }
    return self;
}

// this is called from other places in code
- (id)initWithFrameIntercept:(CGRect)frame
{
    self = [self initWithFrameIntercept:frame]; // Calls the Original method
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
