//
//  UINavigationController+Extension.m
//  MVVMTest
//
//  Created by Allen on 2017/5/2.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "UINavigationController+Extension.h"

@implementation UINavigationController (Extension)

- (void)naviagteToWithPageName:(NSString *)name withParam:(id)params{
    UIViewController *vc = [self CreateVCWithXIB:name];
    if ([vc conformsToProtocol:@protocol(IUINavigationController)]) {
        id<IUINavigationController> navigate = (id<IUINavigationController>)vc;
        [navigate NavigateTo:params withFromClassName:[self.visibleViewController class]];
        NSLog(@"跳转到%@页面，携带参数%@",name,params);
    }
    [self myAnimationPush];
    [self pushViewController:vc animated:NO];
}

- (void)naviagteToWithPageName:(NSString *)name{
    UIViewController *vc = [self CreateVCWithXIB:name];
    NSLog(@"%@",vc);
    [self myAnimationPush];
    [self pushViewController:vc animated:NO];
}

- (void)goBackWithParam:(id)params{
    Class c = [self.visibleViewController class];
    [self myAnimationPop];
    [self popViewControllerAnimated:NO];
    UIViewController *vc = self.visibleViewController;
    if ([vc conformsToProtocol:@protocol(IUINavigationController)]) {
        id<IUINavigationController> navigate = (id<IUINavigationController>)vc;
        [navigate NavigateBack:params withFromClassName:c];
        NSLog(@"返回页面%@传递参数%@",c,params);
    }
    
}

- (void)goBack{
    //    [self myAnimationPop];
    //    [self popViewControllerAnimated:NO];
    [self goBackWithParam:nil];
}

- (UIViewController *)CreateVCWithXIB:(NSString *)xibName{
    UIViewController *control=[(UIViewController *)[NSClassFromString(xibName) alloc] init];
    return control;
    
}

- (void)myAnimationPush{
    //    CATransition *animation = [CATransition animation];
    //    animation.duration = 0.5f;
    //    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.type = @"rippleEffect";
    //    animation.subtype = kCATransitionFromRight;
    //    [self.view.layer addAnimation:animation forKey:@"animation"];
}

- (void)myAnimationPop{
    //    CATransition *animation = [CATransition animation];
    //    animation.duration = 0.3f;
    //    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    //    animation.fillMode = kCAFillModeForwards;
    //    animation.type = @"cameraIris";
    //    animation.subtype = kCATransitionFromRight;
    //    [self.view.layer addAnimation:animation forKey:@"animation"];
}

@end
