#import <UIKit/UIKit.h>

@interface SBCoverSheetPresentationManager : NSObject
+ (id)sharedInstance;
- (void)setCoverSheetPresented:(BOOL)arg1 animated:(BOOL)arg2 withCompletion:(id)arg3;
@end

@interface SBBacklightController : NSObject
- (void)turnOnScreenFullyWithBacklightSource:(long long)arg1;
@end