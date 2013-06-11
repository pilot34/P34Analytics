Pod::Spec.new do |s|
  s.name         = 'P34Analytics'
  s.version      = '0.0.1'
  s.summary      = 'Wrapper for iOS analytics SDKs.'
  s.homepage     = 'https://github.com/pilot34/P34Analytics'
  s.license      = 'MIT'
  s.author       = { 'pilot34' => 'gleb34@gmail.com' }
  s.source       = { :git => 'https://github.com/pilot34/P34Analytics.git' }
  s.platform     = :ios, '5.0'
  s.source_files = 'P34Analytics.{h,m}'
  s.requires_arc = true
  s.dependency 'UIDeviceAddition'
  s.dependency 'GoogleAnalytics-iOS-SDK', '1.5.1'

end
