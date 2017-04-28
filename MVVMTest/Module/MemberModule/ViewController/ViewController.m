//
//  ViewController.m
//  MVVMTest
//
//  Created by Allen on 2017/4/21.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "ViewController.h"
#import "UserinfoViewModel.h"


@interface ViewController ()
{
    UserModel *user;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
    UserInfoViewModel *userInfoViewModel = [[UserInfoViewModel alloc] init];
    [userInfoViewModel setBlockWithReturnBlock:^(id returnValue) {
        UserModel *userModel = returnValue;
        if (![userModel.result isEqualToString:@"0"]) {
            [Utils showAlert:userModel.message];
            return ;
        }
        DDLog(@"%@-%@-%@",userModel.result,userModel.message,userModel.responseData.idCard);
    }];
    
    [userInfoViewModel fetchLogin];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
