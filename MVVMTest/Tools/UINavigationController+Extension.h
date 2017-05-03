//
//  UINavigationController+Extension.h
//  MVVMTest
//
//  Created by Allen on 2017/5/2.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IUINavigationController <NSObject>

@required
- (void)NavigateTo:(id)param withFromClassName:(Class)c;

- (void)NavigateBack:(id)param withFromClassName:(Class)c;

@end

@interface UINavigationController (Extension)

///跳转到页面，并携带参数
- (void)naviagteToWithPageName:(NSString *)name withParam:(id)params;

///跳转到页面
- (void)naviagteToWithPageName:(NSString *)name;

///返回页面，并携带参数
- (void)goBackWithParam:(id)params;

///返回页面
- (void)goBack;

@end
