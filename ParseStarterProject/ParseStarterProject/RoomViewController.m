//
//  RoomViewController.m
//  ParseStarterProject
//
//  Created by Krishna Bharathala on 10/16/15.
//
//

#import "RoomViewController.h"
#import "ChatViewController.h"

@interface RoomViewController ()

@end

@implementation RoomViewController

-(void) viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:69.0/255 green:202.0/255 blue:255.0/255 alpha:1];
    
    int size = 60;
    
    UIButton *logoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [logoButton setBackgroundImage:[UIImage imageNamed:@"TitleChat.png"] forState:UIControlStateNormal];
    [logoButton setUserInteractionEnabled:NO];
    [logoButton setFrame:CGRectMake(self.view.frame.size.width/2-175, 0, size*7, size*7)];
    [self.view addSubview:logoButton];
    
    UIButton *fromRoomID = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [fromRoomID setBackgroundImage:[UIImage imageNamed:@"roomIcon.png"] forState:UIControlStateNormal];
    [fromRoomID setFrame:CGRectMake(self.view.frame.size.width/2-size/2, self.view.frame.size.height/2-size/2, size, size)];
    [fromRoomID addTarget:self action:@selector(fromRoomID) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:fromRoomID];
    
    UILabel *fromRoomLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 55, self.view.frame.size.height/2+size/2, 120, 40)];
    fromRoomLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    fromRoomLabel.textColor = [UIColor whiteColor];
    fromRoomLabel.text = @"Enter Chat ID";
    [self.view addSubview:fromRoomLabel];
    
}

- (void)fromRoomID {
    UIAlertView *roomIDAlert = [[UIAlertView alloc] initWithTitle:@"Room ID" message:nil delegate:self cancelButtonTitle:@"Submit" otherButtonTitles:@"Cancel", nil];
    roomIDAlert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [roomIDAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 0) {
        ChatViewController *chatVC = [[ChatViewController alloc] init];
        chatVC.roomID = [[alertView textFieldAtIndex:0] text];
        
        [self.navigationController pushViewController:chatVC animated:YES];
    }
}


@end
