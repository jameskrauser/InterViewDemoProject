//
//  CheckPwdViewController.h
//  Demo1
//
//  Created by jameskrauser on 2017/10/3.
//  Copyright © 2017年 jameskrauser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckPwdViewController : UIViewController{
    IBOutlet UITextField *usernamefield;
    IBOutlet UITextField *passwordfield;
    NSDictionary *infodictionary;
}

-(IBAction)buttontapped:(id)sender;


@end
