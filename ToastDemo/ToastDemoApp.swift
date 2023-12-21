//
//  ToastDemoApp.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

@main
struct ToastDemoApp: App {
    @StateObject private var toastManager = ToastManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .overlayModal(isPresented: $toastManager.showToast, modalContent: toastManager.toastView)
                .environmentObject(toastManager)
        }
    }
}
