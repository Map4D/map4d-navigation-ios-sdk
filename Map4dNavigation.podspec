Pod::Spec.new do |s|
    s.name              = 'Map4dNavigation'
    s.version           = '0.2.7'
    s.summary           = 'Map4D Navigation SDK'
    s.homepage          = 'http://map4d.vn'

    s.author            = { 'Sua Le' => 'sua8051@gmail.com' }
    s.license           = { :type => 'Apache-2.0'}

    s.platform          = :ios
    s.source = { :git => 'https://github.com/map4d/map4d-navigation-ios-sdk.git', :tag => s.version.to_s }
    s.dependency 'Map4dMap'
    s.dependency 'Map4dServices'
    s.dependency 'Alamofire', '~> 4.7'
    s.dependency 'AlamofireMapper'
    s.ios.deployment_target = '10.0'
    s.ios.vendored_frameworks = 'sdk/Map4dNavigation.framework'
end
