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


@implementation TRElocalNotificationManager

- (instancetype)init{

    if (self == [super init]) {
        
    }
    
    return self;
}

- (void)sendLocalNFwithNFCenterTitle:(NSString *)title andNotifacation:(NSString *)notifation{

    UILocalNotification *localNF = [[UILocalNotification alloc] init];
    
    // 内容相关
    localNF.alertTitle = title;
    localNF.alertBody = notifation;
    
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

@end
