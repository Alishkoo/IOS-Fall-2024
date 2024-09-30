

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Color(.systemMint)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20.0){
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                HStack {
                    
    //                Spacer()
                    Text("Diamond")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    VStack{
                        HStack{
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        Text("(Reviews 361)")
                    }   .foregroundColor(.orange)
                        .font(.caption)
                    
                }
                
                Text("Interesting thing to look")
                
                HStack{
                    Spacer()
                    Image(systemName: "fork.knife")
                    Image(systemName: "binoculars.fill")
                }
                .padding()
                .foregroundColor(.gray)
                .font(.caption)
            }
            .padding()
            .background(Rectangle()
                .foregroundColor(.white)
                .cornerRadius(15)
                .shadow(radius: 15))
            .padding()
        }
        
        
    }
}

#Preview {
    ContentView()
}

