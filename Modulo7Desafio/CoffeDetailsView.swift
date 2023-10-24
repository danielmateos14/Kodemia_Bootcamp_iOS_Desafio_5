//
//  CoffeDetailsView.swift
//  Modulo7Desafio
//
//  Created by danielmateos14 on 05/09/23.
//

import SwiftUI

struct CoffeDetailsView: View {
    var body: some View {
        ZStack {
            Color(Extras().generalBackgroundColor)
            VStack {
                TitleCoffeDetailsView()
                CarruselCoffeDetailsView()
                SubtitleCoffeDetailsView()
                ListProductsCoffeDetailsView()
                AboutCoffeDetailsView()
                Spacer()
                BottomBarCoffDetailsView()
            }
        }.background(ignoresSafeAreaEdges: .all)
    }
}
struct CoffeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeDetailsView()
    }
}

struct TitleCoffeDetailsView: View {
    @State private var backHomeView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        HStack(spacing: 80){
            Image(systemName: "chevron.backward")
                .resizable()
                .frame(width: 10, height: 15)
                .padding(.top, -5)
                .foregroundColor(Extras().elementsColor)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            HStack {
                Image(systemName: "location.north.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Bronx, NYC")
                    .bold()
                    .foregroundColor(Extras().elementsColor)
            }
            
            Image("tresPuntos")
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

struct CarruselCoffeDetailsView: View {
    var body: some View {
        TabView {
            CarouselPageCoffeDetailsView(imageUno: "cafe1")
            CarouselPageCoffeDetailsView(imageUno: "cafe2")
            CarouselPageCoffeDetailsView(imageUno: "cafe3")
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .frame(width: 350, height: 200)
        .cornerRadius(15)
    }
}



struct CarouselPageCoffeDetailsView: View {
    var imageUno: String
    
    var body: some View {
        VStack {
            Image(imageUno)
                .resizable()
                .cornerRadius(10)
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top, -30)
    }
}

struct SubtitleCoffeDetailsView: View {
    var body: some View {
        VStack {
            HStack(spacing: 140){
                Text("Tony's Coffe")
                    .font(.title)
                    .bold()
                    .foregroundColor(Extras().elementsColor)
                Text("1.5 km")
                    .foregroundColor(Extras().elementsColor)
            }
            HStack(spacing: 10){
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.yellow)
                Text("4.9")
                    .font(.title)
                    .foregroundColor(Extras().elementsColor)
                Text("(623 Reviews)")
                    .foregroundColor(Extras().elementsColor)
            }
            .padding(.leading, -150)
        }
    }
}

struct ListProductsCoffeDetailsView: View {
    var body: some View {
        HStack(spacing: 15) {
            VStack {
                VStack{
                    Image(systemName: "cup.and.saucer.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Extras().elementsColor)
                }
                .padding(15)
                .background(Extras().backgroundElementosColor)
            .cornerRadius(15)
                Text("Coffe")
                    .foregroundColor(Extras().elementsColor)
            }
            VStack {
                VStack{
                    Image(systemName: "takeoutbag.and.cup.and.straw")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Extras().elementsColor)
                }
                .padding(15)
                .background(Extras().backgroundElementosColor)
            .cornerRadius(15)
                Text("Sippy Cups")
                    .foregroundColor(Extras().elementsColor)
            }
            VStack {
                VStack{
                    Image(systemName: "sun.max.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Extras().elementsColor)
                }
                .padding(15)
                .background(Extras().backgroundElementosColor)
            .cornerRadius(15)
                Text("Donuts")
                    .foregroundColor(Extras().elementsColor)
            }
            VStack {
                VStack{
                    Image(systemName: "ellipsis.rectangle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Extras().elementsColor)
                }
                .padding(15)
                .background(Extras().backgroundElementosColor)
            .cornerRadius(15)
                Text("Cookies")
                    .foregroundColor(Extras().elementsColor)
            }
            
            
        }
    }
}

struct AboutCoffeDetailsView: View {
    var body: some View {
        VStack(spacing: 6) {
            Text("About")
                .font(.system(size: 20))
                .foregroundColor(Extras().elementsColor)
                .bold()
                .padding(.leading, -170)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
                .font(.system(size: 15))
                .foregroundColor(Extras().elementsColor)
                .padding(.leading, 10)
                .padding(.trailing, 15)
        }
        .padding(.top, 10)
    }
}

struct BottomBarCoffDetailsView: View {
    @State private var goListProductsView: Bool = false
    var body: some View {
        HStack(spacing: 30){
            VStack {
                VStack{
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                .padding(12)
                .background(Extras().elementsColor)
                .cornerRadius(15)
            }
            VStack {
                VStack{
                    Text("Book a table")
                        .frame(width: 200, height: 30)
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .bold()
                        .onTapGesture {
                            goListProductsView.toggle()
                        }
                        .fullScreenCover(isPresented: $goListProductsView) {
                            ListProductsView()
                        }
                }
                .padding(12)
                .background(Extras().elementsColor)
                .cornerRadius(15)
            }
        }
        .frame(width: 380, height: 70)
        .background(.white)
        .shadow(color: .gray, radius: 7, x: 0, y: 0)
        .padding(.bottom, -15)
    }
}


//struct TabBarCoffDetailsView: View {
//    @State private var selectedTab = 0
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            Text("")
//                .tabItem {
//                    Image(systemName: "heart")
//                }
//                .padding(15)
//                .background(Color.gray)
//                .cornerRadius(15)
//
//            Text("")
//                .tabItem {
//                    Image(systemName: "list.dash")
//                    Text("Lista")
//                }
//                .tag(1)
//
//            Text("")
//                .tabItem {
//                    Image(systemName: "person")
//                    Text("Perfil")
//                }
//                .tag(2)
//        }
//    }
//}
