//
//  PublicWeiboViewModel.m
//  MVVMTest
//
//  Created by Allen on 2017/4/24.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel : GTViewModel


- (void)fetchLogin{

    NSDictionary *para = @{TOKEN:@"QE+tbb65coK1iIlh2oFZRg==",
                           COUNT:@"UnmPX8i0Vl0="};

    [NetRequestClass NetRequestPOSTWithRequestURL:REQUESTPUBLICURL WithParameter:para withLoading:YES WithReturnValeuBlock:^(id returnValue){
        DDLog(@"%@",returnValue);
        //直接字典转模型,并会传
        self.returnBlock([UserModel mj_objectWithKeyValues:returnValue]);
    }];
    
}

- (void)userInfoWithUserModel:(UserModel *)userModel WithViewController:(UIViewController *)superController{
    [superController.navigationController  naviagteToWithPageName:UserInfoVC withParam:userModel];
}


- (void)fetchWeb{
    WebModel *webModel = [WebModel new];
    webModel.result = @"0";
    webModel.message = @"成功";
    Web *web = [Web new];
    web.url = @"https://www.baidu.com";
    webModel.responseData = web;
    self.returnBlock(webModel);
}

- (void)webViewWithWebModel:(WebModel *)webModel WithViewController:(UIViewController *)superController{
    [superController.navigationController  naviagteToWithPageName:WebViewVC withParam:webModel];
}

@end
