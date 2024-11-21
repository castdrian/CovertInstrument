#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tweak.h"

%hook SBBacklightController
- (void)turnOnScreenFullyWithBacklightSource:(long long)arg1 {
    %orig;
    NSLog(@"[CovertInstrument] Screen turning on");
    
    SBCoverSheetPresentationManager *presentationManager = [%c(SBCoverSheetPresentationManager) sharedInstance];
    if (presentationManager) {
        NSLog(@"[CovertInstrument] Attempting to dismiss cover sheet");
        [presentationManager setCoverSheetPresented:NO animated:NO withCompletion:nil];
    }
}
%end

%ctor {
    NSLog(@"[CovertInstrument] Tweak initialized");
}
