//
//  ViewController.m
//  MVVMTest
//
//  Created by Allen on 2017/4/21.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"



@interface ViewController ()
{
    UserModel *user;
}
@end

@implementation ViewController
- (void)NavigateTo:(id)param withFromClassName:(Class)c{

}

- (void)NavigateBack:(id)param withFromClassName:(Class)c{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    ViewModel *viewModel = [[ViewModel alloc] init];
    __block UserModel *userModel = nil;
    __block WebModel *webModel = nil;
    [viewModel setBlockWithReturnBlock:^(id returnValue) {
        
        if ([returnValue isKindOfClass:[userModel class]]) {
            userModel = returnValue;
            if (![userModel.result isEqualToString:@"0"]) {
                [Utils showAlert:userModel.message];
                return ;
            }
            DDLog(@"%@-%@-%@",userModel.result,userModel.message,userModel.responseData.idCard);
        }else if ([returnValue isKindOfClass:[WebModel class]]){
            webModel = returnValue;
            if (![webModel.result isEqualToString:@"0"]) {
                [Utils showAlert:webModel.message];
                return;
            }
            DDLog(@"%@",webModel.responseData.url);
        }
    }];
    
    [viewModel fetchLogin];
    [viewModel fetchWeb];
    
    
    UIButton *buttonA = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonA setFrame:CGRectMake(10, 70, 100, 40)];
    [buttonA setTitle:@"跳转A" forState:UIControlStateNormal];
    [buttonA setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:buttonA];
    [[buttonA rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [viewModel userInfoWithUserModel:userModel WithViewController:self];
    }];
    
    
    UIButton *buttonB = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonB setFrame:CGRectMake(10, 70+50, 100, 40)];
    [buttonB setTitle:@"跳转B" forState:UIControlStateNormal];
    [buttonB setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:buttonB];
    [[buttonB rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [viewModel webViewWithWebModel:webModel WithViewController:self];
    }];
    
    
    UIButton *buttonC = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonC setFrame:CGRectMake(10, 70+50+50, 100, 40)];
    [buttonC setTitle:@"跳转C" forState:UIControlStateNormal];
    [buttonC setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:buttonC];
    [[buttonC rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
    }];
}


- (void)click{
    NSLog(@"click");
    [self.navigationController  naviagteToWithPageName:UserInfoVC withParam:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
