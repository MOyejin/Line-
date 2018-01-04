//
//  ShareSDKVC.m
//  星星计划
//
//  Created by mo on 16/6/7.
//  Copyright © 2016年 moyejin. All rights reserved.
//

#import "ShareSDKVC.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <LineSDK/LineSDK.h>


//初始化 shareSDK
static ShareSDKVC *share;
@interface ShareSDKVC ()<NSCopying,NSMutableCopying,UIActionSheetDelegate>

@end

@implementation ShareSDKVC

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    
    @synchronized (self){
        
        if (share == nil) {
            share = [super allocWithZone:zone];
            
        }
        return share;
    }
}
+ (instancetype)share{
    
    return [[self alloc] init];

}

- (id)copyWithZone:(NSZone *)zone{
    return share;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return share;
}

- (void)shareSDK{
    
    
        
        [ShareSDK registerActivePlatforms:@[@(SSDKPlatformTypeLine)] onImport:^(SSDKPlatformType platformType) {
            
            switch (platformType)
            {
                    
                case SSDKPlatformTypeLine:
                    [ShareSDKConnector connectLine:[LineSDKLogin class]];
                    break;
                    
                default:
                    break;
            }
            
        } onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo) {
            
            switch (platformType)
            {
                    
                case SSDKPlatformTypeLine:
                    //                [appInfo SSDKSetupLinkedInByApiKey:@"1555309879"
                    //                                         secretKey:@"fbc43b9f470217bca5ed861ff388caed"
                    //                                       redirectUrl:@"https://www.baidu.com"];
                    [appInfo SSDKSetupLineAuthType:SSDKAuthTypeBoth];
                default:
                    break;
            }
        }];
    
    
}

- (void)login{
    
        
        [ShareSDK getUserInfo:SSDKPlatformTypeLine onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error) {
            
            if (state == SSDKResponseStateSuccess) {
                
                NSLog(@"uid=%@",user.uid);
                NSLog(@"%@",user.credential);
                NSLog(@"token=%@",user.credential.token);
                NSLog(@"nickname=%@",user.nickname);
                
            }else{
                
                NSLog(@"%@",error);
                
            }
            
        }];
 
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
