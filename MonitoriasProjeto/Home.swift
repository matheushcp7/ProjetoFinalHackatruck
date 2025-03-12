import SwiftUI
import Foundation    

func enviarDadosParaServidor(pessoa: pessoa) {
    // URL correta do servidor Node-RED
    guard let url = URL(string: "http://127.0.0.1:1880/uploadPessoa78") else {
        print("URL inválida")
        return
    }
    
    // Codificando os dados como JSON
    do {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601  // Caso tenha datas no formato ISO 8601
        let jsonData = try encoder.encode(pessoa)
        
        // Criando o request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // Enviando a requisição
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Erro na requisição: \(error.localizedDescription)")
                return
            }
            
            if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                // Aqui você pode processar a resposta, se necessário
                print("Dados enviados com sucesso: \(String(data: data, encoding: .utf8) ?? "")")
            } else {
                print("Falha ao enviar os dados.")
            }
        }
        
        // Iniciando a tarefa
        task.resume()
    } catch {
        print("Erro ao codificar os dados: \(error.localizedDescription)")
    }
}

struct Home: View {
    // Controla o índice do dia atual (qual card mostrar)
    @State var scrollIndex: Int = 0
    @StateObject var vm = ModelView()
    
    // Controla qual card está expandido. Se for nil, nenhum está expandido
    @State private var expandedIndex: Int? = nil
    @State private var estaEditando: Bool = false
    @State private var auxEditar: Bool = false
    @State private var texto: String = "Almoço às 12h30 — Ingredientes: arroz, feijão, frango…"
     @State var pessoaExemplo = pessoa(pesoMes: 70.0, aguaTotal: 2, dadosTotais: [
        dados(dia: Date(), agua: true, sono: dadosDormir(horasAcordou: Date(), horasDeitou: Date()), batimentos: tumtum(horarioInicio: Date(), horarioFim: Date(), valor: 75), peso: 70.5, metasDiarias: planejamento(cafeManha: refeicao(horario: Date(), ingredientes: "Frango", preparo: "Frito"), almoco: refeicao(horario: Date(), ingredientes: "Arroz e feijão", preparo: "Cozido"), jantar: refeicao(horario: Date(), ingredientes: "Peixe", preparo: "Assado"), treino: cronograma(horario: Date(), descricao: "Treino de pernas")))])
    
    
    var body: some View {
        ZStack {
            // Fundo gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color.white.opacity(0.9), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                // Cabeçalho com o título "MEU DIA"
                HStack{
                    Text("MEU DIA")
                        .foregroundColor(.white)
                        .frame(width: 130)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(azul)
                                .shadow(color: azul.opacity(0.5), radius: 10, x: 0, y: 5)
                        )
                        .padding(.top, 1)
                    Spacer()
                    Button("ENVIAR") {
                // dados aleatorios
                            
                // Enviar os dados para o servidor
                enviarDadosParaServidor(pessoa: pessoaExemplo)
            }
            .foregroundColor(.white)
            .frame(width: 130)
            .font(Font.custom("Arial", size: 20).bold())
            .padding()
            .background(Color.red)   // Usa a cor "azul" sem alterar
            .padding(.top, 1)
            .shadow(color: minhaCor, radius: 5)
                }
                .padding(.horizontal)

                ScrollView{
                    // Botão "INICIAR O CARDIO"
                    Button(action: {
                        // Ação para iniciar o cardio
                    }) {
                        Text("INICIAR O CARDIO")
                            .padding()
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: 250)
                            .background(
                                LinearGradient(gradient: Gradient(colors: [minhaCor, minhaCor.opacity(0.8)]),
                                               startPoint: .leading,
                                               endPoint: .trailing)
                            )
                            .cornerRadius(25)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                            .shadow(color: minhaCor.opacity(0.6), radius: 10, x: 0, y: 5)
                    }
                    .padding(.top, 70)
                    
                    // Layout horizontal: seta esquerda, card atual, seta direita
                    HStack {
                        // Botão para ir ao dia anterior
                        Button (action: {
                            if scrollIndex > 0 {
                                scrollIndex -= 1
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [minhaCor, minhaCor.opacity(0.8)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .shadow(color: minhaCor.opacity(0.4), radius: 8, x: 0, y: 4)
                                )
                        }
                        .padding(.leading, 5)
                        
                        // Pegamos o item (dia) correspondente ao scrollIndex atual
                        let item = arrayData[scrollIndex]
                        
                        ZStack {
                            // Fundo do Card
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [minhaCor, minhaCor.opacity(0.8)]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .shadow(color: minhaCor.opacity(0.6), radius: 15, x: 0, y: 8)
                                
                            VStack {
                                // Parte principal do card (data e dia)
                                VStack {
                                    Text(item.dat)
                                        .padding(.top, 30)
                                        .font(.system(size: 40, weight: .heavy))
                                        .foregroundColor(.white)
                                    
                                    HStack {
                                        Spacer()
                                        Text(item.dia)
                                            .padding()
                                            .foregroundStyle(Color.white.opacity(0.9))
                                            .font(.system(size: 30, weight: .medium, design: .rounded))
                                            .padding(.trailing, 10)
                                    }
                                }
                                .onTapGesture {
                                    // Ao tocar, expande/colapsa as infos adicionais
                                    withAnimation(.spring()) {
                                        if expandedIndex == scrollIndex {
                                            expandedIndex = nil
                                        } else {
                                            expandedIndex = scrollIndex
                                        }
                                    }
                                }
                                
                                // Se este card estiver expandido, mostra a parte extra
                                if expandedIndex == scrollIndex {
                                    // Rolagem vertical caso as infos sejam grandes
                                    ScrollView(.vertical, showsIndicators: true) {
                                        VStack(alignment: .leading, spacing: 12) {
                                            Text("Refeição do dia:")
                                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                                .padding(.bottom, 5)
                                            
                                            HStack{
                                                if estaEditando {
                                                    TextField("Digite algo", text: $texto, axis: .vertical)
                                                        .textFieldStyle(PlainTextFieldStyle())
                                                        .foregroundColor(minhaCor)
                                                        .padding()
                                                        .frame(height: 150)
                                                        .background(
                                                            RoundedRectangle(cornerRadius: 12)
                                                                .fill(Color.white)
                                                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                                                        )
                                                        .onChange(of: auxEditar) {
                                                            estaEditando = false
                                                        }
                                                } else {
                                                    Text(texto)
                                                        .padding()
                                                        .background(Color.white.opacity(0.15))
                                                        .cornerRadius(12)
                                                }
                                                
                                                EditButton(isEditing: $estaEditando, Aux: $auxEditar)
                                            }
                                            .animation(.easeInOut, value: estaEditando)
                                            
                                            Group {
                                                MealItem(time: "12h30", meal: "Almoço", ingredients: "arroz, feijão, frango")
                                                MealItem(time: "16h00", meal: "Lanche", ingredients: "frutas, iogurte")
                                                MealItem(time: "20h00", meal: "Jantar", ingredients: "salada, peixe")
                                            }
                                        }
                                        .padding()
                                        .foregroundColor(.white)
                                    }
                                    .frame(minHeight: 100) // Limita a altura do "popup"
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(azul.opacity(0.9))
                                            .shadow(color: azul.opacity(0.3), radius: 8, x: 0, y: 4)
                                    )
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                                    .transition(.move(edge: .bottom).combined(with: .opacity))
                                }
                            }
                        }
                        .frame(width: 240)
                        .padding(.bottom, expandedIndex == scrollIndex ? 20 : 0)
                        
                        // Botão para ir ao próximo dia
                        Button (action: {
                            if scrollIndex < arrayData.count - 1 {
                                scrollIndex += 1
                            }
                        }) {
                            Image(systemName: "chevron.right")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(12)
                                .background(
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [minhaCor, minhaCor.opacity(0.8)]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                        .shadow(color: minhaCor.opacity(0.4), radius: 8, x: 0, y: 4)
                                )
                        }
                        .padding(5)
                    }
                    .padding(.top, 70)
                    
                    Spacer()
                    
                    Button("ENVIAR") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .foregroundColor(.white)
                    .frame(width: 150)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [azul, azul.opacity(0.8)]),
                                       startPoint: .leading,
                                       endPoint: .trailing)
                            .cornerRadius(15)
                            .shadow(color: azul.opacity(0.5), radius: 10, x: 0, y: 5)
                    )
                    .padding(.bottom, 20)
                    .padding(.top, 40)
                }
            }
        }
    }
}

// Componente para exibir informações da refeição de forma mais organizada
struct MealItem: View {
    var time: String
    var meal: String
    var ingredients: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(meal)
                    .font(.system(size: 16, weight: .semibold))
                Text("às \(time)")
                    .font(.system(size: 16))
            }
            .foregroundColor(.white)
            
            Text("Ingredientes: \(ingredients)")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.9))
                .padding(.leading, 5)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color.white.opacity(0.15))
        .cornerRadius(10)
    }
}

struct EditButton: View {
    @Binding var isEditing: Bool
    @Binding var Aux: Bool
    var body: some View {
        Button(action: {
            isEditing.toggle()
            Aux.toggle()
        }) {
            Image(systemName: isEditing ? "checkmark.circle.fill" : "pencil")
                .foregroundColor(.white)
                .padding(10)
                .background(
                    Circle()
                        .fill(azul)
                        .shadow(color: azul.opacity(0.5), radius: 5, x: 0, y: 3)
                )
        }
    }
}

#Preview {
    Home()
}
