//
//  ToastView.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

struct ToastView: ViewModifier {
    @Binding var isPresented: Bool

    @State private var hostingController: UIHostingController<Toast>? = nil

    let message: String?

    func showToast(message: String) {
        let swiftUIView = Toast(message: message)
        hostingController = UIHostingController(rootView: swiftUIView)
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

            UIView.animate(withDuration: 0.5) {
                hostingController?.view.frame.origin.y = window.frame.height - contentSize.height
                hostingController?.view.frame.size.height = contentSize.height
            }
        }
    }

    func dismissToast() {
        hostingController?.view.removeFromSuperview()
        hostingController = nil
    }

    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content

            if isPresented, let message = message {
                VStack {}
                    .onAppear {
                        showToast(message: message)
                    }
                    .onChange(of: message) { newValue in
                        dismissToast()
                        showToast(message: newValue)
                    }
                    .onDisappear {
                        dismissToast()
                    }
            }
        }
    }
}
