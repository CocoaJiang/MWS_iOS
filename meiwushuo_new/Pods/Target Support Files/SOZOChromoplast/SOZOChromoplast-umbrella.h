#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SOZOBitmapDataGenerator.h"
#import "SOZOChromoplast.h"
#import "SOZOColorCube.h"
#import "SOZOColorSorter.h"
#import "SOZOCubeKeyGenerator.h"
#import "UIColor+SOZOCompatibility.h"
#import "UIImage+SOZOResize.h"

FOUNDATION_EXPORT double SOZOChromoplastVersionNumber;
FOUNDATION_EXPORT const unsigned char SOZOChromoplastVersionString[];

