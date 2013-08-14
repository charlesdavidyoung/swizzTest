#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef IMP *IMPPointer;

@interface NSObject (swizzFRRuntimeAdditions)

+ (BOOL)swizzle:(SEL)original with:(IMP)replacement store:(IMPPointer)store;

@end
