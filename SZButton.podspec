
Pod::Spec.new do |s|

  s.name         = "SZButton"

  s.version      = "1.0.1"

  s.summary      = "button subclass from UIControl"

  s.homepage     = "https://github.com/chenshengzhi/SZButton"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "陈圣治" => "csz2136@163.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/chenshengzhi/SZButton.git", :tag => s.version.to_s }

  s.source_files = "SZButton/*.{h,m}"

  s.requires_arc = true

end
