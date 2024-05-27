//
//  ContentView.swift
//  Rosbeads Watch App
//
//  Created by Jonathan Andrew Yoel on 20/05/24.
//

import SwiftUI

struct ContentView: View {
        
    var body: some View {
        NavigationStack {
            List{
                NavigationLink(destination: PeristiwaGembira()){
                    Image("PeristiwaGembira")
                        .resizable()
                        .scaledToFit()
                }
                .listRowBackground(Color.clear)
                NavigationLink(destination: PeristiwaSedih()){
                    Image("PeristiwaSedih")
                        .resizable()
                        .scaledToFit()
                }
                .listRowBackground(Color.clear)
                NavigationLink(destination: PeristiwaTerang()){
                    Image("PeristiwaTerang")
                        .resizable()
                        .scaledToFit()
                }
                .listRowBackground(Color.clear)
                NavigationLink(destination: PeristiwaMulia()){
                    Image("PeristiwaMulia")
                        .resizable()
                        .scaledToFit()
                }
                .listRowBackground(Color.clear)
            }
            .navigationTitle("Rosbeads")
            .listStyle(.carousel)
        }
        //Warna aslinya
//        .background(
//            LinearGradient(
//                stops: [
//                    Gradient.Stop(color: Color(red: 0.76, green: 0.39, blue: 0.18), location: 0.35),
//                    Gradient.Stop(color: Color(red: 0.74, green: 0.58, blue: 0.5), location: 0.79),
//                ],
//                startPoint: UnitPoint(x: 0.5, y: 0),
//                endPoint: UnitPoint(x: 0.5, y: 1)
//            )
//        )
    }
}

//struct ContentView: View {
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack {
//                    NavigationLink(destination: PeristiwaGembira()){
//                        Image("PeristiwaGembira")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: .infinity, height: 60)
//                    }
//                    
//                    NavigationLink(destination: EmptyView()){
//                        Image("PeristiwaSedih")
//                            .resizable()
//                            .scaledToFit()
//                    }
//                    
//                    NavigationLink(destination: EmptyView()){
//                        Image("PeristiwaMulia")
//                            .resizable()
//                            .scaledToFit()
//                    }
//                    
//                    NavigationLink(destination: EmptyView()){
//                        Image("PeristiwaTerang")
//                            .resizable()
//                            .scaledToFit()
//                    }
//                }
//            }
//            .navigationTitle("Rosbeads")
//            .background(
//                LinearGradient(
//                    stops: [
//                        Gradient.Stop(color: Color(red: 0.76, green: 0.39, blue: 0.18), location: 0.35),
//                        Gradient.Stop(color: Color(red: 0.74, green: 0.58, blue: 0.5), location: 0.79),
//                    ],
//                    startPoint: UnitPoint(x: 0.5, y: 0),
//                    endPoint: UnitPoint(x: 0.5, y: 1)
//                )
//            )
//        }
//    }
//}


#Preview {
    ContentView()
}
