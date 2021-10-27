//
//  ResultView.swift
//  Destini
//
//  Created by Алишер Алсейт on 27.10.2021.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        ZStack {
            Image("background")
                .edgesIgnoringSafeArea(.all)
            
            Text("Congratulations, you completed the game!")
                .foregroundColor(.white)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
