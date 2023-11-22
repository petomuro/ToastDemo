//
//  Toast.swift
//  ToastDemo
//
//  Created by Peter Murín on 22/11/2023.
//

import SwiftUI

struct Toast: View {
    let message: String

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                Text(message)
                    .font(.system(size: 14))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 11)
            .padding(.horizontal, 20)
            .background(Color(red: 0.2, green: 0.2, blue: 0.2).opacity(0.6))
            .cornerRadius(.infinity)
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
    }
}
