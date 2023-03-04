//
//  FancyToastView.swift
//  TPDemo
//
//  Created by Jose David Sanluis Castillo on 28/02/23.
//

import SwiftUI

struct FancyToastView: View {
    var type: FancyToastStyle
    var message: String
    var onCancelTapped: (() -> Void)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    Text(message)
                        .font(.system(size: 20))
                        .foregroundColor(Color.white)
                }
                
                Spacer(minLength: 10)
            }
            .padding()
        }
        .background(type.themeColor)
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.25),
                radius: 4,
                x: 0,
                y: 1)
        .padding(.horizontal, 16)
    }
}

extension View {
    func toastView(toast: Binding<FancyToast?>) -> some View {
        self.modifier(FancyToastModifier(toast: toast))
    }
}

struct FancyToastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FancyToastView(
                type: .error,
                message: "Try again later!") {}
            
            FancyToastView(
                type: .success,
                message: "Product Added to WhisList") {}
        }
    }
}

