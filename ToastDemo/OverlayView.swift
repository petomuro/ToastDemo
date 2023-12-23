//
//  OverlayView.swift
//  ToastDemo
//
//  Created by Peter Murín on 21/12/2023.
//

import SwiftUI

struct OverlayView<OverlayContent: View>: ViewModifier {
    @Binding var isPresented: Bool

    var modalContent: OverlayContent

    func body(content: Content) -> some View {
        GeometryReader { _ in
            ZStack {
                content

                VStack {
                    if isPresented {
                        modalContent
                    } else {
                        Spacer()
                    }
                }
            }
        }
    }
}

struct OverlayView_Previews: PreviewProvider {
    @StateObject static var toastManager = ToastManager()

    static var previews: some View {
        ContentView()
            .overlayModal(isPresented: .constant(true), modalContent: toastManager.toastView)
            .environmentObject(toastManager)
    }
}
