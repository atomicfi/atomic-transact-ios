Pod::Spec.new do |s|
    s.name         = "TransactiOSSDK"
    s.version      = "1.1.3"
    s.summary      = "iOS SDK for using Atomic Transact"
    s.homepage     = "https://atomic.financial"
    s.license = { :type => 'Copyright', :text => '© Copyright 2021 Atomic FI Inc.'}
    s.author             = { "Erik Sargent" => "admin@eriksargent.me" }
    s.source       = { :git => "https://github.com/atomicfi/TransactiOSSDK.git", :tag => "#{s.version}" }
    s.vendored_frameworks = "artifacts/AtomicTransact.xcframework"
    s.platform = :ios
    s.swift_version = "5"
    s.ios.deployment_target  = '14.0'
end
