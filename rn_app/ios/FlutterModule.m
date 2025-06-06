#import "FlutterModule.h"
#import <Flutter/Flutter.h>

@implementation FlutterModule
RCT_EXPORT_MODULE();

- (instancetype)init {
  self = [super init];
  if (self) {
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter"];
    [self.flutterEngine runWithEntrypoint:nil];
    // [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
  }
  return self;
}

RCT_EXPORT_METHOD(showFlutter:(RCTPromiseResolveBlock)resolve
                     rejecter:(RCTPromiseRejectBlock)reject) {
  dispatch_async(dispatch_get_main_queue(), ^{
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:self.flutterEngine nibName:nil bundle:nil];
    UIViewController *rootViewController = UIApplication.sharedApplication.delegate.window.rootViewController;
    if (rootViewController) {
      [rootViewController presentViewController:flutterViewController animated:YES completion:^{
        resolve(@"Flutter view presented");
      }];
    } else {
      reject(@"no_root_view", @"Root view controller not found", nil);
    }
  });
}
@end
