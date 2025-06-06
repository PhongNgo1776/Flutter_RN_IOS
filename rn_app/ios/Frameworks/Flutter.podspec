Pod::Spec.new do |s|
  s.name             = 'Flutter'
  s.version          = '1.0.0'
  s.summary          = 'Flutter framework for integration with React Native'
  s.description      = 'A custom podspec for including Flutter.xcframework in a React Native project.'
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :path => '.' }
  s.platform         = :ios, '15.1' # Match your project’s deployment target
  s.vendored_frameworks = 'Flutter.xcframework' # Corrected from Flutter.framework
  s.source_files     = 'Flutter.xcframework/ios-arm64/Flutter.framework/Headers/*.h',
                       'Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework/Headers/*.h'
  s.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => [
      '"$(PODS_ROOT)/Flutter/Flutter.xcframework/ios-arm64/Flutter.framework/Headers"',
      '"$(PODS_ROOT)/Flutter/Flutter.xcframework/ios-arm64_x86_64-simulator/Flutter.framework/Headers"'
    ].join(' '),
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/Flutter"',
    'OTHER_LDFLAGS' => '-framework Flutter'
  }
  s.requires_arc     = true
end