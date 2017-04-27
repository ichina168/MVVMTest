//
//  NetRequestClass.h
//  MVVMTest
//
//

#import <Foundation/Foundation.h>
#import "SVProgressHUD.h"

@interface NetRequestClass : NSObject

#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl;

#pragma POST请求
+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                          withLoading: (BOOL) isLoading
                 WithReturnValeuBlock: (ReturnValueBlock) block;

#pragma GET请求
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                         withLoading: (BOOL) isLoading
                WithReturnValeuBlock: (ReturnValueBlock) block;

@end
