//
//  Registro Agua.swift
//  temp
//
//  Created by Turma02-Backup on 10/03/25.
//

import SwiftUI

struct Registro_Agua: View {
    var dados: Bool = true
    let actualDate = (Date.now)
    var meta: Int = 12
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Image(systemName: "drop.circle.fill")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundStyle(Color.blue)
                
                
                ZStack {
                    Rectangle()
                        .frame(width: 130.0, height: 30.0)
                        .foregroundStyle(Color.blue)
                        .cornerRadius(10)
                    
                    Text ("Metas de água")
                        .foregroundStyle(Color.white)
                }
            
                Spacer()
                
            }
            
            Spacer()
            
            ScrollView {
                
                ZStack {
                    
                    if (dados) {
                        Rectangle()
                        .foregroundStyle(Color.green)
                        .cornerRadius(10)
                        .shadow(color: .green ,radius: 3)
                    }
                    else {
                        Rectangle()
                            .foregroundStyle(Color.red)
                        .cornerRadius(10)
                        .shadow(color: .red ,radius: 3)
                    }
                    
                    Text (actualDate, format: .dateTime.day().month())
                        .offset(x:20)
                        .foregroundStyle(Color.white)

                }
            }
            ZStack {
                Rectangle()
                    .frame(width: 350.0, height: 30.0)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                
                Text ("Voce esta \(meta) dias cumprindo a meta")
                    .foregroundStyle(Color.white)
                
            }
            
        }
        .padding()
        
        
    }
}

#Preview {
    Registro_Agua()
}
