//
//  FourthView.swift
//  SwiftUIProject
//
//  Created by Melike Yayla on 4.04.2023.
//

import SwiftUI

struct FourthView: View {
    
    @State var myName = "Melike" //Değiştirilebilir ve görünümü render yapar
    
    
    
    var body: some View {
        VStack{
            Text(myName)
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                self.myName = "James"
                
            }) {
                Text ("My button")
            }

        }
        
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
