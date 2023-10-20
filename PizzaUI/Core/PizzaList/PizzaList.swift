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
                    Carrousel
                    
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
    
    var Carrousel: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                  ForEach(Pizza.MOCK_PIZZAS) { pizza in
                    Image(pizza.image)
                        .resizable()
                        .frame(width: 244, height: 244)
                        .scaledToFill()
                        .scrollTransition(.animated, axis: .horizontal) {
                            content, phase in
                            content
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.5)
                        }
                }
            }.scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .frame(maxWidth: 300, maxHeight: 300)
        .safeAreaPadding(.horizontal, 40)
    }
}

// MARK: - Previews
#Preview {
    PizzaList()
}
