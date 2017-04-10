//
//  AppDelegate.h
//  WJSearchBar
//
//  Created by 军魏 on 2017/4/6.
//  Copyright © 2017年 weijun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

