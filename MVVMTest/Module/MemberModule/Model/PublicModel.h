//
//  PublicModel.h
//  MVVMTest
//
//  Created by Allen on 2017/4/24.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "GTModel.h"

@interface PublicModel : GTModel

@property(strong, nonatomic)NSString *userId;
@property(strong, nonatomic)NSString *weiboId;
@property(strong, nonatomic)NSString *userName;
@property(strong, nonatomic)NSURL *imageUrl;
@property(strong, nonatomic)NSString *date;
@property(strong, nonatomic)NSString *text;
@end
