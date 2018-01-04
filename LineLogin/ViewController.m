//
//  ViewController.m
//  LineLogin
//
//  Created by mo on 2018/1/2.
//  Copyright © 2018年 momo. All rights reserved.
//

#import "ViewController.h"
#import "ShareSDKVC.h"
#import <ShareSDKExtension/ShareSDK+Extension.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)Logion:(id)sender {
    
    
//    if (![ShareSDK isClientInstalled:SSDKPlatformTypeLine]) {
//
//
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"您还没有安装Line" preferredStyle:UIAlertControllerStyleActionSheet];
//
//        UIAlertAction *action  = [UIAlertAction actionWithTitle:@"立即安装Line" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }];
//
//        UIAlertAction *actionTwo  = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }];
//
//
//        [alert addAction:actionTwo];
//        [alert addAction:action];
//        [self presentViewController:alert animated:YES completion:nil];
//
//    }else{
    
         [[ShareSDKVC share] login];
        
//    }


    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
