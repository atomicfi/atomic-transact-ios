Pod::Spec.new do |s|
    s.name         = "AtomicSDK"
    s.version      = "3.6.1"
    s.summary      = "iOS SDK for using Atomic Transact"
    s.homepage     = "https://docs.atomicfi.com/reference/transact-sdk#libraries__swift"
    s.license = { :type => 'Copyright', :text => '© Copyright 2024 Atomic FI Inc.'}
    s.author             = { "Sean Hill" => "sean@atomicfi.com" }
    s.source       = { :git => "https://github.com/atomicfi/atomic-transact-ios.git", :tag => "#{s.version}" }
    s.platform = :ios
    s.swift_version = "5"
    s.ios.deployment_target  = "13.0"
    s.dependency "QuantumIOS"
end
