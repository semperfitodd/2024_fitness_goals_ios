import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var fitnessData: FitnessData = FitnessData(pullups: 0, pushups: 0, squats: 0, hspu: 0)
    private var cancellable: AnyCancellable?

    func fetchData() {
        guard let url = URL(string: "https://fitness.bernsonfamily.net/totals") else { return }

        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: FitnessApiResponse.self, decoder: JSONDecoder())
            .map { response in
                FitnessData(pullups: response.Exercises.Pullup.Total, pushups: response.Exercises.Pushup.Total, squats: response.Exercises.Squat.Total, hspu: response.Exercises.HSPU.Total)
            }
            .replaceError(with: FitnessData(pullups: 0, pushups: 0, squats: 0, hspu: 0))
            .receive(on: DispatchQueue.main)
            .assign(to: \.fitnessData, on: self)
    }
}

struct FitnessApiResponse: Codable {
    let Exercises: Exercises

    struct Exercises: Codable {
        let Pullup: ExerciseDetails
        let Pushup: ExerciseDetails
        let Squat: ExerciseDetails
        let HSPU: ExerciseDetails
    }

    struct ExerciseDetails: Codable {
        let Total: Int
    }
}

struct FitnessData: Codable, Equatable, CustomStringConvertible {
    let pullups: Int
    let pushups: Int
    let squats: Int
    let hspu: Int

    var description: String {
        return "FitnessData(pullups: \(pullups), pushups: \(pushups), squats: \(squats), hspu: \(hspu))"
    }
}
