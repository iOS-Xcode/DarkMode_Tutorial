//
//  ContentView.swift
//  DarkMode_Tutorial
//
//  Created by Seokhyun Kim on 2021-05-27.
//

import SwiftUI

struct ContentView: View {
    @State fileprivate var shouldShowAlert = false
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack {
//            Color.yellow
            Theme.myBackgroundColor(forScheme: scheme)
            VStack{
                Spacer()
                Button(action: {
                    print("Button clicked")
                    shouldShowAlert.toggle()
                }, label: {
                    Text("로그인 하러 가기")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Theme.myButtonBackgroundColor(forScheme: scheme))
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.white, lineWidth: 3)
                        )
                })
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("Hello"), message: Text("Coding hard"), dismissButton: .default(Text("Close")))
                })
                Spacer().frame(height: 100)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.white
        let darkColor = Color.init(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
    
    static func myButtonBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.gray
        let darkColor = Color.init(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
}
