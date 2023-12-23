//
//  ContentView.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var toastManager: ToastManager

    private let toast: String = "Text Text Text Text Text Text Text"
    private let secondToast: String = """
    Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text \
    Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
    """

    var body: some View {
        VStack {
            Group {
                Button(action: {
                    toastManager.show(toast: toast)
                }, label: {
                    Text("Short text toast")
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity)
                })

                Button(action: {
                    toastManager.show(toast: secondToast)
                }, label: {
                    Text("Long text toast")
                        .font(.system(size: 16))
                        .frame(maxWidth: .infinity)
                })
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var toastManager = ToastManager()

    static var previews: some View {
        ContentView()
            .environmentObject(toastManager)
    }
}
