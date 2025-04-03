require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = package["name"]
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platform          = :ios
  s.requires_arc      = true
  s.static_framework  = true

  s.source       = { :git => "https://github.com/arthenica/ffmpeg-kit.git", :tag => "react.native.v#{s.version}" }
  s.platforms    = { :ios => '15.0' }
 s.libraries        = ["z", "bz2", "c++", "iconv"]
  s.dependency "React-Core"
  s.requires_arc     = true
  s.ios.frameworks   = ["AudioToolbox", "AVFoundation", "CoreMedia", "VideoToolbox"]

  s.source_files = ['**/FFmpegKitReactNativeModule.m','**/FFmpegKitReactNativeModule.h']
    s.vendored_frameworks = [
      "ffmpeg-kit-ios-full-gpl/ffmpegkit.xcframework",
    "ffmpeg-kit-ios-full-gpl/libavcodec.xcframework",
    "ffmpeg-kit-ios-full-gpl/libavdevice.xcframework",
    "ffmpeg-kit-ios-full-gpl/libavfilter.xcframework",
    "ffmpeg-kit-ios-full-gpl/libavformat.xcframework",
    "ffmpeg-kit-ios-full-gpl/libavutil.xcframework",
    "ffmpeg-kit-ios-full-gpl/libswresample.xcframework",
    "ffmpeg-kit-ios-full-gpl/libswscale.xcframework"
    ]
end
