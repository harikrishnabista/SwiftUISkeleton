//
//  FormButton.swift
//  SearchPlaces
//
//  Created by Hari Krishna Bista on 5/6/23.
//

import SwiftUI

struct FormButton: View {
    
    @Binding var isEnabled: Bool
    @Binding var title: String
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(
                    .system(
                        size: 16,
                        weight: .bold,
                        design: .default
                    )
                )
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 45, maxHeight: 45)
                .background(isEnabled ? Color.green : Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 23))
        }
        .disabled(!isEnabled)
    }
}

struct FormButton_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            FormButton(
                isEnabled: .constant(true),
                title: .constant("Confirm")
            ) {
                print("")
            }
            
            FormButton(
                isEnabled: .constant(false),
                title: .constant("Confirm")
            ) {
                print("")
            }
        }
    }
}
