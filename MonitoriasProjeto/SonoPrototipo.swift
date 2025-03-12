//
//  SonoPrototipo.swift
//  temp
//
//  Created by Turma02-Backup on 28/02/25.
//

import SwiftUI

struct SonoPrototipo: View {
    @State var selectedStartHour = Date()
    @State var selectedFinalHour = Date()
    let actualDate = (Date.now)
    
    var body: some View {
        VStack {
            
            HStack {
                
                Image(systemName: "icloud.circle.fill")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundStyle(Color.blue)
                
                
                ZStack {
                    Rectangle()
                        .frame(width: 100.0, height: 30.0)
                        .foregroundStyle(Color.blue)
                        .cornerRadius(10)
                    
                    Text ("Sono")
                        .foregroundColor(.white)
                }
            
                Spacer()
            }
            
            Spacer()
            
            ScrollView {
                
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.black)
                        .cornerRadius(10)
                        .shadow(color: .black ,radius: 3)
                    
                    HStack {
                        
                        Text (actualDate, format: .dateTime.day().month())
                            .offset(x:20)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                        
                        
                        VStack {
                            HStack {
                                Text ("Acordei")
                                    .foregroundColor(.white)
                                Text(selectedStartHour.formatted(date: .omitted, time: .shortened))
                                    .colorInvert()
                                    .colorMultiply(.white)
                            }
                            
                            HStack {
                                Text ("Dormi")
                                    .foregroundColor(.white)
                                Text(selectedFinalHour.formatted(date: .omitted, time: .shortened))
                                    .colorInvert()
                                    .colorMultiply(.white)
                            }

                            }
                        
                    }
                }
                
                ZStack {
                    
                    Rectangle()
                        .foregroundStyle(Color.black)
                        .cornerRadius(10)
                        .shadow(color: .black ,radius: 3)
                    
                    HStack {
                        
                        Text (actualDate, format: .dateTime.day().month())
                            .offset(x:20)
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                        
                        VStack {
                            
                            HStack {
                                Text ("Acordei")
                                    .foregroundColor(.white)
                                
                                DatePicker("", selection: $selectedFinalHour, displayedComponents: .hourAndMinute)
                                    .frame(width: 60.0, height: 20.0)
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .labelsHidden()
                                    .clipped()
                                    .colorInvert()
                                    .colorMultiply(.white)
                            }
                            
                            
                            HStack {
                                Text ("Dormi")
                                    .foregroundStyle(Color.white)
                                
                                DatePicker("", selection: $selectedStartHour, displayedComponents: .hourAndMinute)
                                    .frame(width: 60.0, height: 20.0)
                                    .datePickerStyle(CompactDatePickerStyle())
                                    .colorInvert()
                                    .colorMultiply(.white)
                                    .labelsHidden()
                                    .clipped()
                            }
                            
                        }
                        .offset(x:-10)
                        
                        
                    }
                    .frame(height: 70.0)
                    
                }
                
                
            }
            .padding()
            
        }
        .padding()
    }
}

#Preview {
    SonoPrototipo()
}
