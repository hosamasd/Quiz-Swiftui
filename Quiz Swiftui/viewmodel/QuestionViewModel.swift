//
//  QuestionViewModel.swift
//  Quiz
//
//  Created by Balaji on 28/11/20.
//

import SwiftUI
import Firebase

class QuestionViewModel: ObservableObject {

    @Published var questions : [Question] = []
    
    
    func addCollection()  {
        let db = Firestore.firestore()
        
        let ff:[String:Any] =  ["question": " How do you declare an Iboutlet property? ", "a": "BOutlet var button:UIButton", "b": "var button:UIButton(IBOutlet)", "c": "None of the mentioned", "answer": "None of the mentioned"]
        
        
        db.collection("Round_4").document().setData(ff) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    func getQuestions(set: String){
        
        // since were having only one set in firestore so were going to fetch that one only..
        // you can add round 2,3... into firestore and can be fetched....
        
        let db = Firestore.firestore()
        
        // change this to set.....
        db.collection(set).getDocuments { (snap, err) in
            
            guard let data = snap else{return}
            
            DispatchQueue.main.async {
                
                self.questions = data.documents.compactMap({ (doc) -> Question? in
                    return try? doc.data(as: Question.self)
                })
            }
        }
    }
}
