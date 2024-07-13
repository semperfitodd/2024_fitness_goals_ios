import SwiftUI
import WatchKit

@main
struct watchapp_Watch_AppApp: App {
    // Correct use of WKExtensionDelegateAdaptor
    @WKExtensionDelegateAdaptor private var delegate: ExtensionDelegate
    @StateObject private var fitnessDataModel = FitnessDataModel()

    init() {
        // Manually calling the applicationDidFinishLaunching method
        delegate.applicationDidFinishLaunching()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(fitnessDataModel)
                .onAppear {
                    // Make sure fitnessDataModel is updated after initialization
                    fitnessDataModel.update(with: delegate.fitnessDataModel?.fitnessData ?? FitnessData(pullups: 0, pushups: 0, squats: 0, hspu: 0))
                }
        }
    }
}
