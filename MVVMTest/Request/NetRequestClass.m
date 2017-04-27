//
//  NetRequestClass.m
//
//

#import "NetRequestClass.h"

@interface NetRequestClass ()

@end


@implementation NetRequestClass
#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl
{
    //1.创建网络监测者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    __block BOOL netState = false;
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //这里是监测到网络改变的block  可以写成switch方便
        //在里面可以随便写事件
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                netState = false;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"无网络");
                netState = false;
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                netState = true;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                netState = true;
                NSLog(@"WiFi网络");
                break;
            default:
                netState = false;
                break;
        }
        
    }];
    return netState;
}


/***************************************
 在这做判断如果有dic里有errorCode
 调用errorBlock(dic)
 没有errorCode则调用block(dic
 ******************************/

#pragma --mark GET请求方式
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                         withLoading: (BOOL) isLoading
                WithReturnValeuBlock: (ReturnValueBlock) block
{
    AFHTTPSessionManager *manager = [self manager];
    if (isLoading) {
        [SVProgressHUD show];
    }
    [manager GET:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        DDLog(@"%@", dic);
        block(dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        NSLog(@"%@", [error description]);
        [Utils showAlert:[error description]];
        }];
    
    
}

#pragma --mark POST请求方式
+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                          withLoading: (BOOL) isLoading
                 WithReturnValeuBlock: (ReturnValueBlock) block
{
    DDLog(@"请求:%@---%@",requestURLString,parameter);
    AFHTTPSessionManager *manager = [self manager];
    if (isLoading) {
        [SVProgressHUD show];
    }
    [manager POST:requestURLString parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        DDLog(@"%@", dic);
        block(dic);
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        NSLog(@"Faiure%@", [error description]);
        [Utils showAlert:[error description]];
    }];

}




+ (AFHTTPSessionManager *)manager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return manager;
}

@end
