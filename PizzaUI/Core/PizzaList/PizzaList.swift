//
//  PizzaList.swift
//  PizzaUI
//
//  Created by Brenda Saavedra Cantu on 19/10/23.
//

import SwiftUI

struct PizzaList: View {
    var body: some View {
            ZStack {
                // Circle background
                Circle()
                    .frame(width: UIScreen.main.bounds.size.width * 2)
                    .foregroundStyle(Color.pBackground)
                    .offset(y: -300)
                
                VStack {
                    // Navbar
                    NavBar
                    
                    // Carrousel
                    
                    
                    // Sizes
                    
                    // Details
                    
                    // Quantity
                    Spacer()
                }
                .padding()
            }
            
    }
}

extension PizzaList {
    var NavBar: some View {
        HStack {
            getCircleButton(for: "arrow.left", action: {})
               
            Spacer()
            
            VStack(alignment: .center) {
                Text("Pizzas")
                    .font(.figtree(.regular, size: 16))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.black.opacity(0.7))
                
                Text("Pepperoni Blast")
                    .font(.figtree(.semibold))
                  .multilineTextAlignment(.center)
                  .foregroundColor(.black)
            }
            
            Spacer()
            
            getCircleButton(for: "heart", action: {})
        }
        .frame(maxWidth: UIScreen.main.bounds.size.width - 30)
    }
    
    @ViewBuilder
    func getCircleButton(for image: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Circle()
                .frame(width: 48)
                .foregroundStyle(.white)
                .overlay {
                    Image(systemName: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                    
                }
        }
    }
}

// MARK: - Previews
#Preview {
    PizzaList()
}
