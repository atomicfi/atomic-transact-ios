//
//  TransactData.swift
//  TransactData
//
//  Created by Erik Sargent on 9/8/21.
//

import SwiftUI

import AtomicTransact


class TransactData: ObservableObject {
	enum URLOption: String, Identifiable, CaseIterable {
		case production
		case custom
		
		var id: Self { self }
	}
	
	enum DarkModeOption: String, Identifiable, CaseIterable {
		case system
		case dark
		case light
		
		var id: Self { self }
	}
	
	@AppStorage("URLOption") var urlOption = URLOption.production
	@AppStorage("customURLPath") var customURLPath = ""
	@AppStorage("showFullscreen") var showFullscreen = false
	@AppStorage("PublicToken") var publicToken = ""
	@AppStorage("DarkMode") var darkMode = DarkModeOption.system
	@Published var brandColor = Color.blue
	@Published var overlayColor = Color.gray
	@Published var demoModeColor = Color.green
	
	var transactURL: TransactEnvironment {
		switch urlOption {
		case .production: return .production
		case .custom: return .custom(path: customURLPath)
		}
	}
	
	var theme: AtomicConfig.Theme {
		switch darkMode {
		case .system:
			return .init(brandColor: UIColor(brandColor), overlayColor: UIColor(overlayColor), dark: .system)
		case .dark:
			return .init(brandColor: UIColor(brandColor), overlayColor: UIColor(overlayColor), dark: .dark)
		case .light:
			return .init(brandColor: UIColor(brandColor), overlayColor: UIColor(overlayColor), dark: .light)
		}
	}
}
