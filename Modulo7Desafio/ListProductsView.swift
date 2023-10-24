//
//  ListProductsView.swift
//  Modulo7Desafio
//
//  Created by danielmateos14 on 05/09/23.
//

import SwiftUI

struct ListProductsView: View {
    var body: some View {
        ZStack {
            Color(Extras().generalBackgroundColor)
            VStack {
                HeaderProductListView()
                SearchBarProductListView()
                CollectionListHorizontalProductListView()
                SubtitleProductListView()
                CollectionViewHorizontalProductListView()
                Subtitle2ProductListView()
                CollectionViewVerticalProductListView()
                Spacer()
                BottomBarProductListView()
            }
        }.background(ignoresSafeAreaEdges: .all)
    }
}

struct ListProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ListProductsView()
    }
}

struct HeaderProductListView: View {
    var body: some View {
        HStack(spacing: 90){
            VStack{
                HStack{
                    Text("Good morning")
                        .foregroundColor(Extras().elementsColor)
                    Image(systemName: "hand.raised.fill")
                        .foregroundColor(.yellow)
                }
                .padding(.leading, -60)
                Text("Doris Wilkerson")
                    .foregroundColor(Extras().elementsColor)
                    .font(.system(size: 30))
            }
            Image(systemName: "bell.fill")
                .resizable()
                .foregroundColor(Extras().elementsColor)
                .frame(width: 30, height: 30)
        }
        .padding(.top, 20)
    }
}

struct SearchBarProductListView: View {
    @State private var buscar: String = ""
    var body: some View {
        HStack(spacing: 10){
            HStack(spacing: 10){
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 30, height: 30)
                TextField("Search", text: $buscar)
                    .frame(width: 200)
            }
            .frame(height: 50)
            .background(.white)
            .cornerRadius(20)
            Image("btnbuscar")
                .resizable()
                .frame(width: 60, height: 60)
        }
        
    }
}

struct CollectionListHorizontalProductListView: View {
    @State private var selectedText: String? = nil

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(["Capuccino", "Espresso", "Late", "Americano", "Mockaccino"], id: \.self) { text in
                    ZStack(alignment: .bottom) {
                        Text(text)
                            .foregroundColor(selectedText == text ? Extras().elementsColor : .gray)
                            .onTapGesture {
                                selectedText = text
                            }
                        
                        Circle()
                            .fill(Extras().elementsColor)
                            .frame(width: 8, height: 8)
                            .opacity(selectedText == text ? 1.0 : 0.0)
                            .padding(.bottom, -9)
                    }
                }
            }
            .frame(height: 40)
        }
        .frame(height: 20)
        .padding()
    }
}

struct SubtitleProductListView: View {
    @State private var buscar: String = ""
    var body: some View {
        HStack(spacing: 160){
            Text("Near by place")
                .font(.system(size: 20))
                .foregroundColor(Extras().elementsColor)
                .bold()
            Text("See all")
                .font(.system(size: 15))
                .foregroundColor(Extras().elementsColor)
                .padding(.top, 5)
        }
    }
}


struct CollectionViewHorizontalProductListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                CollectionViewHorizontalVistasProductListView(image1: "cafe1", image2: "star.fill", title1: "Tony's Coffe", title2: "1.5 km", title3: "4.9", title4: "(623 Reviews)")
                CollectionViewHorizontalVistasProductListView(image1: "cafe2", image2: "star.fill", title1: "Devilla's Coffe", title2: "2.0 km", title3: "4.8", title4: "(823 Reviews)")
                CollectionViewHorizontalVistasProductListView(image1: "cafe3", image2: "star.fill", title1: "Isaac Coffe", title2: "120 km", title3: "2.0", title4: "(10,000 Reviews)")
            }
        }
        .frame(height: 200)
    }
}

struct CollectionViewHorizontalVistasProductListView: View {
    var image1: String
    var image2: String
    var title1: String
    var title2: String
    var title3: String
    var title4: String
    
    var body: some View {
        VStack{
            VStack {
                Image(image1)
                    .resizable()
                    .frame(width: 200, height: 120)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            .padding(.top, 10)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            VStack {
                HStack(spacing: 30){
                    Text(title1)
                        .font(.system(size: 20))
                        .foregroundColor(Extras().elementsColor)
                        .bold()
                    Text(title2)
                        .foregroundColor(Extras().elementsColor)
                }
                HStack(spacing: 10){
                    Image(systemName: image2)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.yellow)
                        .padding(.bottom, 10)
                    Text(title3)
                        .font(.system(size: 15))
                        .foregroundColor(Extras().elementsColor)
                        .padding(.bottom, 10)
                    Text(title4)
                        .font(.system(size: 15))
                        .foregroundColor(Extras().elementsColor)
                        .padding(.bottom, 10)
                }
                .padding(.leading, -35)
            }
        }
        .background(.white)
        .cornerRadius(10)
        .padding(.top, 10)
        .padding(.bottom, 12)
        .padding(.leading, 20)
        .shadow(color: Color.gray, radius: 8, x: 5, y: 5)
        
    }
}

struct Subtitle2ProductListView: View {
    @State private var buscar: String = ""
    var body: some View {
        HStack(spacing: 160){
            Text("Special for you")
                .font(.system(size: 20))
                .foregroundColor(Extras().elementsColor)
                .bold()
            Text("See all")
                .font(.system(size: 15))
                .foregroundColor(Extras().elementsColor)
                .padding(.top, 5)
        }
        .padding(.top, 20)
        
    }
}

struct CollectionViewVerticalProductListView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                CollectionViewVerticalVistasProductListView(image1: "cafe1", title1: "25% discount", title2: "Get three ice flovoured", title3: "Capuccinos", title4: "Offer valid till 31 Oct to 05 Nov")
                CollectionViewVerticalVistasProductListView(image1: "cafe2", title1: "25% discount", title2: "Get three ice flovoured", title3: "Capuccinos", title4: "Offer valid till 31 Oct to 05 Nov")
                CollectionViewVerticalVistasProductListView(image1: "cafe3", title1: "25% discount", title2: "Get three ice flovoured", title3: "Capuccinos", title4: "Offer valid till 31 Oct to 05 Nov")
            }
        }
        .frame(height: 200)
    }
}

struct CollectionViewVerticalVistasProductListView: View {
    var image1: String
    var title1: String
    var title2: String
    var title3: String
    var title4: String
    
    var body: some View {
        HStack(spacing: 10){
            VStack {
                Image(image1)
                    .resizable()
                    .frame(width: 110, height: 110)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            .padding(.top, -1)
            .padding(.leading, -6)
//            .padding(.trailing, 10)
            VStack (spacing: 12){
                VStack(spacing: 0){
                    Text(title1)
                        .frame(width: 110, height: 30)
                        .foregroundColor(.white)
                        .background(Extras().elementsColor)
                        .cornerRadius(20)
                        .font(.system(size: 13))
                        .bold()
                        .padding(.top, 10)
                        .padding(.leading, -90)
                }
                Text(title2)
                    .font(.system(size: 19))
                    .foregroundColor(Extras().elementsColor)
                    .bold()
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                Text(title3)
                    .font(.system(size: 19))
                    .foregroundColor(Extras().elementsColor)
                    .bold()
                    .padding(.trailing, 95)
                    .padding(.top, -7)
                Text(title4)
                    .font(.system(size: 10))
                    .foregroundColor(Extras().elementsColor)
                    .padding(.top, -5)
                    .padding(.leading, -50)
            }
        }
        .frame(width: 350, height: 130)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 1, x: 2, y: 3)
    }
}

struct BottomBarProductListView: View {
    @State private var selectedImageIndex: Int? = nil
    @State private var backHome: Bool = false
    
    let iconNames = ["house.fill", "heart.fill", "bag.fill", "person.fill"]
    
    var body: some View {
        HStack(spacing: 60){
            ForEach(0..<iconNames.count, id: \.self) { index in
                ZStack(alignment: .bottom) {
                    let iconName = iconNames[index]
                    
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(selectedImageIndex == index ? Extras().elementsColor : .gray)
                        .onTapGesture {
                            selectedImageIndex = index
                            if selectedImageIndex == 0 {
                                backHome.toggle()
                            }
                        }
                        .fullScreenCover(isPresented: $backHome) {
                            HomeView()
                        }
                    
                    Circle()
                        .fill(Extras().elementsColor)
                        .frame(width: 8, height: 8)
                        .opacity(selectedImageIndex == index ? 1.0 : 0.0)
                        .padding(.bottom, -120)
                }
            }
        }
        .frame(width: 380, height: 80)
        .background(Color.white)
        .padding(.bottom, -15)
    }
}


