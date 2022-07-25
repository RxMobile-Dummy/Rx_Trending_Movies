# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
  end
 end
end

target 'RxTrendingMovies' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'SwiftyJSON'
  pod 'IQKeyboardManagerSwift'
  pod 'PKHUD'
  pod 'PINRemoteImage'
  pod 'SlideMenuControllerSwift', :git => 'https://github.com/AtomicSLLC/SlideMenuControllerSwift.git', :branch => 'swift5'
  pod 'Firebase/Analytics'
  pod 'Firebase/Crashlytics'
  pod 'Firebase/RemoteConfig'
  pod 'Firebase/Firestore'
  pod 'Firebase/Storage'
  pod 'Firebase/Functions'
  pod 'Firebase/Auth'
  pod 'Firebase/Core'
  pod 'Alamofire'
  pod 'AlamofireObjectMapper'
  pod 'Kingfisher'
  pod 'SnapKit'
  pod 'Mocker', '~> 2.5.4'
  pod 'TransitionButton'

  # Pods for RxTreandingMovies

  target 'RxTrendingMoviesTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RxTrendingMoviesUITests' do
    inherit! :complete
    # Pods for testing
  end

end
