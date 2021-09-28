//
//  MainView.swift
//  MainView
//
//  Created by Erik Sargent on 9/8/21.
//

import SwiftUI

import AtomicTransact


struct MainView: View {
	@ObservedObject var data: TransactData
	@State var productType = AtomicConfig.ProductType.deposit
	@State var showingTransact = false
	
    var body: some View {
		NavigationView {
			Form {
				Section {
					Button("Setup direct deposit") {
						self.productType = .deposit
						self.showingTransact = true
					}
				}
				
				Section {
					Button("Verify employment status") {
						self.productType = .verify
						self.showingTransact = true
					}
				}
				
				Section {
					Button("Confirm identity") {
						self.productType = .identify
						self.showingTransact = true
					}
				}
			}
			.navigationTitle("Home")
		}
		.atomicTransact(
			isPresented: $showingTransact,
			config: AtomicConfig(
				publicToken: data.publicToken,
				product: productType,
				theme: .init(brandColor: UIColor(data.brandColor), overlayColor: UIColor(data.overlayColor)),
				deeplink: .init(step: .searchCompany)),
			transactURL: data.transactURL,
			presentsFullscreen: data.showFullscreen)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(data: TransactData())
    }
}
