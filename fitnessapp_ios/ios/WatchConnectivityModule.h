#import <React/RCTBridgeModule.h>
#import <WatchConnectivity/WatchConnectivity.h>

@interface WatchConnectivityModule : NSObject <RCTBridgeModule, WCSessionDelegate>
@end
