//
//  WebModel.h
//  MVVMTest
//
//  Created by Allen on 2017/5/3.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "GTModel.h"


@interface Web : NSObject

@property(nonatomic, strong)NSString *url;
@end


@interface WebModel : GTModel

@property(nonatomic, strong)Web *responseData;
@end
