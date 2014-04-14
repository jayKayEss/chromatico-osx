//  CATextLayer+AutoSizing.m
//
//  Created by Andrew Bulhak on 02/08/2013.
//  This code is placed in the public domain`

#import "CATextLayer+AutoSizing.h"
#import <CoreText/CoreText.h>

@implementation CATextLayer (AutoSizing)

- (void) adjustBoundsToFit {
    
    NSAttributedString *as;
    if([self.string isKindOfClass:[NSAttributedString class]]) {
        as = self.string;
#if ! __has_feature(objc_arc)
        [as retain];
#endif
    } else {
        
        NSFont* outfont;
        CFTypeRef layerfont = self.font;
        
        if(layerfont && [(__bridge id) layerfont isKindOfClass:[NSString class]]) {
            outfont = [NSFont fontWithName:(__bridge NSString*)layerfont size:self.fontSize];
        } else {
            CFTypeID ftypeid = CFGetTypeID(layerfont);
            if(ftypeid == CTFontGetTypeID()) {
                CFStringRef fname = CTFontCopyPostScriptName(layerfont);
                outfont = [NSFont fontWithName:(__bridge NSString*)fname size:self.fontSize];
                CFRelease(fname);
            }
            else if (ftypeid == CGFontGetTypeID()) {
                CFStringRef fname = CGFontCopyPostScriptName(layerfont);
                outfont = [NSFont fontWithName:(__bridge NSString*)fname size:self.fontSize];
                CFRelease(fname);
                
            }
            else { // It's undefined, and defaults to Helvetica
                outfont = [NSFont systemFontOfSize:self.fontSize];
            }
        }
        
        as = [[NSAttributedString alloc] initWithString:self.string attributes:@{NSFontAttributeName: outfont}];
    }
    
    CGRect f = self.frame;
    f.size = [as size];
    self.frame = f;
    
#if ! __has_feature(objc_arc)
    [as release];
#endif
}

@end