//
//  PublicWeiboViewModel.h
//  MVVMTest
//
//  Created by Allen on 2017/4/24.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "GTViewModelClass.h"
#import "UserModel.h"

@interface UserInfoViewModel : GTViewModelClass

- (void)fetchLogin;

- (void)userDetailWithUserModel:(UserModel *)userModel WithViewController:(UIViewController *)superController;

@end
