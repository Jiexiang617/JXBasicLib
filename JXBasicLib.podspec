Pod::Spec.new do |s|
  s.name             = 'JXBasicLib'
  s.version          = '0.0.1'
  s.summary          = 'JXBasicLib'
  s.homepage         = 'https://github.com/Jiexiang617/JXBasicLib'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jiexiang' => 'jiexiang617@gmail.com' }
  s.source           = { :git => 'https://github.com/Jiexiang617/JXBasicLib.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'JXBasicLib/Classes/**/*'
  s.requires_arc = true
end