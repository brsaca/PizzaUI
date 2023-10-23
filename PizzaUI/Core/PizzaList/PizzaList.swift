//
//  PizzaList.swift
//  PizzaUI
//
//  Created by Brenda Saavedra Cantu on 19/10/23.
//

import SwiftUI

enum Sizes: String {
    case small = "S"
    case medium = "M"
    case large = "L"
    
    var pizzaWidth: CGFloat {
        switch (self){
        case .small: return 196
        case .medium: return 244
        case .large: return 274
        }
    }
}

struct PizzaList: View {
    // MARK: View Properties
    @State private var sizeSelected: Sizes = .medium
    @State private var pizzaSelected: Pizza = Pizza.MOCK_PIZZAS[0]
    @State private var isZoomOn: Bool = false
    @State private var quantity: Int = 1
    @State private var amount: Double = 0
    
    var body: some View {
        ZStack {
            if isZoomOn {
                Image(pizzaSelected.imageCompleted)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
                    .onTapGesture {
                        withAnimation {
                            isZoomOn.toggle()
                        }
                    }
                    .ignoresSafeArea(.all)
            } else {
                // Circle background
                Circle()
                    .frame(width: UIScreen.main.bounds.size.width * 2)
                    .foregroundStyle(Color.pBackground)
                    .offset(y: -280)
                
                VStack {
                    // Navbar
                    NavBar
                        .padding()
                    
                    // Carrousel
                    Carrousel
                    
                    // Sizes
                    Sizes
                        .padding()
                    
                    
                    Spacer()
                    
                    // Details
                    PizzaInfo

                }
                .frame(width: UIScreen.main.bounds.size.width)
            }
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
        .frame(maxWidth: UIScreen.main.bounds.size.width - 50)
    }
    
    @ViewBuilder
    func getCircleButton(for image: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Circle()
                .frame(width: 48)
                .foregroundStyle(.white)
                .shadow(radius: 5)
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
            LazyHStack(spacing: sizeSelected == .small ? 90 : (sizeSelected == .medium ? 30 : 0)) {
                ForEach(Pizza.MOCK_PIZZAS) { pizza in
                        ZStack {
                            Image(pizza.image)
                                .resizable()
                                .frame(width:  sizeSelected.pizzaWidth, height: sizeSelected.pizzaWidth)
                                .scaledToFill()
                                .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                    content
                                        .scaleEffect(phase.isIdentity ? 1.0 : 0.5)
                                }
                            
                            Button {
                                pizzaSelected = pizza
                                withAnimation {
                                    isZoomOn.toggle()
                                }
                                
                            } label: {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.white)
                                    .frame(width: 40, height: 40)
                                    .rotationEffect(Angle(degrees: 100))
                            }
                       
                    }
                    .frame(width: sizeSelected.pizzaWidth)
                    .padding(.top, sizeSelected == .small ? 20 : 10)
                }
            }.scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .frame(width: .infinity, height: 300)
    }
    
    var Sizes: some View {
        HStack {
            getCircleButtonWithLetter(for: .small, action: {
                sizeSelected = .small
                
                setTotalAmount()
            })
            
            Spacer()
            
            VStack {
                Image("banana")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 97, height: 63)
                
                getCircleButtonWithLetter(for: .medium, action: {
                    sizeSelected = .medium
                    
                    setTotalAmount()
                })
            }
            
            Spacer()
            
            getCircleButtonWithLetter(for: .large, action: {
                sizeSelected = .large
                
                setTotalAmount()
            })
        }
        .padding(.horizontal, 60)
        .padding(.top, -20)
    }
    
    @ViewBuilder
    func getCircleButtonWithLetter(for size: Sizes, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(size == sizeSelected ? .black : .white)
                    .frame(width: 48, height: 48)
                    .shadow(radius: 5)
                
                Text(size.rawValue)
                    .font(.figtree(.semibold, size: 18))
                    .foregroundColor(size == sizeSelected ? .white : .black)
            }
        }
    }
    
    var PizzaInfo: some View {
        VStack {
            Text(pizzaSelected.details)
                .font(.figtree(.regular, size: 14))
                .lineSpacing(10)
                .padding()
            
            HStack {
                getQuantityControl()
                
                Text(amount.formatWithCurrency())
                    .font(.figtree(.bold, size: 24))
                
                Button {
                    
                } label: {
                    Text("Add")
                        .font(.figtree(.bold))
                        .foregroundStyle(.white)
                }
                .frame(width: 83, height: 48)
                .background(Color.pButton)
                .clipShape(Capsule())
                .padding()
            }
            .padding(.vertical)
        }
        .onAppear {
            setTotalAmount()
        }
        
    }
    
    @ViewBuilder
    func getQuantityControl() -> some View {
        HStack {
            getCircleButton(for: "minus", action: {
                if (quantity > 1) {
                    quantity -= 1
                    setTotalAmount()
                }
            })
            
            Spacer()
            
            Text("\(quantity)")
                .font(.figtree(.bold, size: 24))
            
            Spacer()
            
            getCircleButton(for: "plus", action: {
                quantity += 1
                setTotalAmount()
            })
        }
        .frame(width: 144, height: 48)
        .background(Color.pBackground)
        .cornerRadius(48)
    }
}

extension PizzaList {
    private func setTotalAmount() {
        let price = switch sizeSelected {
        case .small: pizzaSelected.priceSmall
        case .medium: pizzaSelected.priceMedium
        case .large: pizzaSelected.priceLarge
        }
        amount = Double(quantity) * price
    }
}

// MARK: - Previews
#Preview {
    PizzaList()
}
