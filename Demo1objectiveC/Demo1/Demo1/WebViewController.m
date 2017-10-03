//
//  WebViewController.m
//  Demo1
//
//  Created by jameskrauser on 2017/10/3.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController


-(IBAction)Search:(id)sender{
    NSURL *url = [ NSURL URLWithString:textfield.text];
    NSURLRequest *myrequest = [ NSURLRequest requestWithURL:url  ];
    [ webview loadRequest:myrequest ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
