import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        ZStack {
            Color(.lightGray)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Image("pullups")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(networkManager.fitnessData.pullups)")
                        .foregroundColor(.red)
                }
                .padding()
                HStack {
                    Image("pushups")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(networkManager.fitnessData.pushups)")
                        .foregroundColor(.red)
                }
                .padding()
                HStack {
                    Image("squats")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(networkManager.fitnessData.squats)")
                        .foregroundColor(.red)
                }
                .padding()
                HStack {
                    Image("hspu")
                        .resizable()
                        .frame(width: 24, height: 24)
                    Text("\(networkManager.fitnessData.hspu)")
                        .foregroundColor(.red)
                }
                .padding()
            }
        }
        .onAppear {
            networkManager.fetchData()
            print("ContentView appeared, fetching data...")
        }
    }
}
