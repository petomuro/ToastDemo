//
//  ToastManager.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

class ToastManager: ObservableObject {
    @Published var lastToast: String?
    @Published var showToast = false

    init(lastToast: String? = nil, showToast: Bool = false) {
        self.lastToast = lastToast
        self.showToast = showToast
    }

    func show(toast: String) {
        lastToast = toast

        withAnimation {
            showToast = true
        }

        Task {
            try await Task.sleep(nanoseconds: 4_000_000_000)

            await MainActor.run {
                withAnimation {
                    showToast = false
                }
            }
        }
    }
}
