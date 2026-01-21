//
//  MainTabView.swift
//  Compare Yourself
//
//  Created by Hubert Wojtowicz on 18/01/2026.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject private var container: DependencyContainer
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let container = DependencyContainer()
    MainTabView()
        .environmentObject(container)
}
