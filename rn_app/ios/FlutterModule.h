#import <React/RCTBridgeModule.h>
#import <Flutter/Flutter.h>
#import <FlutterPluginRegistrant/GeneratedPluginRegistrant.h>

@interface FlutterModule : NSObject <RCTBridgeModule>
@property(nonatomic, strong) FlutterEngine *flutterEngine;
@end
