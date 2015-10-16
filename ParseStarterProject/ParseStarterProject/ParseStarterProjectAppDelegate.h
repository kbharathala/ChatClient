//
//  AppDelegate.h
//  ParseStarterProject
//
//  Created by Krishna Bharathala on 10/16/15.
//
//


#import <Foundation/Foundation.h>
#import "ChatViewController.h"

@class ParseStarterProjectViewController;

@interface ParseStarterProjectAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) ChatViewController *chatViewController;

@end
