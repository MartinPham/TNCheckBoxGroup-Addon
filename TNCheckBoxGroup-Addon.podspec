Pod::Spec.new do |s|

  s.name         = "TNCheckBoxGroup-Addon"
  s.version      = "0.1"
  s.summary      = "Customisable checkbox class for Objective-C. Addon more features for TNCheckBoxGroup"

  s.homepage     = "http://ki.gg"
  s.screenshots  = "http://cl.ly/VB8f/tncheckboxgroup.png"

  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Martin Pham" => "i@ki.gg" }
  
  s.social_media_url   = "http://fb.com/serenade88"  
  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/frederik-jacques/TNCheckBoxGroup.git", :tag => "0.1" }

  s.source_files  = "src/*.{h,m}"
  s.requires_arc = true

end