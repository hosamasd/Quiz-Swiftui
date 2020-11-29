//
//  QuestionView.swift
//  Quiz Swiftui
//
//  Created by Hossam on 11/29/20.
//

import SwiftUI

struct QuestionView: View {
    
    @Binding var question: Question
    @Binding var correct: Int
    @Binding var wrong: Int
    @Binding var answered: Int
    
    @State var selected = ""
    
    var body: some View {
        
        VStack(spacing:22) {
            
            Text(question.question!)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.top,25)
            
            Spacer(minLength: 0)
            
            Button(action: {selected = question.optionA!}, label: {
                Text(question.optionA!)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(getColor(option: question.optionA!),lineWidth: 1)
                    )
                
            })
            
            Button(action: {selected = question.optionB!}, label: {
                Text(question.optionB!)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(getColor(option: question.optionB!),lineWidth: 1)
                    )
                
            })
            
            Button(action: {selected = question.optionC!}, label: {
                Text(question.optionC!)
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(getColor(option: question.optionC!),lineWidth: 1)
                    )
                
            })
            
            Spacer(minLength: 0)
            
            //buttons
            
            HStack(spacing:15){
                
                Button(action: checkAnser, label: {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(
                               Color.blue
                         )
                        .cornerRadius(15)
                })
                //disablimg
                .disabled(question.isSubmitted ? true : false)
                .opacity(question.isSubmitted ? 0.7 : 1)
                
                Button(action:{withAnimation{question.completed.toggle()}}, label: {
                    Text("Next")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.blue
                        )
                        .cornerRadius(15)
                    
                })
                //disablimg
                .disabled(!question.isSubmitted ? true : false)
                .opacity(!question.isSubmitted ? 0.7 : 1)
                
            }
            .padding(.bottom)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: -5, y: -5)
    }
    
    // highlighting answer...
    func getColor(option: String)->Color{
        
        if option == selected{
            
            // displaying if correct means green else red...
            
            if question.isSubmitted{
                
                if selected == question.answer!{
                    return Color.green
                }
                else{
                    return Color.red
                }
            }
            else{
                return Color.blue
            }
        }
        else{
            
            // displaying right if wrong selected....
            if question.isSubmitted && option != selected{
                
                if question.answer! == option{return Color.green}
            }
            return Color.gray
        }
    }
    
    func checkAnser()  {
        if selected == question.answer! {
            correct += 1
        }else {
            wrong += 1
        }
        question.isSubmitted.toggle()
    }
    
}

//struct QuestionView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuestionView(question: ., correct: <#Binding<Int>#>, wrong: <#Binding<Int>#>, answered: <#Binding<Int>#>)
//    }
//}
