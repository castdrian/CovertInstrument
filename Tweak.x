#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Tweak.h"

static void dismissCoverSheet() {
    SBCoverSheetPresentationManager *presentationManager = [%c(SBCoverSheetPresentationManager) sharedInstance];
    if (presentationManager) {
        [presentationManager setCoverSheetPresented:NO animated:NO withCompletion:nil];
    }
}

%hook SBBacklightController
- (void)turnOnScreenFullyWithBacklightSource:(long long)arg1 {
    %orig;
    NSLog(@"[CovertInstrument] Screen turning on");
    dismissCoverSheet();
}
%end

%ctor {
    NSLog(@"[CovertInstrument] Tweak initialized");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        dismissCoverSheet();
    });
}
