//
//  subclassUIImageView.h
//  subclassUIImageView
//
//  Created by C David Young on 8/12/13.
//  Copyright (c) 2013 C David Young. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIImageView (interceptInit)

// This Method allows the class to Swizzle more methods within itself.
// And allows for an overridable init method in Class Extensions
// ######################
// //// To Swizzle a method, call Swizzle once on the class in question.
// //// dispatch_once is a good way to handle that.
//            static dispatch_once_t onceToken;
//            dispatch_once(&onceToken, ^{
//                Swizz([UITableViewCell class], @selector(reuseIdentifier), @selector(classReuseIdentifier));
//            });
- (void) swizzInit;

@end
