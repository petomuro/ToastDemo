//
//  ToastManager.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

class ToastManager: ObservableObject {
    @Published public var showToast: Bool = false

    public var toasts: [String] = [] {
        didSet {
            if toasts.isEmpty {
                showToast = false
            } else {
                showToast = true
            }
        }
    }

    func show(toast: String) {
        toasts.insert(toast, at: 0)

        Task {
            try await Task.sleep(nanoseconds: 4_000_000_000)

            await MainActor.run {
                closeToast()
            }
        }
    }

    func toastView() -> some View {
        if let toast = toasts.first {
            return Toast(toast: toast)
        }

        return Toast(toast: "")
    }

    func closeToast() {
        if !toasts.isEmpty {
            toasts.removeLast()
        }
    }
}
