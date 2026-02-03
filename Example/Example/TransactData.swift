//
//  TransactData.swift
//  TransactData
//
//  Created by Erik Sargent on 9/8/21.
//

import SwiftUI

import AtomicTransact


class TransactData: ObservableObject {
	enum DarkModeOption: String, Identifiable, CaseIterable {
		case system
		case dark
		case light
		
		var id: Self { self }
	}
	
	@AppStorage("showFullscreen") var showFullscreen = false
	@AppStorage("PublicToken") var publicToken = ""
	@AppStorage("DarkMode") var darkMode = DarkModeOption.system
	@Published var brandColor = Color.blue
	@Published var overlayColor = Color.gray
	@Published var demoModeColor = Color.green
	
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
