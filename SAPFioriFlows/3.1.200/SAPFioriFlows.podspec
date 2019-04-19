Pod::Spec.new do |spec|
  spec.platform             = :ios, "11.0"
  spec.name                 = 'SAPFioriFlows'
  spec.version              = '3.1.200'
  spec.license              = { :type => 'SAP Developer License', :file => 'SAP-DEVELOPER-LICENSE.txt' }
  spec.homepage             = 'https://developers.sap.com/topics/cloud-platform-sdk-for-ios.html'
  spec.authors              = 'SAP SE'
  spec.summary              = 'SAP CP SDK for iOS - SAPFioriFlows'
  spec.documentation_url    = 'https://help.sap.com/viewer/p/SAP_CLOUD_PLATFORM_SDK_FOR_IOS'
  spec.source               = { :http => 'https://repositories.sap.ondemand.com/nexus3/repository/maven73555000100900003122/com/sap/mobile/platform/client/hcp/sdk/ios/flows/SAPFioriFlows/3.1.200/SAPFioriFlows-3.1.200-Release-fat.zip' }
  spec.vendored_frameworks  = 'SAPFioriFlows.framework'
  spec.framework            = 'SAPFioriFlows'
  spec.dependency           'SAPCommon', '~> 3.1.200'
  spec.dependency           'SAPFoundation', '~> 3.1.200'
  spec.dependency           'SAPFiori', '~> 3.1.200'
end
