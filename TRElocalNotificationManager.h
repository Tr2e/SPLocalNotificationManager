//
//  TRElocalNotificationManager.h
//  MyBaby4Teacher
//
//  Created by Tree on 16/5/23.
//  Copyright © 2016年 wobaobao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LocalNoticationCenter [TRElocalNotificationManager sharedManager]

@interface TRElocalNotificationManager : NSObject

@property (nonatomic, strong) NSString *latestNotiEntryId;

+(instancetype)sharedManager;
- (void)sendLocalNFwithNFCenterTitle:(NSString *)title andNotifacation:(NSString *)notifation andUserInfo:(NSDictionary *)info;

@end
