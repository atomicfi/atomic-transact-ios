Pod::Spec.new do |s|
    s.name         = "AtomicSDKBeta"
    s.version      = "0.0.4-beta"
    s.summary      = "iOS SDK for using Atomic Transact"
    s.homepage     = "https://docs.atomicfi.com/reference/transact-sdk#libraries__swift"
    s.license = { :type => 'Copyright', :text => '© Copyright 2024 Atomic FI Inc.'}
    s.author             = { "Sean Hill" => "sean@atomicfi.com" }
    s.source       = { :git => "https://github.com/atomicfi/atomic-transact-ios.git", :tag => "#{s.version}" }
    s.platform = :ios
    s.swift_version = "5"
    s.ios.deployment_target  = '12.0'
    s.default_subspec  = 'AtomicTransact'

    s.subspec 'AtomicTransact' do |ss|
        ss.vendored_frameworks = "artifacts/AtomicTransact.xcframework"
        ss.dependency "AtomicSDKBeta/MuppetIOS"
        ss.ios.deployment_target = '12.0'
    end

    s.subspec 'SwiftUI' do |ss|
        ss.vendored_frameworks = "artifacts/AtomicTransactSwiftUI.xcframework"
        ss.ios.deployment_target = '14.0'
    end

    s.subspec 'MuppetIOS' do |ss|
        ss.vendored_frameworks = "artifacts/MuppetIOS.xcframework"
        ss.ios.deployment_target = '12.0'
    end
end
