//
//  QAView.swift
//  Quiz Swiftui
//
//  Created by Hossam on 11/29/20.
//

import SwiftUI

struct QAView: View {
    
    @Binding var correct : Int
    @Binding var wrong: Int
    @Binding var answered: Int
    @StateObject var data = QuestionViewModel()
    var set: String = "Round_1"
    
    var body: some View {
        
        ZStack {
        
            if data.questions.isEmpty{
                
                ProgressView()
            }
            else{
            
                if answered == data.questions.count{
                
        VStack {
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                
                Capsule()
                    .fill(Color.gray.opacity(0.7))
                    .frame(height:6)
                
                Capsule()
                    .fill(Color.green)
                    .frame(width:100,height:6)
                
            })
            .padding()
            
            //correct and wrong count
            
            HStack{
                
                Label(
                    title: { Text(correct == 0 ? "" : "\(correct)")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    },
                    icon: { Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                    }
                )
                
                Spacer()
                
                Label(
                    title: { Text(wrong == 0 ? "" : "\(wrong)")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    },
                    icon: { Image(systemName: "xmark")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    }
                )
                
            }
            .padding()
            
            Spacer(minLength: 0)
        }
                }  else{
                    
                    VStack{
                        
                        // Top Progress View...
                        
                        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                            
                            Capsule()
                                .fill(Color.gray.opacity(0.5))
                                .frame(height: 6)
                            
                            Capsule()
                                .fill(Color.green)
                                .frame(width: progress(), height: 6)
                        })
                        .padding()
                        
                        // Correct And Wrong Count...
                        
                        HStack{
                            
                            Label(
                                title: { Text(correct == 0 ? "" : "\(correct)")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                },
                                icon: { Image(systemName: "checkmark")
                                    .font(.largeTitle)
                                    .foregroundColor(.green)
                                })
                            
                            Spacer()
                            
                            Label(
                                title: { Text(wrong == 0 ? "" : "\(wrong)")
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                },
                                icon: { Image(systemName: "xmark")
                                    .font(.largeTitle)
                                    .foregroundColor(.red)
                                })
                        }
                        .padding()
                        .frame(height: 40)
                        
                        // QuestionView...
                        
                        ZStack{
                            
                            ForEach(data.questions.reversed().indices){index in
                                
                                // View...
                                
                                QuestionView(question: $data.questions[index], correct: $correct, wrong: $wrong, answered: $answered)
                                // if current question is completed means moving away...
                                    .offset(x: data.questions[index].completed ? 1000 : 0)
                                    .rotationEffect(.init(degrees: data.questions[index].completed ? 10 : 0))
                            }
                        }
                        .padding()
                    }
                }
        
        }
        }
        // fetching...
        .onAppear(perform: {
//            data.addCollection()
            data.getQuestions(set: set)
        })
    }
    
    // progres...
    
    func progress()->CGFloat{
        
        let fraction = CGFloat(answered) / CGFloat(data.questions.count)
        
        let width = UIScreen.main.bounds.width - 30
        
        return fraction * width
    }
    
}

struct QAView_Previews: PreviewProvider {
    static var previews: some View {
        QAView(correct: .constant(0), wrong: .constant(1),answered: .constant(0))
    }
}
