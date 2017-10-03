//
//  WebViewController.h
//  Demo1
//
//  Created by jameskrauser on 2017/10/3.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController{
    IBOutlet UIWebView *webview;
    IBOutlet UITextField *textfield;
    
}

-(IBAction)Search:(id)sender;

@end
