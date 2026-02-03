//
//  ContentView.swift
//  Example
//
//  Created by Erik Sargent on 8/24/21.
//

import SwiftUI

import AtomicTransact


struct TransactSettingsView: View {
	@ObservedObject var data: TransactData
	
	var body: some View {
		NavigationView {
			Form {
				Section(header: Text("UI Customization")) {
					Toggle("Present Fullscreen", isOn: $data.showFullscreen)
					ColorPicker("Brand Color", selection: $data.brandColor)
					ColorPicker("Overlay Color", selection: $data.overlayColor)
					Picker("Dark Mode", selection: $data.darkMode) {
						ForEach(TransactData.DarkModeOption.allCases) { option in
							Button(option.rawValue.capitalized) {
								data.darkMode = option
							}
						}
					}
				}
				
				Section(header: Text("Public Token")) {
					TextField("Public Token", text: $data.publicToken)
						.autocapitalization(.none)
				}
			}
			.navigationTitle("Settings")
		}
	}
}


struct TransactView_Previews: PreviewProvider {
	static var previews: some View {
		TransactSettingsView(data: TransactData())
	}
}
