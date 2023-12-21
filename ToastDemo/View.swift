//
//  View.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func overlayModal<ModalContent: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder modalContent: @escaping () -> ModalContent) -> some View {
            modifier(OverlayView(isPresented: isPresented, modalContent: modalContent()))
        }
}
