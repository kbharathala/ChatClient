//
//  AppDelegate.h
//  ParseStarterProject
//
//  Created by Krishna Bharathala on 10/16/15.
//
//


#import <Foundation/Foundation.h>
#import "RoomViewController.h"

@class ParseStarterProjectViewController;

@interface ParseStarterProjectAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) RoomViewController *roomViewController;

@end
