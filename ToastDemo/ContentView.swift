//
//  ContentView.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var toastManager: ToastManager

    var body: some View {
        /* EmptyView()
            .background(.red)
            .sheet(isPresented: .constant(true)) {
                VStack {
                    Button(action: {
                        toastManager.show(toast: "Text Text Text Text Text Text Text")
                    }, label: {
                        Text("SHORT TEXT TOAST")
                    })
                    .buttonStyle(.bordered)

                    Button(action: {
                        toastManager.show(
                            toast: """
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text \
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            """)
                    }, label: {
                        Text("LONG TEXT TOAST")
                    })
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } */

         /* EmptyView()
            .background(.red)
            .fullScreenCover(isPresented: .constant(true)) {
                VStack {
                    Button(action: {
                        toastManager.show(toast: "Text Text Text Text Text Text Text")
                    }, label: {
                        Text("SHORT TEXT TOAST")
                    })
                    .buttonStyle(.bordered)

                    Button(action: {
                        toastManager.show(
                            toast: """
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text \
                            Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                            """)
                    }, label: {
                        Text("LONG TEXT TOAST")
                    })
                    .buttonStyle(.bordered)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } */

        VStack {
            Button(action: {
                toastManager.show(toast: "Text Text Text Text Text Text Text")
            }, label: {
                Text("SHORT TEXT TOAST")
            })
            .buttonStyle(.bordered)

            Button(action: {
                toastManager.show(
                    toast: """
                    Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text \
                    Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text
                    """)
            }, label: {
                Text("LONG TEXT TOAST")
            })
            .buttonStyle(.bordered)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
