//
//  TRElocalNotificationManager.h
//  MyBaby4Teacher
//
//  Created by Tree on 16/5/23.
//  Copyright © 2016年 wobaobao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRElocalNotificationManager : NSObject

- (void)sendLocalNFwithNFCenterTitle:(NSString *)title andNotifacation:(NSString *)notifation;

@end
