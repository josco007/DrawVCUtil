#
# Be sure to run `pod lib lint DrawVCUtil.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DrawVCUtil'
  s.version          = '0.1.2'
  s.summary          = 'A viewcontroller where you can draw something'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: I wrote this pod because I have a few applications where a person must draw a signature.
      In this pod you can make a draw and export it to an UIImage.
                       DESC

  s.homepage         = 'https://github.com/josco007/DrawVCUtil'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'josco007' => 'noe_is10@msn.com' }
  s.source           = { :git => 'https://github.com/josco007/DrawVCUtil.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DrawVCUtil/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DrawVCUtil' => ['DrawVCUtil/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
