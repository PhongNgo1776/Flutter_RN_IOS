Pod::Spec.new do |s|
  s.name             = 'Flutter'
  s.version          = '1.0.0' # Set an appropriate version
  s.summary          = 'Flutter framework for integration with React Native'
  s.description      = 'A custom podspec for including Flutter.framework in a React Native project.'
  s.homepage         = 'https://flutter.dev'
  s.license          = { :type => 'MIT', :file => 'LICENSE' } # Adjust license as needed
  s.author           = { 'Your Name' => 'your.email@example.com' }
  s.source           = { :path => '.' }
  s.platform         = :ios, '13.0' # Match your project’s deployment target
  s.vendored_frameworks = 'Flutter.framework'
  s.requires_arc     = true
end