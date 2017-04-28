//
//  PublicWeiboViewModel.m
//  MVVMTest
//
//  Created by Allen on 2017/4/24.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "UserinfoViewModel.h"

@implementation UserInfoViewModel : GTViewModelClass


- (void)fetchLogin{

    NSDictionary *para = @{TOKEN:@"QE+tbb65coK1iIlh2oFZRg==",
                           COUNT:@"UnmPX8i0Vl0="};

    [NetRequestClass NetRequestPOSTWithRequestURL:REQUESTPUBLICURL WithParameter:para withLoading:YES WithReturnValeuBlock:^(id returnValue){
        DDLog(@"%@",returnValue);
        //直接字典转模型,并会传
        self.returnBlock([UserModel mj_objectWithKeyValues:returnValue]);
        
    }];
    
}

- (void)userDetailWithUserModel:(UserModel *)userModel WithViewController:(UIViewController *)superController{

}



@end
