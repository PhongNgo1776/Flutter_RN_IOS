Pod::Spec.new do |s|
  s.name             = 'Flutter'
  s.version          = '1.0.0'
  s.summary          = 'Flutter framework for integration with React Native'
  s.description      = 'A custom podspec for including Flutter.xcframework in a React Native project.'
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :path => '.' }
  s.platform         = :ios, '15.1'
  s.vendored_frameworks = 'Flutter.xcframework'
  s.source_files     = 'Flutter.xcframework/ios-arm64/Flutter.framework/Headers/*.h',
                       'Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework/Headers/*.h'
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => [
      '"$(PODS_ROOT)/Flutter/Flutter.xcframework/ios-arm64/Flutter.framework/Headers"',
      '"$(PODS_ROOT)/Flutter/Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework/Headers"',
      '"$(PODS_ROOT)/FlutterPluginRegistrant/FlutterPluginRegistrant.xcframework/ios-arm64/FlutterPluginRegistrant.framework/Headers"',
      '"$(PODS_ROOT)/FlutterPluginRegistrant/FlutterPluginRegistrant.xcframework/ios-arm64_x86_64-simulator/FlutterPluginRegistrant.framework/Headers"'
    ].join(' '),
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Flutter" "$(PODS_ROOT)/FlutterPluginRegistrant"',
    'OTHER_LDFLAGS' => '-framework Flutter -framework FlutterPluginRegistrant'
  }
  s.dependency 'App'
  s.dependency 'FlutterPluginRegistrant'
  s.requires_arc     = true
end