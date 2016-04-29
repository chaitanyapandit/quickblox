//
//  ViewController.m
//  VideoCall
//
//  Created by Chaitanya Pandit on 29/04/16.
//  Copyright © 2016 include tech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <QBRTCClientDelegate>

@property (nonatomic) QBRTCSession *session;
@property (nonatomic) QBRTCCameraCapture *videoCapture;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [QBRTCClient initializeRTC];
    [QBRTCClient.instance addDelegate:self]; // self class must conform to QBRTCClientDelegate protocol
    // Users 4, 5, 6
    NSArray *opponentsIDs = @[@2436258, @2436259, @2436262];
    self.session = [QBRTCClient.instance createNewSessionWithOpponents:opponentsIDs
                                                                withConferenceType:QBRTCConferenceTypeVideo];
}

- (IBAction)connect:(id)sender {
    
    QBRTCVideoFormat *videoFormat = [[QBRTCVideoFormat alloc] init];
    videoFormat.frameRate = 30;
    videoFormat.pixelFormat = QBRTCPixelFormat420f;
    videoFormat.width = 640;
    videoFormat.height = 480;

    self.videoCapture = [[QBRTCCameraCapture alloc] initWithVideoFormat:videoFormat position:AVCaptureDevicePositionFront]; // or AVCaptureDevicePositionBack

    self.videoCapture.previewLayer.frame = self.localView.bounds;
    [self.videoCapture startSession];
    [self.localView.layer insertSublayer:self.videoCapture.previewLayer atIndex:0];
}

- (void)didReceiveNewSession:(QBRTCSession *)session userInfo:(NSDictionary *)userInfo {
    
    if (self.session) {
        // we already have a video/audio call session, so we reject another one
        // userInfo - the custom user information dictionary for the call from caller. May be nil.
        NSDictionary *userInfo = @{ @"key" : @"value" };
        [session rejectCall:userInfo];
        return;
    } else {
        self.session = session;
        NSDictionary *userInfo = nil;
        [self.session acceptCall:userInfo];
    }
}

- (void)session:(QBRTCSession *)session receivedRemoteVideoTrack:(QBRTCVideoTrack *)videoTrack fromUser:(NSNumber *)userID {
    [self.remoteView setVideoTrack:videoTrack];
}

- (void)session:(QBRTCSession *)session initializedLocalMediaStream:(QBRTCMediaStream *)mediaStream {
    
}

- (void)session:(QBRTCSession *)session updatedStatsReport:(QBRTCStatsReport *)report forUserID:(NSNumber *)userID {
    
}

- (void)session:(QBRTCSession *)session userDidNotRespond:(NSNumber *)userID {
    
}

- (void)session:(QBRTCSession *)session rejectedByUser:(NSNumber *)userID userInfo:(NSDictionary *)userInfo {
    
}

- (void)session:(QBRTCSession *)session acceptedByUser:(NSNumber *)userID userInfo:(NSDictionary *)userInfo {
    
}

- (void)session:(QBRTCSession *)session hungUpByUser:(NSNumber *)userID userInfo:(NSDictionary *)userInfo {
    
}

- (void)session:(QBRTCSession *)session connectionClosedForUser:(NSNumber *)userID {
    
}

- (void)session:(QBRTCSession *)session startedConnectingToUser:(NSNumber *)userID {
    
}

- (void)session:(QBRTCSession *)session connectedToUser:(NSNumber *)userID {
    
}

- (void)session:(QBRTCSession *)session disconnectedFromUser:(NSNumber *)userID {
    
}

- (void)session:(QBRTCSession *)session disconnectedByTimeoutFromUser:(NSNumber *)userID {
    
}

- (void)session:(QBRTCSession *)session connectionFailedForUser:(NSNumber *)userID {
    
}

- (void)sessionDidClose:(QBRTCSession *)session {
    
}

@end
