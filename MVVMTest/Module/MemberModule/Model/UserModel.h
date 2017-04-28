//
//  PublicModel.h
//  MVVMTest
//
//  Created by Allen on 2017/4/24.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "GTModel.h"


@interface User : NSObject

@property(strong, nonatomic)NSString *email;
@property(strong, nonatomic)NSString *idCard;
@property(strong, nonatomic)NSString *name;
@property(strong, nonatomic)NSURL *password;
@property(strong, nonatomic)NSString *phone;
@property(strong, nonatomic)NSString *sex;
@property(strong, nonatomic)NSString *userId;

@end


@interface UserModel : GTModel

@property(strong,nonatomic)User *responseData;

@end

