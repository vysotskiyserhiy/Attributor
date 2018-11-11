Pod::Spec.new do |s|
  s.name             = 'Attributor'
  s.version          = '0.0.2'
  s.summary          = 'Easy Swift programmatic NSAttributedStringManager'
  s.homepage         = 'https://github.com/vysotskiyserhiy/Attributor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Serhiy Vysotskiy' => 'vysotskiyserhiy@gmail.com' }
  s.source           = { :git => 'https://github.com/vysotskiyserhiy/Attributor.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Attributor/Classes/**/*'
  s.frameworks = 'UIKit'
end
