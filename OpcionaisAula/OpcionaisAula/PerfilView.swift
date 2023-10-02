//
//  PerfilView.swift
//  OpcionaisAula
//
//  Created by Sarah dos Santos Silva on 02/10/23.
//

import SwiftUI

struct PerfilView: View {
    
    @State var nome: String
    @State var sobrenome: String
    @State var idade: Int?
    
    var body: some View {
        VStack{
            Text("Perfil")
                .font(.system(.largeTitle, design: .rounded))
                .bold()
            Text("Nome: \(nome)")
                .font(.title3)
            Text("Sobrenome: \(sobrenome)")
                .font(.title3)
            
            if let idadeDesembrulhada = idade {
                Text("Idade: \(idadeDesembrulhada)")
                    .font(.title3)
            }
            else {
                Text("Idade não fornecida")
                    .font(.title3)
            }
        }
        
        
        
    }
}

//#Preview {
//    PerfilView()
//}
