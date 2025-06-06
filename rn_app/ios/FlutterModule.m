#import "FlutterModule.h"
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@implementation FlutterModule
RCT_EXPORT_MODULE();

- (instancetype)init {
  self = [super init];
  if (self) {
    self.flutterEngine = [[FlutterEngine alloc] initWithName:@"io.flutter"];
    BOOL didRun = [self.flutterEngine runWithEntrypoint:nil];
    NSLog(@"FlutterEngine run: %d", didRun);
    [GeneratedPluginRegistrant registerWithRegistry:self.flutterEngine];
    [[self.flutterEngine binaryMessenger] setMessageHandlerOnChannel:@"com.example/debug" binaryMessageHandler:^(NSData *message, void (^reply)(NSData *)) {
      NSDictionary *data = [NSJSONSerialization JSONObjectWithData:message options:0 error:nil];
      NSLog(@"Flutter: %@", data[@"message"]);
      reply(nil);
    }];
  }
  return self;
}

RCT_EXPORT_METHOD(showFlutter:(RCTPromiseResolveBlock)resolve
                     rejecter:(RCTPromiseRejectBlock)reject) {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (!self.flutterEngine) {
      NSLog(@"FlutterEngine is nil");
      reject(@"no_engine", @"Flutter engine not initialized", nil);
      return;
    }
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:self.flutterEngine nibName:nil bundle:nil];
    flutterViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    flutterViewController.view.backgroundColor = [UIColor whiteColor];
    UIViewController *topViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
    while (topViewController.presentedViewController) {
      topViewController = topViewController.presentedViewController;
    }
    if (!topViewController) {
      NSLog(@"Top view controller is nil");
      reject(@"no_root_view", @"Top view controller not found", nil);
      return;
    }
    NSLog(@"Presenting FlutterViewController");
    [topViewController presentViewController:flutterViewController animated:YES completion:^{
      NSLog(@"FlutterViewController presentation completed");
      resolve(@"Flutter view presented");
    }];
  });
}

RCT_EXPORT_METHOD(showFlutterWithRoute:(NSString *)initialRoute
                             resolver:(RCTPromiseResolveBlock)resolve
                             rejecter:(RCTPromiseRejectBlock)reject) {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (!self.flutterEngine) {
      NSLog(@"FlutterEngine is nil");
      reject(@"no_engine", @"Flutter engine not initialized", nil);
      return;
    }
    FlutterViewController *flutterViewController = [[FlutterViewController alloc] initWithEngine:self.flutterEngine nibName:nil bundle:nil];
    [flutterViewController setInitialRoute:initialRoute];
    flutterViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    flutterViewController.view.backgroundColor = [UIColor whiteColor];
    UIViewController *topViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
    while (topViewController.presentedViewController) {
      topViewController = topViewController.presentedViewController;
    }
    if (!topViewController) {
      NSLog(@"Top view controller is nil");
      reject(@"no_root_view", @"Top view controller not found", nil);
      return;
    }
    NSLog(@"Presenting FlutterViewController with route: %@", initialRoute);
    [topViewController presentViewController:flutterViewController animated:YES completion:^{
      NSLog(@"FlutterViewController presentation completed with route: %@", initialRoute);
      resolve(@"Flutter view presented with route");
    }];
  });
}

RCT_EXPORT_METHOD(checkEngineStatus:(RCTPromiseResolveBlock)resolve
                          rejecter:(RCTPromiseRejectBlock)reject) {
  if (self.flutterEngine) {
    resolve(@"Engine initialized");
  } else {
    reject(@"no_engine", @"Flutter engine not initialized", nil);
  }
}
@end