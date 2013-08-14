//
//  UIImageView+interceptInit.m
//
//  Created by C David Young on 8/12/13.
//  Copyright (c) 2013 C David Young. All rights reserved.
//
// This is based on http://stackoverflow.com/questions/5339276/what-are-the-dangers-of-method-swizzling-in-objective-c?rq=1

#import "UIImageView+interceptInit.h"
#import "NSObject+FRRuntimeAdditions.h"

@implementation UIImageView(interceptInit)

static id MyInitWithCoder(id self, SEL _cmd, NSCoder *decoder);
static void (*InitWithCoderIMP)(id self, SEL _cmd, NSCoder *decoder);

static id MyInitWithCoder(id self, SEL _cmd, NSCoder *decoder) {
    // do custom work
    NSLog(@"In UIImageView(interceptInit) MyInitWithCoder");
    InitWithCoderIMP(self, _cmd, decoder);
    return self;
}

static id MyInitWithFrame(id self, SEL _cmd, NSCoder *decoder);
static void (*InitWithFrameIMP)(id self, SEL _cmd, NSCoder *decoder);

static id MyInitWithFrame(id self, SEL _cmd, NSCoder *decoder) {
    // do custom work
    NSLog(@"In UIImageView(interceptInit) MyInitWithFrame");
    InitWithFrameIMP(self, _cmd, decoder);
    return self;
}

+ (void)load {
    [self swizzle:@selector(initWithCoder:) with:(IMP)MyInitWithCoder store:(IMP *)&InitWithCoderIMP];
    [self swizzle:@selector(initWithFrame:) with:(IMP)MyInitWithFrame store:(IMP *)&InitWithFrameIMP];
}

@end
