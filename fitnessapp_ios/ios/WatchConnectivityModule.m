#import "WatchConnectivityModule.h"
#import <React/RCTLog.h>

@implementation WatchConnectivityModule

RCT_EXPORT_MODULE();

- (instancetype)init {
  self = [super init];
  if (self) {
    if ([WCSession isSupported]) {
      WCSession.defaultSession.delegate = self;
      [WCSession.defaultSession activateSession];
      RCTLogInfo(@"WatchConnectivityModule: WCSession supported and activated.");
    }
  }
  return self;
}

RCT_EXPORT_METHOD(sendFitnessDataToWatch:(NSDictionary *)fitnessData)
{
  RCTLogInfo(@"sendFitnessDataToWatch called with data: %@", fitnessData);
  if ([WCSession.defaultSession isReachable]) {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:fitnessData options:0 error:&error];
    if (error) {
      RCTLogError(@"Failed to serialize fitness data: %@", error);
      return;
    }
    [WCSession.defaultSession sendMessage:@{@"fitnessData": data} replyHandler:nil errorHandler:^(NSError *error) {
      RCTLogError(@"Failed to send message: %@", error);
    }];
  } else {
    RCTLogError(@"WCSession is not reachable");
  }
}

#pragma mark - WCSessionDelegate methods

- (void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(NSError *)error {
  RCTLogInfo(@"WCSession activation completed with state: %ld", (long)activationState);
}

- (void)sessionDidBecomeInactive:(WCSession *)session {
  RCTLogInfo(@"WCSession did become inactive");
}

- (void)sessionDidDeactivate:(WCSession *)session {
  RCTLogInfo(@"WCSession did deactivate");
}

@end
