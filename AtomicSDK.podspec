Pod::Spec.new do |s|
    s.name         = "AtomicSDK"
    s.version      = "2.1.2"
    s.summary      = "iOS SDK for using Atomic Transact"
    s.homepage     = "https://docs.atomicfi.com/reference/transact-sdk#libraries__swift"
    s.license = { :type => 'Copyright', :text => '© Copyright 2021 Atomic FI Inc.'}
    s.author             = { "Sean Hill" => "sean@atomicfi.com" }
    s.source       = { :git => "https://github.com/atomicfi/atomic-transact-ios.git", :tag => "#{s.version}" }
    s.vendored_frameworks = "artifacts/AtomicTransact.xcframework"
    s.platform = :ios
    s.swift_version = "5"
    s.ios.deployment_target  = '14.0'
end
