//
//  ContentView.swift
//  Modulo7Desafio
//
//  Created by danielmateos14 on 04/09/23.
//

import SwiftUI
import UIKit

struct HomeView: View {
    var body: some View {
        VStack() {
            ImageWomanView()
            CarouselView()
            ButtonView()
        }
    }
}

struct ImageWomanView: View {
    var body: some View {
        VStack {
            Image("mujer")
                .resizable()
                .frame(width: 300, height: 350)
        }
        .padding(.top, 90)
    }
}



struct CarouselView: View {
    var body: some View {
        TabView {
            CarouselPageView(title1: "Coffe so good, your", title2: "buds will love it", title3: "The best grain, the fitnest roast, the", title4: "most powerful flavour")
                .tag(0)
            CarouselPageView(title1: "Coffe so good, your", title2: "buds will love it", title3: "The best grain, the fitnest roast, the", title4: "most powerful flavour")
                .tag(1)
            CarouselPageView(title1: "Coffe so good, your", title2: "buds will love it", title3: "The best grain, the fitnest roast, the", title4: "most powerful flavour")
                .tag(1)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
}

struct CarouselPageView: View {
    var title1: String
    var title2: String
    var title3: String
    var title4: String
    
    var body: some View {
        VStack {
            Text(title1)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding()
            Text(title2)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding()
                .padding(.top, -40)
            Text(title3)
                .font(.system(size: 19))
                .foregroundColor(.gray)
                .padding()
                .padding(.top, -20)
            Text(title4)
                .font(.system(size: 19))
                .foregroundColor(.gray)
                .padding()
                .padding(.top, -40)
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, -45)
    }
}

struct ButtonView: View {
    @State private var detailsView: Bool = false
    var body: some View {
        VStack {
            VStack{
                Image(systemName: "arrow.forward")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .onTapGesture {
                        detailsView.toggle()
                    }
                    .fullScreenCover(isPresented: $detailsView) {
                        CoffeDetailsView()
                    }
                    .padding(16)
                    .background(Extras().elementsColor)
                    .cornerRadius(30)
            }
            .padding(.top, 10)
            .padding(.bottom, 50)
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}
