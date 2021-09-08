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
				}
				
				Section(header: Text("Public Token")) {
					TextField("Public Token", text: $data.publicToken)
						.autocapitalization(.none)
				}
				
				Section(header: Text("Transact URL")) {
					ForEach(TransactData.URLOption.allCases) { option in
						Button(action: {
							withAnimation {
								data.urlOption = option
							}
						}, label: {
							HStack {
								Text(option.rawValue.capitalized)
									.foregroundColor(.primary)
								Spacer()
								if data.urlOption == option {
									Image(systemName: "checkmark")
								}
							}
						})
					}
				}
				
				if data.urlOption == .custom {
					Section(header: Text("Custom URL")) {
						TextField("Custom URL", text: $data.customURLPath)
							.textContentType(.URL)
					}
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
