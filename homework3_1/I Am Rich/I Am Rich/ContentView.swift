

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            VStack {
                Image("diamond")
                    .resizable()
                    .cornerRadius(15)
                    .frame(width:200, height:200)
                
                Text("Interesting diamond")
                    .font(.title)
                    .foregroundColor(.red)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

