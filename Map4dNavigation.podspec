Pod::Spec.new do |s|
    s.name              = 'Map4dNavigation'
    s.version           = '1.2.0'
    s.summary           = 'Map4D Navigation SDK'
    s.homepage          = 'http://map4d.vn'

    s.author            = { 'IOTLink' => 'admin@iotlink.com.vn' }
    s.license           = { :type => 'Apache-2.0'}

    s.platform          = :ios
    s.source            = { :git => 'https://github.com/map4d/map4d-navigation-ios-sdk.git', :tag => s.version.to_s }

    s.ios.deployment_target   = '10.0'
    s.ios.vendored_frameworks = 'sdk/Map4dNavigation.framework'

    s.dependency 'Map4dMap', '~> 2.3'
    s.dependency 'Map4dServices', '~> 2.1'
end
