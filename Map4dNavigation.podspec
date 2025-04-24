Pod::Spec.new do |s|
    s.name        = 'Map4dNavigation'
    s.version     = '1.4.0'
    s.summary     = 'Map4D Navigation SDK for iOS'
    s.homepage    = 'https://map4d.vn'
    s.author      = { 'IOTLink' => 'admin@iotlink.com.vn' }
    s.license     = { :type => "Copyright", :text => "Copyright (c) 2025 IOTLink" }
    s.source      = { :git => 'https://github.com/map4d/map4d-navigation-ios-sdk.git', :tag => s.version.to_s }
    s.platform    = :ios, "12.0"
    s.ios.vendored_frameworks = 'sdk/Map4dNavigation.xcframework'

    s.dependency 'Map4dMap', '~> 3.0'
    s.dependency 'Map4dServices', '~> 2.4'
end
