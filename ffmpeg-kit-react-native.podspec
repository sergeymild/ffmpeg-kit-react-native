require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => 15.0 }
  s.requires_arc      = true
  s.static_framework  = true

  s.source       = { :git => "https://github.com/sergeymild/ffmpeg-kit-react-native.git", :tag => package["version"] }
  s.ios.frameworks   = ["AudioToolbox", "AVFoundation", "CoreMedia", "VideoToolbox"]
  s.libraries        = ["z", "bz2", "c++", "iconv"]

  s.source_files = "ios/**/*.{h,m,mm,cpp}"
  s.vendored_frameworks = [
    "frameworks/ffmpegkit.xcframework",
    "frameworks/libavcodec.xcframework",
    "frameworks/libavdevice.xcframework",
    "frameworks/libavfilter.xcframework",
    "frameworks/libavformat.xcframework",
    "frameworks/libavutil.xcframework",
    "frameworks/libswresample.xcframework",
    "frameworks/libswscale.xcframework"
  ]
  install_modules_dependencies(s)

end
