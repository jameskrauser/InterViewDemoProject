//
//  CheckPwdViewController.m
//  Demo1
//
//  Created by jameskrauser on 2017/10/3.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

#import "CheckPwdViewController.h"
#import "ViewController.h"

@interface CheckPwdViewController ()

@end

@implementation CheckPwdViewController

-(IBAction)buttontapped:(id)sender{
    if ( [[infodictionary objectForKey:usernamefield.text] isEqualToString:passwordfield.text ] ) {
        UIAlertView *alert = [[UIAlertView alloc ] initWithTitle:@"Correct password" message:@"The password is correct"
                                   delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    }else {
        UIAlertView *alert2 = [[UIAlertView alloc ] initWithTitle:@"Incorrect password" message:@"The password is incorrect"
                                   delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert2 show];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    infodictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"password" , nil ] forKeys:[NSArray arrayWithObjects:@"username" , nil]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
