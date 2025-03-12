//
//  Monitorias.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 26/02/25.
//

import SwiftUI

struct Monitorias: View {
    var body: some View {
        VStack {
            HStack{
                Text("MONITORAMENTO")
                    .font(Font.custom("arial", size: 20))
                    .padding()
                    .background(minhaCor)
                    .foregroundStyle(.white)
                    .padding(.top, 1)
                Spacer()
            }
            //Spacer()
            HStack{
                VStack{
                    HStack{
                        Image(systemName: "powersleep").foregroundStyle(Color.yellow)
                        Text("Sono").foregroundStyle(Color.white)
                        Spacer()
                    }.padding()
                        .background(minhaCor).cornerRadius(50).padding()
                    
                    HStack{
                        Image(systemName: "suit.heart.fill").foregroundStyle(Color.red)
                        Text("Media de batimentos").foregroundStyle(Color.white)
                        Spacer()
                    }.padding()
                        .background(minhaCor).cornerRadius(50).padding()
                    HStack{
                        Image(systemName: "scalemass.fill").foregroundStyle(Color.white)
                        Text("Peso atual").foregroundStyle(Color.white)
                        Spacer()
                    }.padding()
                        .background(minhaCor).cornerRadius(50).padding()
                    HStack{
                        Image(systemName: "drop.fill")
                            .foregroundStyle(azul)
                            Text("Meta de Agua").foregroundStyle(Color.white)
                        Spacer()
                        }.padding()
                        .background(minhaCor).cornerRadius(50).padding()
                        
                }
                .padding(.top, 150)
                Spacer()
            }
            Spacer()
            
            
        }
    }
}

#Preview {
    Monitorias()
}
