//
//  PublicWeiboViewModel.m
//  MVVMTest
//
//  Created by Allen on 2017/4/24.
//  Copyright © 2017年 Allen. All rights reserved.
//

#import "PublicWeiboViewModel.h"

@implementation PublicWeiboViewModel


- (void)fetchPublicWeibo{
    NSDictionary *para = @{TOKEN:ACCESSTOKEN,
                           COUNT:@"100"};
    [NetRequestClass NetRequestGETWithRequestURL:REQUESTPUBLICURL WithParameter:para WithReturnValeuBlock:^(id returnValue) {
        DDLog(@"%@",returnValue);
        [self fetchValueSuccessWithDic:returnValue];
    } WithErrorCodeBlock:^(id errorCode) {
        DDLog(@"%@",errorCode);
        [self errorCodeWithDic:errorCode];
    } WithFailureBlock:^{
        [self netFailure];
        DDLog(@"网络异常");
    }];
}

- (void)weiboDetailWithPublicModel:(PublicModel *)publicModel WithViewController:(UIViewController *)superController{


}

- (void)fetchValueSuccessWithDic:(NSDictionary *)returnValue{
    NSArray *statues = returnValue[STATUSES];
    NSMutableArray *publicModelArray =[[NSMutableArray alloc] initWithCapacity:statues.count];
    for (int i=0; i<statues.count; i++) {
        PublicModel *publicModel = [[PublicModel alloc] init];
        NSDateFormatter *iosDateFormater=[[NSDateFormatter alloc]init];
        iosDateFormater.dateFormat=@"EEE MMM d HH:mm:ss Z yyyy";
        
        //必须设置，否则无法解析
        iosDateFormater.locale=[[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
        NSDate *date=[iosDateFormater dateFromString:statues[i][CREATETIME]];
        //目的格式
        NSDateFormatter *resultFormatter=[[NSDateFormatter alloc]init];
        [resultFormatter setDateFormat:@"MM月dd日 HH:mm"];
        publicModel.date = [resultFormatter stringFromDate:date];
        publicModel.userName = statues[i][USER][USERNAME];
        publicModel.text = statues[i][WEIBOTEXT];
        publicModel.imageUrl = [NSURL URLWithString:statues[i][USER][HEADIMAGEURL]];
        publicModel.userId = statues[i][USER][UID];
        publicModel.weiboId = statues[i][WEIBOID];
        [publicModelArray addObject:publicModel];
        
    }
    self.returnBlock(publicModelArray);
}

- (void)errorCodeWithDic:(NSDictionary *)errorDic{
    self.errorBlock(errorDic);
}

- (void)netFailure{
    self.failureBlock();
}
@end
