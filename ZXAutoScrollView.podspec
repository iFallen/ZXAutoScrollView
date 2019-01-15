Pod::Spec.new do |s|
  s.name             = 'ZXAutoScrollView'
  s.version          = '2.0.0'
  s.summary          = 'ZXAutoScrollView.Delegate/DataSource'
  s.description      = <<-DESC
TODO: ZXAutoScrollView.Delegate/DataSource.
                       DESC
  s.homepage              = 'https://github.com/iFallen/ZXAutoScrollView'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'JuanFelix' => 'hulj1204@yahoo.com' }
  s.source                = { :git => 'https://github.com/iFallen/ZXAutoScrollView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files          = 'ZXAutoScrollView/Classes/**/*'
  s.frameworks            = 'UIKit'
end
