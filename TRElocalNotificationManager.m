//
//  TRElocalNotificationManager.m
//  MyBaby4Teacher
//
//  Created by Tree on 16/5/23.
//  Copyright © 2016年 wobaobao. All rights reserved.
//

#import "TRElocalNotificationManager.h"

//  1.实现时间 fireDate;

//  2.推送通知的具体内容 alertBody;

//  3.在锁屏时显示的动作标题(完整测标题:"滑动来" + alertAction) alertAction;

//  4.app图标数字 applicationIconBadgeNumber;

//  5.每隔多久重复发一次推送通知 repeatInterval;

//  6.点击推送通知打开app时显示的启动图片(mainBundle 中提取图片) alertLaunchImage - 设置任意字符串

//  7.附加的额外信息 userInfo;

//  8.时区 timeZone;

@interface TRElocalNotificationManager()

@end

static NSString * const kEntryId = @"entryId";

@implementation TRElocalNotificationManager
@dynamic latestNotiEntryId;

+(instancetype)sharedManager{
    
    static TRElocalNotificationManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[TRElocalNotificationManager alloc] init];
    });
    
    return _manager;
}



- (void)sendLocalNFwithNFCenterTitle:(NSString *)title andNotifacation:(NSString *)notifation andUserInfo:(NSDictionary *)info{
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
        [self sendLocalNF4backiOSXwithNFCenterTitle:title andNotifacation:notifation andUserInfo:info];
    }else{
        [self sendLocalNF4exiOSXwithNFCenterTitle:title andNotifacation:notifation andUserInfo:info];
    }
    
}

/**
 *  Before iOS 10
 */
- (void)sendLocalNF4exiOSXwithNFCenterTitle:(NSString *)title andNotifacation:(NSString *)notifation andUserInfo:(NSDictionary *)info{
    
    UILocalNotification *localNF = [[UILocalNotification alloc] init];
    
    localNF.alertBody = notifation;
    localNF.userInfo = info;
    
    // 设置相关
    localNF.fireDate = [NSDate dateWithTimeIntervalSinceNow:1.0];
    localNF.hasAction = YES;
    localNF.alertLaunchImage = @"";
    localNF.applicationIconBadgeNumber = 1;
    localNF.alertAction = @"查看详情";
    localNF.timeZone = [NSTimeZone defaultTimeZone];
    localNF.soundName = UILocalNotificationDefaultSoundName;
    
    
    // 通知调度
    [[UIApplication sharedApplication] scheduleLocalNotification:localNF];
    
}


/**
 *  iOS 10 or later
 */
- (void)sendLocalNF4backiOSXwithNFCenterTitle:(NSString *)title andNotifacation:(NSString *)notifation andUserInfo:(NSDictionary *)info{
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    //创建通知对象
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    //    content.title = title;
    content.body = notifation;
    content.userInfo = info;
    content.sound = [UNNotificationSound defaultSound];
    content.badge = @(1);
    content.launchImageName = @"";
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1.0 repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"localNF" content:content trigger:trigger];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
    }];
    
}


-(void)setLatestNotiEntryId:(NSString *)latestNotiEntryId{
    [[NSUserDefaults standardUserDefaults] setValue:latestNotiEntryId forKey:kEntryId];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *)latestNotiEntryId{
    return [[NSUserDefaults standardUserDefaults] valueForKey:kEntryId];
}

@end
