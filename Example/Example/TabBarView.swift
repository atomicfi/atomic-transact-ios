//
//  TabBarView.swift
//  TabBarView
//
//  Created by Erik Sargent on 9/8/21.
//

import SwiftUI


struct TabBarView: View {
	enum Tabs: Int, Identifiable {
		case home
		case settings
		
		var id: Self { return self }
	}
	
	@SceneStorage("SelectedTab") var selectedTab = Tabs.home
	@StateObject var data = TransactData()
	
    var body: some View {
		TabView(selection: $selectedTab) {
			MainView(data: data)
				.tabItem({ Label("Home", systemImage: "house") })
				.tag(Tabs.home)
			
			TransactSettingsView(data: data)
				.tabItem({ Label("Settings", systemImage: "gear") })
				.tag(Tabs.settings)
		}
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
