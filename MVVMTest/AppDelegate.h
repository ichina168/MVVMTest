//
//  AppDelegate.h
//  MVVMTest
//
//  Created by Allen on 2017/4/21.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *nav;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

