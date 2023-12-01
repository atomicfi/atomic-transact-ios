Pod::Spec.new do |s|
    s.name         = "AtomicSDKTest3"
    s.version      = "3.1.2"
    s.summary      = "iOS SDK for using Atomic Transact"
    s.homepage     = "https://docs.atomicfi.com/reference/transact-sdk#libraries__swift"
    s.license = { :type => 'Copyright', :text => '© Copyright 2022 Atomic FI Inc.'}
    s.author             = { "Sean Hill" => "sean@atomicfi.com" }
    s.source       = { :git => "https://github.com/atomicfi/atomic-transact-ios.git", :tag => "#{s.version}" }
    s.platform = :ios
    s.swift_version = "5"
    s.ios.deployment_target  = '10.0'
    s.default_subspec  = 'AtomicTransactTest3'

    s.subspec 'AtomicTransactTest3' do |ss|
        ss.vendored_frameworks = "artifacts/AtomicTransactTest3.xcframework"
        ss.ios.deployment_target  = '10.0'
    end

    s.subspec 'SwiftUI' do |ss|
        ss.vendored_frameworks = "artifacts/AtomicTransactSwiftUITest3.xcframework"
        ss.ios.deployment_target  = '14.0'
    end
end
