import WatchKit
import WatchConnectivity
import Combine

class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate {
    
    var fitnessDataModel: FitnessDataModel?

    override init() {
        super.init()
        setupWatchConnectivity()
    }

    func applicationDidFinishLaunching() {
        // Initialize the FitnessDataModel with static data
        self.fitnessDataModel = FitnessDataModel()
        let staticFitnessData = FitnessData(pullups: 13945, pushups: 27890, squats: 21692, hspu: 1089)
        self.fitnessDataModel?.update(with: staticFitnessData)
        print("Static Fitness data loaded: \(staticFitnessData)")
    }

    func setupWatchConnectivity() {
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
            print("ExtensionDelegate: WCSession supported and activated.")
        }
    }

    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("WCSession activation completed with state: \(activationState.rawValue)")
        if let error = error {
            print("WCSession activation error: \(error.localizedDescription)")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Currently, we are bypassing dynamic updates for testing purposes
        print("Received message but currently bypassing dynamic updates for testing.")
    }
}
