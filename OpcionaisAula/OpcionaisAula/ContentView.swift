//
//  ContentView.swift
//  OpcionaisAula
//
//  Created by Sarah dos Santos Silva on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var nome = ""
    @State var sobrenome = ""
    @State var idade: Int? = nil
    @State var mostrarAlerta = false
    @State var sheetView = false
    
    
    var body: some View {
        
        VStack {
            Text("Perfil")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            TextField("*Nome", text: $nome)
                .textInputAutocapitalization(.never)
                .font(.system(size: 20))
                .disableAutocorrection(true)
                .border(.quaternary)
                .clipShape(.containerRelative)
                .padding(.horizontal)
            
            TextField("*Sobrenome", text: $sobrenome)
                .textInputAutocapitalization(.never)
                .font(.system(size: 20))
                .disableAutocorrection(true)
                .border(.quaternary)
                .clipShape(.containerRelative)
                .padding(.horizontal)
            
            TextField("Idade", value: $idade, format: .number)
                .textInputAutocapitalization(.never)
                .font(.system(size: 20))
                .disableAutocorrection(true)
                .border(.quaternary)
                .clipShape(.containerRelative)
                .padding(.horizontal)
            
            Button("Salvar") {
                verificarCampos()
            }
        }
        .alert(isPresented: $mostrarAlerta) {
            Alert(title: Text("Campos obrigatórios"), message: Text("Por favor, preencha todos os campos obrigatórios."), dismissButton: .default(Text("OK")))
        }
        .sheet(isPresented: $sheetView, onDismiss: {
                  limparTF()
               }) {
                   PerfilView(nome: nome, sobrenome: sobrenome, idade: idade)
               }
    }
    
    private func verificarCampos(){
        if nome.isEmpty || sobrenome.isEmpty {
            mostrarAlerta = true
            return
        }
        else {
            sheetView = true
        }
    }
    private func limparTF(){
        nome = ""
        sobrenome = ""
        idade = nil
    }
}



#Preview {
    ContentView()
}
