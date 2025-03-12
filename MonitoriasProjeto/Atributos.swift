//
//  Atributos.swift
//  MonitoriasProjeto
//
//  Created by Turma02-22 on 28/02/25.
//

import Foundation
import SwiftUI

var minhaCor : Color = Color.pretoCinza
var azul : Color = Color.azulBonito

struct Data : Identifiable{
    var id: Int
    var dat: String
    var dia: String
}

var arrayData = [Data(id: 1, dat: "01/02", dia: "Segunda"), Data(id: 2, dat: "02/02", dia: "Terca"), Data(id: 3, dat: "03/02", dia: "Quarta"), Data(id: 4, dat: "04/02", dia: "Quinta"), Data(id: 5, dat: "05/02", dia: "Sexta"), Data(id: 6, dat: "06/02", dia: "Sabado"), Data(id: 7, dat: "07/02", dia: "Domingo")]

struct dadosDormir: Codable {
    var horasAcordou: Date?
    var horasDeitou: Date?
}

struct refeicao: Codable {
    var horario: Date?
    var ingredientes: String?
    var preparo: String?
}

struct cronograma: Codable {
    var horario: Date?
    var descricao: String?
}

struct tumtum: Codable {
    var horarioInicio: Date?
    var horarioFim: Date?
    var valor: Int?
}

struct planejamento: Codable {
    var cafeManha: refeicao?
    var almoco: refeicao?
    var jantar: refeicao?
    var treino: cronograma?
}

struct dados: Codable {
    var dia: Date?
    var agua: Bool?
    var sono: dadosDormir?
    var batimentos: tumtum?
    var peso: Double?
    var metasDiarias: planejamento?
}

struct pessoa: Codable {
    var _id: String?         // Agora _id tem tipo definido
    var pesoMes: Double?
    var aguaTotal: Int?
    var dadosTotais: [dados]?
}
