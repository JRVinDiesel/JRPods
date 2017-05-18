
Pod::Spec.new do |s|


  s.name         = "JRPods"
  s.version      = “1.0.1”
  s.summary      = "A JRPods to use ourself"

  s.homepage     = "https://github.com/JRVinDiesel/JRPods"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "张景瑞" => "380323094@qq.com" }

  s.source       = { :git => "https://github.com/JRVinDiesel/JRPods.git", :tag => s.version }

  s.source_files  = "JRPods/*”

  s.public_header_files = "JRPods/JRPodsHeaderFiles.h"

  s.requires_arc = true

  s.dependency "MJRefresh"

  s.ios.deployment_target = "7.0"


end
