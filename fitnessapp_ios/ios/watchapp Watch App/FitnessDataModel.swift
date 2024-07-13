import Foundation
import Combine

class FitnessDataModel: ObservableObject {
    @Published var fitnessData: FitnessData = FitnessData(pullups: 0, pushups: 0, squats: 0, hspu: 0)
    
    func update(with data: FitnessData) {
        fitnessData = data
    }
}

struct FitnessData: Codable {
    let pullups: Int
    let pushups: Int
    let squats: Int
    let hspu: Int
}
