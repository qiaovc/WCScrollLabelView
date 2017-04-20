
Pod::Spec.new do |s|

  s.name         = "WCScrollLabelView"
  s.version      = "0.0.1"
  s.summary      = "scrollLabel for iOS."

  s.description  = <<-DESC
                    up down scroll label for iOS
                   DESC
  s.ios.deployment_target = '7.0'
  s.homepage     = "https://github.com/Verchen/WCScrollLabelView"
  s.license      = "MIT"
  s.author             = { "qiao" => "iosqiao@qq.com" }
  s.source       = { :git => "https://github.com/Verchen/WCScrollLabelView.git", :tag => s.version }
  s.source_files  = "WCScrollLabelView/*"
  s.requires_arc = true
end
