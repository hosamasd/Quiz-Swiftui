//
//  Home.swift
//  Quiz Swiftui
//
//  Created by Hossam on 11/29/20.
//

import SwiftUI

struct Home: View {
    
    @State var show=false
    @State var set=""
    // for analytics....
    @State var correct = 0
    @State var wrong = 0
    @State var answered = 0
    
    var body: some View {
        
        VStack{
            
            Text("Homam Mohamed")
                .font(.system(size: 38))
                .fontWeight(.heavy)
                .foregroundColor(.purple)
                .padding(.top)
            
            Text("Choose the way \nyou play !!!")
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.top,8)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            // Level View...
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 2),spacing: 35, content: {

                ForEach(1...4,id: \.self){index in
                
                Image("lv\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)

                Text("SwiftUI Quiz")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)

                Text("LEVEL \(index)")
                    .foregroundColor(.black)
                }
                .padding()
                .frame(maxWidth:.infinity)
                .background(Color.white)
                .cornerRadius(15)

                .onTapGesture(perform: {
                    set = "Round_\(index)"
                    self.show.toggle()
                })
            })
            .padding()
            
            Spacer(minLength: 0)
            
            }
        .background(Color.black.opacity(0.05).ignoresSafeArea())
        
        .sheet(isPresented: $show, content: {
            QAView(correct: $correct, wrong: $wrong,answered: $answered)
        })
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
