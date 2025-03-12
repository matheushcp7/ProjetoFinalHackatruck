//
//  botaoDeAgua.swift
//  MonitoriasProjeto
//
//  Created by Turma02-17 on 28/02/25.
//

import Foundation
import SwiftUI

struct Agua: View {
    @State private var nivelDeAgua: CGFloat = 0 // Nível de água (0 a 1)
    @State private var animando: Bool = false // Controle da animação

    let nivelMinimoDeAgua: CGFloat = 0 // Nível máximo de água

    var body: some View {
        VStack {
            // Círculo que representa o nível de água
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .foregroundColor(.gray.opacity(0.2)) // Cor do fundo do círculo (sem água)
                    .frame(width: 200, height: 200)

                Circle()
                    .trim(from: 0, to: nivelDeAgua/100) // O nível da água
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.blue) // Cor da água
                    .rotationEffect(.degrees(-90)) // Começar da parte inferior
                    .frame(width: 200, height: 200)
                    .animation(.easeInOut(duration: 0.5), value: nivelDeAgua)
                VStack{
                    Text("\(Int(nivelDeAgua*20)) ml's") // Texto do nível de água
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                    if(nivelDeAgua>=100){
                        Text("Meta Batida!") // Texto do nível de água
                            .font(.title3)
                            .bold()
                            .foregroundColor(.black)
                    }
                }
                
            }

            // Botão para aumentar o nível de água
            Button(action: {
                withAnimation {
                    
                        nivelDeAgua += 10 // Aumenta 10% de cada vez
                    
                }
            }) {
                Text("Adicionar Água")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
            // Botão para aumentar o nível de água
            Button(action: {
                withAnimation {
                    if(nivelDeAgua>nivelMinimoDeAgua){
                        nivelDeAgua -= 10 // Diminui 10% de cada vez
                    }
                }
            }) {
                Text("Diminuir Água")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top, 20)
        }
    }
}
#Preview {
    Agua()
}
