//
//  Toast.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

// MARK: - Basic variables and initializers

public struct Toast: View {
    @State private var hostingController: UIHostingController<AnyView>?

    let toast: String

    public init(toast: String) {
        self.toast = toast
    }
}

// MARK: - Functions

private extension Toast {
    func showToast(toast: String) {
        let swiftUIView = toastContent(toast: toast)
        hostingController = UIHostingController(rootView: AnyView(swiftUIView))
        hostingController?.view.backgroundColor = .clear
        hostingController?.view.frame = CGRect(
            x: 0,
            y: UIScreen.main.bounds.height,
            width: UIScreen.main.bounds.width,
            height: 0)

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.addSubview(hostingController!.view)

            hostingController?.view.center.x = window.center.x

            let contentSize = hostingController!.view.sizeThatFits(CGSize(
                width: UIScreen.main.bounds.width,
                height: .greatestFiniteMagnitude))

            // If anybody wants to animate toast appear, you have to do it here
            UIView.animate(withDuration: 0.3) {
                hostingController?.view.frame.origin.y = window.frame.height - contentSize.height
                hostingController?.view.frame.size.height = contentSize.height
            }
        }
    }

    func dismissToast() {
        // If anybody wants to animate toast dismiss, you have to do it here
        UIView.animate(withDuration: 0.3) {
            hostingController?.view.frame = CGRect(
                x: 0,
                y: UIScreen.main.bounds.height,
                width: UIScreen.main.bounds.width,
                height: 0)
            hostingController?.view.alpha = 0
        }

        // TODO: This cause strange behavior but I need to clear that hostingController somehow
        /* Task {
            try await Task.sleep(nanoseconds: 300_000_000)

            hostingController?.view.removeFromSuperview()
            hostingController = nil
        } */
    }
}

// MARK: - Component

public extension Toast {
    var body: some View {
        VStack {}
            .onAppear {
                showToast(toast: toast)
            }
            .onChange(of: toast) { newValue in
                dismissToast()
                showToast(toast: newValue)
            }
            .onDisappear {
                dismissToast()
            }
    }
}

// MARK: - Component parts

private extension Toast {
    @ViewBuilder
    func toastContent(toast: String) -> some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Text(toast)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 11)
            .padding(.horizontal, 20)
            .background(
                .gray
                    .opacity(0.6)
            )
            .cornerRadius(.infinity)
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
    }
}
