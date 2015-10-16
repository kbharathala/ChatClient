//
//  ChatViewController.m
//  ParseStarterProject
//
//  Created by Krishna Bharathala on 10/16/15.
//
//

#import "ChatViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface ChatViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) NSMutableArray *chatArray;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = [NSString stringWithFormat:@"Room: %@", self.roomID];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 300, 40)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.font = [UIFont systemFontOfSize:15];
    self.textField.placeholder = @"Enter Text";
    self.textField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.textField.returnKeyType = UIReturnKeyDone;
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.textField.delegate = self;
    [self.view addSubview:self.textField];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submitButton setTitle:@"Submit Text" forState:UIControlStateNormal];
    [submitButton sizeToFit];
    [submitButton setCenter:CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/6 + 50)];
    [submitButton addTarget:self action:@selector(submitText) forControlEvents:UIControlEventTouchUpInside];
    [submitButton setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:submitButton];
    
    self.chatArray = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Input"];
    [query whereKey:@"room" equalTo:self.roomID];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"No Error");
            for(PFObject *object in objects) {
                [self.chatArray addObject:[object objectForKey:@"text"]];
            }
            
            [self createLabel:self.chatArray];
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
}

- (void)createLabel:(NSMutableArray *)textArray {
    
    self.label = [[UILabel alloc] init];
    self.label.text = [textArray componentsJoinedByString:@"\n"];
    self.label.numberOfLines = 0;
    self.label.frame = CGRectMake(20, 180, self.view.frame.size.width - 20, self.view.frame.size.height/2);
    [self.label sizeToFit];
    
    [self.view addSubview:self.label];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self submitText];
    return YES;
}

-(void) submitText {
    
    PFObject *textInput = [PFObject objectWithClassName:@"Input"];
    textInput[@"text"] = self.textField.text;
    textInput[@"room"] = self.roomID;
    [textInput saveInBackground];
    
    self.textField.text = nil;
    [self.textField resignFirstResponder];
    
    [self viewDidLoad];
    [self.label removeFromSuperview];
}



@end
