//
//  PublicWeiboViewModel.h
//  MVVMTest
//
//  Created by Allen on 2017/4/24.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "GTViewModelClass.h"
#import "PublicModel.h"

@interface PublicWeiboViewModel : GTViewModelClass

- (void)fetchPublicWeibo;

- (void)weiboDetailWithPublicModel:(PublicModel *)publicModel WithViewController:(UIViewController *)superController;

@end
