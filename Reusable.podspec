Pod::Spec.new do |s|
		s.name 				= "Reusable"
		s.version 			= "1.1.0"
		s.summary         	= "Sort description of 'Reusable' framework"
	    s.homepage        	= "https://github.com/amine2233/Reusable"
	    s.license           = { type: 'MIT', file: 'LICENSE' }
	    s.author            = { 'Amine Bensalah' => 'amine.bensalah@outlook.com' }
	    s.ios.deployment_target = '10.0'
	    s.osx.deployment_target = '10.12'
	    s.tvos.deployment_target = '10.0'
	    s.watchos.deployment_target = '3.0'
	    s.requires_arc = true
	    s.source            = { :git => "https://github.com/amine2233/Reusable.git", :tag => s.version.to_s }
	    s.source_files      = "Sources/**/*.swift"
	    s.exclude_files		= 'LICENSE'
	    s.pod_target_xcconfig = {
    		'SWIFT_VERSION' => '4.1'
  		}
  		s.module_name = s.name
  		s.swift_version = '4.1'

		s.ios.exclude_files = "Sources/AppKit", "Sources/WatchKit"
  		s.tvos.exclude_files = "Sources/AppKit", "Sources/WatchKit"
  		s.osx.exclude_files = "Sources/UIKit", "Sources/WatchKit"
  		s.watchos.exclude_files = "Sources/AppKit", "Sources/UIKit"
	end
