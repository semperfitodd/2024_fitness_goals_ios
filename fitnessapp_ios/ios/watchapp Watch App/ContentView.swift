import SwiftUI

struct ContentView: View {
    @EnvironmentObject var fitnessDataModel: FitnessDataModel

    var body: some View {
        ZStack {
            Color(UIColor.lightGray).opacity(0.4).edgesIgnoringSafeArea(.all) // Set the background color

            VStack(alignment: .leading) {
                HStack {
                    Image("pullups")
                        .resizable()
                        .frame(width: 24, height: 24) // Adjust the size as needed
                    Text("\(fitnessDataModel.fitnessData.pullups)")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 2)

                HStack {
                    Image("pushups")
                        .resizable()
                        .frame(width: 24, height: 24) // Adjust the size as needed
                    Text("\(fitnessDataModel.fitnessData.pushups)")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 2)

                HStack {
                    Image("squats")
                        .resizable()
                        .frame(width: 24, height: 24) // Adjust the size as needed
                    Text("\(fitnessDataModel.fitnessData.squats)")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 2)

                HStack {
                    Image("hspu")
                        .resizable()
                        .frame(width: 24, height: 24) // Adjust the size as needed
                    Text("\(fitnessDataModel.fitnessData.hspu)")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 2)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(FitnessDataModel())
}
