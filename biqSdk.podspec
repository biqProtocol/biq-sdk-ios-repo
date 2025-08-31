Pod::Spec.new do |s|
  s.name             = 'biqSdk'
  s.version          = '1.0.4'
  s.summary          = 'The Biq iOS SDK is a lightweight library that enables proof of presence for iOS applications using BLE beacons.'
  s.description      = 'biq is a decentralized Proof of Presence (PoP) protocol that enables the verification of real-world attendance using Bluetooth Low Energy (BLE) technology. It allows physical presence at events, locations, or activities to be validated in a trustless and seamless manner, providing a scalable, frictionless solution for both Web3 and traditional business applications.'
  s.homepage         = 'https://github.com/biqprotocol/biq-sdk-ios-repo'
  s.license          = { :type => 'Commercial', :text => 'Copyright (c) 2025 Biq. All rights reserved.' }
  s.author           = { 'Biq' => 'connect@biq.me' }
  s.source           = { :http => 'https://biqprotocol.github.io/biq-sdk-ios-repo/biqSdk.xcframework.zip' }

  s.ios.deployment_target = '15.0'

  s.vendored_frameworks = 'biqSdk.xcframework'

  s.dependency 'Alamofire', '~> 5.10'
  s.dependency 'SQLite.swift', '~> 0.15'
  s.dependency 'ZIPFoundation', '~> 0.9'
end
