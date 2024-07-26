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
		case sandbox
		case custom
		
		var id: Self { self }
	}
	
	@AppStorage("URLOption") var urlOption = URLOption.sandbox
	@AppStorage("customURLPath") var customURLPath = ""
	@AppStorage("showFullscreen") var showFullscreen = false
	@AppStorage("PublicToken") var publicToken = ""
	@Published var brandColor = Color.blue
	@Published var overlayColor = Color.gray
	
	var environment: TransactEnvironment {
		switch urlOption {
		case .production: return .production
		case .sandbox: return .sandbox
		case .custom: return .custom(path: customURLPath)
		}
	}
}
