//
//  MainView.swift
//  MainView
//
//  Created by Erik Sargent on 9/8/21.
//

import SwiftUI

import AtomicTransact
import AtomicTransactSwiftUI


class ConfigData: ObservableObject {
	@Published var showTransact = false
	var productType = AtomicConfig.ProductType.deposit
	var scopeType = AtomicConfig.ScopeType.userLink
	
	func show(product: AtomicConfig.ProductType, scope: AtomicConfig.ScopeType) {
		self.productType = product
		self.scopeType = scope
		self.showTransact = true
	}
}


struct MainView: View {
	@ObservedObject var data: TransactData
	@StateObject var config = ConfigData()
	
	var switchToSettings: (() -> ())?
	
	var body: some View {
		NavigationView {
			Form {
				if data.publicToken == "" {
					VStack(alignment: .center, spacing: 8) {
						HStack {
							Image(systemName: "exclamationmark.triangle")
								.foregroundColor(Color.red)
							Text("Don't forget to set your public token!")
						}
						
						Button {
							switchToSettings?()
						} label: {
							HStack {
								Text("Add it now")
								Image(systemName: "arrow.right")
								Image(systemName: "slider.horizontal.below.square.filled.and.square")
							}
						}
					}
					.multilineTextAlignment(.center)
					.frame(maxWidth: .infinity, alignment: .center)
					.listRowBackground(Color.clear)
					.font(.subheadline)
				}
				
				Section {
					Button {
						config.show(product: .deposit, scope: .userLink)
					} label: {
						Label("Setup direct deposit", systemImage: "pencil.and.ellipsis.rectangle")
					}
				}
				
				Section {
					Button {
						config.show(product: .verify, scope: .userLink)
					} label: {
						Label("Verify employment status", systemImage: "person.crop.circle.badge.checkmark")
					}
				}
				
				Section {
					Button {
						config.show(product: .switch, scope: .payLink)
					} label: {
						Label("Switch payment method", systemImage: "creditcard.and.123")
					}
				}
			}
			.navigationTitle("Home")
		}
		.atomicTransact(
			isPresented: $config.showTransact,
			config: {
				AtomicConfig(
					publicToken: data.publicToken,
					scope: config.scopeType,
					tasks: [.init(product: config.productType)],
					theme: data.theme)
			},
			environment: data.transactURL,
			presentsFullscreen: data.showFullscreen)
	}
}


struct MainView_Previews: PreviewProvider {
	static var previews: some View {
		MainView(data: TransactData())
	}
}
