//
//  PublicWeiboViewModel.h
//  MVVMTest
//
//  Created by Allen on 2017/4/24.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "GTViewModel.h"
#import "UserModel.h"

@interface ViewModel : GTViewModel

- (void)fetchLogin;
- (void)userInfoWithUserModel:(UserModel *)userModel WithViewController:(UIViewController *)superController;

- (void)fetchWeb;
- (void)webViewWithWebModel:(WebModel *)webModel WithViewController:(UIViewController *)superController;

@end
