//
//  View.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

extension View {
    func toastView(isPresented: Binding<Bool>, message: String?) -> some View {
        self.modifier(ToastView(isPresented: isPresented, message: message))
    }
}
