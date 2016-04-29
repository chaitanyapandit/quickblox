//
//  ViewController.h
//  VideoCall
//
//  Created by Chaitanya Pandit on 29/04/16.
//  Copyright © 2016 include tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)connect:(id)sender;

@property (strong, nonatomic) IBOutlet QBRTCRemoteVideoView *remoteView;
@property (strong, nonatomic) IBOutlet UIView *localView;

@end

